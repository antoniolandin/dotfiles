#!/bin/bash

# update system
sudo pacman -Syu

# install yay
cd ~
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~
rm -rf ~/yay

# install dependencies
sudo pacman -S kitty stow zsh tree-sitter-cli ripgrep fzf ttf-firacode-nerd tldr p7zip unzip go neovim python-neovim zathura zathura-pdf-mupdf git eza less python-pipx lazygit maim jq imagemagick brightnessctl python-dbus
yay -S pulseaudio-control synology-drive

# install tools with curl
curl https://get.volta.sh | bash
curl -sS https://starship.rs/install.sh | sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# install node and npm
volta install node
volta install npm

# install dotfiles
mkdir ~/Repos
mkdir ~/Repos/dotfiles
git clone https://github.com/antoniolandin/dotfiles ~/Repos/dotfiles
cd ~/Repos/dotfiles

stow --ignore="INSTALL.md" --dir=$HOME/Repos --target=$HOME/.config dotfiles

# make zsh default shell
chsh -s $(which zsh)

# create directories
mkdir $HOME/.local/state/zsh
mkdir $HOME/Desktop $HOME/Pictures $HOME/Music $HOME/Videos $HOME/Downloads $HOME/Documents $HOME/Drive $HOME/Repos
touch $HOME/.local/state/zsh/history

# install termpdf
mkdir ~/.virtualenvs
cd ~/.virtualenvs
python -m venv termpdf
source ~/.virtualenvs/termpdf/bin/activate
git clone https://github.com/antoniolandin/termpdf.py ~/Repos/termpdf.py
cd ~/Repos/termpdf.py
pip install -r requirements.txt
chmod +x termpdf.py
deactivate
cd ~

# now reboot shell
echo "restart i3 and open kitty"
