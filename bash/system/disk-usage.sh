#!/usr/bin/env bash
# disk-usage.sh
# Pretty and human-readable disk usage report.
# Usage: ./disk-usage.sh [path]  (default: current directory)

set -euo pipefail

TARGET=${1:-.}

echo "📊 Disk usage for: $TARGET"
echo "----------------------------------------"

du -h --max-depth=1 "$TARGET" 2>/dev/null | sort -hr | head -n 20

echo "----------------------------------------"
echo "Top 10 largest files/dirs shown."
