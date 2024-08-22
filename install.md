# actualizar sistema operativo
```bash
sudo pacman -Syu
```

# instalar zsh
```bash
sudo pacman -S zsh
```

# hacer zsh la consola default
```bash
chsh -s $(which zsh)
```
# Poner en el archivo .zprofile la ruta de configuración de zsh
```bash
echo "export ZDOTDIR=".config/zsh"" > ~/.zprofile
```
# copiar las carpetas de dotfiles a .config
```bash
cp -r ~/dotfiles/zsh ~/.config
cp -r ~/dotfiles/nvim ~/.config
cp -r ~/dotfiles/git ~/.config
cp -r ~/dotfiles/kitty ~/.config
cp -r ~/dotfiles/starship.toml ~/.config
```
# hacer source del .zshenv
```bash
source ~/.config/zsh/.zshenv
```

# instalar oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

# instalar zsh-autosuggestions y zsh-syntax-highlighting
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

# instalar treesitter-cli
```bash
sudo pacman -S tree-sitter-cli
```

# instalar ripgrep
```bash
sudo pacman -S ripgrep
```

# instalar fzf
```bash
sudo pacman -S fzf
```

# instalar todas las nerdfonts
```bash
sudo pacman -S nerdfonts
```

# instalar yay
```bash
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

# instalar SynologyDrive
```bash
yay -S synology-drive 
```

# instalar utilidades varias
```bash
sudo pacman -S tldr p7zip
```

# instalar term.pdf
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
