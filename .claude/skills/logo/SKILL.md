---
name: logo
description: Make, refine or critique a logo mark, wordmark or app icon as real SVG files. Three directions that differ in idea or silhouette, the user picks, then build in black first, prove it on a sheet at every size and on every ground, revise one change at a time, and export for web, iOS and Android. Never replaces an existing logo without the user's say.
user-invocable: true
---

# Logo

## Core Rule

**A mark has to hold at small size, in one color, before it gets anything else.**
Draw it, render it and look at it; a mark you haven't seen hasn't passed. The user
picks the direction, and an existing logo stays until they say otherwise.

Method: `agent_docs/brand-identity.md → Logo and icon craft`. For a whole identity
(type and palette too), start at `/brand-method`, which hands the mark to this skill.

## Know the limit
Hand-written SVG suits geometric marks, letterforms and simple objects. It doesn't
suit a detailed mascot or illustration. If the idea needs one, say so before building,
write the brief for an illustrator or an image tool, then run steps 4–10 on what comes back.

## Steps
1. **Intake, in one message**, only what blocks you: new, refresh or critique; mark, wordmark or app icon; where it has to live (favicon, nav, launcher, print); 3–5 real competitors. Colors and type already in `DESIGN_MAP.md` are constraints. **Refresh** starts from the existing logo and keeps what makes it recognizable.
2. **Three directions.** Write 4–6 one-line ideas and keep three that differ in **idea or silhouette**; a different color doesn't count. Drop any idea that would suit three unrelated products. An idea on the reflex list stays only if you can justify it from the brief. Open each competitor's site and look at its mark; memory isn't looking. Draw each direction as a rough black SVG and show them with: the idea in one line, the one ownable detail, the plan at 16px, and where it stands apart from the competitors you saw. Recommend one, then **stop and let the user pick**.
3. **Build in black.** A square `viewBox`, whole-number coordinates where you can, as few shapes as the idea allows. Also make the reversed version for dark grounds.
4. **Prove it.** Copy `proof-sheet.html` from this skill next to the mark and render it as its header comment says, then look at the screenshot and at the mark alone at 1024px. If you can't render, say so and mark every result *inferred*; don't report a pass.
5. **Gates.** Run every gate in the method. Report each as pass or fail with what you saw, and give measured values where you measured. A gate you couldn't run goes under Not checked, never under pass.
6. **Revise.** Find the failure that costs the most, make one structural change and at most one polish change, then go back to step 4. Comparing variants of one change counts as one round. Stop when the gates pass; more variation after that only loses the identity. After three rounds without passing, stop and say what's still failing.
7. **Color.** Once the black mark passes, choose 1–3 colors from the palette roles. If no roles exist, name them yourself and mark them as proposed. Rerun steps 4–5 on the colored files. On light and dark, a mark can stay one color only if it clears the contrast bar on both.
8. **Wordmark and lockup**, if asked for. No typeface yet? Offer 2–3 open-licence options that avoid the reflex list; using a font the project doesn't have needs approval, even once outlined. Convert the type to outlines (fonttools, opentype.js; adding either to the project needs approval too). Confirm the licence from the licence file beside the font and record what it said. Outlining drops kerning, so space the letters by hand and look at them. Live `<text>` is not a deliverable.
9. **App icon and exports.** Build the icon as its own file: a full-bleed opaque ground with the mark at about 55–65% of the height, optically centered. Export the set the project needs from the method's table with `bash render.sh in.svg out.png WIDTH [HEIGHT]` from this skill. Don't rasterize with ImageMagick's own SVG reader, and don't screenshot an SVG directly in Chrome: both can give a right-sized wrong image. Open every raster and look at it; `identify` only proves the size.
10. **Hand over and stop.**
   ```
   ## Logo — <name>
   Idea: <one line> · Ownable detail: <one> · Colors: <roles and values, proposed or agreed>
   Gates: <each: pass / fail, what you saw> | Not checked: <…>
   Files: <paths>
   Misuses: <1–2 for this mark>
   Before shipping: trademark search not done
   ```
   Write new colors into `DESIGN_MAP.md → Tokens` only if the user agreed them. Wiring the mark into the product replaces a brand asset, so ask first.

## Critique only
Render the logo, run the gates and the symptom table, and return findings ranked by damage, each with an exact fix. Change nothing.

## Never
- Replace, redraw or "tidy" an existing logo unasked.
- Name or imitate an artist, studio or company's mark, or write "in the style of".
- Say a mark is safe or original as a legal matter. You can compare it with marks you've looked at; a trademark search is the user's to run.
- Score a mark out of 100. Gates pass or fail; the rest is labelled judgement.
- Bake in shadows, gloss, bevels or corner masks for a platform that adds its own.
