# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Global aliases and functions
alias s='sudo '
alias sw='sudo su -'

svim () {
    sudo vim -u ~andrew/.vimrc $@
}

# kubectl and helm autocompletion
for x in kubectl helm; do
    if [ -x `which ${x}` ]; then
        . <(${x} completion bash)
    fi
done

if [ `uname` == 'Darwin' ]; then
    source ~/.macrc
elif [ `uname` == 'Linux' ]; then
    source ~/.linuxrc
fi
