#!/usr/bin/env bash
# Exact-size PNG from an SVG, transparency kept. For /logo.
# usage: bash render.sh in.svg out.png WIDTH [HEIGHT]
# Needs Chrome or Chromium (set CHROME if it isn't found) and ImageMagick.
# Goes through an HTML page and a crop: a direct Chrome screenshot below about
# 500px wide comes out the right size and blank.
set -euo pipefail

[ $# -ge 3 ] || { echo "usage: bash render.sh in.svg out.png WIDTH [HEIGHT]" >&2; exit 2; }
width=$3
height=${4:-$3}

chrome=${CHROME:-}
if [ -z "$chrome" ]; then
  for c in "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" "/Applications/Chromium.app/Contents/MacOS/Chromium" google-chrome chromium chromium-browser; do
    if command -v "$c" >/dev/null 2>&1; then chrome=$c; break; fi
  done
fi
[ -n "$chrome" ] || { echo "render.sh: no Chrome found; set CHROME" >&2; exit 1; }
command -v magick >/dev/null 2>&1 || { echo "render.sh: ImageMagick (magick) not found" >&2; exit 1; }

[ -f "$1" ] || { echo "render.sh: no such file: $1" >&2; exit 1; }
tmp=$(mktemp -d)
trap 'rm -rf "${tmp:?}"' EXIT
# A fixed name, so a space, # or % in the real path can't break the image URL.
cp "$1" "$tmp/in.svg"

window_w=$(( width + 200 > 700 ? width + 200 : 700 ))
window_h=$(( height + 200 > 700 ? height + 200 : 700 ))
# onerror removes the broken-image icon, so a bad SVG renders blank and fails the check below.
printf '<!doctype html><html style="background:transparent"><body style="margin:0;background:transparent"><img src="in.svg" onerror="this.remove()" width="%s" height="%s" style="display:block"></body></html>' "$width" "$height" > "$tmp/page.html"
"$chrome" --headless=new --disable-gpu --hide-scrollbars --user-data-dir="$tmp/profile" \
  --default-background-color=00000000 --window-size="$window_w,$window_h" \
  --screenshot="$tmp/shot.png" "file://$tmp/page.html" >/dev/null 2>&1
magick "$tmp/shot.png" -crop "${width}x${height}+0+0" +repage "PNG32:$tmp/out.png"
if [ "$(magick "$tmp/out.png" -alpha extract -format '%[fx:maxima]' info:)" = 0 ]; then
  echo "render.sh: nothing rendered; is $1 a valid SVG?" >&2
  exit 1
fi
cp "$tmp/out.png" "$2"
