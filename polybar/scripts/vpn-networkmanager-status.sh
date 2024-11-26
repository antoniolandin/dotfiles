#!/bin/sh

vpn="$(nmcli -t -f name,type connection show --order name --active 2>/dev/null | grep vpn | head -1 | cut -d ':' -f 1)"

ICON_CONNECTED=" "
ICON_CONNECTING="ﱱ "
ICON_DISCONNECTED=" "

COLOR_CONNECTED="#a5fb8f"
COLOR_CONNECTING="#FAE3B0"
COLOR_DISCONNECTED="#f087bd"

if [ -n "$vpn" ]; then
	echo "%{F$COLOR_CONNECTED}${ICON_CONNECTED}${vpn}%{F-}"
else
	echo "%{F$COLOR_DISCONNECTED}${ICON_DISCONNECTED}No VPN%{F-}"
fi
