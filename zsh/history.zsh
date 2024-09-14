HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=10000
SAVEHIST=100000
HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..)"
HISTDUP=erase
WORDCHARS='*?_-[]~&;!#$%^(){}<>|'
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
