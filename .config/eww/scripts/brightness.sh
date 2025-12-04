#!/bin/bash
while true; do
  brightnessctl get | awk -v max=$(brightnessctl max) '{printf "%.0f\n", ($1/max)*100}'
  inotifywait -q -e modify /sys/class/backlight/*/brightness >/dev/null 2>&1
done
