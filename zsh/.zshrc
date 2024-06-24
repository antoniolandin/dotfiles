## /* ---- 🌟 Zsh configuration 🌟 ---- */ ##

# Lista de plugins
plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    sudo
    colored-man-pages
)

# Oh-my-zsh 
source $ZSH/oh-my-zsh.sh

# Starship
eval "$(starship init zsh)"

# Bindeos:
source $ZDOTDIR/bindings.zsh

# Alias
source $ZDOTDIR/alias.zsh

HISTFILE="$XDG_STATE_HOME"/zsh/history

# Nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
