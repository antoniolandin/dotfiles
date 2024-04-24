## /* ---- 🌟 Zsh configuration 🌟 ---- */ ##

# oh-my-zsh
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
    sudo
    zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# Path
export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:/home/antonio/.local/share/cargo/bin

# Variables de entorno
export CLASE=$HOME/OneDrive/cursos/curso-2023-2024/cuatrimestre-2/
export DOTFILES=$HOME/Repos/dotfiles/

# Starship
eval "$(starship init zsh)"

# Bindeos que sobrescriben zsh-vi-mode
function zvm_after_init() {
    bindkey '^[[Z' autosuggest-accept   # Shift + tab | accept autosuggest
}

# Bindeos:
bindkey '5~' kill-word  # Ctrl + delete | kill word
bindkey '^I' complete-word  # tab | complete

# Alias
alias ls="exa --icons --grid --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
alias la="ls -a"
alias ll="ls -al"
alias peaclock="peaclock --config-dir ~/.config/peaclock"
alias vim="nvim"
alias pdf="termpdf 2>/dev/null"
alias horario="termpdf /home/antonio/OneDrive/cursos/curso-2023-2024/horarios/horario-segundo-cuatrimestre.pdf 2>/dev/null"
alias calendario="zathura ~/OneDrive/cursos/curso-2023-2024/horarios/calendario.pdf 2>/dev/null"
alias img="kitty +kitten icat"
alias doraemon="mpv -ao=pulse ~/Videos/VIAJE\ AL\ MISMO\ PLANETA.mp4"
alias mhr="img ~/Pictures/memes/mangel.jpeg"
alias chess="cli-chess"

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

