# fix ctrl-s freeze
stty -ixon

# set the correct repeat rate for the keyboard
xset r rate 190 35
 
# load configuration files
source "$ZDOTDIR/zimfw.zsh"
source "$ZDOTDIR/history.zsh" # history settings
source "$ZDOTDIR/vim.zsh" # vim mode settings
source "$ZDOTDIR/alias.zsh" # aliases
source "$ZDOTDIR/utilities.zsh"
source "$ZDOTDIR/bindings.zsh" # key bindings
source "$ZDOTDIR/integration.zsh" # shell integration

# source all scripts in the script folders
source <(cat $ZDOTDIR/scripts/*)

# pnpm
export PNPM_HOME="/home/antonio/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
