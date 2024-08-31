# Actualizar sistema operativo
```bash
sudo pacman -Syu
```

# Instalar todas las dependencias
```bash
sudo pacman -S stow zsh tree-sitter-cli ripgrep fzf nerdfonts tldr p7zip
```

# Crear los enlaces simbólicos de los dotfiles
```bash
stow --ignore="INSTALL.md" --dir=$HOME/Repos --target=$HOME/.config dotfiles
```

# Hacer zsh la consola default
```bash
chsh -s $(which zsh)
```

# Poner en el archivo .zprofile la ruta de configuración de zsh
```bash
echo "export ZDOTDIR=".config/zsh"" > ~/.zprofile
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
