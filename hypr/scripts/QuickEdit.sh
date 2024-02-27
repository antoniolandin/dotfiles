#!/bin/bash

dir="$HOME/.config/hypr"
defaultDir="$HOME/.config/hypr/configs"
userDir="$HOME/.config/hypr/UserConfigs"
editor="nvim"

menu(){
  printf "1. view Env-variables\n"
  printf "2. view Window-Rules\n"
  printf "3. view Startup_Apps\n"
  printf "4. view User-Keybinds\n"
  printf "5. view Monitors\n"
  printf "6. view Laptop-Keybinds\n"
  printf "7. view User-Settings\n"
  printf "8. view Default-Settings\n"
  printf "9. view Default-Keybinds\n"
  printf "10. view Default-Scripts\n"
  printf "11. view User-Scripts\n"
}

main() {
    choice=$(menu | rofi -dmenu -i -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)

    case $choice in
        1)
            kitty -e $editor "$userDir/ENVariables.conf"
            ;;
        2)
            kitty -e $editor "$userDir/WindowRules.conf"
            ;;
        3)
            kitty -e $editor "$userDir/Startup_Apps.conf"
            ;;
        4)
            kitty -e $editor "$userDir/UserKeybinds.conf"
            ;;
        5)
            kitty -e $editor "$userDir/Monitors.conf"
            ;;
        6)
            kitty -e $editor "$userDir/Laptops.conf"
            ;;
        7)
            kitty -e $editor "$userDir/UserSettings.conf"
            ;;
        8)
            kitty -e $editor "$defaultDir/Settings.conf"
            ;;
        9)
            kitty -e $editor "$defaultDir/Keybinds.conf"
            ;;
        10)
            kitty -e $editor "$dir/scripts"
            ;;
        11)
            kitty -e $editor "$dir/UserScripts"
            ;;
        *)
            ;;
    esac
}

main
