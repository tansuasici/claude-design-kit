---
name: stress-ui
description: Break a component with worst-case but realistic data (long names, unbreakable emails, CJK/RTL, 0/1/1,000 items, huge numbers, missing fields), wire a dev-only data toggle, check at 320px, 200% zoom, dark mode and RTL, and report Broken/Ugly/Fragile findings with fixes. Report only; fix on request.
user-invocable: true
---

# Stress UI

## Core Rule

**Components are built against kind data. Test them against real data.** The
worst case must be *plausible*: values a real user, a schema or a translation
could produce, not random noise. Swap data only at the data boundary, never by
editing the component. Report, then **stop**; the user decides what to fix.

## Steps

### 1. Map the surface
Table every field the component renders: field · source · type · limit (schema, form, or none).

### 2. Build the worst case
One fixture shaped exactly like the existing demo data. Spread the failures across the first few rows, which are what's on screen. Typical values:
- **Names**: `Aleksandra Wiśniewska-Kowalczyk`, `Jo`, `王秀英`, `نور الهدى عبد الرحمن`, `👩🏽‍💻 Priya`, missing.
- **Identifiers**: `bartholomew.fitzgerald@northwind-industries-holdings.example.com`, a UUID, a long file name with a version at the end.
- **Copy**: `Benachrichtigungseinstellungen`, a 30% longer translation, twelve tags, an empty title, `<script>`/`&amp;`/`**bold**` as literal text, a 2,000-character paste.
- **Numbers**: `0`, `1` (plurals), `1284567.891`, negative, `null`.
- **Collections**: empty, one, 1,000+ (if unpaginated).
- **Time and media**: far past or future dates, broken image URLs, odd aspect ratios.
Also add separate **Empty**, **One** and **1,000 rows** states.

### 3. Wire a dev-only toggle
A segmented control, fixed bottom-center: **Demo / Worst case / Empty / One / 1,000 rows**. In an app, read it from `?data=` where the fixture is chosen. Standalone, use one HTML file with the data inline. Keep it plain chrome, with no animation on the content.

### 4. Break it
Check at the real container width, then 320px and the widest layout; at 200% zoom; in dark mode and RTL (`dir="rtl"`) if supported. Screenshot if you can; otherwise say which findings are inferred.

| What you see | Usual fix |
|---|---|
| Avatar or icon squished | `flex-shrink: 0` |
| Text overflows its box | `min-width: 0` (grid: `minmax(0, 1fr)`) |
| Email or URL runs off the edge | `overflow-wrap: anywhere` |
| Trailing menu pushed off-row | `min-width: 0` on the middle, `flex-shrink: 0` on the action |
| Badge wraps | `white-space: nowrap; flex-shrink: 0` |
| "1 members" | `Intl.PluralRules` |
| Numbers jitter or misalign | `tabular-nums` |
| `1284`, `NaN`, `undefined` | `Intl.NumberFormat`, null guards |
| Wrong initials or `�` | `Intl.Segmenter`, first and last word, fallback |
| Diacritics clipped | looser `line-height`, no `overflow: hidden` on text |
| Truncated with no way to read it | `title`/tooltip plus the full value elsewhere |
| 1,000 rows stutter | virtualise or paginate |

Truncate, wrap or clamp **per field**. Wrap identifying text. End-truncate secondary metadata. Middle-truncate things that differ at the end (file names, paths). Clamp card previews. **Never truncate** numbers, amounts or dates.

### 5. Report and stop
```
| # | Severity | Field | Worst-case value | What happens | Fix (file:line) |
```
Severity: **Broken** (unreadable, unreachable, or wrong data) · **Ugly** (visibly wrong) · **Fragile** (fine now, one step from breaking: no limit, no fallback).
Then: **Decisions for you** (truncate vs wrap, paginate vs virtualise, one line each with a recommendation), **What held up**, and where the toggle lives. Close with: "Say `fix all` or `fix 1, 3`."

### 6. Fix on request
Apply only the named fixes, using the project's tokens. Flip through **every** state again, Demo included. Keep the fixture as a regression test.
