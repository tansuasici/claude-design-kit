---
name: interface-check
description: Check UI code against the interface guidelines (keyboard, targets, forms, state and URL, feedback, touch, layout, content and accessibility, performance, dark mode, hydration, design details) and report file:line findings with severities. Use before shipping a form, dialog, navigation, list or any interactive screen.
user-invocable: true
---

# Interface Check

## Core Rule

**Check behaviour, not taste.** This audit is about whether the interface *works*
for keyboards, touch, screen readers, slow networks and real content. Each
finding cites `file:line`, names the rule it breaks, and gives the concrete fix.
If you couldn't run or render something, say the finding is *inferred from code*.

Rules: `agent_docs/interface-guidelines.md`.

## When to Use
- Before shipping any interactive screen: forms, dialogs, menus, navigation, tables.
- After `/slop-audit`. A screen can be tasteful and still not work.
- The user names files or a route. Otherwise, check the files changed in the current diff.

## Steps
1. **Scope.** List the files or route under check. Read `agent_docs/interface-guidelines.md`.
2. **Walk the sections in order:** Keyboard → Targets → Forms → State and navigation → Feedback → Touch and drag → Animation → Layout → Content and accessibility → Content handling → Performance → Dark mode and theming → Hydration → Design details. Skip a section only when nothing in scope touches it, and say so.
3. **Exercise it if you can.** With a browser: Tab through the screen, press Escape in overlays, submit an empty form, resize to 375px, zoom to 200%, toggle dark mode. Note what you actually saw.
4. **Report**, then stop. Fix only what the user picks (or everything, if they asked for "check and fix").

## Output
```
## Interface check — <scope>

| # | Severity | Rule | Where | Problem | Fix |
|---|---|---|---|---|---|
| 1 | Blocker | Keyboard: visible focus | src/Button.tsx:14 | `outline-none` with no replacement | `focus-visible:ring-2 ring-offset-2` |
| 2 | Major | Forms: labels | src/Signup.tsx:40 | input has a placeholder only | add `<label htmlFor>` |
| 3 | Minor | Content: ellipsis | src/Search.tsx:9 | `Search...` | `Search…` |

Verified in browser: 1, 2 · Inferred from code: 3
Passed: <sections with no findings>
```
Severity: **Blocker** (someone can't complete the task: keyboard trap, unlabeled control, unreachable action), **Major** (works but fails a guideline that users will hit), **Minor** (polish).

## Never
- Report a contrast ratio you didn't measure as a measurement.
- Restyle while auditing. This skill reports; fixes are separate and scoped.
