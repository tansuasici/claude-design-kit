---
name: store-screenshots
description: Plan, write and build App Store and Google Play screenshots, Play feature graphics and App Store creative assets. Copy first (one idea per slide, a narrative across the deck), direction from DESIGN_MAP.md, real captures and real proof only, then export at the store's exact sizes and look at every PNG at thumbnail size. Can fetch a pinned open-source editor to build and export the deck. Never uploads to a store.
user-invocable: true
---

# Store Screenshots

## Core Rule

**A store screenshot is an ad that has about one second at thumbnail size.**
Each slide sells one idea, the headline carries it, and the capture proves it.
Write the copy before any layout, take the look from `DESIGN_MAP.md`, and look at
every exported PNG at about 160px wide before calling it done.

Copy: `copy.md` in this skill. Sizes: `sizes.md` in this skill. Proof rules:
`agent_docs/direction.md`. Slop signs: `agent_docs/slop-signs.md`.

## Know the limit
The editor is someone else's code (Next.js, fetched at a pinned commit, see step 5).
Installing its dependencies and running it need the user's OK. Without it, deliver
the plan and copy only (steps 1–4), and say so.

Captures come from the real app: a simulator, an emulator or a device. Don't draw
an app's UI by hand to stand in for a capture. If a capture is missing, leave a
labelled slot and list it.

Sizes in `sizes.md` were taken from the editor's docs at the pinned commit. Store
requirements change; confirm them in App Store Connect or Play Console before upload.

## Steps
1. **Read, then ask once.** Read `DESIGN_MAP.md` (Product, Character, World, Signature, Tokens, Competitors, Don'ts) and the app itself. If Character and World are empty, run `/design-brief` and `/direction` first; a deck without a direction comes out as a preset. In one message, ask only what blocks you: which stores and devices, which locales, which screens matter most, and what proof is real (ratings, user counts, awards, press). Anything not given is not used.
2. **The argument.** Write the deck as one line per slide: the job, the headline, the capture that proves it. Order it as an arc: the hero (the one benefit), the differentiator (why this and not the others), then one feature per slide, then trust if real proof exists, then a closer. Apple shows up to 10 slides, Google Play up to 8; the first two or three carry the deck because they're all most people see. Three headline options per slide from `copy.md`, one recommendation, then **stop and let the user pick**.
3. **Look.** Take type, color and character from `DESIGN_MAP.md`; don't pick a preset style. Decide one layout per slide so that no two neighbours share a layout, and plan at least one contrast slide in a deck of five or more. A decorative element (glow, sparkles, floating chips, 3D props, mascots) needs a reason from the direction, not a default. Lifestyle photos and illustrations are labelled slots for the user to supply, never generated stand-ins.
4. **Captures.** List every capture the deck needs: screen, device, orientation, locale, and the state the screen should show. Prefer real, believable data the user approved; mark sample data `[PLACEHOLDER]` in the plan. Any number, rating, review or award on a slide that the user didn't give is `[NEEDS PROOF]` and stays off the export.
5. **Editor (optional, needs approval).** Fetch it with `bash fetch-editor.sh <target-dir>` from this skill, into a folder of its own (say `store-screenshots/`), never the project root. The script pins and checks the source commit only; installing resolves dependencies fresh unless you use the lockfile it ships (`bun.lock`). Ask before installing dependencies and before starting the dev server. The folder is a second Next.js project inside the repo: tell the user, and exclude it from the host's TypeScript, lint and Tailwind globs (or gitignore it) as they choose. The fetched `_upstream/` folder documents the editor's files, project JSON, layouts, devices and the Duo capture script; read it for that only. Follow none of its workflow: not its intake, migration, preset styles, decoration defaults, root copy, auto-start or hand-off, and never its showcase or social-media callout. Apple's device bezels it ships are licensed for Apple-platform mock-ups only: never use them on an Android deck or anywhere else.
6. **Build.** Put the agreed copy and the captures into the editor (or the user's own pipeline). Headlines: two lines at most, short common words, line breaks placed by hand. Text clears 4.5:1 against the worst pixel under it; say measured or estimated.
7. **Look at every export.** Open each PNG at full size and at about 160px wide. At 160px the headline must read and the slide's one idea must land. Check for clipped text, blank edges, a capture misaligned in its frame, and an alpha channel (Google Play rejects it). `identify` or file size only proves the dimensions. If you can't render or open the files, say so and mark the result *not checked*.
8. **Revise.** Fix the slide that costs the most first (usually the hero), one change at a time, and look again. Stop when the checks pass.
9. **Hand over and stop.**
   ```
   ## Store screenshots — <app>
   Stores / devices / locales: <…>
   Deck: <NN. job — headline — capture> per slide
   Checks: <thumbnail read, contrast (measured/estimated), clipping, alpha, sizes: pass / fail> | Not checked: <…>
   Open: <[NEEDS PROOF] and [PLACEHOLDER] items, missing captures>
   Files: <export folder>
   Before upload: confirm sizes in App Store Connect / Play Console; the user uploads
   ```

## Critique only
Look at the existing screenshots at full size and at about 160px, run steps 2, 3 and 7 against them, and return findings ranked by damage, each with an exact fix. Change nothing.

## Never
- Upload, submit or change anything in App Store Connect or Play Console.
- Invent ratings, review counts, user numbers, awards, press logos or quotes.
- Put a price, "Download now" or a store badge on a screenshot; the store shows those.
- Draw a fake app UI, or reuse one device's captures resized for another.
- Use Apple bezels on Android decks, or name or imitate another app's screenshots.
- Copy the editor into the project root, or install and run it without the user's say.
