---
name: slop-audit
description: Audit a screen for AI-slop signs (reflex gradients, glows, emoji icons, hype copy, heavy headings, pulsing elements, off-scale spacing, template look), decide how much slop there is (heavy, light, none), set or confirm the direction, and fix in nine ordered passes. Use when a UI "looks AI-made", generic or templated, or before shipping any screen.
user-invocable: true
---

# Slop Audit

## Core Rule

**Fix the craft, keep the product.** The features, the content and the order of
sections stay. What changes is that every size, color, word and image becomes
deliberate. Slop is usually *addition*, so the fix is usually subtraction plus
one chosen thing. Never change a good screen just to make it different.

Signs: `agent_docs/slop-signs.md`. Values: `agent_docs/tokens.md`. Motion: `agent_docs/motion.md`.

## Steps

### 1. Look
Render the screen and take screenshots (desktop and ~375px, plus dark if supported). If you can't render, say so and audit from the code; label every finding as *inferred*.

### 2. Audit
Go through **every group** in `slop-signs.md` (surfaces and color, type, icons, spacing, copy, components, landing, visuals, motion, template look, kit additions). List each sign with where it lives: `file:line` or a screen region.

### 3. Decide how much
- **Heavy slop**: most groups have hits. Full run: a new direction from the product, then all nine passes.
- **Light slop**: mostly designed, a few signs. Polish mode: fix only what the audit found, take the direction from the existing brand, keep palette, type, layout and visual. Bigger ideas go into the report as suggestions.
- **No slop**: say so plainly. Suggest 2–3 refinements at most, with exact values, and apply them only if the user agrees.

### 4. Direction, then stop
If `DESIGN_MAP.md` already has an agreed direction, confirm it in one line. Otherwise write the five lines (Product, Character, World, Moments, Signature; see `/direction`). Show the audit and the direction, and **wait for the user** unless they said "just do it".

### 5. Nine passes, in order
Finish each pass across the whole screen before starting the next.
1. **Spacing**: 4px grid; same thing, same size; space shows grouping; remove one-off values.
2. **Color**: one neutral ramp tinted by the world; three text roles; one accent used rarely; no hue gradients, glows, color washes or neon borders; hairline borders.
3. **Icons**: emoji → one line set (the project's, else lucide), one size and stroke, colored by text role.
4. **Copy**: plain statements; changes with a reference; short placeholders; no hype; no invented proof (ask instead).
5. **Type**: family from the character; 400/500 (600 at most); hierarchy from size and color; sentence case; tabular numbers.
6. **Layout**: the main thing gets the most space; vary the widths in card rows; heroes are asymmetric or text over the product; one primary action.
7. **Details**: concentric radii; quiet badges; focus rings; empty, loading and error states.
8. **Visuals**: the product itself, or one concrete object from the world. Never a nebula, an orb, or text baked into an image.
9. **Motion**: one ease-out curve; transform and opacity only; nothing ambient; reduced motion. (`/motion-review` for depth.)

Copy comes before type and layout because headline length decides size and placement. Visuals and motion come last because they should fit a screen that already works without them.

### 6. Check
Render again and compare with the audit list. Check the template look: does it now look like *every* cleaned-up screen? Run the competitor test against `DESIGN_MAP.md → Competitors`. Fix whatever is still on the list. Render at most three times.

### 7. Report
- Mode (heavy / light / none) and the direction used.
- Per pass: a few lines on what changed, with `file:line`.
- Suggestions you didn't apply (light mode), and anything left `[PLACEHOLDER]` or `[NEEDS PROOF]`.

## Never
- Remove features, sections or content to make a screen "cleaner".
- Replace a real brand color with your preferred accent.
- Claim contrast passes without measuring. Say *estimated* if you didn't measure.
