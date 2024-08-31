# Crear los enlaces simbólicos de los dotfiles
```bash
stow --ignore="INSTALL.md" --dir=$HOME/Repos --target=$HOME/.config dotfiles
```

# Actualizar sistema operativo
```bash
sudo pacman -Syu
```

# Instalar zsh
```bash
sudo pacman -S zsh
```

# Hacer zsh la consola default
```bash
chsh -s $(which zsh)
```

# Poner en el archivo .zprofile la ruta de configuración de zsh
```bash
echo "export ZDOTDIR=".config/zsh"" > ~/.zprofile
```

# Copiar las carpetas de dotfiles a .config
```bash
cp -r ~/dotfiles/zsh ~/.config
cp -r ~/dotfiles/nvim ~/.config
cp -r ~/dotfiles/git ~/.config
cp -r ~/dotfiles/kitty ~/.config
cp -r ~/dotfiles/starship.toml ~/.config
```

# Hacer source del .zshenv
```bash
source ~/.config/zsh/.zshenv
```

# Instalar oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

# Instalar zsh-autosuggestions y zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

# Instalar treesitter-cli
```bash
sudo pacman -S tree-sitter-cli
```

# Instalar ripgrep
```bash
sudo pacman -S ripgrep
```

# Instalar fzf
```bash
sudo pacman -S fzf
```

# Instalar todas las nerdfonts
```bash
sudo pacman -S nerdfonts
```

# Instalar yay
```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

# Instalar SynologyDrive
```bash
yay -S synology-drive 
```

# Instalar utilidades varias
```bash
sudo pacman -S tldr p7zip
```

# Instalar term.pdf
```bash
mkdir ~/.config/venv
cd ~/.config/venv
python -m venv termpdf
source ~/.config/venv/termpdf/bin/activate

cd ~/Repos
git clone https://github.com/dsanson/termpdf.py
cd termpdf.py
pip install -r requirements.txt
```
