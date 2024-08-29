bindkey '^H' backward-kill-word
bindkey '^I' complete-word  # tab | complete
bindkey '^[[Z' autosuggest-accept   # Shift + tab | accept autosuggest

# Remap sudo plugin
bindkey -M emacs '^a' sudo-command-line
bindkey -M vicmd '^a' sudo-command-line
bindkey -M viins '^a' sudo-command-line

# Unbind ctrl + r
bindkey -r "^R"
