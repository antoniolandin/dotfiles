# OMZ plugins
zinit snippet OMZP::command-not-found
zinit snippet OMZP::sudo
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::kitty

# Core plugins
zinit wait lucid for \
  atinit"zicompinit; zicdreplay" \
    @zsh-users/zsh-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
  atinit"bindkey '^ ' autosuggest-execute; bindkey '^[[Z' autosuggest-accept;ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste up-line-or-search down-line-or-search expand-or-complete accept-line push-line-or-edit);" \
    @zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
    @zsh-users/zsh-completions

# Other plugins
zinit light Aloxaf/fzf-tab
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

zinit ice wait blockf lucid
zinit light rupa/z
zinit ice wait lucid
zinit light changyuheng/fz
