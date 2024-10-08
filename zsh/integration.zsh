# Shell integration for zsh
source <(fzf --zsh) # fzf
eval "$(starship init zsh)" # starship prompt
eval "$(zoxide init zsh)" # zoxide

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/antonio/.config/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ -f "/home/antonio/.config/miniforge3/etc/profile.d/conda.sh" ]; then
    . "/home/antonio/.config/miniforge3/etc/profile.d/conda.sh"
else
    export PATH="/home/antonio/.config/miniforge3/bin:$PATH"
fi

unset __conda_setup

if [ -f "/home/antonio/.config/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/antonio/.config/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

