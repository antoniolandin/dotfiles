#!/bin/bash

current_brightness=$(brightnessctl get)
max_brightness=$(brightnessctl max)

brightness_percentage=$(( $current_brightness / $max_brightness ))

if (( $(bc -l <<< "$brightness_percentage < 0.5") )); then
    brightnessctl set 100%
else
    brightnessctl set 1%
fi
