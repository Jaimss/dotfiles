export XDG_CONFIG_HOME="$HOME/.config" # /etc
export XDG_DATA_HOME="$HOME/.local/share" # /usr/share
export XDG_STATE_HOME="$HOME/.local/state" # /var/lib
export XDG_CACHE_HOME="$HOME/.cache" # /var/cache

# sdkman
export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# default programs
export EDITOR="nvim"

export PATH="$XDG_CONFIG_HOME/scripts:$PATH"
export LC_ALL=en_US.UTF-8

# vscode (first option is undocumented and may break, second is supported)
# export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
alias code='code --extensions-dir "$XDG_DATA_HOME/vscode"'

# rust
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup

# nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

# tex
export PATH="$PATH:/usr/local/texlive/2024/bin/x86_64-linux"

# cuda
export CUDA_HOME=/usr/local/cuda
export PATH=${CUDA_HOME}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH

# jetbrains toolbox
export PATH="$PATH:/home/james/.local/share/JetBrains/Toolbox/scripts"

source "$XDG_CONFIG_HOME/aliasrc"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"

# gtk2
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"

export LESSHISTFILE="-"

# npm (make sure to stow npm)
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

# java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export JAVA_HOME="$SDKMAN_DIR/candidates/java/current"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
# maven
export MAVEN_OPTS=-Dmaven.repo.local="$XDG_DATA_HOME"/maven/repository
export MAVEN_ARGS="--settings $XDG_CONFIG_HOME/maven/settings.xml"
# gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# docker config
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"

# nvidia / cuda
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv

# GNU
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

# w3m
export W3M_DIR="$XDG_STATE_HOME/w3m"

# python
export PYTHON_HISTORY=$XDG_STATE_HOME/python_history
export PYLINTHOME="$XDG_CACHE_HOME/pylint"

# set PATH so it includes user's local/bin
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export GPG_TTY=$(tty)
