# CLAUDE.project.md

> Project-specific overlay. Kit upgrades never touch this file. Rules here
> override the kit defaults in CLAUDE.md. Delete the examples and add your own.

## This Project
- **Product:** <...>
- **Owner:** <...>
- **Stack:** <e.g. Next.js + Tailwind v4 + shadcn/ui; icons: lucide; motion: CSS only>

## Conventions (override kit defaults here)
- <e.g. Tokens live in `app/globals.css` as CSS variables; never add a Tailwind color literal.>
- <e.g. Reduced motion is handled globally in `globals.css`; files may carry `design-kit-allow-motion`.>
- <e.g. Screenshots: `pnpm dev` then http://localhost:3000.>

## Protected (beyond the kit defaults)
- <e.g. The logo and the brand orange (#E8590C) are fixed. Build around them.>
- <e.g. `components/ui/*` is shared with the dashboard; ask before restyling.>

## Project hooks
- Project-specific hooks live in `.claude/hooks/project/` and are wired separately.
