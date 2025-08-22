#!/bin/bash
# Network speed monitor for wlan0 using interface bytes

PREV_RX="/tmp/prev_rx_wlan0"
PREV_TX="/tmp/prev_tx_wlan0"

IFACE="wlan0"

CUR_RX=$(cat /sys/class/net/$IFACE/statistics/rx_bytes)
CUR_TX=$(cat /sys/class/net/$IFACE/statistics/tx_bytes)

# Initialize previous values if not exist
[ -f "$PREV_RX" ] && PREV_RX_VAL=$(cat $PREV_RX) || PREV_RX_VAL=$CUR_RX
[ -f "$PREV_TX" ] && PREV_TX_VAL=$(cat $PREV_TX) || PREV_TX_VAL=$CUR_TX

# Save current for next poll
echo $CUR_RX > $PREV_RX
echo $CUR_TX > $PREV_TX

# Calculate speed in bytes/sec
RX_SPEED=$((CUR_RX - PREV_RX_VAL))
TX_SPEED=$((CUR_TX - PREV_TX_VAL))

# Convert to human-readable
human() {
    if [ $1 -ge 1073741824 ]; then
        echo "$(awk "BEGIN{printf \"%.1f\", $1/1073741824}") GB/s"
    elif [ $1 -ge 1048576 ]; then
        echo "$(awk "BEGIN{printf \"%.1f\", $1/1048576}") MB/s"
    elif [ $1 -ge 1024 ]; then
        echo "$(awk "BEGIN{printf \"%.1f\", $1/1024}") KB/s"
    else
        echo "$1 B/s"
    fi
}

echo "⬇ $(human $RX_SPEED) ⬆ $(human $TX_SPEED)"
