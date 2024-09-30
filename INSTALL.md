# Update operating system 
```bash
sudo pacman -Syu
```

# Install dependencies
```bash
sudo pacman -S stow zsh tree-sitter-cli ripgrep fzf ttf-firacode-nerd tldr p7zip unzip go neovim python-neovim zathura-pdf-mupdf git eza less python-pipx lazygit
```

# Install yay
```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

# Install synology-drive
```bash
yay -S synology-drive 
```

# Install volta
```bash
curl https://get.volta.sh | bash
```

# Install node and npm
```bash
volta install node
volta instasll npm
```

# Install starship
```bash
curl -sS https://starship.rs/install.sh | sh
```

# Install zoxide
```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

# Clone this repository
```bash
mkdir ~/repos/dotfiles
git clone https://github.com/antoniolandin/dotfiles ~/repos/dotfiles
cd ~/repos/dotfiles
```

# Create the symbolic links of the dotfiles
```bash
stow --ignore="INSTALL.md" --dir=$HOME/repos --target=$HOME/.config dotfiles
```

# Make zsh the default shell
```bash
chsh -s $(which zsh)
```

# Install termpdf
```bash
mkdir ~/.config/venv
cd ~/.config/venv
python -m venv termpdf
source ~/.config/venv/termpdf/bin/activate
git clone https://github.com/antoniolandin/termpdf.py ~/repos/termpdf.py
cd ~/repos/termpdf.py
pip install -r requirements.txt
chmod +x termpdf.py
deactivate
cd ~
```
