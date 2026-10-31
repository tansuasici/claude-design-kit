# Tokens

Starting values to use when a project has no system yet. If the project
already has a good scale, keep its values and fix only how they're used. These
are starting points, not a house style. The direction in `DESIGN_MAP.md` can
move any of them. When it does, write the new value into the map.

> Values adapted from unslop's `references/tokens.md`. Not covered by the kit's
> MIT license; see `THIRD_PARTY_NOTICES.md`. The motion values are reconciled with
> Emil Kowalski's skills; see `agent_docs/motion.md`.

## Spacing
Scale: **4, 8, 12, 16, 20, 24, 32, 40, 48, 64, 80, 96, 128**. Any multiple of 4 is fine. A 2px step is fine for nudges inside small controls.

| Use | Value |
|---|---|
| Inside a control | 4–12 |
| Between related items (list rows) | 2–8 |
| Between groups (a label and its list, two cards) | 12–24 |
| Between sections | 32–64 (80–128 on landing pages) |
| Row height | 32 compact · 36 default · 40–44 touch |
| Hero, nav to headline | 96–128 desktop · 48–64 mobile |

Space shows grouping: the space inside a group is smaller than the space between groups.

## App layout
- Sidebar 240–280. Content is fluid, with 24–32 of page padding, capped at about 1440–1600.
- Top bar 56–64. Navigation rows 32–36 with a 2–4 gap. Section labels have 24 above and 8 below.
- The main chart takes at least ⅔ of the content width and is 280–360 tall. A second data block is a list or a table, not another chart of the same size.

## Neutral ramps
Apps and dashboards: keep surfaces graphite or similarly grey, because people look at them for hours.
Landing pages: tint the ramp toward the direction's **world**. Warm suits paper, wood, food and craft. Ink suits night, water and technical subjects.

| Role | Dark graphite | Dark warm | Dark ink | Light graphite | Light warm | Light ink |
|---|---|---|---|---|---|---|
| Deepest (sidebar) | #0f0f10 | #12110f | #07080d | — | — | — |
| Page | #141415 | #161513 | #0b0d14 | #fafafa | #f7f4ee | #f5f7fa |
| Card | #19191b | #1c1a18 | #11141c | #ffffff | #fdfbf7 | #ffffff |
| Raised (active row, input) | #232325 | #262421 | #1a1e28 | #f4f4f5 | #efe9df | #eceff4 |
| Primary text | #ededed | #efe9de | #eef0f5 | #171717 | #1f1b16 | #111827 |
| Secondary text | #a1a1a6 | #aaa398 | #a3a9b8 | #525252 | #5e554a | #4b5565 |
| Muted text and icons | #85858b | #8a847a | #7a8296 | #737373 | #7b7266 | #6b7487 |

Hairline: primary text at 6–10% opacity. Muted text is for meta and captions only.
Semantic colors: positive #4cc38a (dark) / #16a34a (light); negative #e5484d (dark) / #dc2626 (light).

## Accent
- Keep a real brand color. A hue-to-hue glow gradient is not a brand color unless the user says it is.
- If there's no brand color, take the accent from the world. Warm worlds suggest amber, coral or ember. Cool worlds suggest cobalt, teal or sky. Natural worlds suggest moss or sage. Avoid the purple-to-blue family unless the brand really is purple.
- The accent covers a few percent of the screen: the primary action, the selection, one key figure.
- Text on the accent must **measure** at least 4.5:1 (WCAG 2) or meet the APCA equivalent. Report the measured value; don't estimate it.

## Type families (all free)
| Character | Interface family | Optional partner |
|---|---|---|
| Precise, technical, calm | Geist, IBM Plex Sans, Inter | Geist Mono / IBM Plex Mono / JetBrains Mono for figures |
| Warm, friendly, human | Instrument Sans, DM Sans, Figtree | Instrument Serif / Newsreader for the hero only |
| Editorial, literary | Inter / Instrument Sans | Newsreader / Instrument Serif / Fraunces for headlines |
| Playful, bold | Space Grotesk, Bricolage Grotesque | A mono for small labels |

Use one interface family and at most one partner. Use a display serif only for large headlines.
Inter is fine *when chosen*. It's a default when nobody chose it.

## Type scale
| Use | Size / line height | Weight |
|---|---|---|
| Meta, counts | 12 / 16 | 400 (mono welcome) |
| Captions, secondary | 13–14 / 20 | 400 |
| Body, nav | 14–15 / 20–22 | 400–500 |
| Card figures | 28–32 / 1 | 500, tabular |
| Page title | 28–36 / 1.15 | 400–500 |
| Hero subhead | 18–20 / 28–30 | 400, max ~36rem |
| Hero headline | 56–72 desktop · 36–44 mobile / 1.02–1.08 | 400–500 |

Tracking: 0 under 16px (+0.01em is fine for small muted text). From 40px, −0.02em. From 56px, −0.03em.
Weights: 400 and 500, with 600 for rare emphasis. Never 700–900 on headings unless the direction names it.
Body measure: ~45–75 characters (`max-width: 65ch`).

## Radius
| Element | Radius |
|---|---|
| Keycap, tag, small button | 4–6 |
| Row, input, button | 8–10 |
| Card | 12–16 |
| Panel, window | 14–20 |

Nested radius: **inner = outer − padding**, never below 4.

## Icons
Use one set (the project's own, otherwise lucide), at 16 or 18px with a 1.5 stroke, in the muted or secondary text color, with an 8–10px gap to the label.

## Depth
- Dark: surface steps plus a hairline. An active row can carry an `inset 0 1px 0 rgb(255 255 255 / .12)` top highlight.
- Light: `0 1px 2px rgb(0 0 0 / .05)` for small things and `0 8px 24px rgb(0 0 0 / .06)` for floating ones. Layer ambient and direct shadows when needed.

## Motion
See `agent_docs/motion.md` for curves and durations. In short: use one ease-out curve, keep UI under 300ms, and animate transform and opacity only.

---

Part of unslop by Damir Sokolovsky (@heydamir), CC BY 4.0. Keep this credit in copies and adaptations.
