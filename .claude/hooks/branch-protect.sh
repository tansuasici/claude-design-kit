#!/usr/bin/env bash
#
# branch-protect.sh — PreToolUse hook
# Blocks direct pushes to main/master branch
#
# Reads tool input from stdin (JSON with tool_name and tool_input)
#

set -euo pipefail

INPUT=$(cat)
HOOK_LIB="$(cd "$(dirname "$0")/lib" 2>/dev/null && pwd || true)"
# Fail closed: a safety hook that can't load its library must block, not
# silently no-op. Empty HOOK_LIB → lib/ missing → exit 2 (CLA-47).
if [ -z "$HOOK_LIB" ] || [ ! -f "$HOOK_LIB/json-parse.sh" ]; then
  echo "BLOCKED: $(basename "$0") cannot load .claude/hooks/lib/ — refusing to run fail-open. Reinstall kit hooks (re-run install.sh)." >&2
  exit 2
fi
source "$HOOK_LIB/json-parse.sh"
source "$HOOK_LIB/state-counter.sh"

ROOT="${CLAUDE_PROJECT_DIR:-$PWD}"

bump_branch_block() {
  bump_counter "$ROOT/.hook-state/hook-firings.json" "branch-protect"
}

TOOL_NAME=$(parse_json_field "tool_name")

# Only check Bash tool
[ "$TOOL_NAME" != "Bash" ] && exit 0

COMMAND=$(parse_json_field "command")
[ -z "$COMMAND" ] && exit 0

# `git push` possibly preceded by global options like `git -c key=val push`.
# Matching the prefix means `git -c color.ui=always push origin main` can't slip by.
GIT_PUSH='git\s+(-c\s+\S+\s+)*push'

block() {
  bump_branch_block
  printf '%s\n' "$@"
  exit 2
}

FEATURE_HINT=("" "Create a feature branch and open a PR instead:" "  git checkout -b feat/your-feature" "  git push -u origin feat/your-feature")

# check_push SEGMENT: SEGMENT is one command, cut at &&, ||, ; or |, so the
# arguments of a later command (`gh pr create --base main`, `grep -f x`) are
# never read as the push's target or flags.
check_push() {
  local seg="$1" current

  # Force push: always block, whatever the branch. --force-with-lease is allowed
  # (it only overwrites if the remote matches expectations).
  if echo "$seg" | grep -qE -- "${GIT_PUSH}\s+(.*\s)?--force-with-lease"; then
    :
  elif echo "$seg" | grep -qE -- "${GIT_PUSH}\s+(.*\s)?(--force|-f)(\s|$)"; then
    block "BLOCKED: Force push detected" "" \
      "Force pushing can overwrite remote history." \
      "Consider using --force-with-lease for a safer alternative," \
      "or get explicit approval from the user before force pushing."
  fi

  # A protected branch named explicitly. Two shapes:
  #   1. main/master as a positional arg: git push origin main |
  #      git push -u origin main | git push --set-upstream origin main
  #   2. a refspec whose DESTINATION is protected: HEAD:main | local:master |
  #      main:main. `git push origin main:feature` is allowed: that pushes
  #      local main to a feature branch, not to remote main.
  if echo "$seg" | grep -qE "${GIT_PUSH}\s+(\S+\s+)*\+?(main|master)(\s|$)" \
    || echo "$seg" | grep -qE "${GIT_PUSH}\s+(\S+\s+)*\S*:(refs/heads/)?(main|master)(\s|$)"; then
    block "BLOCKED: Direct push to main/master branch" "${FEATURE_HINT[@]}"
  fi

  # `git push <remote> HEAD`, or a bare `git push` (optionally -u and a
  # remote), while on main/master.
  if echo "$seg" | grep -qE "${GIT_PUSH}\s+\S+\s+HEAD(\s|$)" \
    || echo "$seg" | grep -qE "^\s*${GIT_PUSH}(\s+(-u|--set-upstream))?(\s+origin)?\s*$"; then
    current=$(git branch --show-current 2>/dev/null) || current=""
    if [ "$current" = "main" ] || [ "$current" = "master" ]; then
      block "BLOCKED: this push resolves to protected branch '$current'" "${FEATURE_HINT[@]}"
    fi
  fi
}

# Split the command into its parts and check each part that is a git push.
while IFS= read -r seg; do
  if echo "$seg" | grep -qE "(^|\s)${GIT_PUSH}(\s|$)"; then
    check_push "$seg"
  fi
done < <(printf '%s\n' "$COMMAND" | awk '{ gsub(/&&|\|\||;|\|/, "\n"); print }')

exit 0
