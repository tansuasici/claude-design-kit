---
name: design-brief
description: Fill DESIGN_MAP.md from the user and the project before any design work. Covers what the product is, who it serves, the one job of the screen, the brand that already exists, real competitors, the assets that actually exist, and a subject inventory of 8–12 things only this product has. Asks only what blocks the direction and never invents product facts.
user-invocable: true
---

# Design Brief

## Core Rule

**You can't choose for a product you don't understand.** The brief is what every
later decision gets checked against, so it holds facts, not guesses. Anything the
user or the project didn't tell you is marked `[UNKNOWN]` or asked about. It is
never filled with something plausible.

## When to Use
- `DESIGN_MAP.md` is still the empty template.
- A new page, product or redesign is starting.
- The user says "make it look better" and there's no direction to judge "better" against.

## Steps

### 1. Read before you ask
- `DESIGN_MAP.md`, `CLAUDE.project.md`, `README`, the landing copy, and any existing pages.
- The styling setup: Tailwind config / CSS variables / theme file. Existing fonts, colors, radius, icon set.
- Assets that really exist: logo files, product screenshots, photography, illustration. **Plan only around pictures that exist.**

### 2. Ask in one message, and only what blocks you
Skip anything step 1 already answered. Typical gaps:
1. What is it, and for whom? (one sentence)
2. What is the **one thing** this screen or page must get someone to do?
3. Page (read and scrolled) or app screen (worked in)?
4. What brand already exists: logo, color, typeface? Keep, refresh, or none?
5. 3–5 **real** competitors or alternatives the user would be compared with.
6. Hard constraints: framework, component library, dark mode, languages/RTL, accessibility target.
7. Anything they already know they don't want.

If the request is vague but not blocked, state your reading in one line and continue. Don't interrogate.

### 3. Inventory the subject
In your notes, list **8–12 things that belong to this product and to no competitor**: its name and what it means, the users' vocabulary, the numbers in the brief, the constraint it lives with, its materials and artefacts (invoice, terminal, ticket, map, label), its rituals, the output it produces. This list feeds the World, Moments and Signature in `/direction`.

### 4. Write the map
Fill these headings in `DESIGN_MAP.md`: **Product**, **Competitors**, and the inventory under **World** (as raw material, not yet a world). Leave **Character**, **World**, **Moments**, **Signature** and **Tokens** for `/direction`. Put anything the user rules out under **Don'ts**.

### 5. Hand off
Say what's still `[UNKNOWN]`, then suggest `/direction`.

## Never
- Invent metrics, customers, testimonials, pricing or features to make the brief look complete.
- Write a banned character word (clean, modern, sleek, minimal, premium, intuitive, seamless) into the map.
- Pick a direction during the brief. That's the next step, and it needs the user's agreement.
