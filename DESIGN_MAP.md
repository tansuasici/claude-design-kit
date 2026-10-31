# DESIGN_MAP.md

> The single source of truth for this product's design direction. Every color,
> typeface, spacing value, icon and animation should trace back to a line here.
> Fill it with `/design-brief` (Product, Competitors, inventory) and
> `/direction` (Character → Tokens). Replace every `<…>`; session-start.sh
> treats `<` as "still the template".
>
> Changing Character, World, Signature or the palette needs the user's approval.

## Product
<One plain sentence: what it is, for whom, and the one thing this screen must get someone to do.>

- **Kind:** <page (read and scrolled) | app screen (worked in)>
- **Audience:** <…>
- **Existing brand:** <logo / color / typeface: keep, refresh or none>
- **Constraints:** <framework, component library, dark mode, languages/RTL, accessibility target>
- **Assets that exist:** <logo files, product screenshots, photography; plan only around these>

## Character
<2–3 concrete words, e.g. "patient, exact, a little dry".>
<!-- Don't use: clean, modern, sleek, minimal, premium, intuitive, seamless. slop-scan.sh flags them here. -->

## World
<A place or material to borrow from, not a style label. e.g. "a ship's chart room: paper, brass, pencil marks".>

Subject inventory (8–12 things only this product has):
- <…>

## Moments
<1–2 places that get rich color and detail. Everything else stays quiet.>
1. <…>

## Signature
<Exactly one ownable detail.>

**Idea sentence:** On this page, <subject thing> becomes <device>.

## Tokens
| Token | Value | Why (which line above) |
|---|---|---|
| Neutral ramp | <…> | <…> |
| Accent | <…> (contrast: <measured value + tool, or "estimated">) | <…> |
| Type | <family> / <partner, optional> | <…> |
| Type scale | <…> | |
| Spacing | 4px base: 4 8 12 16 20 24 32 40 48 64 80 96 128 | |
| Radius | <family> | <…> |
| Motion | ease-out `cubic-bezier(0.23, 1, 0.32, 1)`, UI < 300ms | |
| Icons | <set>, <size>/<stroke> | |

## Competitors
<3–5 real competitors or alternatives. The competitor test runs against these.>
- <name>: <what their screen looks like, in one line>

## Don'ts
<Corrections that should hold in future sessions. Add one each time the user says "this isn't us".>
- <…>
