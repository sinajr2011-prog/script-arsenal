#!/usr/bin/env bash
# git-cleanup.sh
# Cleans up merged local branches and prunes remote-tracking branches.
# Usage: ./git-cleanup.sh

set -euo pipefail

echo "🔍 Fetching latest from remote..."
git fetch --prune

echo "🧹 Deleting local branches that are already merged into main/master..."

# Detect main branch
MAIN_BRANCH=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || echo "main")

git branch --merged "$MAIN_BRANCH" | grep -vE "^\*|\s+$MAIN_BRANCH$" | xargs -r git branch -d

echo "✅ Cleanup complete!"
echo "Remaining local branches:"
git branch
