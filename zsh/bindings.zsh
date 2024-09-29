# remove vi bindings
# bindkey -e

# Autocomplete
bindkey '^I' complete-word  # tab | complete command

# Changle clear bind to ctrl+o
bindkey '^O' clear-screen

# Accept autosuggestions
bindkey '^[[Z' autosuggest-accept

# Remap sudo plugin
bindkey '^S' sudo-command-line
