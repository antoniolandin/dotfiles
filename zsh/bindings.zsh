
bindkey '^H' backward-kill-word
bindkey '^I' complete-word  # tab | complete
bindkey '^[[Z' autosuggest-accept   # Shift + tab | accept autosuggest

# Go up and down in autosuggest using j and k
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward

# Remap sudo plugin
bindkey -M emacs '^a' sudo-command-line
bindkey -M vicmd '^a' sudo-command-line
bindkey -M viins '^a' sudo-command-line
