#!/usr/bin/python
# Description: This script is used to print the keybinds.conf file in a more readable format
# Author: Antonio

import os
from termcolor import colored

KEYBINDS_FILE = "~/.config/kitty/keybinds.conf"

if __name__ == "__main__":
    f = open(os.path.expanduser(KEYBINDS_FILE), "r")

    # skip the first two lines
    for _ in range(2):
        f.readline()

    temp = False     

    for line in f:
        line = line.strip()
        
        if len(line) > 0:
            if line[0] == "#":
                text = colored(line[2:], "yellow")
                print(f"{text} --- ", end="")
                temp = False 
            else:
                text = colored(line.split(" ")[1].replace("kitty_mod","󰄛").replace("+"," + "), "red")
                
                if not temp:
                    print(text)
                    temp = True
    print()
    f.close()

