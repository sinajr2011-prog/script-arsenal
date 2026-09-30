#!/usr/bin/env bash
# git-sync.sh
# Quick pull + push for the current branch.
# Usage: ./git-sync.sh [commit message (optional)]

set -euo pipefail

BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "🔄 Syncing branch: $BRANCH"

git pull --rebase origin "$BRANCH"

if [[ $# -gt 0 ]]; then
  git add -A
  git commit -m "$*" || true
fi

git push origin "$BRANCH"

echo "✅ Branch $BRANCH is now in sync!"
