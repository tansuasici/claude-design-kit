# Sections

The recurring parts of a page: navigation, hero, pricing, call to action and
footer. Each entry says what the section is for, lists the variants and when
each one fits, and gives the rules and slop signs specific to it.

Which sections a page has, and in what order, still comes from the argument
(`agent_docs/direction.md` → 3). This file is for building a section the
argument already asked for. It is not a list of sections every page needs.

## Using references
Gallery sites collect real examples of one section type. Use them to see the
range of variants before you choose one. Don't use them to pick a look.
- Study three or more examples of the variant you're considering. Note what each one does with its content, not what it looks like.
- Don't copy a layout, illustration or copy from a reference. The look still comes from `DESIGN_MAP.md`, and the competitor test still applies.
- Never take another company's logo, screenshot or numbers from a reference.

| Section | Gallery |
|---|---|
| Hero | https://supahero.io |
| Navigation | https://www.navbar.gallery |
| Pricing | https://pricingpages.design |
| Call to action | https://www.cta.gallery |
| Footer | https://www.footer.design |

## Navigation
**Job:** get a visitor to the page they came for, and keep the primary action within reach.

| Variant | Fits when |
|---|---|
| Static / sticky bar | A few top-level links, no hierarchy. Most pages. |
| Dropdown / flyout | Some top-level items group 2–7 pages. |
| Mega menu | Many products or audiences, each with its own pages. Earn it with real content: one link per column isn't a mega menu. |
| Side bar | App screens, docs, settings: navigation people return to while working. |
| Search-led | More pages than a menu can hold (docs, catalogs). |
| Announcement bar | One real, time-bound notice above the nav. |
| Full screen | Small sites where the menu itself is a moment (portfolio, event). Never for an app. |
| Breadcrumbs | A secondary trail in deep hierarchies, alongside one of the above. |

Rules:
- Order: brand mark (links home) → links → one primary action. A second, quieter action (Sign in) at most.
- Five to seven top-level items. More goes into groups, search or the footer.
- The current page is marked by more than color (weight, an underline, `aria-current="page"`).
- Dropdowns and mega menus open on click or Enter, close on Escape and on focus leaving, and follow the WAI-ARIA disclosure pattern. Hover alone is not enough: touch and keyboard users can't hover.
- Below the breakpoint, the menu button has an `aria-label` and `aria-expanded`, the open menu traps focus, and the page behind doesn't scroll.
- A sticky bar stays short (about 56–72px) and doesn't cover anchor targets (`scroll-margin-top`).

Slop signs:
- A glass bar with a blur and a glowing border → a plain surface with a hairline once the page scrolls
- Every link with an icon → text links; icons only where they carry meaning
- An announcement bar with nothing to announce, or a ✨ "New" pill in it → remove it
- Two or three filled buttons in the bar → one primary action

## Hero
**Job:** answer the visitor's first question (what is this, and is it for me?) and offer one next step.

The rules and slop signs are in `agent_docs/direction.md` → 7 (Words before markup) and `agent_docs/slop-signs.md` → Landing pages and heroes. In short: a headline of two lines or fewer that names this product's job, one plain supporting sentence, one primary action, and the product or one concrete image from the world instead of decoration.

| Variant | Fits when |
|---|---|
| Split: text beside the product | The product has a screen worth showing. The default for software. |
| Text over a large product view | The product view is the argument (an editor, a map, a dashboard). |
| Text only, large type | The claim is strong and there's no visual yet. Better than a fake one. |
| The live thing in the hero | The page's one live thing (`direction.md` → 5) answers the first question by itself. |
| Full-bleed image or video | Physical products, places, events, where a photo is the proof. Needs a real asset. |

## Pricing
**Job:** let a visitor pick a plan and know what it costs them, without contacting anyone if they don't need to.

Prices, tier names, limits and what each tier includes come from the user. Never invent them. Mark gaps `[NEEDS PROOF]` or `[PLACEHOLDER]`.

| Pattern | Fits when |
|---|---|
| Tier cards (2–4) | Plans differ by a few clear limits. |
| Tier cards plus a comparison table | Plans differ on many features. Cards up top, the full table below. |
| Usage-based, with a calculator | The price depends on volume. The calculator uses real rates and is the page's live thing. |
| One price | One product, or a one-off payment. One block, no grid. |
| Contact sales / enterprise | Custom deals. One tier or a line under the grid, not the whole page. |

Rules:
- Every tier states the price, the billing period and the unit (per seat, per month, billed yearly) in the same place and format.
- A monthly/annual switch shows what changes: the price in both periods, or the saving as an amount or percentage, computed from the real prices. It's a real control (a radio group or a toggle with a label), reachable by keyboard, and the choice survives a reload (URL or storage).
- At most one tier is highlighted, and only if the user says which plan to steer people toward.
- Feature lists in different tiers line up row for row, so they can be compared. Checkmarks and crosses come with text for screen readers.
- Questions people ask before buying (refunds, cancelling, limits, what counts as a seat) go in a short FAQ under the grid, answered with real policy.
- Numbers use `tabular-nums`.

Slop signs:
- A "Most popular" badge on a plan nobody chose → remove it, or highlight the plan the user names
- Fake anchor prices (~~$99~~ $49) or a countdown → remove them unless the discount is real and the user asks for it
- Feature lists padded with things every plan includes → list what differs; put shared features in one line
- Three identical glowing cards with the middle one scaled up → one surface, with the recommended tier marked by a border or label
- "Unlimited" for something that has a limit → the real limit

## Call to action
**Job:** ask for the one action the page exists for, at the point where the visitor has the reason to take it.

| Kind | Fits when |
|---|---|
| Closing section (headline + button) | A long page, after the argument. Repeats the hero's primary action. |
| Inline form (email, newsletter) | The action is one field. Follow the Forms rules in `interface-guidelines.md`. |
| Download | Apps and files. Name the platform and the size. |
| Buy / start | The page sells one thing. The price sits next to the button. |
| Modal / pop-up | Only when the user asks for one. Never on load, never before the visitor has read anything. |

Rules:
- The button says what happens: "Start a trial", "Download for macOS", "Book a call". Not "Submit", "Click here" or "Learn more" on its own.
- One action per CTA, the same one as the hero's unless the argument says otherwise.
- A line that lowers the risk ("Cancel any time", "No card needed") only if it's true. Ask.
- Social proof next to the button only if the user gave it. Otherwise leave it out, or mark it `[NEEDS PROOF]`.

Slop signs:
- Urgency that isn't real ("Only 3 spots left!", a timer) → remove it
- A gradient band with a blurred blob behind the closing CTA → the page's normal surface, or one surface step
- Two equal buttons ("Get started" / "Book a demo") → one primary, at most one quiet secondary
- A headline that only says "Ready to get started?" → what the visitor gets by acting

## Footer
**Job:** the place people scroll to when they're looking for something specific: a page, a contact, a legal link.

| Variant | Fits when |
|---|---|
| Single line | Small sites: the name, a few links, the copyright. |
| Link columns | Many pages. Group by what visitors look for (Product, Company, Support, Legal). |
| Large type / wordmark | A page where the brand ends the story. Still holds the links. |
| With a sign-up | Only if there's a real newsletter. One field, labelled. |

Rules:
- It's a `<footer>` landmark, and link groups have headings or an `aria-label` on their `<nav>`.
- Legal and contact links are always there if the product has them (privacy, terms, imprint where the law asks for it).
- The copyright year isn't hard-coded, or it's checked.
- Social links are icons with an `aria-label`, and only for accounts that exist.
- At mobile width, columns stack and stay readable. Don't hide them behind toggles unless there are many.

Slop signs:
- Social icons for accounts the product doesn't have → only the real ones
- "Made with ❤️" → remove it, or keep it plain if the user wants it
- A sign-up box with no newsletter behind it → remove it
- A huge decorative wordmark that pushes the links off the first screen of the footer → links first, or a smaller wordmark

## Component sources
Component registries (21st.dev, shadcn/ui blocks and similar) and site builders (Framer) can save time, but what they give you is a starting point.
- A copied component is restyled to `DESIGN_MAP.md → Tokens` before it ships: its own palette, gradients, glows and motion go. It passes `slop-scan.sh` and `/slop-audit` like anything else you write.
- Check what it brings with it. A new UI or animation library is a dependency and needs the user's approval (`CLAUDE.md` → Approval Required).
- A registry's MCP server or CLI that needs an account, an API key or a paid plan (21st.dev's does) is the user's decision. Ask before connecting it, and never write its key into the repo.
- Use the Framer MCP only when the site lives in Framer. Its changes land in the Framer project, not in this repo, so the repo's hooks and audits don't see them. Work on a Framer branch and don't publish unless the user asks.
