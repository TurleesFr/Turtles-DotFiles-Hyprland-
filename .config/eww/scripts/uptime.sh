#!/bin/bash
# uptime.sh — outputs system uptime in human-readable form

# Read uptime in seconds
UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)

# Convert to days, hours, minutes
DAYS=$((UPTIME_SEC/86400))
HOURS=$(( (UPTIME_SEC%86400)/3600 ))
MINUTES=$(( (UPTIME_SEC%3600)/60 ))

# Print nicely
if [ $DAYS -gt 0 ]; then
    echo "${DAYS}d ${HOURS}h ${MINUTES}m"
else
    echo "${HOURS}h ${MINUTES}m"
fi
