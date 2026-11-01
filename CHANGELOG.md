# Changelog

All notable changes to Claude Design Kit will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

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
