#!/usr/bin/env bash
#
# fetch-editor.sh — download the screenshot editor at a pinned commit.
#
# The editor is ParthJadhav/app-store-screenshots (MIT), a Next.js app that lays
# out, previews and exports store screenshots. It is not bundled with the kit:
# this script fetches it into a folder of its own and checks the commit.
# It installs nothing and runs nothing. Installing dependencies and starting
# the dev server are separate steps that need the user's OK.
#
# Usage:
#   bash fetch-editor.sh <target-dir>      e.g. bash fetch-editor.sh store-screenshots
#
# Result:
#   <target-dir>/            the editor (a Next.js project; app-store-screenshots.json is its state)
#   <target-dir>/LICENSE     the upstream MIT licence
#   <target-dir>/_upstream/  upstream's own skill docs and Duo capture script,
#                            kept as a manual for how the editor works
#
# The editor ships Apple product bezels in public/frames/. Apple licenses them
# for mock-ups of apps on Apple platforms only.

set -euo pipefail

REPO="https://github.com/ParthJadhav/app-store-screenshots.git"
PIN="e889033b68f418952cc65ba897fe2b1ec63d1564"
SUB="skills/app-store-screenshots"

die() { printf 'fetch-editor: %s\n' "$1" >&2; exit 1; }

[ "$#" -eq 1 ] || die "usage: bash fetch-editor.sh <target-dir>"
TARGET="$1"
[ -n "$TARGET" ] || die "target dir is empty"
[ -e "$TARGET" ] && die "$TARGET already exists; pick a new folder (nothing was changed)"
case "$TARGET" in
  . | ./ | .. | ../ | / ) die "target must be a new folder, not $TARGET" ;;
esac
command -v git >/dev/null 2>&1 || die "git is required"

WORK="$(mktemp -d "${TMPDIR:-/tmp}/kit-store-editor.XXXXXX")"
cleanup() {
  if [ -n "${WORK:-}" ] && [ -d "$WORK" ]; then rm -rf -- "$WORK"; fi
}
trap cleanup EXIT

SRC="$WORK/repo"
git init -q "$SRC"
git -C "$SRC" remote add origin "$REPO"
printf 'fetch-editor: fetching %s at %s\n' "$REPO" "$PIN"
git -C "$SRC" fetch -q --depth 1 origin "$PIN" || die "could not fetch commit $PIN"
git -C "$SRC" -c advice.detachedHead=false checkout -q FETCH_HEAD

GOT="$(git -C "$SRC" rev-parse HEAD)"
[ "$GOT" = "$PIN" ] || die "commit mismatch: expected $PIN, got $GOT"
[ -d "$SRC/$SUB/template" ] || die "$SUB/template not found at $PIN"
[ -f "$SRC/LICENSE" ] || die "LICENSE not found at $PIN"

mkdir -p "$TARGET"
cp -R "$SRC/$SUB/template/." "$TARGET/"
cp "$SRC/LICENSE" "$TARGET/LICENSE"
mkdir -p "$TARGET/_upstream"
for f in SKILL.md iphone-duo.md; do
  if [ -f "$SRC/$SUB/$f" ]; then cp "$SRC/$SUB/$f" "$TARGET/_upstream/$f"; fi
done
if [ -d "$SRC/$SUB/scripts" ]; then cp -R "$SRC/$SUB/scripts" "$TARGET/_upstream/scripts"; fi
printf 'Source: %s\nCommit: %s\nLicense: MIT (see ../LICENSE)\n' "$REPO" "$PIN" > "$TARGET/_upstream/SOURCE.txt"

printf 'fetch-editor: editor at %s (commit %s)\n' "$TARGET" "$PIN"
printf 'fetch-editor: next, with the user'"'"'s OK: install dependencies and start the dev server inside %s\n' "$TARGET"
