#!/usr/bin/env bash
# serve.sh
# Quickly serve current directory over HTTP.
# Usage: ./serve.sh [port=8000]

set -euo pipefail

PORT=${1:-8000}

echo "🌐 Serving $(pwd) on http://localhost:$PORT"
echo "Press Ctrl+C to stop"

if command -v python3 &>/dev/null; then
  python3 -m http.server "$PORT"
elif command -v python &>/dev/null; then
  python -m SimpleHTTPServer "$PORT"
elif command -v npx &>/dev/null; then
  npx serve -p "$PORT"
else
  echo "Need python3 or npx to serve files."
  exit 1
fi
