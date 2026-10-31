# linear.md

> The kit's single task file until work moves to Linear. **Now** is this
> session's work; **Next** is queued; **Later** is ideas. Don't create
> `tasks/todo.md`.

## Now
- [ ] Review the first pass of skills, agents and hooks against real projects
- [ ] Test the hooks in a live Claude Code session (PostToolUse additionalContext reaches the model)
- [ ] First commit and push to `tansuasici/claude-design-kit`

## Next
- [ ] Hook test suite: fixture files plus expected JSON for slop-scan, motion-gate, prompt-router, session-start
- [ ] `bench/` scenarios: a sloppy landing page, a broken table, an over-animated menu; score before/after each skill
- [ ] CLI (`bin/cdk`) for `npx @tansuasici/claude-design-kit init`, then npm publish
- [ ] release-please config and a validate workflow (bash -n, frontmatter check, manifest check)
- [ ] `scripts/convert.sh` to regenerate AGENTS.md from CLAUDE.md
- [ ] Contrast checker script, so the kit can *measure* instead of estimate (keep it out of hooks)

## Later
- [ ] Docs site (`web/`) in the style of the sibling kits
- [ ] Mobile-native skill (iOS/Android: safe areas, dynamic type, haptics, platform motion)
- [ ] Data-viz skill (chart form, color formula, dark mode)
- [ ] Copy/voice skill (microcopy, empty states, error messages)
- [ ] Field overlays: dashboard, marketing site, dev tool, consumer app
- [ ] More sources as they come in; log each in SOURCES.md with its license
