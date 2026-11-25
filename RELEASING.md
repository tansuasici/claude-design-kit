# Releasing

GitHub-hosted Actions don't start on this account, so `validate.yml` and
`release.yml` never run. Validation and releases are done locally, by hand.

**Never** attach a self-hosted runner to this repo for `pull_request` jobs.
The repo is public: a fork's PR would run arbitrary code on the server.

## 1. Validate before pushing or merging

```bash
npm run validate
```

This runs the same checks as `validate.yml`: the plugin manifest
(`scripts/check-plugin.sh`), install alongside another kit, and the
branch-protect hook tests. Run it on the branch before you open or merge a PR.

## 2. Cut the release PR

Pick one of these.

**a. release-please CLI (preferred).** It reads `release-please-config.json`
and `.release-please-manifest.json` and opens the same PR the workflow would.

```bash
npx release-please release-pr \
  --token "$(gh auth token)" \
  --repo-url tansuasici/claude-design-kit \
  --config-file release-please-config.json \
  --manifest-file .release-please-manifest.json
```

**b. Manual bump.** On a `release/vX.Y.Z` branch, set the new version in
every place release-please would:

- `VERSION`
- `package.json` → `version`
- `.claude-plugin/plugin.json` → `version`
- `.claude-plugin/marketplace.json` → `metadata.version` **and** `plugins[0].version`
- `.release-please-manifest.json` → `"."`
- `CHANGELOG.md`: a new `## [X.Y.Z](compare link) (YYYY-MM-DD)` section

Then `npm run validate` and open a PR titled `chore(main): release X.Y.Z`.

## 3. Tag and publish the GitHub release

After the release PR is merged, use the merge commit:

```bash
gh release create vX.Y.Z --target <merge-sha> --notes-file <changelog-section.md> --latest
```

If the PR came from release-please, flip its label so release-please doesn't
refuse the next run:

```bash
gh pr edit <n> --remove-label "autorelease: pending" --add-label "autorelease: tagged"
```

(With the CLI, `npx release-please github-release --token "$(gh auth token)" ...`
does the tag, release and relabel in one step.)

## 4. Publish to npm

The maintainer does this, from the tag, with browser approval:

```bash
git fetch --tags && git checkout vX.Y.Z
npm publish --access public
```

`publishConfig.access` is already `public`. Check the result with
`npm view @tansuasici/claude-design-kit version --prefer-online`; without
`--prefer-online` the registry can show the old version for a while.

## 5. Refresh the website

The site (private repo `claude-design-kit-web`) shows the kit's version,
CHANGELOG and skill docs. Its Deploy workflow runs on a self-hosted runner on
the server, so it works despite the Actions lock:

```bash
gh workflow run deploy.yml --repo tansuasici/claude-design-kit-web
```

Fallback from a local web checkout: `pnpm run deploy`.
