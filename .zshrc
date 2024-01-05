# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=( 
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

### From this line is for pywal-colors
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

# Starship

eval "$(starship init zsh)"

# Bindeos:

bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey '^I'   complete-word       # tab          | complete
bindkey '^[[Z' autosuggest-accept  # shift + tab  | autosuggest

# Alias

alias ls="exa --icons --grid --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
alias la="ls -a"
alias ll="ls -al"
alias peaclock="peaclock --config-dir ~/.config/peaclock"

# Recuperar colores de la terminal
(cat ~/.cache/wal/sequences &)

# Created by `pipx` on 2024-01-04 12:18:01
export PATH="$PATH:/home/antonio/.local/bin"
