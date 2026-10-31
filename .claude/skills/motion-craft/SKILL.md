---
name: motion-craft
description: Add or change UI animation the disciplined way. Decide first whether it should animate at all (frequency gate), name its purpose, pick the cheapest tool, then the right properties, easing, duration and origin, and ship reduced-motion and hover gating with it. Use when asked to animate, add transitions, or make something "feel smoother".
user-invocable: true
---

# Motion Craft

> Distilled from Emil Kowalski's skills (animate, animation-vocabulary,
> animation-performance; MIT). For recipes (toasts, drawers, hold-to-confirm,
> Expo), install upstream: `npx skills@latest add emilkowalski/skills`.

## Core Rule

**The best animation is often none.** Before writing motion code, answer two
questions: *how often will people see this?* and *what is it for?* If it's seen
100+ times a day, or you can't name a purpose, don't animate it. Writing zero
lines of motion code is a valid result.

Values: `agent_docs/motion.md`.

## Steps
1. **Frequency gate.** 100+/day or keyboard-initiated → none. Tens/day → barely there. Occasional → standard. Rare → delight allowed.
2. **Name the purpose.** Feedback · spatial consistency · state indication · preventing a jarring change · explanation · delight (rare only). Write it in a code comment if it's not obvious.
3. **Check the direction.** `DESIGN_MAP.md → Character`. A dashboard stays crisp; a playful product can be a little bouncier. Use the map's motion curve if one is set.
4. **Cheapest tool.** CSS transition → `@starting-style` → CSS animation → WAAPI → Motion/Framer (springs, layout, exit, gestures). Use the project's existing animation library if there is one; ask before adding one.
5. **Build it right.**
   - `transform` and `opacity` only. No `transition: all`.
   - Enter with ease-out `cubic-bezier(0.23, 1, 0.32, 1)`. Move on screen with ease-in-out. Never use ease-in on UI.
   - Durations: press 100–160ms · tooltip 125–200ms · dropdown 150–250ms · modal/drawer 200–300ms. UI stays under 300ms unless there's a stated reason.
   - Start from `scale(0.95–0.97)` plus `opacity: 0`, never `scale(0)`. Popovers use `transform-origin` at the trigger; modals stay centered.
   - Use transitions (which retarget) for anything that can fire twice a second. Keyframes are for predetermined sequences only.
   - Stagger groups at 30–60ms, ~6 items max.
6. **Ship the guards with it.**
   - `@media (prefers-reduced-motion: reduce)`: keep opacity and color, drop movement.
   - `@media (hover: hover) and (pointer: fine)` around hover motion.
7. **Look at it.** If you can, record or step through it frame by frame. If you can't, say the timing is unverified.

## Output
For each animation you add: the element, frequency tier, purpose, properties, duration and curve, and how reduced motion is handled. One line each.

## Never
- Animate keyboard shortcuts, the command palette, typing, or list navigation.
- Add `animate-pulse`/`animate-ping` to things that aren't live.
- Animate `width`, `height`, `top`, `left`, `margin` or `padding` (`height` on an accordion is the one tolerated exception).

`.claude/hooks/motion-gate.sh` warns when an edited file adds motion without a reduced-motion guard or animates layout properties.
