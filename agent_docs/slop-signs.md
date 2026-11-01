# Slop Signs

The predictable ways AI-built UI goes wrong, grouped by layer. Each line pairs
the sign with its fix. Go through every group during an audit and record each
sign you find, with the place it lives (`file:line` or a screen region).

Slop is not "ugly". It is **unchosen**: a value that landed because it was the
default, the trend, or the first thing typed. The fix is almost always
subtraction plus one deliberate choice.

## Surfaces and color
- Purple to blue or violet to pink gradients on backgrounds, cards, buttons or the active nav item → one neutral surface; the accent only where it means something
- Gradient text in headings, numbers or the logo → solid primary text
- Colored glows (`shadow-[0_0_20px_rgba(139,92,246,.5)]`, drop-shadow on emoji, glowing pills) → remove; get depth from surface steps and hairlines
- Radial color washes or blurred blobs behind content → remove
- Neon or high-contrast colored borders → a hairline at 6–10% opacity
- Five near-identical tints for text → three text roles from one neutral ramp
- Everything highlighted, so nothing stands out → one accent, used once or twice per screen
- Glass cards with a white inner highlight and a colored shadow → a plain raised surface with a hairline

## Type
- Headings at weight 800/900 → 400–500, with hierarchy coming from size and color
- `UPPERCASE TRACKED LABELS` → sentence case, normal tracking
- Too many sizes and weights on one screen → a few sizes from the scale; weights 400 and 500
- Mixed number formats (`$48,210` next to `$124,860.40`) → one format, `tabular-nums`
- Negative letter-spacing on small text → zero or slightly positive
- Italic used for emphasis → color or weight instead

## Icons
- Emoji as nav icons, label decoration or status (🏠 🚀 💰 🔥) → one line-icon set, or nothing
- Emoji inside pills and counts (`18 👤`) → the plain number
- Icons in many sizes and colors → one size, one stroke, the color of their text role
- Icons nudged off the column → the same icon-box width in every row
- ✨ for anything AI → remove it, or use a plain icon where it actually explains something

## Spacing
- Arbitrary values (`mt-[13px]`, `h-[31px]`) → steps on the 4px scale
- Rows in one list with different heights or gaps → one height, one gap
- Groups sitting closer to their neighbours than to their own items → smaller gaps inside groups, bigger gaps between them
- Uneven padding in sibling cards → one padding
- A big gap above a section and cramped space below it → a balanced rhythm

## Copy
- Greeting headlines (`Welcome back, Sam! 👋`) → the page or period as the title
- Exclamation marks, `!!` → a plain statement
- Changes without a reference (`+12%!!`) → `+12% vs last month`
- Wordy placeholders (`Search anything...`) → `Search`
- Hype words (supercharge, seamless, unlock, magic, revolutionize, game-changing, AI-powered) → what the thing actually does
- Trailing periods on labels and buttons → none
- Fake-looking data (`$123,456`, `[X]`, `Lorem ipsum`) → plausible numbers, marked as placeholder
- Unverifiable claims (`Loved by 10,000+ teams`, `10x faster`) → ask whether they're real; then make them specific, or remove them

## Components
- Glowing pills for counts, plans, shortcuts or status → quiet mono text or a keycap
- `PRO`, `New ✨`, `Beta 🚀` badges everywhere → remove them, or keep one quiet text badge
- Every element a full pill → radius chosen by size, with nested radius math
- Charts with rainbow, glowing or pill-shaped bars → one or two series, a muted grid, mono labels, one highlight
- Sparklines or mini bars stuffed into every stat card → the number, its label, and its change
- A row of equal cards with the same layout → one main chart, compact stats, varied widths
- A logo made of a gradient tile with a sparkle → the product name as text plus a flat mark

## Landing pages and heroes
- A pill badge above the headline (`✨ Introducing X 2.0`) → remove it, or use a quiet text link if the news is real
- A headline that fits any product (`Supercharge your workflow with AI`) → what this product does, and for whom
- Everything stacked and centered → an asymmetric split, or text over a large product view
- Three or more buttons, or chips and avatars stacked under the CTA → one primary action and at most one secondary
- Rows of avatar dots or five stars without a source → ask; then make them specific, or remove them
- Feature cards with an emoji, a bold title and one vague line → fewer features, concrete copy

## Visuals
- Glossy 3D blobs, orbs, liquid chrome, a purple nebula → the product itself, or one concrete metaphor for what it does
- Stock robots, glowing brains, circuit lines for anything AI → show what the AI actually produces
- Text, fake buttons or a fake logo baked into an image → real text in the page
- An image with a hard edge and a different black from the page → match the page background and soften the edges
- A visual on every section → one visual where it helps, usually only the hero

## Motion
- `animate-pulse` / `animate-ping` / breathing glows on things that are not live → static
- `transition-all`, `hover:scale` on cards → a color or surface step on hover, a tiny scale-down on press
- Bouncy springs on simple UI → one ease-out curve
- Everything flying in on load → at most one short fade-and-rise, with a small stagger
- Parallax, floating loops → a static layout
- Animating width/height/top/left → transform and opacity

## Template look (post-cleanup fallback)
These aren't slop, but they're what a cleaned-up screen falls back to when
nobody made a decision. Watch for them after the fixes.
- A pure grey page, Inter, white text, and the old brand color on one button, for a product whose world is warm → a ramp tinted toward the world and an accent taken from it
- A headline that still works if you swap in a competitor's name → use this product's own nouns
- A hero visual that is an empty box or a generic picture → a product preview in code, or an image from the world
- Every product ending up with the same layout, type and palette → let the direction decide

## Interface and motion
- `outline: none` with no visible replacement → a `:focus-visible` ring
- `...` (three dots) in UI copy → `…`
- `transform: scale(0)` entrances → `scale(0.95)` plus opacity
- `ease-in` on anything that appears → ease-out
- A page following the stock sequence of hero, logos, three features, testimonial, pricing, CTA → sections that come from the claims the page has to make

## Pairs
The same element, slop then fixed. A sign is easier to spot once you've seen
both halves side by side. The fixed halves are corrections, not templates:
the right value still comes from `DESIGN_MAP.md`.

**Stat card**
```html
<!-- slop: gradient, glow, emoji, no reference -->
<div class="rounded-2xl bg-gradient-to-br from-violet-500 to-blue-500 p-6 shadow-[0_0_24px_rgba(139,92,246,.5)]">
  <p class="text-xs font-bold uppercase tracking-widest text-white/70">💰 REVENUE</p>
  <p class="text-4xl font-black text-white">$123,456</p>
  <p class="text-white">+12%!!</p>
</div>
<!-- fixed: one surface, three text roles, a change with a reference -->
<div class="rounded-lg border border-border bg-surface p-4">
  <p class="text-sm text-muted">Revenue</p>
  <p class="text-2xl font-medium tabular-nums">$48,210</p>
  <p class="text-sm text-muted tabular-nums">+12% vs last month</p>
</div>
```

**Hero**
```html
<!-- slop: badge, hype headline, centered stack, three actions -->
<section class="text-center">
  <span class="rounded-full bg-violet-500/10 px-3 py-1">✨ Introducing Acme 2.0</span>
  <h1 class="text-7xl font-extrabold">Supercharge your workflow with AI</h1>
  <button>Get started</button> <button>Book a demo</button> <button>Watch video</button>
</section>
<!-- fixed: what it does and for whom, one primary action, the product leads (example product; every claim is a placeholder) -->
<section class="grid md:grid-cols-[5fr_7fr] items-center gap-8">
  <div>
    <h1 class="text-5xl font-medium">Close the month in two days, not ten [PLACEHOLDER]</h1>
    <p class="text-muted">Reconciliation for finance teams on NetSuite. [PLACEHOLDER: real claim]</p>
    <button>Start a trial</button>
  </div>
  <img src="/product/reconcile.png" alt="The reconciliation queue with three unmatched entries" />
</section>
```

**Status**
```html
<!-- slop: a pulsing glow on something that isn't live -->
<span class="animate-pulse rounded-full bg-green-400 px-2 shadow-[0_0_12px_#4ade80]">🟢 Active</span>
<!-- fixed: a static dot plus the word, so color isn't the only signal -->
<span class="inline-flex items-center gap-1.5 text-sm"><span class="size-1.5 rounded-full bg-success"></span>Active</span>
```

**Card hover**
```css
/* slop: every property animated, the card jumps */
.card { transition: all .3s; } .card:hover { transform: scale(1.05); }
/* fixed: one named property, a surface step */
.card { transition: background-color 150ms ease-out; } .card:hover { background: var(--surface-2); }
```
