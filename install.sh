#!/bin/bash

# Define colors
RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
GRAY='\033[90m'
TURQUOISE="\033[1;96m"
ORANGE="\033[38;5;208m"
NC="\e[0m"

echo -e "${RED}
       __      __  _____ __         
  ____/ /___  / /_/ __(_) /__  _____
 / __  / __ \/ __/ /_/ / / _ \/ ___/
/ /_/ / /_/ / /_/ __/ / /  __(__  ) 
\__,_/\____/\__/_/ /_/_/\___/____/
${NC}"

# update system
echo -e "${YELLOW}[*]${NC} Updating system"
sudo pacman -Syu

PACKAGES=(
    "kitty"
    "stow"
    "zsh"
    "tree-sitter-cli"
    "ripgrep"
    "fzf"
    "ttf-firacode-nerd"
    "tldr"
    "p7zip"
    "unzip"
    "go"
    "neovim"
    "python-neovim"
    "zathura"
    "zathura-pdf-mupdf"
    "git"
    "base-devel"
    "eza"
    "less"
    "python-pipx"
    "lazygit"
    "maim"
    "jq"
    "imagemagick"
    "brightnessctl"
    "python-dbus"
    "polybar"
    "zoxide"
    "xclip"
    "github-cli"
    "firefox"
    "picom"
    "blueman"
    "thunar"
    "hyperfine"
    "firewalld"
    "rofi"
    "man"
    "bluez"
    "bluez-utils"
    "dunst"
)

echo -e "${YELLOW}[*]${NC} Installing multiple packages"

# install packages 
for PACKAGE_NAME in "${PACKAGES[@]}"; do
    # check if package is installed
    if ! pacman -Q "$PACKAGE_NAME" &> /dev/null; then
        sudo pacman -S --noconfirm "$PACKAGE_NAME"
    else
        echo -e "${GRAY}$PACKAGE_NAME already installed${NC}"
    fi
done

echo -e "${YELLOW}[*]${NC} Installing yay"

# install yay
if ! pacman -Q yay &>/dev/null; then
    cd $HOME
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $HOME
    rm -rf $HOME/yay
else
    echo -e "${ORANGE}[*]${NC}${GRAY} yay already installed${NC}"
fi

# yay packages
YAY_PACKAGES=(
    "pulseaudio-control"
    "synology-drive"
    "librewolf-bin"
    "fancy-cat"
)

echo -e "${YELLOW}[*]${NC} Installing multiple AUR packages"

# install yay packages 
for PACKAGE_NAME in "${YAY_PACKAGES[@]}"; do
    # check if package is installed
    if ! yay -Q "$PACKAGE_NAME" &> /dev/null; then
        yay -S --noconfirm "$PACKAGE_NAME"
    else
        echo -e "${GRAY}$PACKAGE_NAME already installed${NC}"
    fi
done

# create librewolf desktop file
if ! [ -f $HOME/.local/share/applications/librewolf.desktop ]; then
    echo "[Desktop Entry]
    Type=Application
    Name=LibreWolf
    Exec=librewolf %u
    Icon=librewolf
    Comment=Private web browser
    Terminal=false
    Categories=Network;WebBrowser;
    MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;x-scheme-handler/http;x-scheme-handler/https;" > $HOME/.local/share/applications/librewolf.desktop
fi

# make librewolf the default browser
xdg-mime default librewolf.desktop x-scheme-handler/http
xdg-mime default librewolf.desktop x-scheme-handler/https

# install starship
echo -e "${YELLOW}[*]${NC} Installing starship"
if command -v starship &>/dev/null; then
    echo -e "${ORANGE}[*]${NC}${GRAY} Starship already installed${NC}"
else
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
fi

# create directories and files
mkdir -p $HOME/.local/share/virtualenvs
mkdir -p $HOME/.local/state/zsh
mkdir -p $HOME/Desktop $HOME/Videos $HOME/Downloads $HOME/Documents $HOME/Drive $HOME/Repos
touch $HOME/.local/state/zsh/history

echo -e "${YELLOW}[*]${NC} Creating nvim virtualenv"

# create neovim virtualenv
if [ -d "$HOME/.local/share/virtualenvs/neovim" ]; then
    echo -e "${ORANGE}[*]${NC}${GRAY} Neovim virtualvenv already exists${NC}"
else
    cd $HOME/.local/share/virtualenvs
    python -m venv neovim
fi

# install dotfiles
function dotfiles() {
	mkdir -p $HOME/Repos/dotfiles
    git clone https://github.com/antoniolandin/dotfiles $HOME/Repos/dotfiles
    stow --dir=$HOME/Repos --target=$HOME/.config --adopt dotfiles
    git --reset hard
}

echo -e "${YELLOW}[*]${NC} Installing dotfiles"

# update dotfiles
if [ -d "$HOME/Repos/dotfiles/.git" ]; then
	cd $HOME/Repos/dotfiles
    
    git fetch
    
    # get the branch name
    CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    BASE=$(git merge-base $CURRENT_BRANCH "origin/$CURRENT_BRANCH")
    AREF=$(git rev-parse $CURRENT_BRANCH)
    BREF=$(git rev-parse "origin/$CURRENT_BRANCH")
    
    if [[ $AREF = $BREF ]]; then
        echo -e "${GREEN}[*]${NC} Dotfiles are up to date"
    elif [[ $BREF == $BASE ]]; then
        echo -e "${RED}[!] Dotfiles are ahead, please push local changes${NC}"
    elif [[ $AREF == $BASE ]]; then
        echo "${YELLOW}[*]${NC} Dotfiles are outdated, updating..."
        dotfiles
    else
        echo -e "${RED}[!] Dotfiles are diverged${NC}"
    fi
else
	dotfiles
fi

echo -e "${YELLOW}[*]${NC} Making zsh the default shell"

# make zsh default shell
DEFAULT_SHELL=$(basename "$SHELL")

if [ "$DEFAULT_SHELL" == "zsh" ]; then
    echo -e "${ORANGE}[*]${NC}${GRAY} zsh already default shell${NC}"
else
    if command -v zsh &>/dev/null; then
        chsh -s $(which zsh)
    else
        echo -e "${RED}[!] Could not make zsh default shell, zsh is not installed${NC}"
    fi
fi

# set ZDOTDIR enviroment variable
echo 'export ZDOTDIR="$HOME/.config/zsh"' > $HOME/.profile
source $HOME/.profile

echo -e "${YELLOW}[*]${NC} Installing volta"

# install volta
if command -v volta &>/dev/null; then
    echo -e "${ORANGE}[*]${NC}${GRAY} Volta already installed${NC}"
else
    curl https://get.volta.sh | bash
fi

echo -e "${YELLOW}[*]${NC} Installing node"

# install node
if command -v node &>/dev/null; then
    echo -e "${ORANGE}[*]${NC}${GRAY} Node already installed${GRAY}"
else
    volta install node
fi

echo -e "${YELLOW}[*]${NC} Installing npm"

# install npm
if command -v npm &>/dev/null; then
    echo -e "${ORANGE}[*]${NC}${GRAY} npm already installed${NC}"
else
    volta install npm
fi

# enable firewalld
echo -e "${YELLOW}[*]${NC} Starting firewall"
sudo systemctl enable firewalld.service
sudo systemctl start firewalld.service

echo -e "${GREEN}Dotfiles installation complete!${NC}"

# go to home
cd $HOME
