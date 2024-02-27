#!/bin/bash
# Description: Get VPN status for waybar
# Author: antonio

if systemctl is-active --quiet mullvad-daemon; then
    status=$(mullvad status)
    
    if [[ $status == *"Connected"* ]]; then
        connection=$(echo $status | awk '{print $3}')
        country=$(echo $status | awk '{print $5 $6}')
        echo "$country $connection"
        exit 0
    fi
fi

echo "disconnected"

