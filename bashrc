# .bashrc

if [ `uname` == 'Darwin' ]; then
    source ~/.macrc
elif [ `uname` == 'Linux' ]; then
    source ~/.linuxrc
fi

# Source Cloud SDK tools
if [ -f "/Users/andrew/opt/google-cloud-sdk/completion.bash.inc" ]; then
    # Enable shell command completion for gcloud
    . /Users/andrew/opt/google-cloud-sdk/completion.bash.inc

    # Add the Google Cloud SDK command line tools
    . /Users/andrew/opt/google-cloud-sdk/path.bash.inc
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

export PS1="\[\033[38;5;184m\]\h \[\033[32m\][\w]\[\033[0m\]\n\[\033[1;34m\][\!]\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"
export EDITOR=vim
export LANG=en_US.UTF-8
export PATH=${PATH}:/opt/bin
export KUBECONFIG=~/.kube/motion:~/.kube/mylab:~/.kube/cluster-1:~/.kube/ali-motion

# Global aliases and functions
alias s='sudo'
alias sw='sudo su -'

svim () {
    sudo vim -u ~andrew/.vimrc $@
}

# kubectl and helm autocompletion
for x in kubectl helm; do
    path=`which $x 2> /dev/null`
    if [ -x "$path" ]; then
        . <(${x} completion bash)
    fi
done

# Enable ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    # ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    if find ~/.ssh -type f -perm 0600 | grep -q id_rsa; then
        start_agent;
    fi
fi
