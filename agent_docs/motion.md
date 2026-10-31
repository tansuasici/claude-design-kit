# Motion

How to decide whether something moves, and how it moves if it does.

## 1. Should it animate at all?

| How often the user sees it | Decision |
|---|---|
| 100+ times a day (keyboard shortcuts, command palette) | **No animation.** |
| Tens of times a day (hover, list navigation) | Near-imperceptible, or nothing |
| Occasionally (modals, drawers, toasts) | Standard animation |
| Rarely or once (onboarding, success, celebration) | Delight is allowed here |

Keyboard-initiated actions don't animate. Producing zero lines of motion code is often the right outcome.

## 2. Name the purpose
**Feedback** · **spatial consistency** (where it came from or went) · **state indication** · **preventing a jarring change** · **explanation** (marketing and onboarding) · **delight** (rare tier only).
If you can't name one, don't build it. Data the user is reading or acting on doesn't move for style.

## 3. Cheapest tool that works
CSS transition → CSS `@starting-style` (entry) → CSS animation (predetermined, stays smooth under load) → WAAPI → Motion/Framer (springs, layout, exit, gestures).
If the task needs a *component* (toast, drawer, menu), use an accessible primitive. Don't hand-roll one.

## 4. Properties
- Animate **`transform` and `opacity` only**. `clip-path` is also acceptable. `height` is tolerated for accordions only.
- **Never use `scale(0)`.** Start from `scale(0.95–0.97)` plus `opacity: 0`.
- Popovers, menus and tooltips scale from the **trigger** (`transform-origin`). Modals stay centered.
- Never use `transition: all`. Name the properties (`transition-colors`, `transition-[transform,opacity]`).
- Animated blur stays small (under ~20px). Use `will-change` only after you've seen an actual problem.
- In Motion/Framer, prefer the full `transform` string over `x`/`y`/`scale` shorthands for motion that runs while the page is busy.

## 5. Easing and duration

**Easing**

| Situation | Curve |
|---|---|
| Entering or exiting | ease-out: `cubic-bezier(0.23, 1, 0.32, 1)` |
| Moving or morphing on screen | ease-in-out: `cubic-bezier(0.77, 0, 0.175, 1)` |
| Drawer / sheet | `cubic-bezier(0.32, 0.72, 0, 1)` |
| Hover color change | `ease` |
| Constant motion (progress, marquee) | `linear` |

**Never use ease-in on UI.** It delays the exact moment the user is watching.
(`cubic-bezier(0.22, 1, 0.36, 1)` is practically the same strong ease-out. Use whichever one the project already has. Don't add both.)

**Duration**

| Element | Duration |
|---|---|
| Press feedback, hover, toggles | 100–160ms |
| Tooltips, small popovers | 125–200ms |
| Dropdowns, selects | 150–250ms |
| Modals, drawers | 200–300ms |
| Stagger between items | 30–60ms, at most ~6 items |
| Marketing and explanatory | longer if needed |

**Product UI stays under 300ms.** 300–500ms is allowed only for page entrances on landing pages and first-load moments, never on repeated interactions.
Rise distance on enter: 6–12px. Press scale: 0.97–0.98. Exits can be faster than enters.

**Springs** are for drag with momentum, interruptible gestures, and things that should feel alive: `{ type: "spring", duration: 0.5, bounce: 0.2 }`. Keep bounce at 0.1–0.3. Avoid bounce on ordinary UI.

## 6. Interruption and exit
- Anything that can fire twice in a second (toasts, toggles) uses **transitions, not keyframes**. Transitions retarget; keyframes restart.
- Exit the way it entered.
- Use asymmetric timing where the user is deciding: the deliberate phase is slow (hold-to-confirm), the system response is snappy.

## 7. Accessibility and pointer gating
These ship **with** the animation, never as a follow-up.
```css
@media (prefers-reduced-motion: reduce) {
  .thing { transition: opacity 150ms ease; transform: none; }
}
@media (hover: hover) and (pointer: fine) {
  .card:hover { background: var(--surface-raised); }
}
```
Reduced motion means fewer and gentler animations, not zero: keep opacity and color, drop movement.
Autoplaying motion longer than 5s next to other content needs a pause, stop or hide control.

## Never ship
| Never | Instead |
|---|---|
| `transition: all` | Named properties |
| `scale(0)` entrance | `scale(0.95)` plus opacity |
| `ease-in` on UI | Strong ease-out |
| Animation on a keyboard or 100+/day action | None |
| UI duration over 300ms with no reason | 150–250ms |
| `transform-origin: center` on an anchored popover | The trigger origin |
| Keyframes on toasts or toggles | Transitions |
| Animating width/height/top/left/margin | Transform and opacity |
| Ungated `:hover` motion | `@media (hover: hover) and (pointer: fine)` |
| Missing reduced-motion handling | A gentler variant |
| `animate-pulse` / `animate-ping` on non-live things | Static |
| Everything entering at once | A 30–60ms stagger, or one entrance only |
