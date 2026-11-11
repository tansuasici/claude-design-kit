# Changelog

All notable changes to Claude Design Kit will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
From 0.2.2 on, release-please writes each entry from the conventional commits
merged since the last release.

## [0.2.2](https://github.com/tansuasici/claude-design-kit/compare/v0.2.1...v0.2.2) (2026-11-11)


### Features

* **docs:** add agent_docs/sections.md for navigation, hero, pricing, call-to-action and footer sections, with the prompt router, CLAUDE.md and AGENTS.md pointing at it ([#11](https://github.com/tansuasici/claude-design-kit/issues/11)) ([eb68453](https://github.com/tansuasici/claude-design-kit/commit/eb68453d260fe47af47f424b53791982a7b62b53))


### Bug Fixes

* **hooks:** branch-protect checks only the push itself, so a feature-branch push chained with a PR command no longer gets blocked ([#12](https://github.com/tansuasici/claude-design-kit/issues/12)) ([eb68453](https://github.com/tansuasici/claude-design-kit/commit/eb68453d260fe47af47f424b53791982a7b62b53))
* **install:** refuse a folder that already holds another Claude kit ([#10](https://github.com/tansuasici/claude-design-kit/issues/10)) ([eb68453](https://github.com/tansuasici/claude-design-kit/commit/eb68453d260fe47af47f424b53791982a7b62b53))

## 0.2.1 (2026-11-08)

### Fixed

* `/logo`'s `render.sh` no longer reports success when it can't draw the logo. A missing file or an invalid SVG used to exit 0 and write a PNG of Chrome's broken-image icon; now it exits 1 and writes nothing. Paths containing `#` or `%`, which failed the same way, now render correctly.

## 0.2.0 (2026-11-08)

### Added

* `/logo` makes a logo mark, wordmark or app icon as real SVG files: three directions, build in black, a proof sheet at every size and on every ground, pass/fail gates, one change per revision, and exports for web, iOS, Android, Google Play and print. It ships with its proof sheet and a render script.
* `agent_docs/brand-identity.md` has a logo and icon craft section with the gates, a by-size review, a symptom table and the export rules.

### Changed

* `/brand-method` hands the finished mark to `/logo` instead of stopping at the method and tokens.
* The prompt router sends logo, wordmark, app icon and favicon requests to `/logo`.

## 0.1.4 (2026-11-01)

### Changed

* `design-critic` reviews cold: it skips the builder's rationale, ties every finding to a screenshot, ranks findings by how much of the screen they spoil, and lists what it didn't check.
* `/slop-audit` opens with a whole-screen read for five failures (too much, empty, boxed, flat, bland), each pointing at the passes that fix it.
* `agent_docs/slop-signs.md` ends with slop/fixed pairs for a stat card, a hero, a status and a card hover.

## 0.1.3 (2026-10-31)

### Changed

* Source credits are removed from the README, `CLAUDE.md`, `AGENTS.md`, `agent_docs/` and the skills, and `SOURCES.md` is gone. `LICENSE` keeps its CC BY 4.0 exception clause and `THIRD_PARTY_NOTICES.md` stays.

### Fixed

* The plugin now loads its three review agents (`design-critic`, `interface-reviewer`, `motion-reviewer`). Claude Code ignores an `agents` key in `plugin.json`, so they ship in a root `agents/` directory instead. `scripts/check-plugin.sh` fails CI if that copy drifts from `.claude/agents/` or if `hooks/hooks.json` drifts from `.claude/settings.json`.

## 0.1.2 (2026-10-31)

### Changed

* The plugin is now `design-kit` in the shared `tansuasici` marketplace. An existing `claude-design-kit@claude-design-kit` install keeps updating; to move over, run `/plugin uninstall claude-design-kit@claude-design-kit`, then `/plugin marketplace add tansuasici/claude-plugins` and `/plugin install design-kit@tansuasici`.

## 0.1.1 (2026-10-31)

### Features

* npx installer: `npx @tansuasici/claude-design-kit init` (also `uninstall`, `skills`, `--version`; bin `cdk`).
* The Claude Code plugin now loads the kit's skills, agents and hooks from `.claude/` (`hooks/hooks.json` runs the hook scripts through `${CLAUDE_PLUGIN_ROOT}`).
* `session-start` tells a plugin install where `agent_docs/` and the `DESIGN_MAP.md` template live.

## 0.1.0 (2026-10-31)

### Features

* `CLAUDE.md` ruleset: tiered session boot, Brief → Direction → Build → Audit loop, "Chosen, Not Defaulted", motion discipline, approval list, verification order.
* `DESIGN_MAP.md` direction template (Product, Character, World, Moments, Signature, Tokens, Competitors, Don'ts) and `CLAUDE.project.md` overlay.
* Skills: `design-brief`, `direction`, `slop-audit`, `interface-check`, `motion-craft`, `motion-review`, `stress-ui`, `brand-method`.
* Agents: `design-critic`, `interface-reviewer`, `motion-reviewer`.
* Hooks: `session-start`, `prompt-router`, `slop-scan`, `motion-gate`, `branch-protect`, `block-dangerous-commands`.
* Reference docs in `agent_docs/`: slop signs, tokens, motion, interface guidelines, direction, brand identity.
* `install.sh` / `uninstall.sh`, Claude Code plugin manifests.
* Sources and licences recorded in `SOURCES.md` and `THIRD_PARTY_NOTICES.md` (unslop-derived files stay CC BY 4.0).
