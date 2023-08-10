export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# sdkman
# export SDKMAN_DIR="$XDG_DATA_HOME/sdkman"
# source "$SDKMAN_DIR/bin/sdkman-init.sh"

# default programs
export EDITOR="vim"

export PATH="$XDG_CONFIG_HOME/scripts:$PATH"
export LC_ALL=C
export LC_CTYPE=en_US.UTF-8

# maven
export PATH="$XDG_CONFIG_HOME/maven/apache-maven-3.6.3/bin:$PATH"
#export JAVA_HOME="$XDG_CONFIG_HOME/java/java_home/openjdk-15.0.1"
export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

# ~/ cleanup
source "$XDG_CONFIG_HOME/aliasrc"

export LEIN_HOME="$XDG_DATA_HOME/lein"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export LESSHISTFILE="-"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"

# source setup env variables
#if [ -f "$HOME/.config/scripts/monitor_env_vars.sh" ]; then
    #source "$HOME/.config/scripts/monitor_env_vars.sh"
#fi

# from .profile
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export GPG_TTY=$(tty)
