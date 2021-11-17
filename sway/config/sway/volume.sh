#!/bin/bash
message="Volume Up"
icon="audio-volume-high"
case $1 in
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +10%
    ;;
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -10%
    message="Volume Down"
    icon="audio-volume-low"
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    icon="audio-volume-mute"
    if [ "$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')" -eq "no" ]; then
      message="Volume Unmuted"
    else
      message="Volume Muted"
    fi
    ;;
esac

dunstify "$message" \
  -h string:x-canonical-private-synchronous:audio \
  -h int:value:$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}') \
  -t 1500 \
  --icon "$icon"
