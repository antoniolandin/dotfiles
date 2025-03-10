#!/bin/bash

# update system
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
)

# install packages 
for PACKAGE_NAME in "${PACKAGES[@]}"; do
    # check if package is installed
    if ! pacman -Q "$PACKAGE_NAME" &> /dev/null; then
        sudo pacman -S --noconfirm "$PACKAGE_NAME"
    else
        echo "$PACKAGE_NAME already installed"
    fi
done

# install yay
if ! pacman -Q yay &>/dev/null; then
    cd $HOME
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $HOME
    rm -rf $HOME/yay
else
    echo "yay already installed"
fi

# yay packages
YAY_PACKAGES=(
    "pulseaudio-control"
    "synology-drive"
    "librewolf-bin"
)

# install yay packages 
for PACKAGE_NAME in "${YAY_PACKAGES[@]}"; do
    # check if package is installed
    if ! yay -Q "$PACKAGE_NAME" &> /dev/null; then
        yay -S --noconfirm "$PACKAGE_NAME"
    else
        echo "$PACKAGE_NAME already installed"
    fi
done

# create librewolf desktop file
if [! -f $HOME/.local/share/applications/librewolf.desktop ]; then
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
if command -v starship &>/dev/null; then
    echo "starship already installed"
else
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
fi

# create directories and files
mkdir -p $HOME/.local/share/virtualenvs
mkdir -p $HOME/.local/state/zsh
mkdir -p $HOME/Desktop $HOME/Videos $HOME/Downloads $HOME/Documents $HOME/Drive $HOME/Repos
touch $HOME/.local/state/zsh/history

# install termpdf
if [ -d "$HOME/.local/share/virtualenvs/termpdf" ] && [ -f "$HOME/Repos/termpdf.py/termpdf.py" ]; then
    echo "termpdf already installed"
else
    cd $HOME/.local/share/virtualenvs
    python -m venv termpdf
    source $HOME/.local/share/virtualenvs/termpdf/bin/activate
    git clone https://github.com/antoniolandin/termpdf.py $HOME/Repos/termpdf.py
    cd $HOME/Repos/termpdf.py
    pip install -r requirements.txt
    chmod +x termpdf.py
    deactivate
fi

# create neovim virtualenv
if [ -d "$HOME/.local/share/virtualenvs/neovim" ]; then
    echo "neovim virtualvenv already exists"
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
        echo "dotfiles are up to date"
    elif [[ $BREF == $BASE ]]; then
        echo "dotfiles are ahead, please push local changes"
    elif [[ $AREF == $BASE ]]; then
        echo "dotfiles are outdated, updating..."
        dotfiles
    else
        echo "dotfiles are diverged"
    fi
else
	dotfiles
fi

# make zsh default shell
DEFAULT_SHELL=$(basename "$SHELL")

if [ "$DEFAULT_SHELL" == "zsh" ]; then
    echo "zsh already default shell"
else
    if command -v zsh &>/dev/null; then
        chsh -s $(which zsh)
    else
        echo "ERROR: could not make zsh default shell, zsh is not installed"
    fi
fi

# set ZDOTDIR enviroment variable
echo 'export ZDOTDIR="$HOME/.config/zsh"' > $HOME/.profile
source $HOME/.profile

# enter zsh
source $HOME/.config/zsh/.zshrc

# install volta
if command -v volta &>/dev/null; then
    echo "volta already installed"
else
    curl https://get.volta.sh | bash
fi

# install node
if command -v node &>/dev/null; then
    echo "node already installed"
else
    volta install node
fi

# install npm
if command -v npm &>/dev/null; then
    echo "npm already installed"
else
    volta install npm
fi

# enable firewalld
sudo systemctl enable firewalld.service
sudo systemctl start firewalld.service

# go to home
cd $HOME
