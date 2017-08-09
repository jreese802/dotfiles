# Path to oh-my-zsh installation.
export ZSH=/Users/johnreese/.oh-my-zsh

# fix for ctrl s and ctrl q
stty stop ''
stty start ''
stty -ixon
stty -ixoff

# [ COLOR TERMINAL ]

# Set terminal to use 256 colors
export TERM=xterm-256color

# [ TNEME ]

# Zsh will show username for all users except DEFAULT_USER
DEFAULT_USER=`whoami`
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
# plugins=( gitfast extract z common-aliases npm git-extras history-substring-search )

# load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

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
 
 # Connect to 1.5
alias app1="ssh johnr@10.191.1.5"
alias app2="ssh johnr@10.191.1.6"
alias app3="ssh johnr@10.191.1.7"
alias front1="ssh johnr@10.191.1.2"
alias front2="ssh johnr@10.191.1.3"
alias front="ssh johnr@10.191.1.11"
alias serv="ssh johnr@10.191.1.8"

alias pg="ps auwwx | grep"

# use `config` for git dotfiles repo
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

alias lr="ls -ltr"
alias lra="ls -ltra"

# virtualenv
alias pyenv='export WORKON_HOME=~/Envs; source /usr/local/bin/virtualenvwrapper.sh'

# cursor movement back and forth
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home/
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:$HOME/bin
export PATH=$PATH:$HOME/repos/depot_tools

