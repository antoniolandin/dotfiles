#!/bin/bash
# Description: This script reads the keybinds.conf file and prints the keybinds and their descriptions
# Author: antonio

#Colors
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

filename="$HOME/.config/kitty/keybinds.conf"

# Read the file content and store paragraphs in an array
IFS=$'\n' read -r -d '' -a paragraphs < <(awk -v RS= '{gsub(/\n/," "); print}' "$filename" && printf '\0')

# Skip the fist paragraph (header)
paragraphs=("${paragraphs[@]:1}")

for paragraph in "${paragraphs[@]}"; do
    info=$(echo ${paragraph} | awk -F 'map' '{print $1}' | cut -c 3-)
    command_line=$(echo ${paragraph} | awk -F 'map' '{print $2}' | cut -c 2-)
    bind=$(echo $command_line | awk '{print $1}' | sed 's/kitty_mod/󰄛/g' | sed 's/+/ + /g')

    echo -e "${yellow}${info}${end} ${gray}---${end} ${blue}${bind}${end}"
done
