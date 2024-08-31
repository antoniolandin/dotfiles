# Autocomplete
bindkey '^I' complete-word  # tab | complete command
bindkey '^[[Z' autosuggest-accept   # Shift + tab | accept autosuggest

# Remap sudo plugin
bindkey -r '^S'
bindkey -M emacs '^S' sudo-command-line
bindkey -M vicmd '^S' sudo-command-line
bindkey -M viins '^S' sudo-command-line

# Unbind arrow keys
bindkey -r '^[[A'
bindkey -r '^[[B'
bindkey -r '^[[C'
bindkey -r '^[[D'

# Unbind ctrl + r
bindkey -r '^R'
