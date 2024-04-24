#!/bin/bash
# Author: Antonio
# Description: Change asus aura colors to the pywal colors

color=$(sed -n '4p' ~/.cache/wal/colors)

asusctl led-mode static -c ${color//#}
