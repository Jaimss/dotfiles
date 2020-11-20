# default programs
export EDITOR="vim"

export PATH="$HOME/.config/scripts:$PATH"

# maven
export M2_HOME="/opt/maven"
export PATH="$M2_HOME/bin:$PATH"

# ~/ cleanup
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
source "$XDG_CONFIG_HOME/aliasrc"

export ZDOTDIR="$HOME/.config/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export LESSHISTFILE="-"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
export WINEPREFIX="$XGD_DATA_HOME/wineprefixes/default"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

# from .profile
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

