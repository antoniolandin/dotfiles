# set XDG Base Directories
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state

# path
export PATH=$VOLTA_HOME/bin:$PATH
# export PATH="$HOME/.config/miniforge3/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/go/bin:$PATH"
export PATH="$HOME/Drive/scripts:$PATH"
export PATH="$HOME/.local/share/cargo/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"
export PATH="$HOME/.rvm/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=$HOME/.config/rofi/scripts:$PATH

# aliases para rutas
export UNI=$HOME/Drive/universidad/cursos/curso-2024-2025/cuatrimestre-1
export DOT=$HOME/Repos/dotfiles
export CONF=$HOME/.config

# shell defaults
export TERMINAL=kitty
export EDITOR=nvim
export BROWSER=/usr/bin/librewolf

# locale settings
export LC_CTYPE=es_ES.UTF-8
export LC_ALL=es_ES.UTF-8
export LANG=es_ES.UTF-8

# fix paths
export VOLTA_HOME="$HOME/.local/share/volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export RXVT_SOCKET=$XDG_RUNTIME_DIR/urxvtd
export W3M_DIR=$XDG_DATA_HOME/w3m
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
export ZSH=$XDG_CONFIG_HOME/oh-my-zsh
export ZSH_COMPDUMP=$XDG_CACHE_HOME/.zcompdump-$HOST
export DOCKER_CONFIG=$XDG_CONFIG_HOME/docker 
export CUDA_CACHE_PATH=$XDG_CACHE_HOME/nv
export CARGO_HOME=$XDG_DATA_HOME/cargo
export HISTFILE=$XDG_STATE_HOME/bash/history
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export OLLAMA_MODELS=$XDG_DATA_HOME/ollama/models
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java
export GTK2_RC_FILES=$XDG_CONFIG_HOME/gtk-2.0/gtkrc
export ANDROID_USER_HOME=$XDG_DATA_HOME/android
export GRADLE_USER_HOME=$XDG_DATA_HOME/gradle
export JUPYTER_CONFIG_DIR=$XDG_CONFIG_HOME/jupyter  
export NODE_REPL_HISTORY=$XDG_DATA_HOME/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc 
export MYSQL_HISTFILE=$XDG_DATA_HOME/mysql_history
export GOPATH=$XDG_DATA_HOME/go
export GOMODCACHE=$XDG_CACHE_HOME/go/mod
export VOLTA_HOME=$XDG_DATA_HOME/volta
export JUPYTERLAB_DIR=$HOME/.local/share/jupyter/lab
export NLTK_DATA=$XDG_DATA_HOME/nltk
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export KERAS_HOME="$XDG_STATE_HOME/keras"
export rvm_path="$XDG_DATA_HOME"/rvm
