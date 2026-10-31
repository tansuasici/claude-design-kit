---
name: motion-review
description: Review existing or changed animation code against ten motion standards (justified, frequency-appropriate, responsive easing, sub-300ms UI, correct origin, interruptible, GPU-only, accessible, asymmetric, cohesive). Output a Before/After/Why table, a tiered verdict, and an explicit Block or Approve.
user-invocable: true
---

# Motion Review

> Distilled from Emil Kowalski's `review-animations` skill (MIT).

## Core Rule

**Strict reviewer, specific fixes.** Every animation in scope is measured against
the ten standards. Each finding is a row with the exact before value, the exact
after value, and why, citing `file:line`. When unsure whether something feels
right, the strongest move is often to delete it.

Values: `agent_docs/motion.md`.

## The ten standards
1. **Justified**: it has a purpose (spatial, state, feedback, explanation, preventing a jarring change).
2. **Frequency-appropriate**: none for keyboard and 100+/day actions.
3. **Responsive easing**: ease-out or a strong custom curve; ease-in on UI is a block.
4. **Sub-300ms UI**: slower needs a stated reason.
5. **Origin and physics**: popovers scale from the trigger (modals stay centered); enter from `scale(0.95)` or so, never `scale(0)`.
6. **Interruptible**: transitions or springs for rapid or gesture motion; not keyframes.
7. **GPU-only**: transform and opacity; no layout properties.
8. **Accessible**: reduced motion honoured (gentler, not zero); hover gated by `(hover: hover) and (pointer: fine)`.
9. **Asymmetric**: deliberate phases are slow, system responses snap.
10. **Cohesive**: matches `DESIGN_MAP.md → Character` and the rest of the product.

## Flag on sight
`transition: all` · `scale(0)` · `ease-in` on UI · animation on a keyboard or 100+/day action · UI duration over 300ms with no reason · center origin on an anchored popover · keyframes on toasts or toggles · animated layout properties · Framer `x`/`y`/`scale` shorthands under load · a parent CSS variable driving child transforms · missing reduced motion · ungated `:hover` motion · symmetric hold or press timing · everything entering at once.

## Fix preference (earlier beats later)
1. Delete → 2. Reduce → 3. Fix easing → 4. Fix origin/physics → 5. Make interruptible → 6. Move to GPU → 7. Asymmetric timing → 8. Polish (stagger, blur-masked crossfade, `@starting-style`) → 9. Accessibility and cohesion.

## Output (both parts required)

**Part 1: findings**
| Before | After | Why |
|---|---|---|
| `transition: all 300ms` (`Card.tsx:12`) | `transition: transform 200ms cubic-bezier(0.23,1,0.32,1)` | `all` animates unintended properties off the GPU |

**Part 2: verdict**, grouped by tier, highest first; omit empty tiers:
1. Feel-breaking regressions
2. Missed simplifications
3. Performance
4. Interruptibility and timing
5. Origin, physicality and cohesion
6. Accessibility

End with **Block** (any feel-breaking regression, animation on a keyboard/high-frequency action, `scale(0)` or ease-in on UI, or a non-GPU animation with an easy fix) or **Approve**.

## Never
- Approximate values. Take curves and durations from `agent_docs/motion.md`.
- Approve motion you couldn't observe without saying it was reviewed from code only.
