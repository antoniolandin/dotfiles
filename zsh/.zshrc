## /* ---- 🌟 Zsh configuration 🌟 ---- */ ##

# plugin list 
plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    sudo
    colored-man-pages
    vi-mode
    kitty
)

# starship
eval "$(starship init zsh)"

# load files
source $ZSH/oh-my-zsh.sh # oh-my-zsh
source $ZDOTDIR/alias.zsh # aliases
source $ZDOTDIR/bindings.zsh # key bindings

# remove delay when pressing ESC (for vi mode)
export KEYTIMEOUT=1

# set the history file
HISTFILE="$XDG_STATE_HOME"/zsh/history
# Completion files: Use XDG dirs
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION
