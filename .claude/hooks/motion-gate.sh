#!/usr/bin/env bash
#
# motion-gate.sh — PostToolUse hook (Edit|Write)
#
# Enforces the Motion Discipline in CLAUDE.md where a pattern can see it. In
# edited UI files (.tsx .jsx .vue .svelte .astro .html .css .scss) it flags:
#   - Motion with no reduced-motion guard in the same file (keyframes,
#     transitions, Tailwind animate-*/transition, Motion/Framer props)
#   - Animated layout properties (width, height, top, left, right, bottom,
#     margin, padding) in transitions, keyframes or Framer `animate`
#
# A guard in a global stylesheet is invisible to a per-file check. If the
# project handles reduced motion globally, say so in the file with
# `design-kit-allow-motion` in its first 5 lines.
#
# Output: hookSpecificOutput.additionalContext on stdout. Always exits 0.
#

set -euo pipefail

INPUT=$(cat)
HOOK_LIB="$(cd "$(dirname "$0")/lib" 2>/dev/null && pwd)" || exit 0
source "$HOOK_LIB/json-parse.sh"
source "$HOOK_LIB/emit.sh"

TOOL_NAME=$(parse_json_field "tool_name")
case "$TOOL_NAME" in
  Edit|Write|MultiEdit) ;;
  *) exit 0 ;;
esac

FILE_PATH=$(parse_json_field "file_path")
[ -z "$FILE_PATH" ] && exit 0
[ -f "$FILE_PATH" ] || exit 0

case "$FILE_PATH" in
  *.tsx|*.jsx|*.vue|*.svelte|*.astro|*.html|*.css|*.scss) ;;
  *) exit 0 ;;
esac

if head -5 "$FILE_PATH" | grep -q "design-kit-allow-motion" 2>/dev/null; then
  exit 0
fi

command -v python3 >/dev/null 2>&1 || exit 0

FINDINGS=$(python3 - "$FILE_PATH" <<'PY' 2>/dev/null || true
import re, sys

path = sys.argv[1]
try:
    src = open(path, encoding="utf-8", errors="replace").read()
except OSError:
    sys.exit(0)
# Strip comments (keeping line count) so neither motion nor a guard is found inside one.
def blank(m):
    return re.sub(r"[^\n]", " ", m.group(0))
src = re.sub(r"/\*.*?\*/|<!--.*?-->", blank, src, flags=re.S)
src = re.sub(r"(^|[^:\w])//[^\n]*", blank, src)
lines = src.splitlines()

# CSS property position (none/0s values do not count), or a Tailwind class token on a class line.
motion = re.compile(
    r"@keyframes\b|(^|[;{\s])animation(-name)?\s*:(?!\s*(none|initial|unset)\b)"
    r"|(^|[;{\s])transition(-property)?\s*:(?!\s*(none|0s?|initial|unset)\b)"
    r"|<motion\.|\bmotion\.[a-z]+\(|framer-motion|\buseAnimate\b"
)
tw_motion = re.compile(
    r"(?<![-\w])(transition(-(all|colors|opacity|shadow|transform|\[[^\]]+\]))?|animate-(?!none)[a-z][-\w]*)(?![-\w])"
)
class_line = re.compile(r"\bclass(Name)?\s*=|\b(cn|clsx|cva|twMerge)\(|@apply\b")
guard = re.compile(
    r"prefers-reduced-motion|\bmotion-(safe|reduce):|useReducedMotion|reducedMotion|MotionConfig"
)
layout = r"(?<![-\w])((max|min)-)?(width|height|top|left|right|bottom|margin(-[a-z]+)?|padding(-[a-z]+)?)"

out = []
first_motion = None
for i, line in enumerate(lines, 1):
    s = line.strip()
    if s.startswith("import "):
        continue
    if first_motion is None and (motion.search(line) or (class_line.search(line) and tw_motion.search(line))):
        first_motion = i
    if re.search(rf"\btransition(-property)?\s*:[^;{{}}]*\b{layout}\b", line):
        out.append(f"L{i}: transition on a layout property — {s[:90]}")
    if re.search(rf"\btransition-\[{layout}", line):
        out.append(f"L{i}: transition on a layout property — {s[:90]}")
    if re.search(rf"\b(animate|initial|exit)=\{{\{{[^}}]*\b{layout}\s*:", line):
        out.append(f"L{i}: Framer animates a layout property (use transform or layout) — {s[:90]}")

# Layout properties inside @keyframes blocks.
for m in re.finditer(r"@keyframes\s+[\w-]+\s*\{", src):
    depth, j = 1, m.end()
    while j < len(src) and depth:
        depth += {"{": 1, "}": -1}.get(src[j], 0)
        j += 1
    body = src[m.end():j]
    if re.search(rf"(^|[;{{\s]){layout}\s*:", body):
        n = src.count("\n", 0, m.start()) + 1
        out.append(f"L{n}: @keyframes animates a layout property (use transform/opacity)")

if first_motion and not guard.search(src):
    out.insert(0, f"L{first_motion}: motion with no prefers-reduced-motion guard in this file")

for f in out[:10]:
    print(f)
if len(out) > 10:
    print(f"… and {len(out) - 10} more")
PY
)

[ -z "$FINDINGS" ] && exit 0

ROOT="${CLAUDE_PROJECT_DIR:-$PWD}"
source "$HOOK_LIB/state-counter.sh"
bump_counter "$ROOT/.hook-state/hook-firings.json" "motion-gate" 2>/dev/null || true

MSG="motion-gate: $(basename "$FILE_PATH") breaks the motion discipline (agent_docs/motion.md):"$'\n'"$(printf '%s\n' "$FINDINGS" | sed 's/^/  - /')"$'\n'"Fix: animate transform/opacity only; add @media (prefers-reduced-motion: reduce) or motion-safe:/motion-reduce:. Guarded globally? Add 'design-kit-allow-motion' to the file's first 5 lines."
emit_context "PostToolUse" "$MSG"

exit 0
