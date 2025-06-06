#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# gather the list of monitors into an array
mapfile -t MONITORS < <(polybar --list-monitors | cut -f 1 -d :)

# iterate through the array indexes

for MON_IDX in "${!MONITORS[@]}"; do
    # launch the first bar at every monitor
    MONITOR="${MONITORS[$MON_IDX]}" polybar main &
done

# # if there are multiple monitors
# if type "xrandr"; then
#     if [ "$m" == "eDP1" ]; then
#         MONITOR=$m polybar --reload main &
#     else
#         for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#             MONITOR=$m polybar --reload main &
#         done
#     fi
# else
#     polybar --reload main &
# fi
