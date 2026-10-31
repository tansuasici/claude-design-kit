# Sources

What this kit took from where, and how. Licence details and the exact credit
lines are in [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md). Each upstream is
worth installing on its own; this kit distills a workflow from them and does
not replace them.

| Source | License | Used in | How |
|---|---|---|---|
| [unslop](https://github.com/heydamir/unslop) by Damir Sokolovsky (@heydamir) | CC BY 4.0 | `agent_docs/slop-signs.md`, `agent_docs/tokens.md`, `.claude/skills/slop-audit/`; the five-line direction in `agent_docs/direction.md` | Adapted (slop signs, token values, nine-pass run); the five lines are paraphrased with attribution |
| [brand-identity-skill](https://github.com/fatihaydost/brand-identity-skill) by Fatih Aydost | MIT | `agent_docs/brand-identity.md`, `.claude/skills/brand-method/` | Method paraphrased; no scripts copied |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) by Emil Kowalski | MIT | `agent_docs/motion.md`, `.claude/skills/motion-craft/`, `motion-review/`, `stress-ui/`, `.claude/agents/motion-reviewer.md` | Distilled from animate, review-animations, break-ui and the animation references |
| [taste-skill](https://github.com/Leonxlnx/taste-skill) ([tasteskill.dev](https://www.tasteskill.dev/)) by Leonxlnx | MIT | `agent_docs/direction.md`, `.claude/skills/design-brief/`, `direction/` | Inventory, argument, idea sentence, competitor test, words-first build order |
| [Web Interface Guidelines](https://vercel.com/design/guidelines) ([vercel-labs/web-interface-guidelines](https://github.com/vercel-labs/web-interface-guidelines)) by Vercel | MIT (repo) | `agent_docs/interface-guidelines.md`, `.claude/skills/interface-check/`, `.claude/agents/interface-reviewer.md` | Paraphrased and regrouped; nothing copied from the vercel.com page |

## Install the upstreams

```bash
git clone https://github.com/heydamir/unslop
```

```text
/plugin marketplace add fatihaydost/brand-identity-skill
/plugin install brand-identity@brand-identity-skill
```

```bash
npx skills@latest add emilkowalski/skills
```

```text
/plugin marketplace add Leonxlnx/taste-skill
/plugin install taste-skill@taste-skill
```

```bash
npx skills add https://github.com/vercel-labs/agent-skills --skill web-design-guidelines
```

## Adding a source
1. Read its license before taking anything. Note whether it permits adaptation and what credit it requires.
2. Add a row above and an entry in `THIRD_PARTY_NOTICES.md`.
3. If it isn't MIT-compatible, list the derived files as a carve-out and put the credit line in each one.
