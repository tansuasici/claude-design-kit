# Direction

A direction is the short, opinionated decision that comes **before** any CSS.
Everything that follows (tokens, layout, copy, visuals, motion) is checked
against it. Without one, the model fills every gap with its average, and the
average is what every AI-built page looks like.

## 0. Page or app screen?
Decide this first. It changes most of the rules below.
- **A page** is read and scrolled: landing, marketing, product site, portfolio, event. The idea, the argument and the "one live thing" all apply. Surfaces may be tinted toward the world.
- **An app screen** is worked in: dashboard, settings, inbox, editor, admin. Surfaces stay neutral, density is a feature, and repeated panels and small labels are normal. The world shows up in the accent, the charts and the moments, not in the chrome.
A product site that shows its app is a page. The app fragments on it follow the app-screen rules for what's inside them.

## 1. Inventory the subject
Before the direction, write down **8–12 things that belong to this product and to no competitor**:
its name and what the name means; its users' vocabulary; the numbers in the brief; the constraint it lives with; its materials and colors; its rituals and hours; the printed or physical artefacts of its world (ticket, label, receipt, invoice, terminal, timetable); the output it produces.
This list is where the world, the moments and the signature come from. If you can't fill it, the brief is too thin. Ask (`/design-brief`); don't invent.

## 2. Write the five lines (the direction)
Write these into `DESIGN_MAP.md`.

- **Product.** What it does and for whom, in one plain sentence.
- **Character.** Two or three concrete words, such as *calm, exact, a little warm* or *fast, technical, playful*. **Banned:** clean, modern, sleek, minimal, premium, intuitive, seamless. They describe every template. (`slop-scan.sh` warns when they appear in `DESIGN_MAP.md`.)
- **World.** The place or material the product naturally belongs to: paper and ink, instruments and night shifts, maps and window light. The world sets the neutral tint, the accent and the visual.
- **Moments.** One or two places where the screen gets rich color, material and detail, chosen from what the product shows. Say exactly what they are.
- **Signature.** **One** small detail only this product would have, used consistently: a live status dot, keycaps, a route line, hand-drawn underlines. One detail, not five.

If the product already has a real brand (logo, color or typeface that isn't slop), keep it and build the direction around it. A violet-to-blue gradient with sparkles is not a brand unless the user says it is.

## 3. The argument (pages)
List the page as **claims with proof**, one line per section. The claims decide which sections exist and in what order. **Delete any section that has no claim.** This is how you avoid the stock sequence: hero → logos → three features → testimonial → pricing → CTA.
Proof is never invented: no customers, quotes, reviews, press, logos or business numbers that the user didn't give you.

## 4. The idea sentence
> On this page, **[something that belongs to the subject]** becomes **[the device the layout uses]**.

Fill the first blank from the inventory, never from the category. Places to look: its **output**, its **object or shape**, its **name**, its **place**, its **ritual**, its **artefact**, its **opposite** (the category that owns the feeling this one lacks).

**Competitor test.** Put the nearest real competitor into the sentence. If it still works, the idea belongs to the category, not the product. Try again. "Clean and modern" is not an idea.

## 5. One live thing (pages)
Give the page one thing the visitor can *do*, or that's different on each visit, built from the idea. For example: set the loan and read the real monthly figure, type your name and see it in the product's output, see whether the thing is open right now.
Rules: it uses the subject's real content, it works with a thumb, it has a plain fallback without script, it never blocks reading, and there is **one**, not a playground.

## 6. Tokens follow
Only now pick the values: neutral ramp (tinted by the world), accent (from the brand or the world), type family (from the character), radius family, motion curve. Start from `agent_docs/tokens.md` and write the chosen values into `DESIGN_MAP.md → Tokens`.

## 7. Words before markup
- Headlines fit in **two lines or fewer** at every width. About 32 characters is safe at a confident size.
- One supporting sentence directly under the headline that says plainly what the thing is.
- One primary action, named for what it does.
- The first screen answers the visitor's first question in large type.
- Write the **full** content. Thin sections lose to busier pages. Sample details are fine where the brief leaves gaps, as long as they're marked `[PLACEHOLDER]` and listed in the report.

## 8. Stop and agree
Show the inventory, the five lines, the idea sentence and the competitor test to the user, and **wait**. Changing the direction later means redoing everything. Skip the wait only when the user has said "just do it".

## Choosing among several directions
If you're unsure, write **three** directions that differ on at least two axes (for example, quiet↔loud, warm↔technical, editorial↔product-led). Hold each against the inventory and pick the one that can carry something only this product has, *not* the most familiar one. Say in one line why.

## Red flags in a direction
- Any banned character word, or a character that would also describe the competitor.
- A world that is a style ("glassmorphism", "brutalist") instead of a place or material.
- Five signatures.
- Moments that are effects ("glow on hover") instead of content (a rendered invoice, a route map).
- An accent that is purple-to-blue for a product with no purple in its world.
