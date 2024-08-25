# set XDG Base Directories
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# path
export PATH="$PATH:$HOME/.local/bin:$HOME/.cargo/bin:/home/antonio/.local/share/cargo/bin:$(go env GOBIN):$(go env GOPATH)/bin"

# aliases para rutas
export UNI=$HOME/SynologyDrive/Universidad/cursos/curso-2024-2025/cuatrimestre-1
export DOT=$HOME/Repos/dotfiles
export CONF=$HOME/.config

# fix paths
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker 
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export HISTFILE="$XDG_STATE_HOME"/bash/history
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export OLLAMA_MODELS=$XDG_DATA_HOME/ollama/models
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export ANDROID_USER_HOME="$XDG_DATA_HOME"/android
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter  
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc 
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv 
export GOPATH="$XDG_DATA_HOME"/go
export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
