# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/zsh/.oh-my-zsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

ZSH_THEME="robbyrussell"

# manage zsh plugins
plugins=(
    git 
    python
)

source $ZSH/oh-my-zsh.sh
