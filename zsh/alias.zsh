# Replace the default commands with better ones
alias ls="eza --icons --grid --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
alias cd="z"

# University alias
alias horario="$HOME/Repos/termpdf.py/termpdf.py $HOME/Drive/universidad/cursos/curso-2024-2025/horarios/horario-primer-cuatrimestre.pdf 2>/dev/null"
alias calendario="zathura $HOME/Drive/universidad/cursos/curso-2024-2025/horarios/calendario.pdf 2>/dev/null"

# Easier commands names
alias pdf="$HOME/Repos/termpdf.py/termpdf.py 2>/dev/null"
alias img="kitty +kitten icat"

# New commands
alias note="nvim $(date +%d-%m-%Y-%H:%M:%S.txt)"
alias zbench="hyperfine 'zsh -cli exit'"
alias la="ls -a"
alias ll="ls -al"

# Fix commands
alias nvidia-settings="nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings"
alias mocp=mocp -M "$XDG_CONFIG_HOME"/moc  
