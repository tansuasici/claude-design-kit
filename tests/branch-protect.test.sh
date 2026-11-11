#!/usr/bin/env bash
#
# branch-protect.test.sh — which Bash commands .claude/hooks/branch-protect.sh blocks
#
# Usage: bash tests/branch-protect.test.sh
#
# Each case feeds the hook a PreToolUse payload and checks the exit code:
# 2 means blocked, 0 means allowed. The hook runs inside a throwaway repo, on
# a feature branch for most cases and on main for the HEAD and bare-push ones.
#
set -uo pipefail
cd "$(dirname "$0")/.." || exit 1

HOOK="$PWD/.claude/hooks/branch-protect.sh"
pass=0; fail=0
work=$(mktemp -d)
trap 'rm -rf "${work:?}"' EXIT

git -C "$work" init -q -b main
git -C "$work" -c user.name=t -c user.email=t@example.com commit -q --allow-empty -m init
git -C "$work" switch -q -c feat/x

# payload CMD → the JSON the hook reads on stdin
payload() {
  if command -v jq >/dev/null 2>&1; then
    jq -cn --arg c "$1" '{tool_name: "Bash", tool_input: {command: $c}}'
  else
    python3 -c 'import json,sys; print(json.dumps({"tool_name":"Bash","tool_input":{"command":sys.argv[1]}}))' "$1"
  fi
}

# expect CODE CMD → run the hook on CMD from $work and compare its exit code
expect() {
  local want="$1" cmd="$2" got
  (cd "$work" && payload "$cmd" | CLAUDE_PROJECT_DIR="$work" bash "$HOOK" >/dev/null 2>&1)
  got=$?
  if [ "$got" = "$want" ]; then
    pass=$((pass + 1)); printf '  ok   %s  %s\n' "$want" "$cmd"
  else
    fail=$((fail + 1)); printf '  FAIL %s  %s (got %s)\n' "$want" "$cmd" "$got"
  fi
}

echo "On a feature branch"
# main in a later command is not the push target
expect 0 'git push -u origin feat/x && gh pr create --base main --title x'
expect 0 'git push origin feat/x; git log main --oneline'
expect 0 'git push origin feat/x | tee push.log && echo main'
expect 0 'git push origin feat/x || git diff main'
expect 0 'git push origin feat/x && grep -f patterns.txt main.c'
expect 0 'git push -u origin feat/x'
expect 0 'git push origin main:feat/x'
expect 0 'git push --force-with-lease origin feat/x'
expect 0 'git status && git log main'
# real pushes to main still blocked
expect 2 'git push origin main'
expect 2 'cd x && git push origin main'
expect 2 'git push -u origin main'
expect 2 'git push --set-upstream origin master'
expect 2 'git push origin HEAD:main'
expect 2 'git push origin feat/x:refs/heads/main'
expect 2 'git push origin +main'
expect 2 'git -c color.ui=always push origin main'
expect 2 'git status; git push origin main && echo done'
# force push blocked whatever the branch
expect 2 'git push --force origin feat/x'
expect 2 'git push -f origin feat/x'
expect 2 'git push origin feat/x -f && gh pr create --base main'

echo "On main"
git -C "$work" switch -q main
expect 2 'git push'
expect 2 'git push -u origin'
expect 2 'git push origin HEAD'
expect 2 'git add . && git push'
expect 0 'git push origin feat/x'

echo
echo "passed $pass, failed $fail"
[ "$fail" -eq 0 ]
