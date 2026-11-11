#!/usr/bin/env bash
#
# prompt-router.sh — UserPromptSubmit hook
#
# Looks at the user's prompt and injects the matching design-discipline
# reminder and skill pointer when the task touches a known failure point
# (vague "make it pretty", new pages, animation, brand, forms, audits). Emits
# nothing when no keyword matches. Always exits 0.
#

set -euo pipefail

INPUT=$(cat)
HOOK_LIB="$(cd "$(dirname "$0")/lib" 2>/dev/null && pwd)" || exit 0
source "$HOOK_LIB/json-parse.sh"
source "$HOOK_LIB/emit.sh"

PROMPT=$(parse_json_field "prompt")
[ -z "$PROMPT" ] && exit 0
LOWER=$(printf '%s' "$PROMPT" | tr '[:upper:]' '[:lower:]')

REMINDERS=""
append() { REMINDERS="${REMINDERS}${1}"$'\n'; }
# Whole words only: "logout" is not "logo", "transform" is not "form".
has() { printf '%s' "$LOWER" | grep -qE "(^|[^a-z])($1)([^a-z]|$)"; }

# Vague aesthetic requests
if has '(make it|look) (better|nicer|pretty|prettier|modern|premium|clean)|beautif[a-z]*|polish (it|this|up|the (ui|page|design|screen))|redesign[a-z]*|revamp[a-z]*|looks? (generic|ai|cheap|bland)'; then
  append "[Direction first] \"Better\" needs a direction to be measured against. Check DESIGN_MAP.md → Character/World/Signature; if empty, run /design-brief and /direction and get agreement before restyling. For an existing screen, /slop-audit decides heavy, light or no slop first."
fi

# New pages / landing / hero
if has 'landing( page)?|hero|homepage|home page|marketing (page|site)|new page|pricing page'; then
  append "[Words before markup] Write the argument (claim → proof per section), the headline (≤2 lines) and one primary action before any layout. Never invent metrics, logos or testimonials; mark gaps [NEEDS PROOF]. See agent_docs/direction.md."
fi

# Page sections
if has 'nav ?bars?|navigation bars?|site headers?|mega ?menus?|footers?|ctas?|calls? to action|call-to-action|pricing( page| table| section)?|plans? (page|table)|hero( section)?s?'; then
  append "[Sections] Build only the sections the page argument asks for. agent_docs/sections.md has each section's variants, rules and slop signs: nav, hero, pricing, CTA, footer. Prices, tiers, urgency and social proof come from the user, never invented."
fi

# Motion
if has 'anim(ate|ated|ates|ating|ation|ations)?|transitions?|motion|framer|gsap|keyframes?|smooth(er|ly)?|micro-?interactions?|hover effects?'; then
  append "[Motion] Frequency gate first: keyboard and 100+/day actions get no animation. Transform/opacity only, ease-out, UI under 300ms, reduced-motion guard. /motion-craft to build, /motion-review to judge."
fi

# Logo
if has 'logos?|wordmarks?|app icons?|favicons?'; then
  append "[Logo] An existing logo stays unless the user says to change it. Use /logo: three directions that differ in idea or silhouette, the user picks, build in black, prove it at every size and on every ground, then export."
fi

# Brand
if has 'brand(ing)?|palettes?|colou?r (scheme|palette)s?|typefaces?|font pair(s|ing)?|visual identity'; then
  append "[Brand] Brand changes need the user's approval. Use /brand-method: sets differ on ≥2 axes, a reflex test against AI defaults, then stop for the user to pick. Claims about contrast are measured or labelled as estimates."
fi

# Forms / dialogs / interactive
if has 'forms?|inputs?|dialogs?|modals?|dropdowns?|menus?|navigation|navbar|keyboard|a11y|accessib[a-z]*|focus'; then
  append "[Interface] Labels on every control, visible :focus-visible, Enter/Escape where expected, errors next to fields, state in the URL where it should survive a reload. /interface-check before calling it done."
fi

# Data-heavy components
if has 'tables?|lists?|cards?|avatars?|dashboards?|feeds?|grid of'; then
  append "[Real data] Lorem ipsum hides layout bugs. Try long names, empty, one and 1,000 items, missing fields. /stress-ui reports what breaks."
fi

[ -z "$REMINDERS" ] && exit 0
emit_context "UserPromptSubmit" "$REMINDERS"
exit 0
