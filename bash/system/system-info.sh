#!/usr/bin/env bash
# system-info.sh
# Quick and pretty system overview.
# Usage: ./system-info.sh

set -euo pipefail

echo "🖥️  System Info"
echo "=============="
echo "Hostname : $(hostname)"
echo "OS       : $(uname -s) $(uname -r)"
echo "Arch     : $(uname -m)"
echo "Uptime   : $(uptime -p 2>/dev/null || uptime)"
echo ""
echo "💾 Memory:"
free -h 2>/dev/null | grep -E "Mem|Swap" || echo "  (free command not available)"
echo ""
echo "💿 Disk:"
df -h / 2>/dev/null | tail -1 || echo "  (df not available)"
echo ""
echo "🔥 CPU Load: $(cat /proc/loadavg 2>/dev/null | cut -d' ' -f1-3 || echo 'N/A')"
echo ""
echo "👤 User: $(whoami) | Shell: $SHELL"
