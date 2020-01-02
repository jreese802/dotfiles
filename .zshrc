# Path to oh-my-zsh installation.
export ZSH=/Users/john.reese/.oh-my-zsh

# fix for ctrl s and ctrl q
stty stop ''
stty start ''
stty -ixon
stty -ixoff

# [ COLOR TERMINAL ]

# Set terminal to use 256 colors
export TERM=xterm-256color
# export LS_COLORS=`cat ~/shoji/dircolors`
[ -n "$PS1" ] && sh ~/nightshell/seagrey-dark


# [ TNEME ]

# Zsh will show username for all users except DEFAULT_USER
DEFAULT_USER=`whoami`
# ZSH_THEME="spaceship"
ZSH_THEME="agnoster"
# Red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# [ UI ]

# Case-sensitive completion.
CASE_SENSITIVE="true"

# Use hyphen-insensitive completion. 
# Case sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"


# [ GIT ]
# # CHECK .gitconfig for more!

# Disable marking untracked files in code repos
# This makes repository status check for large repositories # much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# [ PLUGINS ]

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# TODO: install these manually:
plugins=( gitfast extract z common-aliases npm git-extras history-substring-search kubectl)

# lazy-load NVM
# Add every binary that requires nvm, npm or node to run to an array of node globals
NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`)
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")

# Lazy-loading nvm + npm on node globals call
load_nvm () {
  export NVM_DIR=~/.nvm
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && . "$(brew --prefix nvm)/nvm.sh"
}

# Making node global trigger the lazy loading
for cmd in "${NODE_GLOBALS[@]}"; do
  eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done


# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# [ EXTRAS ]

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# decrease escape sequence delay from 40ms to 10ms
# improves vim mode switching time
KEYTIMEOUT=1

# using default ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# [ ALIASES ]
# Moved these to their own file
source ~/.aliasrc
 
 # Connect to 1.5
# alias app1="ssh johnr@10.191.1.5"
# alias app2="ssh johnr@10.191.1.6"
# alias app3="ssh johnr@10.191.1.7"
# alias front1="ssh johnr@10.191.1.2"
# alias front2="ssh johnr@10.191.1.3"
# alias front="ssh johnr@10.191.1.11"
# alias serv="ssh johnr@10.191.1.8"

# alias pg="ps auwwx | grep"

# # use `config` for git dotfiles repo
# alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# alias lr="ls -ltr"
# alias lra="ls -ltra"

# # virtualenv
# alias pyenv='export WORKON_HOME=~/Envs; source /usr/local/bin/virtualenvwrapper.sh'

# cursor movement back and forth
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home/
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/bin
export PATH=$PATH:$HOME/repos/depot_tools
export PATH=$PATH:/usr/local/opt/python/libexec/bin
export PATH=`pwd`/flutter/bin:$PATH
export PATH=/Users/john.reese/.pyenv/shims:$PATH
export PATH=/Users/john.reese/.local/bin:$PATH


# export WORKON_HOME=$HOME/virtualenvs
export PROJECT_HOME=$HOME/repos
# source /usr/local/bin/virtualenvwrapper.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# bindkey -v

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

precmd() { RPROMPT="" }
function zle-line-init zle-keymap-select {
   VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
   RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
   zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

export KEYTIMEOUT=1
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/apr/bin:$PATH"
export PATH="/usr/local/opt/php@7.0/bin:$PATH"
export PATH="/usr/local/opt/php@7.0/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/Users/john.reese/Downloads/sonar-scanner-3.3.0.1492-macosx/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/john.reese/.sdkman"
[[ -s "/Users/john.reese/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/john.reese/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
