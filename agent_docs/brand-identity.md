# Brand Identity

How to make or critique a logo, type pairing and palette, as **sets** built
together from one brief. Load this only for brand work. For styling the UI
of a product whose brand already exists, use `direction.md` and `tokens.md`.

## The stance
You are the designer. Tools measure what's broken; you decide what's good. Every claim about a color, typeface or mark is either **measured** (by a tool, with the value) or labelled as **judgement**.

## 1. Intake: one message, only what blocks you
Ask in one message, and skip whatever the user or their site has already answered:
- For **logo**, **type** and **palette**, each one: `new` · `refresh` (evolve what they have) · `keep` (use as-is) · `none`.
- How many sets: **3** (default), or 1, 2 or 4.
- Site URL or files; the languages the brand writes in; whether the product shows numbers (that affects figure design in the type choice).
- Only if still unknown: sector, audience, three attributes, 3–5 real competitors.

## 2. Making the sets
- **One mechanism per set.** A single visual idea produces the mark, the type choice and the palette together. Write it as one sentence *before* choosing anything.
- **One expression move per set.** Only one thing gets to be loud.
- **Decision axes.** Pick 2–4 axes for this brief (for example geometric↔humanist, quiet↔loud, heritage↔new, warm↔cold) and place each set on them from −2 to +2. Sets must differ on **at least two axes**. Inside a set, the three parts sit at the same position.
- **Differentiate against the real competitors** the user named, not a generic list. Say for each set where it stands apart.
- **Reflex test.** For each font, color and mark idea, ask: *would I propose this for another brand in this sector?* If yes, justify it from the brief or change it. **At least one set uses none of the AI defaults** (below).
- **`keep` parts are constraints.** Build the new parts to fit them. If a kept part clashes, say so as a suggestion; never change it.
- Mark the one set you would defend as recommended, and know why.

## 3. Component craft
**Logo.** A mark identifies; it doesn't explain. Write 4–6 one-sentence ideas per set and build one with `/logo`. Check it at **16px and 32px** every round. A wordmark-only set still needs (1) one ownable detail drawn on the letters and (2) a designed small mark for 16–48px. Plain type with a first-letter favicon reads as stock.
**Type.** The display face carries the voice; the text face carries the reading. Pin variable axes (large optical size for display, text size for text). Prefer open licences (OFL / Google Fonts). For a commercial face, state the licence and offer a free alternative.
**Color.** A color is hue + chroma + lightness + the ground it sits on. Name every color's job. Logo colors are palette roles, not raw hex values.

## 4. AI defaults (the reflex list)
These show up for every brand when nobody decides. Each needs a reason from the brief, or it goes:
- Fonts: Inter, Poppins, Montserrat, Playfair Display, Space Grotesk as the "techy" pick.
- Palettes: violet/indigo-to-blue gradient, teal-and-coral, black plus one neon, "trust blue" for finance and health.
- Marks: abstract interlocking loops, a gradient blob, a sparkle or star, a letter in a rounded square, a hexagon or cube for tech, a leaf for "eco", a speech bubble for "community", a shield for "security".

## 5. Checkpoint, then stop
Present each set in this shape:
```
### A — <Set name>   ← recommended
<Mechanism, one sentence.> <Where it differs from the competitors.>
Logo: <idea> · Type: <display / text> · Color: <2–3 named colors>
Checks: <what was measured, and how> · <warnings, AI-default flags with their reasons>
```
Then: "Pick a set, or ask for parts of different sets." **Stop. Never pick for the user.**
After the pick: add 1–2 misuses of this particular mark to the guidelines, and write the chosen tokens into `DESIGN_MAP.md → Tokens`.

## 6. Honesty
- Measured failures (contrast, licence, glyph coverage, file validity) are **gates**. Heuristics are **warnings**; say they're uncalibrated when you mention them.
- Label evidence as `measured`, `judgement`, or by research strength (`strong` / `limited` / `practice`).
- **Never claim that a color or font "converts" or "builds trust."** Associations are weak and depend on context.
- Don't show a set you wouldn't defend. Label mock data as mock data.
- Never imitate or reuse a real company's mark.

## 7. Logo and icon craft
Used by `/logo`.

**Logo and app icon differ.** A logo has to be recognized, so it may be abstract. An app icon sits in a grid of neighbours, so a concrete object tied to the product's job can help it; it still has to read as this product and not as the category.

### Gates
A failed gate means revise before delivery. Several are judgement, so say what you saw at each size. Where you can, get a read from a fresh agent shown only the render.
- **Solid.** With every shape black, it is still recognizable. On an app icon, test the foreground alone.
- **Small.** It holds at 16px as a logo or 32px as an app icon. It may need its own simplified drawing at that size; a separate small mark is good practice, not a failure.
- **Reads as intended.** Name what a stranger would see at 32px. If that's another symbol, a currency sign or a power button, it fails.
- **Ownable.** Take the ownable detail away. If what's left would suit three unrelated products, the detail isn't doing the work. A letter on a platform's rounded mask isn't the reflex "letter in a rounded square" by itself, but a letter with no ownable detail still fails.
- **Greyscale.** Foreground and background still separate without hue. Run this once color exists.
- **Both grounds.** It works on light and dark, using the reversed file if needed, and on the brand color if it will sit there. Measure each pair as a WCAG contrast ratio and give the value. Logos are exempt from WCAG, so 3:1, borrowed from its non-text rule, is a working floor; say so when you use it.
- **One subject.** Nothing competes with the main shape, and no words explain it. A brand's own letters are fine.
- **Masks.** On an app icon, nothing important is cut by the rounded square or the circle.
- **Competitors.** It doesn't resemble a competitor's mark. Open their sites and look; if you can't see a mark, this goes under Not checked. Tell the user about any famous mark it reminds you of, named or not. This is not a trademark clearance.
- **File.** Marks and icons have a square `viewBox`; wordmarks and lockups have a tight one. No fixed `width` or `height`, no live `<text>`, no embedded raster, and it opens without errors.

### What to look at, by size
| Size | Look for |
| --- | --- |
| 16px | The silhouette, nothing else |
| 32px | The silhouette and the ownable detail |
| 64px | The idea still reads; gaps stay open |
| 180px | Balance, spacing between the parts, optical center |
| 1024px | Curve quality, edge joins, stray points |

### Symptoms
| What you see | Likely cause | Fix |
| --- | --- | --- |
| Could belong to anyone | No ownable detail | Change the one shape that makes it this product's; a recolor won't do it |
| Reads as something else | The outline matches a known symbol | Change the outline, then ask again what a stranger sees |
| Closes up at 16px | Gaps under about 1px at that size | Widen the gaps, drop a part, or draw a small version |
| Only works in color | Parts are separated by hue alone | Separate them with a gap or a shape, and recheck Solid |
| Centered but looks off | Centered by box, not by mass | Nudge toward optical center; triangles and arrows need it most |
| Busy | Too many parts | Merge them; aim for a shape you could describe in one sentence |
| Close to a competitor | Same idea and same outline | Change the idea and the outline together |
| Muddy on a launcher | Baked shadow, gloss or a long gradient | Remove it; a flat shape or a simple background reads better and platforms add their own effects |

### Exports
Platform rules change; these were checked in November 2026. Confirm them against the current docs before a store submission. The Browser and Print rows are common practice rather than platform rules; 192 and 512 are what Chrome asks for before it offers to install a web app. If a target can't be built or tested here, list it under Not checked.

| Target | Files | Rules |
| --- | --- | --- |
| Product | `logo.svg`, `logo-mono.svg`, plus `logo-dark.svg` if it differs. Add `wordmark.svg` and `lockup.svg` if asked for | `logo` is the square mark. The vector files are the source; everything else is generated from them |
| Browser | `favicon.svg`, `favicon.ico` (16 and 32px), `apple-touch-icon.png` (180px, opaque) | The SVG can switch with `prefers-color-scheme`; the ICO can't, so give it a ground or a color that survives both tab themes. Use the small drawing if there is one |
| Web manifest | `icon-192.png`, `icon-512.png`, `icon-maskable-512.png` | Keep the maskable icon separate with `"purpose": "maskable"`; its content stays inside a centered circle with a radius of 40% of the width. The `any` icons can be transparent with no padding, in a color that clears the bar on both grounds. The manifest file belongs to the project |
| iOS, iPadOS, macOS | 1024×1024 square, unmasked. Layered in Icon Composer (preferred), from SVG or PDF foreground layers with text outlined, or one PNG | No baked corners or custom shadows, highlights, bevels, blurs or glows. An imported background is full-bleed and opaque. Icon Composer needs the user's Mac. Check default, dark, clear and tinted appearances |
| Android | Foreground and background layers at 108×108dp, plus an optional `monochrome` layer | Vector means VectorDrawable XML in `res/`, not SVG. The logo is 48–66dp in the center; the outer 18dp on each side can be masked. No masks or background shadows in the layers |
| Google Play | 512×512, 32-bit PNG, sRGB, up to 1024 KB | Full square, no shadow: Play adds the corners and shadow itself |
| Print | `logo-mono.svg`, `lockup-mono.svg` | One color. State the minimum size in mm, and test a 1-bit version at the printer's DPI |
