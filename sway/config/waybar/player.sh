#!/bin/bash
PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    STATUS=$PLAYERCTL_STATUS
else
    STATUS="Stopped"
fi

if [ "$STATUS" == "Playing" ]; then
  playerctl metadata --format " {{ title }} - {{ artist }}"
elif [ "$STATUS" == "Paused" ]; then
  playerctl metadata --format "奈 {{ title }} - {{ artist }}"
elif [ "$STATUS" == "Stopped" ]; then
  echo "ﭦ"
fi
