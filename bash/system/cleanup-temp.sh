#!/usr/bin/env bash
# cleanup-temp.sh
# Safely cleans common temporary and cache directories.
# Usage: ./cleanup-temp.sh [--dry-run]

set -euo pipefail

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
  echo "🔍 DRY RUN mode — nothing will be deleted"
fi

clean() {
  local path="$1"
  if [[ -d "$path" ]]; then
    echo "Cleaning: $path"
    if [[ "$DRY_RUN" == true ]]; then
      du -sh "$path" 2>/dev/null || true
    else
      rm -rf "${path:?}"/* 2>/dev/null || true
      echo "  ✅ cleaned"
    fi
  fi
}

echo "🧹 Starting safe temp cleanup..."

clean "$HOME/.cache"
clean "/tmp"
clean "$HOME/.npm/_cacache" 2>/dev/null || true
clean "$HOME/.local/share/Trash" 2>/dev/null || true

echo "✨ Done!"
