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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
