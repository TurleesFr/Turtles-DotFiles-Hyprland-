#!/bin/bash
# Get used and total space in KB for /home
read used total <<< $(df /home | awk 'NR==2 {print $3, $2}')
# Calculate percentage
percent=$(( 100 * used / total ))
echo "$percent"
