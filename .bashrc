# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto -Fh'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# User specific aliases and functions
alias s='sudo '
alias sw='sudo su -'

svim () {
    sudo vim -u ~andrew/.vimrc $@
}

# Check Mac OS X or Linux operation system
if which system_profiler > /dev/null 2>&1; then
    alias ls='ls -Fh'
    export CLICOLOR='true'
    export LSCOLORS="gxfxcxdxcxegedabagacad"
fi
