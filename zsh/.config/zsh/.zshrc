# Path to your oh-my-zsh installation.
export ZSH="$XDG_CONFIG_HOME/zsh/ohmyzsh"
export ZSH_CACHE_DIR="$XDG_CACHE_HOME/zsh"

# ignore permissions things for root user
ZSH_DISABLE_COMPFIX=true

# https://github.com/zsh-users/zsh-completions/tree/master
# git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
#fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# yay -S zsh-completions-git
source $ZSH/oh-my-zsh.sh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vim mode
bindkey -v
export KEYTIMEOUT=5

bindkey -M viins 'jk' vi-cmd-mode

bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-hist
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey -v '^?' backward-delete-char
# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# edit command line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# manage zsh plugins
plugins=(
    git 
    python
    vi-mode
    zsh-history-substring-search
) 


source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /home/james/.config/zsh/ohmyzsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# substring history search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# 1password
if command -v op > /dev/null 2>&1; then
    eval "$(op completion zsh)"; compdef _op op
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Set up fzf key bindings and fuzzy completion
source /home/james/.config/zsh/fzf-tab-completion/zsh/fzf-zsh-completion.sh
bindkey '^I' fzf_completion
source <(fzf --zsh)

# compdump
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION


eval "$(starship init zsh)"
