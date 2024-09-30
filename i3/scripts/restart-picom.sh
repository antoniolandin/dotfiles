#!/bin/bash

# Kill picom
killall picom

# Wait until picom is killed
while pgrep -u $UID -x picom > /dev/null; do sleep 1; done

# Launch picom
picom -b
