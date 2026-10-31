#!/usr/bin/env bash
#
# slop-scan.sh — PostToolUse hook (Edit|Write)
#
# Enforces "Chosen, Not Defaulted" mechanically, where it can be checked by
# pattern. In edited UI files (.tsx .jsx .vue .svelte .astro .html .css .scss)
# it flags:
#   - Reflex palette      — purple/violet/fuchsia gradients (Tailwind or CSS)
#   - transition-all      — `transition-all` / `transition: all`
#   - Ambient motion      — `animate-pulse` / `animate-ping`
#   - Emoji as icons      — emoji characters in markup
#   - Hype copy           — supercharge, seamless, unlock, magic, revolutionize, game-changing
#   - Heavy display type  — font-black / font-extrabold / font-weight 800–900
# In DESIGN_MAP.md it flags banned character words (clean, modern, sleek,
# minimal, premium, intuitive, seamless) under `## Character`.
#
# It warns, it never blocks or rewrites: a pattern can't tell a reflex from a
# choice the direction made on purpose. Silence a file by putting
# `design-kit-allow-slop` in its first 5 lines.
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

MODE=""
case "$FILE_PATH" in
  */DESIGN_MAP.md|DESIGN_MAP.md) MODE="map" ;;
  *.tsx|*.jsx|*.vue|*.svelte|*.astro|*.html) MODE="markup" ;;
  *.css|*.scss) MODE="style" ;;
  *) exit 0 ;;
esac

if head -5 "$FILE_PATH" | grep -q "design-kit-allow-slop" 2>/dev/null; then
  exit 0
fi

# Without python3 the hook skips silently; it never reports a false "clean".
command -v python3 >/dev/null 2>&1 || exit 0

FINDINGS=$(python3 - "$FILE_PATH" "$MODE" <<'PY' 2>/dev/null || true
import re, sys

path, mode = sys.argv[1], sys.argv[2]
try:
    src = open(path, encoding="utf-8", errors="replace").read()
except OSError:
    sys.exit(0)
if mode != "map":
    # Blank out comments (keeping line numbers) so commented-out code and notes are not findings.
    def blank(m):
        return re.sub(r"[^\n]", " ", m.group(0))
    src = re.sub(r"/\*.*?\*/|<!--.*?-->", blank, src, flags=re.S)
    src = re.sub(r"(^|[^:\w])//[^\n]*", blank, src)
lines = src.splitlines()

out = []
def hit(n, label, text):
    out.append(f"L{n}: {label} — {text.strip()[:90]}")

if mode == "map":
    banned = re.compile(r"\b(clean|modern|sleek|minimal|premium|intuitive|seamless)\b", re.I)
    in_char, in_comment = False, False
    for i, line in enumerate(lines, 1):
        if line.startswith("## "):
            in_char = line.strip().lower().startswith("## character")
            continue
        if "<!--" in line:
            in_comment = True
        if in_char and not in_comment and not line.lstrip().startswith(">"):
            words = sorted({w.lower() for w in banned.findall(line)})
            if words:
                hit(i, "empty character word(s) " + ", ".join(f"'{w}'" for w in words), line)
        if "-->" in line:
            in_comment = False
else:
    hue = r"(purple|violet|fuchsia)"
    rules = [
        (re.compile(rf"\b(from|via|to)-{hue}-\d{{2,3}}\b"), "reflex gradient (purple/violet/fuchsia)"),
        (re.compile(rf"(linear|radial|conic)-gradient\([^)]*({hue}|#8b5cf6|#7c3aed|#a855f7|#9333ea|#d946ef|#c026d3)", re.I), "reflex gradient (purple/violet/fuchsia)"),
        (re.compile(r"\btransition-all\b|transition\s*:\s*all\b"), "transition-all (name the properties)"),
        (re.compile(r"\banimate-(pulse|ping)\b"), "ambient pulse/ping (only for live status)"),
        (re.compile(r"\bfont-(black|extrabold)\b|font-weight\s*:\s*(800|900)\b"), "heavy display weight (use 400/500, 600 max)"),
        (re.compile(r"<h[1-3]\b[^>]*\bfont-bold\b"), "bold heading (headings take 400/500, 600 max)"),
    ]
    hype = re.compile(r"\b(supercharge[sd]?|seamless(ly)?|unlock(s|ing)?|magic(al|ally)?|revolutioni[sz]e[sd]?|game-?changing)\b", re.I)
    # Copy only: JSX/HTML text between tags, and string literals. Identifiers like onClick={unlock} are code.
    # Attribute values that are code, not copy (class names, routes, ids).
    code_attr = re.compile(r"\b(class(Name)?|href|src|to|id|key|name|type|role|data-[\w-]+)\s*=\s*(\"[^\"]*\"|\x27[^\x27]*\x27)")
    copy_parts = re.compile(">([^<>{}]+)<|>([^<>{}]+)$|^([^<>{}=;()]+)<|\"([^\"\n]*)\"|\x27([^\x27\n]*)\x27")
    if mode == "markup":
        rules.append((re.compile("[\U0001F300-\U0001FAFF✨⚡✅❌⭐\U0001F680]"), "emoji as icon (use the icon set)"))
    for i, line in enumerate(lines, 1):
        s = line.strip()
        if s.startswith("import "):
            continue
        for rx, label in rules:
            if rx.search(line):
                hit(i, label, line)
        if mode == "markup":
            copy = " ".join(g for m in copy_parts.findall(code_attr.sub(" ", line)) for g in m if g)
            if hype.search(copy):
                hit(i, "hype copy (say what it does)", line)

for f in out[:12]:
    print(f)
if len(out) > 12:
    print(f"… and {len(out) - 12} more")
PY
)

[ -z "$FINDINGS" ] && exit 0

ROOT="${CLAUDE_PROJECT_DIR:-$PWD}"
source "$HOOK_LIB/state-counter.sh"
bump_counter "$ROOT/.hook-state/hook-firings.json" "slop-scan" 2>/dev/null || true

if [ "$MODE" = "map" ]; then
  HEAD="slop-scan: DESIGN_MAP.md → Character uses words that describe every product. Replace them with something only this product is (see agent_docs/direction.md):"
else
  HEAD="slop-scan: $(basename "$FILE_PATH") has default-looking choices. Keep one only if DESIGN_MAP.md names it on purpose; otherwise fix it (agent_docs/slop-signs.md):"
fi

MSG="$HEAD"$'\n'"$(printf '%s\n' "$FINDINGS" | sed 's/^/  - /')"$'\n'"Intentional? Add 'design-kit-allow-slop' to the file's first 5 lines."
emit_context "PostToolUse" "$MSG"

exit 0
