# Update operating system 
```bash
sudo pacman -Syu
```

# Install dependencies
```bash
sudo pacman -S stow zsh tree-sitter-cli ripgrep fzf ttf-firacode-nerd tldr p7zip unzip go neovim python-neovim zathura-pdf-mupdf lazygit 
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

# Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
```

# Install zsh-autosuggestions and zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
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

# Specify the ZDOTDIR in the .zprofile
```bash
echo "export ZDOTDIR=".config/zsh"" > ~/.zprofile
```

# Source the .zshenv
```bash
source ~/.config/zsh/.zshenv
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
