#!/usr/bin/env bash
# find-large-files.sh
# Find the largest files in a directory.
# Usage: ./find-large-files.sh [path] [count=20]

set -euo pipefail

TARGET=${1:-.}
COUNT=${2:-20}

echo "🔍 Top $COUNT largest files in: $TARGET"
echo "----------------------------------------"

find "$TARGET" -type f -exec du -h {} + 2>/dev/null | sort -hr | head -n "$COUNT"
