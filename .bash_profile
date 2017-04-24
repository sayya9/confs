# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/bin:/sbin:/usr/sbin:/opt/bin
PS1="\u@\h:\w> "
GREP_COLOR='1;32'
export GDFONTPATH="/usr/share/fonts/msttcorefonts"
export GNUPLOT_DEFAULT_GDFONT="arial"

export PATH GREP_COLOR PS1
