#!/bin/bash

# Stop script if error
set -e

# Define colors
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
GRAY='\033[90m'
NC="\e[0m"

# Variables
REPO_URL="https://github.com/antoniolandin/dotfiles.git"
DOTFILES_DIR="$HOME/Repos/dotfiles"

echo -e "${RED}
       __      __  _____ __         
  ____/ /___  / /_/ __(_) /__  _____
 / __  / __ \/ __/ /_/ / / _ \/ ___/
/ /_/ / /_/ / /_/ __/ / /  __(__  ) 
\__,_/\____/\__/_/ /_/_/\___/____/
${NC}"


echo -e "${BLUE}Installing dotfiles...${NC}"

# Create dotfiles path directories
mkdir -p $HOME/Repos

# Install dependencies
echo -e "${GREEN}[+] Installing git and ansible...${NC}"
if ! command -v ansible &> /dev/null; then
    sudo pacman -Sy --noconfirm git ansible
fi

# Clone repository
if [ ! -d "$DOTFILES_DIR" ]; then
    echo -e "${GREEN}[+] Cloning repository in $DOTFILES_DIR...${NC}"
    git clone "$REPO_URL" "$DOTFILES_DIR"
else
    echo -e "${GREEN}[+] $DOTFILES_DIR already exists.${NC}"

    cd "$DOTFILES_DIR"

    # Try to pull updates
    if git pull; then
        echo -e "${GREEN}[+] Dotfiles repo updated!${NC}"
    else
        echo -e "${BLUE}[!] Couldn't update dotfiles.${NC}"
        echo -e "${BLUE}[!] Installation will resume with current version.${NC}"
    fi
    
    # Go back to previous directory
    cd - > /dev/null
fi

# Install ansible galaxy dependencies
echo -e "${GREEN}[+] Installing ansible galaxy extension...${NC}"
# AUR extension
ansible-galaxy collection install kewlfft.aur

# Exec playbook
echo -e "${BLUE}Executing Ansible Playbook...${NC}"

cd "$DOTFILES_DIR/ansible"
ansible-playbook -i inventory.ini setup.yml -K -v

echo -e "${GREEN}✅ Dotfiles installation complete!${NC}"
echo -e "${GREEN}Please, reboot system to apply all changes.${NC}"
