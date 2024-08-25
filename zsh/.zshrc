## /* ---- 🌟 Zsh configuration 🌟 ---- */ ##

# lista de plugins
plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    sudo
    colored-man-pages
    vi-mode
)

# oh-my-zsh 
source $ZSH/oh-my-zsh.sh

# starship
eval "$(starship init zsh)"

# bindeos
source $ZDOTDIR/bindings.zsh

# blias
source $ZDOTDIR/alias.zsh

# follow the XDG Base Directory Specification
HISTFILE="$XDG_STATE_HOME"/zsh/history
# completion files: Use XDG dirs
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

# vim mode
bindkey -v
export KEYTIMEOUT=1

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
