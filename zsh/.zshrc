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
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
