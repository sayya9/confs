# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Global environment and startup programs
PS1="\[\033[38;5;184m\]\h \[\033[32m\][\w]\[\033[0m\]\n\[\033[1;34m\][\!]\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"

# Set default editor
export EDITOR=vim
