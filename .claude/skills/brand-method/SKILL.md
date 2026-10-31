---
name: brand-method
description: Make or critique a brand identity (logo, type, palette) as 1–4 sets built together from one brief. Uses a one-message intake, one mechanism per set, decision axes, differentiation from real competitors, a reflex test against AI defaults, then a checkpoint where the user picks. Never picks for the user and never claims colors "convert".
user-invocable: true
---

# Brand Method

## Core Rule

**You design; measurements judge what's broken; the user picks.** Every claim about
a color, typeface or mark is either **measured** (with a tool and a value) or
labelled **judgement**. You present sets and **stop**. Never pick for the user.

Method: `agent_docs/brand-identity.md`.

## Steps
1. **Intake, in one message**, only what blocks you: logo / type / palette each `new · refresh · keep · none`; number of sets (default 3); site or files; languages; whether it shows numbers; then, if unknown, sector, audience, three attributes, 3–5 real competitors.
2. **Axes.** Pick 2–4 decision axes for this brief and place each planned set from −2 to +2. Sets differ on **at least two** axes.
3. **Per set**, write the **mechanism** in one sentence first, then derive the mark, type and palette from it. Add one expression move, and only one.
4. **Logo**: 4–6 one-line ideas, build one; check it at 16 and 32px. A wordmark needs one ownable detail plus a small mark.
   **Type**: display for voice, text for reading; prefer OFL; note any licence.
   **Color**: hue, chroma, lightness and ground; every color has a named job.
5. **Reflex test.** For every font, color and mark idea: "would I propose this for another brand in this sector?" If yes, justify it from the brief or replace it. **At least one set uses no AI defaults** (list in `agent_docs/brand-identity.md`).
6. **Competitors.** Say per set where it stands apart from the *named* competitors.
7. **Keep parts are constraints.** Build around them; flag clashes as suggestions only.
8. **Checkpoint, then stop:**
   ```
   ### A — <name>   ← recommended
   <Mechanism.> <How it differs from competitors.>
   Logo: … · Type: … / … · Color: … , … , …
   Checks: measured: … | judgement: … | AI-default flags: … (reason)
   ```
   "Pick a set, or ask for parts of different sets."
9. **After the pick**: add 1–2 misuses of this mark, write the tokens into `DESIGN_MAP.md → Tokens`, and list the deliverables. If the user needs files (SVG/PDF kit), say this skill stops at the method and the tokens.

## Never
- Claim a color or font "converts", "builds trust" or "feels premium" as evidence.
- Show a set you wouldn't defend, or fake a measurement.
- Reuse or imitate a real company's mark.
