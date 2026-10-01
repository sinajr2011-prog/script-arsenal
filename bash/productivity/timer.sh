#!/usr/bin/env bash
# timer.sh
# Simple countdown timer with notification.
# Usage: ./timer.sh 25m          (pomodoro style)
#        ./timer.sh 90s
#        ./timer.sh 1h30m

set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <time>   e.g. 25m, 90s, 1h, 1h30m"
  exit 1
fi

TIME_STR=$1
SECONDS=0

# Convert to seconds
if [[ $TIME_STR =~ ^([0-9]+)h([0-9]+)m$ ]]; then
  SECONDS=$(( ${BASH_REMATCH[1]} * 3600 + ${BASH_REMATCH[2]} * 60 ))
elif [[ $TIME_STR =~ ^([0-9]+)h$ ]]; then
  SECONDS=$(( ${BASH_REMATCH[1]} * 3600 ))
elif [[ $TIME_STR =~ ^([0-9]+)m$ ]]; then
  SECONDS=$(( ${BASH_REMATCH[1]} * 60 ))
elif [[ $TIME_STR =~ ^([0-9]+)s$ ]]; then
  SECONDS=${BASH_REMATCH[1]}
else
  echo "Invalid format. Use 25m, 90s, 1h, 1h30m"
  exit 1
fi

echo "⏳ Timer started: $TIME_STR ($SECONDS seconds)"
echo "Press Ctrl+C to cancel"

for ((i=SECONDS; i>0; i--)); do
  printf "\r⏱️  %02d:%02d remaining" $((i/60)) $((i%60))
  sleep 1
done

echo -e "\n\n✅ Time's up!"

# Try to notify
if command -v notify-send &>/dev/null; then
  notify-send "Timer" "Time's up! ($TIME_STR)"
elif command -v osascript &>/dev/null; then
  osascript -e "display notification \"Time's up!\" with title \"Timer\""
fi

# Beep if possible
echo -e "\a"
