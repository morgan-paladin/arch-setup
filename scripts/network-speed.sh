#!/bin/bash

INTERFACE="ens33"  # Replace with the correct network interface (e.g., wlan0 for Wi-Fi)

RX_BEFORE=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_BEFORE=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# Wait for 1 second to calculate the rate
sleep 1

RX_AFTER=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX_AFTER=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

RX_RATE=$((($RX_AFTER - $RX_BEFORE) / 1024))  # Convert to KB/s
TX_RATE=$((($TX_AFTER - $TX_BEFORE) / 1024))  # Convert to KB/s

# Output the rates
echo "↓ ${RX_RATE}KB/s ↑ ${TX_RATE}KB/s"

