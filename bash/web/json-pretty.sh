#!/usr/bin/env bash
# json-pretty.sh
# Pretty-print JSON from file or stdin.
# Usage: ./json-pretty.sh data.json
#        cat data.json | ./json-pretty.sh
#        curl -s api.example.com | ./json-pretty.sh

set -euo pipefail

if command -v jq &>/dev/null; then
  if [[ $# -gt 0 ]]; then
    jq . "$1"
  else
    jq .
  fi
elif command -v python3 &>/dev/null; then
  if [[ $# -gt 0 ]]; then
    python3 -m json.tool "$1"
  else
    python3 -m json.tool
  fi
else
  echo "Install jq or python3 for JSON pretty-printing."
  exit 1
fi
