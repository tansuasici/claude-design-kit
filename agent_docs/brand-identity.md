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
**Logo.** A mark identifies; it doesn't explain. Write 4–6 one-sentence ideas per set and build one. Check it at **16px and 32px** every round. A wordmark-only set still needs (1) one ownable detail drawn on the letters and (2) a designed small mark for 16–48px. Plain type with a first-letter favicon reads as stock.
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
