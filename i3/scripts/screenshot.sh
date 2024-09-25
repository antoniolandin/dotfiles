#!/bin/bash
# Take a screenshot/select a region to screenshot and save it to a file
# Author: Antonio

IMG_PATH="$HOME/pictures/screenshots/$(date +%s).png"

# Get parameters -s
if [ "$1" == "-s" ]; then
    maim -s "$IMG_PATH"
else
    maim "$IMG_PATH"
fi

# Copy to clipboard
xclip -selection clipboard -t image/png -i "$IMG_PATH"
