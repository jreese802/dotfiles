# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
umask g+w

# key bindings
# bind "\e\e[D" : backword-word
# bind "\e\e[C" : forward-word

export PATH=/home/johnr/bin:usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/node/bin/

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

