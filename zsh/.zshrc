# fix ctrl-s freeze
stty -ixon

# load configuration files
source "$ZDOTDIR/zimfw.zsh"
source "$ZDOTDIR/history.zsh" # history settings
# source "$ZDOTDIR/vim.zsh" # vim mode settings
source "$ZDOTDIR/alias.zsh" # aliases
source "$ZDOTDIR/bindings.zsh" # key bindings
source "$ZDOTDIR/integration.zsh" # shell integration
