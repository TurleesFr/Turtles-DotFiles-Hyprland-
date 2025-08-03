#!/bin/bash

LOCKFILE="/tmp/.next_wallpaper.lock"
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"
CURRENT_FILE="$HOME/.config/hypr/.current_wallpaper"

# Exit if already running
[ -e "$LOCKFILE" ] && exit 1

# Create lockfile and ensure removal on exit
touch "$LOCKFILE"
trap "rm -f $LOCKFILE" EXIT

# Get wallpapers sorted
mapfile -t wallpapers < <(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.gif' \) | sort)

# Exit if no wallpapers found
[ ${#wallpapers[@]} -eq 0 ] && exit 1

# Read current wallpaper if exists
current=""
[ -f "$CURRENT_FILE" ] && current=$(<"$CURRENT_FILE")

# Find index of current wallpaper
index=-1
for i in "${!wallpapers[@]}"; do
  [[ "${wallpapers[i]}" == "$current" ]] && index=$i && break
done

# Get next wallpaper index sequentially
next_index=$(( (index + 1) % ${#wallpapers[@]} ))
next="${wallpapers[next_index]}"

# Set wallpaper with swww animation
swww img "$next" \
  --transition-type grow \
  --transition-pos 0.5,0.5 \
  --transition-duration 0.4 \
  --transition-fps 60

# Save next wallpaper as current
echo "$next" > "$CURRENT_FILE"
