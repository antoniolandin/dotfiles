# remove vi bindings
# bindkey -e

# Autocomplete
bindkey '^I' complete-word  # tab | complete command

# Changle clear bind to ctrl+o
bindkey '^O' clear-screen
bindkey -M vicmd '^O' clear-screen

# Accept autosuggestions
bindkey '^[[Z' autosuggest-accept

# Remap sudo plugin
bindkey '^S' sudo-command-line
bindkey -M vicmd '^S' sudo-command-line

# Open yazi
bindkey -s "^y" "yazi\n"
