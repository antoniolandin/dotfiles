# Replace the default ls command with exa
alias ls="eza --icons --grid --colour=auto --sort=type --group-directories-first --header --modified --created --git --binary --group"
alias la="ls -a"
alias ll="ls -al"

# University alias
alias horario="$HOME/Repos/termpdf.py/termpdf.py /home/antonio/SynologyDrive/Universidad/cursos/curso-2024-2025/horarios/horario-primer-cuatrimestre.pdf 2>/dev/null"
alias calendario="zathura ~/SynologyDrive/Universidad/cursos/curso-2024-2025/horarios/calendario.pdf"

# Easier commands names
alias pdf="$HOME/Repos/termpdf.py/termpdf.py 2>/dev/null"
alias img="kitty +kitten icat"

# New commands
alias note="nvim $(date +%d-%m-%Y-%H:%M:%S.txt)"
alias benchmark="time zsh -i -c exit"

# Fix commands
alias nvidia-settings="nvidia-settings --config="$XDG_CONFIG_HOME"/nvidia/settings"
alias bc="bc -l $XDG_CONFIG_HOME/bcinit"
