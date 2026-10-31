---
name: direction
description: Write the five-line design direction (Product, Character, World, Moments, Signature) from the subject itself, plus the idea sentence, the competitor test, the page argument and the token set that follows. Then stop for the user's agreement before any CSS is written.
user-invocable: true
---

# Direction

## Core Rule

**Decide before you style, and derive from the subject, never from the trend.**
A direction is five short lines and one idea sentence. If a competitor could
use your direction unchanged, it's not a direction. You **stop** after writing
it, because changing the direction later means redoing everything.

Method: `agent_docs/direction.md`. Tokens: `agent_docs/tokens.md`.

## When to Use
- After `/design-brief`, before building.
- When a build has drifted generic and needs re-anchoring.
- When the user asks for "a few options": write three directions that differ on at least two axes.

## Steps
1. **Load** `DESIGN_MAP.md` (Product, Competitors, inventory) and `agent_docs/direction.md`. If Product or the inventory is empty, run `/design-brief` first.
2. **Page or app screen.** Say which. It changes how far the world can tint the surfaces.
3. **Five lines.**
   - **Product**: one plain sentence.
   - **Character**: 2–3 concrete words, with no banned words (clean, modern, sleek, minimal, premium, intuitive, seamless).
   - **World**: a place or material, not a style.
   - **Moments**: 1–2 places that get rich color and detail, named concretely.
   - **Signature**: exactly one ownable detail.
4. **Idea sentence.** "On this page, **[subject thing]** becomes **[device]**." Fill the first blank from the inventory.
5. **Competitor test.** Put each competitor from the map into the idea sentence and the character line. If either still works, rewrite it.
6. **Argument (pages only).** One line per section: claim → proof. Delete sections without a claim. Mark proof the user hasn't given as `[NEEDS PROOF]`, never as invented numbers.
7. **One live thing (pages only).** One interactive or per-visit element made from the idea, with a no-JS fallback.
8. **Tokens that follow.** Neutral ramp (tinted by the world), accent (from the brand, else the world) with the contrast you'll verify, type family plus at most one partner, radius family, the one motion curve.
9. **Present and stop.** Show the five lines, the idea sentence, the competitor test result, the argument, and the tokens. Ask: "Agree, or adjust?" **Write nothing else until the user answers**, unless they already said "just do it".
10. **On agreement**, write it into `DESIGN_MAP.md` (Character, World, Moments, Signature, Tokens). New "don'ts" go under Don'ts.

## Output shape
```
Kind: page | app screen
Product:   …
Character: … , … , …
World:     …
Moments:   1) …  2) …
Signature: …
Idea:      On this page, … becomes … .
Competitor test: <competitor> → fails because …
Argument:  hero — claim / proof · section — claim / proof · …
Live thing: …
Tokens:    ramp … · accent … (contrast to verify) · type … · radius … · ease …
```

## Never
- Pick the most familiar direction because it's safe. Pick the one that can carry something only this product has.
- Use a style label ("glassmorphism", "bento", "brutalist") as a world.
- Write CSS before the user agrees.
