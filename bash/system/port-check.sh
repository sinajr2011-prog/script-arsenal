#!/usr/bin/env bash
# port-check.sh
# Check if a port is open / what's listening on it.
# Usage: ./port-check.sh 3000
#        ./port-check.sh 8080 --listen

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <port> [--listen]"
  exit 1
fi

PORT=$1

if [[ "${2:-}" == "--listen" ]]; then
  echo "📡 Processes listening on port $PORT:"
  if command -v lsof &>/dev/null; then
    lsof -i :"$PORT" -sTCP:LISTEN 2>/dev/null || echo "  Nothing found."
  elif command -v ss &>/dev/null; then
    ss -tlnp | grep ":$PORT" || echo "  Nothing found."
  else
    echo "  Need lsof or ss installed."
  fi
else
  if command -v nc &>/dev/null; then
    if nc -z localhost "$PORT" 2>/dev/null; then
      echo "✅ Port $PORT is open"
    else
      echo "❌ Port $PORT is closed"
    fi
  else
    echo "Install netcat (nc) for port checking."
  fi
fi
