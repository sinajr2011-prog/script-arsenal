#!/usr/bin/env bash
# weather.sh
# Simple weather report using wttr.in (no API key needed).
# Usage: ./weather.sh [city]
#        ./weather.sh Tehran
#        ./weather.sh "New York"

set -euo pipefail

CITY=${1:-}

if [[ -z "$CITY" ]]; then
  curl -s "wttr.in?format=3"
  echo ""
  curl -s "wttr.in?0q"
else
  curl -s "wttr.in/${CITY// /+}?format=3"
  echo ""
  curl -s "wttr.in/${CITY// /+}?0q"
fi
