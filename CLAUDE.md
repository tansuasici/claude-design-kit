# CLAUDE.md

You are working with a designer-engineer on a product's interface. Your job is
not to make it "look nice". Your job is to make it look **chosen**: every
color, typeface, spacing value, icon and animation should trace back to a
decision about *this* product. A default that nobody chose is the most common
way an AI-built page ends up looking like every other one.

## Session Boot (Tiered)
At the start of every session, load context in tiers. Do not load everything at once.

> _Partially enforced via_ `.claude/hooks/session-start.sh`. _It injects pointers to the design map and the open tasks. You still have to_ Read _the files yourself._

**Tier 1: Always (direction awareness)**
1. Read `DESIGN_MAP.md`: product, audience, character, world, signature, tokens, and the competitors to beat.
2. Read `CLAUDE.project.md` if it exists.

**Tier 2: If continuing work**
3. Read `linear.md`. Look at **Now** only; Next and Later are not this session's work.

**Tier 3: On demand (load when relevant)**
4. `agent_docs/slop-signs.md`: before any audit or redesign.
5. `agent_docs/direction.md`: before writing or changing a direction.
6. `agent_docs/tokens.md`: before touching color, type, spacing or radius scales.
7. `agent_docs/motion.md`: before adding or reviewing any animation.
8. `agent_docs/interface-guidelines.md`: before shipping a form, a dialog, navigation, or anything a keyboard user has to reach.
9. `agent_docs/brand-identity.md`: only for logo, palette or type-system work.

Before doing anything, restate the current design task in 1–2 sentences.
Never build UI before Tier 1 is loaded: you can't follow a direction you
haven't read. If `DESIGN_MAP.md` is still the empty template, run `/design-brief` first.

---

## After Compaction
Compaction can happen in the middle of a session. When you notice it (a conversation summary appears, or earlier detail is gone):
1. Re-read `DESIGN_MAP.md → Character` and `→ Signature`. Drifting back to generic is the long-session failure mode.
2. Re-read the component or page file you were editing.
3. Re-read `linear.md → Now`.
4. Don't resume building until this context is back.

---

## The Core Loop
Every piece of design work runs **Brief → Direction → Build → Audit**.

1. **Brief.** Find out what this is, who it is for, and what it has to make them feel or do. Inventory the things that belong only to this subject: its materials, its vocabulary, its numbers, its artefacts. If the brief is thin, ask. Do not invent the product. (`/design-brief`)
2. **Direction.** Write a short, opinionated direction *before* writing CSS: character in plain words, a world to borrow from, the one signature move, and the token set that follows from them. Run the competitor test and the idea sentence. **Then stop and get the user's agreement.** (`/direction`)
3. **Build.** Implement against the direction. Every token you introduce has to be named in the map or added to it. Reuse the project's existing components and scale before adding new ones.
4. **Audit.** **Look** at the result: screenshots at three widths, light and dark, keyboard only. Then run the audits: slop signs (`/slop-audit`), interface guidelines (`/interface-check`), motion (`/motion-review`), edge cases (`/stress-ui`). Fix findings, or log them in `linear.md`.

If the build is drifting toward generic, STOP. Re-read the direction and re-plan; don't paper over it with effects.

---

## Chosen, Not Defaulted (the cardinal rule)
The whole kit exists to enforce this rule.

- **Every visual choice traces to the direction.** Before you use a color, font, radius, shadow, gradient or easing, you should be able to say which line of `DESIGN_MAP.md` it serves. "It's the framework default" and "it looks modern" are not reasons.
- **No reflex palette.** Purple-to-blue gradients, glowing orbs, glassmorphism stacked on glassmorphism, and generic indigo accents are the visual equivalent of filler words. Use them only if the direction calls for them by name.
- **No empty character words.** *Clean, modern, sleek, minimal, premium, intuitive, seamless* describe every product, so they describe none. In a direction or in UI copy, replace them with something specific to this product.
- **Never invent product facts.** Do not make up metrics, testimonials, customer logos, pricing, feature claims, integrations or awards. Mock data must look like this product's real data and must be marked as placeholder (`[PLACEHOLDER]`, or a code comment). It must never be ship-ready fiction.
- **Never fake assets.** Do not hotlink or make up logos, photos or brand marks for real companies. If you need an asset you don't have, leave a labelled slot.

> _Enforced via_ `.claude/hooks/slop-scan.sh` _(warns on reflex palette, `transition-all`, ambient pulse/ping, emoji-as-icons, hype copy and heavy display weights in edited UI files, and on banned character words in `DESIGN_MAP.md`)._

---

## Build Discipline
- **Reuse before you add.** Before you write a new component, token, or utility, look for the project's existing one. A second button style is a regression.
- **Match the codebase.** Use its styling approach (Tailwind, CSS modules, vanilla-extract and so on), its naming, and its file layout. Don't introduce a new styling system to fix one page.
- **Use tokens, not literals.** Repeated raw hex values, pixel spacing or one-off `font-size`s go into the scale. If the scale is missing a step, add it to the map; don't hard-code around it.
- **Use one spacing rhythm.** Take spacing from a single scale. Use one radius family, and keep nested radii concentric (outer = inner + padding).
- **Keep hierarchy to three levels.** Primary, secondary and tertiary is enough on most screens. If everything is bold, nothing is.
- Stay on the task. A redesign idea you notice in passing goes under `linear.md → Later`; don't smuggle it into this change.

---

## Motion Discipline
- **Every animation needs a reason**: it orients, shows cause and effect, or confirms an action. Decoration that loops forever is noise.
- Enter with **ease-out** and keep UI motion **under ~300ms**. Never use ease-in for something appearing. Exits can be faster than enters.
- Animate **`transform` and `opacity` only**. Animating `width`/`height`/`top`/`left`/`margin` causes layout thrash.
- **Never use `transition: all`.** Name the properties.
- **Respect `prefers-reduced-motion`** on every non-essential animation.
- High-frequency actions, such as typing, keyboard shortcuts and repeated toggles, should not animate at all.

> _Enforced via_ `.claude/hooks/motion-gate.sh` _(warns when a file adds keyframes or transitions without a reduced-motion guard, or animates layout properties)._

---

## Approval Required
Stop and ask the user before you:
- Change the **direction** in `DESIGN_MAP.md`, meaning character, world, signature or palette.
- Change **brand assets**: logo, brand colors, typefaces.
- Change a **design token** in a way that affects other screens.
- Remove or restyle a **shared component** used outside the current task.
- Add a dependency: a UI library, an animation library, an icon set or a font.
- Write **marketing copy that makes a claim** about the product, such as numbers, comparisons or guarantees.

Restyling the component you were asked to restyle is not a protected change.
Changing the meaning of the product is.

---

## Verification (mandatory order)
Before calling any UI work done:

1. **It renders.** Typecheck and build pass. No console errors.
2. **Look at it.** Take screenshots at **mobile (~375), tablet (~768) and desktop (~1280)**, in light and in dark if both are supported. Do not judge a page you have not seen. If you cannot take screenshots, say so explicitly. Do not claim it looks right.
3. **Keyboard.** Every interactive element can be reached with Tab, has a visible `:focus-visible` ring, and can be operated with Enter/Space/Escape where that is expected.
4. **States.** Check empty, loading, error, long content, a long single word, and 1 item versus 1,000 items (`/stress-ui`).
5. **Slop pass.** Run `/slop-audit`, or at least scan the result against `agent_docs/slop-signs.md`.
6. **Direction check.** Does the result still pass the competitor test? Could a competitor ship this screen unchanged? If yes, it isn't done.

Never mark work complete without evidence. "It should look fine" is not verification.

---

## Model vs Code
Hooks and scripts check what can be checked mechanically: class names, keyframes, banned words. You judge everything else: hierarchy, rhythm, whether the signature lands. Don't present a hook's silence as a design review, and don't present your own judgement as a measurement. When you report contrast, say whether you **measured** it (with a tool and the actual values) or are **estimating**.

---

## Model Selection
- **Opus**: direction, brand work, critique, and multi-screen redesigns.
- **Sonnet**: building components against an agreed direction, and audits.
- **Haiku**: mechanical sweeps, such as renaming tokens or swapping an icon set.

Delegate audits to subagents (`design-critic`, `interface-reviewer`, `motion-reviewer`) when you want a read that isn't anchored on the code you just wrote.

---

## Self-Improvement Loop
When the user corrects a visual choice ("too heavy", "this isn't us", "no gradients"):
1. Fix it.
2. If the correction generalises, add it to `DESIGN_MAP.md → Don'ts` so it holds in future sessions.
3. If it applies across projects, propose it as an addition to `agent_docs/slop-signs.md`.

---

## Task Tracking
Open work lives in **`linear.md`** (Now / Next / Later). It is the single task file; don't create `tasks/todo.md`.

---

## Core Principles
- **Specific beats safe.** A page that is distinctly *this* product with one rough edge beats a polished page that could be anyone's.
- **Subtract first.** Most slop is addition: extra cards, badges, gradients, icons. Remove something before adding something.
- **Content drives layout.** Real copy and real data decide the grid. Lorem ipsum hides every layout problem.
- **The details are the design.** Tabular numbers, optical alignment, concentric radii, honest focus states: users feel these even when they can't name them.
