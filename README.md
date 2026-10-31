# Claude Design Kit

A drop-in kit that makes Claude Code design interfaces that look **chosen, not
defaulted**. Every color, typeface, spacing value, icon and animation should
trace back to a decision about *this* product, written down before the CSS.

It's a sibling of [Claude Code Kit](https://github.com/tansuasici/ClaudeCodeKit)
and [Claude Research Kit](https://github.com/tansuasici/ClaudeResearchKit): a
`CLAUDE.md` ruleset, a direction file, skills, review agents and hooks that
check what can be checked mechanically.

## The loop

**Brief → Direction → Build → Audit**

| Step | What happens | Tool |
|---|---|---|
| Brief | Learn what the product is, who it's for, what it must make them do. Inventory what only this subject has. | `/design-brief` |
| Direction | Character in plain words, a world to borrow from, one signature move, tokens that follow. Competitor test, idea sentence. Stop for agreement. | `/direction` |
| Build | Implement against `DESIGN_MAP.md`. Reuse before adding; tokens, not literals. | — |
| Audit | Look at it (3 widths, light/dark, keyboard), then audit. | `/slop-audit`, `/interface-check`, `/motion-review`, `/stress-ui` |

## What's inside

```
CLAUDE.md                 ruleset (tiered boot, cardinal rule, approvals, verification)
DESIGN_MAP.md             the direction: Product, Character, World, Moments,
                          Signature, Tokens, Competitors, Don'ts
CLAUDE.project.md         your project overlay (never touched by upgrades)
linear.md                 open work: Now / Next / Later
agent_docs/               slop-signs, tokens, motion, interface-guidelines,
                          direction, brand-identity
.claude/skills/           8 user-invocable skills
.claude/agents/           3 review agents
.claude/hooks/            6 hooks + lib/
.claude/settings.json     hook wiring and permissions
```

### Skills

| Skill | Use it for |
|---|---|
| `/design-brief` | Start here. Reads the project, asks once, fills Product, Competitors and the subject inventory. |
| `/direction` | Writes the five-line direction and tokens into `DESIGN_MAP.md`, then stops for approval. |
| `/slop-audit` | Finds AI-slop signs, rates the screen heavy / light / none, fixes in nine ordered passes. |
| `/interface-check` | Interface guidelines review (keyboard, focus, forms, layout, content, performance) as a Blocker / Major / Minor table. |
| `/motion-craft` | Adding an animation: frequency gate, purpose, cheapest tool, guards. |
| `/motion-review` | Reviewing existing motion: Before / After / Why table and a Block or Approve verdict. |
| `/stress-ui` | Breaks a component with empty, long, many, slow, failing and RTL inputs. |
| `/brand-method` | Logo, type and color system from a brand intake, with a reflex test. |

### Agents

| Agent | Reads |
|---|---|
| `design-critic` | A screen against `DESIGN_MAP.md` and the slop signs. Not anchored on the code you just wrote. |
| `interface-reviewer` | Interface guidelines compliance. |
| `motion-reviewer` | Animations against the motion discipline. |

All three run on Opus and leave their findings in `.hook-state/agent-handoff.md`.

### Hooks

| Hook | Event | Does |
|---|---|---|
| `session-start.sh` | SessionStart | Reports whether `DESIGN_MAP.md` is filled, shows Character and Signature, lists `linear.md → Now`. |
| `prompt-router.sh` | UserPromptSubmit | Adds reminders for vague aesthetic asks, landing pages, motion, brand, forms and data UI. |
| `slop-scan.sh` | PostToolUse (Edit/Write) | Warns on reflex gradients, `transition-all`, ambient pulse/ping, heavy display weights, emoji icons, hype copy, and banned character words in `DESIGN_MAP.md`. |
| `motion-gate.sh` | PostToolUse (Edit/Write) | Warns on motion without a reduced-motion guard and on animated layout properties. |
| `branch-protect.sh` | PreToolUse (Bash) | Blocks pushes to `main`/`master` and force-pushes. |
| `block-dangerous-commands.sh` | PreToolUse (Bash) | Blocks destructive shell commands. |

The scan hooks warn; they never block. A file that has a reason to break a rule
can opt out with `design-kit-allow-slop` or `design-kit-allow-motion` in its
first 5 lines. Hook silence is not a design review: hooks catch class names and
keyframes, not hierarchy or taste.

## Install

From your product repo, pointing at a checkout of this kit:

```bash
git clone https://github.com/tansuasici/claude-design-kit ~/claude-design-kit
```

```bash
bash ~/claude-design-kit/install.sh "$PWD"
```

Flags: `--upgrade` (update kit files), `--gitignore` (keep the kit out of your
repo), `--dry-run`, `--force` (replace kit files that already exist). Your
overlay (`DESIGN_MAP.md`, `CLAUDE.project.md`, `linear.md`) is never
overwritten, and an existing `.claude/settings.json` gets the kit's hooks merged
in rather than replaced. If you already have a `CLAUDE.md`, the installer keeps
it and warns; move your rules into `CLAUDE.project.md` and rerun with `--force`.

Remove it with `uninstall.sh`. It deletes only the files the kit installed;
`--keep-project` also keeps the overlay.

Then start a Claude Code session and run `/design-brief`.

Requirements: bash, git and python3. The scan hooks (`slop-scan`, `motion-gate`)
and the settings merge need python3; without it they stay silent.

## Sources

The kit distills a workflow from these projects. Each one is worth installing
on its own; see [SOURCES.md](SOURCES.md) for what came from where and the
install commands.

- [unslop](https://github.com/heydamir/unslop) by Damir Sokolovsky: slop signs, tokens, direction (CC BY 4.0)
- [emilkowalski/skills](https://github.com/emilkowalski/skills) by Emil Kowalski: motion craft and review, UI stress testing (MIT)
- [taste-skill](https://github.com/Leonxlnx/taste-skill) by Leonxlnx: inventory, argument, competitor test (MIT)
- [Web Interface Guidelines](https://vercel.com/design/guidelines) by Vercel: interface rules (MIT)
- [brand-identity-skill](https://github.com/fatihaydost/brand-identity-skill) by Fatih Aydost: brand method (MIT)

## License

MIT, except three files adapted from unslop, which stay CC BY 4.0. See
[LICENSE](LICENSE) and [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
