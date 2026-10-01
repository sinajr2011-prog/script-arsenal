#!/usr/bin/env bash
# git-undo.sh
# Soft undo the last commit (keeps changes staged).
# Usage: ./git-undo.sh
#        ./git-undo.sh --hard   (WARNING: discards changes)

set -euo pipefail

if [[ "${1:-}" == "--hard" ]]; then
  echo "⚠️  Hard reset last commit (changes will be lost)!"
  read -p "Are you sure? (y/N) " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    git reset --hard HEAD~1
    echo "✅ Last commit hard-undone."
  else
    echo "Cancelled."
  fi
else
  git reset --soft HEAD~1
  echo "✅ Last commit undone (changes are still staged)."
  echo "Run 'git status' to see them."
fi
