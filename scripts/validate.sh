#!/usr/bin/env bash
#
# validate.sh — run the same checks as .github/workflows/validate.yml, locally.
#
# GitHub-hosted Actions don't start on this account at the moment, and this
# public repo must never run pull_request jobs on a self-hosted runner, so run
# this before pushing a branch or merging a PR:
#
#   npm run validate        (or: bash scripts/validate.sh)
#
set -euo pipefail
cd "$(dirname "$0")/.."

echo "==> plugin manifest"
./scripts/check-plugin.sh

echo "==> install alongside another kit"
bash tests/install-other-kit.test.sh

echo "==> branch-protect hook"
bash tests/branch-protect.test.sh

echo "validate: all checks passed"
