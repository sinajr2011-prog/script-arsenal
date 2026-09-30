#!/usr/bin/env bash
# daily-standup.sh
# Generates a quick standup summary from your recent git activity.
# Usage: ./daily-standup.sh [days=1]

set -euo pipefail

DAYS=${1:-1}

echo "📝 Standup Summary (last $DAYS day(s))"
echo "======================================"
echo ""
echo "### What I did:"
git log --since="$DAYS days ago" --pretty=format:"- %s (%an, %ar)" --no-merges 2>/dev/null || echo "- No commits found"
echo ""
echo "### Current branch:"
git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "N/A"
echo ""
echo "### Uncommitted changes:"
git status -s 2>/dev/null || echo "None"
echo ""
echo "Happy coding! 🚀"
