# Interface Guidelines

The rules that make an interface work for keyboards, touch, screen readers,
slow networks and long content. They aren't about taste, and every project
needs them.

Each rule is phrased so you can check it. `/interface-check` goes through these sections in order.

## Keyboard
- Everything that can be clicked can be reached with Tab and operated with Enter or Space. Escape closes overlays.
- Focus is always visible. Use `:focus-visible` rings, and never `outline: none` without a replacement. Use `:focus-within` for grouped controls.
- Manage focus. Trap it inside modals, return it to the trigger when an overlay closes, and move it to new content when that content replaces the view.
- Follow WAI-ARIA keyboard patterns for menus, tabs, listboxes and comboboxes (arrow keys, Home/End).

## Targets
- Hit targets are at least 24×24px, and at least 44×44px on touch. If the visual is smaller, enlarge the target with padding or a pseudo-element.
- Inputs are at least 16px on mobile, so iOS doesn't zoom on focus.
- `touch-action: manipulation` removes the double-tap zoom delay on controls.

## Forms
- Enter submits a single-field form. In a textarea, ⌘/Ctrl+Enter submits.
- Every control has a `<label>` (or an `aria-label`), and clicking the label focuses the control.
- Keep the submit button enabled until the request starts. Disable it while in flight and show a spinner or progress. Don't pre-disable it to "prevent errors".
- Validate on blur or submit, not on every keystroke. Show the error next to the field, and focus the first invalid field on submit.
- Set `autocomplete`, the right `type`/`inputmode`, and `spellcheck="false"` for emails, codes and usernames.
- Don't block paste. Trim trailing whitespace from input.
- Placeholders show an example of the value (`name@company.com`). They don't replace a label. End them with `…` when they suggest more.
- Warn before navigating away from unsaved changes.

## State and navigation
- The URL reflects the state: filters, tabs, pagination and expanded panels can be deep-linked and survive a refresh.
- Navigation uses real links (`<a>` / `<Link>`), so Cmd-click, middle-click and "open in new tab" work.
- Back and Forward restore scroll position and the previous state.
- Destructive actions need either a confirmation or an undo window. Undo is better.

## Feedback
- Optimistic UI where it's safe, with a rollback on failure.
- Async status updates (toasts, saved/failed) are announced with a polite `aria-live` region.
- Loading shows up after a short delay (~150–300ms) and then stays a minimum time (~300–500ms), so fast responses don't flicker.
- Error messages say what happened and what to do next. Don't stop at "Something went wrong."

## Touch and drag
- Hover effects are gated behind `@media (hover: hover) and (pointer: fine)`. Nothing important is available only on hover.
- During a drag, disable text selection and mark dragged elements `inert`.
- Use `overscroll-behavior: contain` in modals, drawers and sheets.

## Animation
See `agent_docs/motion.md`. In short: honour `prefers-reduced-motion`; animate compositor properties (transform, opacity); never use `transition: all`; animations can be interrupted; set `transform-origin` to where the motion starts.

## Layout
- Optical alignment beats mathematical alignment. Adjust by ±1px where an icon or glyph looks off.
- Every element aligns to something deliberate: a grid, a baseline, an edge.
- Check at mobile, laptop and ultra-wide widths, and at 200% zoom.
- Respect safe areas (`env(safe-area-inset-*)`). Avoid unwanted scrollbars, and fix the overflow that causes them.
- Let the browser size things (flex, grid, intrinsic sizing) rather than measuring in JS.

## Content and accessibility
- Typography: use `…` (not `...`), curly quotes, and non-breaking spaces in units and shortcuts (`10 MB`, `⌘ K`).
- Numbers that change or sit in columns use `font-variant-numeric: tabular-nums`.
- Icon-only buttons have an `aria-label`. Decorative icons are `aria-hidden`.
- Use semantic HTML before ARIA: `<button>`, `<a>`, `<label>`, `<table>`, headings in order.
- Use a skip link and hierarchical headings, and use `scroll-margin-top` on anchor targets.
- Status is never shown by color alone. Pair it with an icon or text.
- Format with the locale: `Intl.DateTimeFormat` and `Intl.NumberFormat`, never hand-built strings. Detect language from `Accept-Language` or the browser, not from IP.
- Use the right input `type` (`email`, `tel`, `url`, `number`) so mobile keyboards match.

## Content handling
- Containers handle short, average and very long content. Truncate with `text-overflow`/`line-clamp` or wrap with `overflow-wrap: anywhere`. Flex children that should shrink need `min-width: 0`.
- Design the empty state, the single-item state, and the "too many" state. Never leave a blank area.
- Write user-generated text into the layout as data, not markup, and make sure the layout survives it (`/stress-ui`).

## Performance
- Lists with more than ~50 items are virtualised, or paginated.
- Reserve space for images and embeds (`width`/`height` or `aspect-ratio`) so the layout doesn't shift.
- Preload above-the-fold fonts and images. Lazy-load the rest.
- Batch DOM reads and writes. Avoid layout reads in loops. Test with CPU and network throttling.
- Keep input handlers cheap. Prefer uncontrolled inputs, or debounce expensive work.

## Dark mode and theming
- Set `color-scheme: light dark` (or the scheme the page is in) on `<html>`, so scrollbars and native controls match.
- Set `<meta name="theme-color">` to match the page background.
- Give native `<select>` options explicit colors on Windows dark mode.

## Hydration
- Inputs with `value` have an `onChange`. Otherwise use `defaultValue`.
- Guard date, time and locale rendering against server/client mismatch.

## Design details
- Layered shadows (ambient plus direct) look more real than one heavy shadow.
- Nested radii are concentric: the child radius is ≤ the parent radius minus the padding.
- Borders and shadows blend with the surface. Translucent hairlines look crisper than solid grey lines.
- Check contrast with APCA (or WCAG 2 at 4.5:1 for text and 3:1 for UI). Interactive states (hover, active, focus) have more contrast than the rest state.
- Tint neutrals toward the brand hue only slightly.
