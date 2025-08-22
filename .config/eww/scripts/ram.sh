#!/bin/bash

# Get total and available memory in KB
total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
available=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

# Calculate used memory percentage
used=$(( (total - available) * 100 / total ))

# Output the value
echo "$used"
