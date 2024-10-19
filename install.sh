#!/bin/bash

# update system
sudo pacman -Syu

# install yay
cd $HOME
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd $HOME
rm -rf $HOME/yay

# install dependencies
sudo pacman -S kitty stow zsh tree-sitter-cli ripgrep fzf ttf-firacode-nerd tldr p7zip unzip go neovim python-neovim zathura zathura-pdf-mupdf git eza less python-pipx lazygit maim jq imagemagick brightnessctl python-dbus polybar zoxide xclip
yay -S pulseaudio-control synology-drive

# install tools with curl
curl https://get.volta.sh | bash
curl -sS https://starship.rs/install.sh | sh

# install node and npm
volta install node
volta install npm

# install termpdf
mkdir $HOME/.local/share/virtualenvs
cd $HOME/.local/share/virtualenvs
python -m venv termpdf
source $HOME/.local/share/termpdf/bin/activate
git clone https://github.com/antoniolandin/termpdf.py $HOME/Repos/termpdf.py
cd $HOME/Repos/termpdf.py
pip install -r requirements.txt
chmod +x termpdf.py
deactivate

# create neovim virtualenv
cd $HOME/.local/share/virtualenvs
python -m venv neovim

# install dotfiles
mkdir $HOME/Repos
mkdir $HOME/Repos/dotfiles
git clone https://github.com/antoniolandin/dotfiles $HOME/Repos/dotfiles
cd $HOME/Repos/dotfiles
stow --ignore="INSTALL.md" --dir=$HOME/Repos --target=$HOME/.config dotfiles

# create directories
mkdir $HOME/.local/state/zsh
mkdir $HOME/Desktop $HOME/Pictures $HOME/Music $HOME/Videos $HOME/Downloads $HOME/Documents $HOME/Drive $HOME/Repos
touch $HOME/.local/state/zsh/history

# make zsh default shell
chsh -s $(which zsh)

# set ZDOTDIR enviroment variable
echo 'export "ZDOTDIR=$HOME/.config/zsh"' >> $HOME/.profile
source $HOME/.profile

# restart zsh
cd $HOME
zsh
