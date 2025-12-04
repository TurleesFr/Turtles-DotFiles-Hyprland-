#!/bin/bash
# playerctl1.sh — current song or playback status
playerctl metadata --format "{{ title }}" 2>/dev/null || echo "Waiting.."
