#!/usr/bin/env bash
# git-whoami.sh
# Shows current git user config + recent activity.
# Usage: ./git-whoami.sh

set -euo pipefail

echo "👤 Git Identity"
echo "---------------"
echo "Name : $(git config user.name 2>/dev/null || echo 'Not set')"
echo "Email: $(git config user.email 2>/dev/null || echo 'Not set')"
echo ""
echo "📍 Current repo: $(basename "$(git rev-parse --show-toplevel 2>/dev/null || echo 'N/A')")"
echo "🌿 Branch     : $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'N/A')"
echo ""
echo "📝 Last 5 commits by you:"
git log --author="$(git config user.name)" --pretty=format:"  %h - %s (%ar)" -5 2>/dev/null || echo "  No commits found"
