# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

## Make sure all tmux windows write to history
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
# append history entries..
shopt -s histappend
# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

source /usr/share/git-core/contrib/completion/git-prompt.sh

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color|screen|xterm|xterm-256color|screen-256color)
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;35m\]$(__git_ps1)\[\033[00m\]\$ '
    ;;
*)
    PS1='\u@\h:\w\$ '
    ;;
esac

#export PS1=[\u@\h \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ 
function today {
    echo "Today's date is:"
    date +"%A, %B %-d, %Y"
}

alias rm='rm -i'

# Bigger history file
export HISTSIZE=1000000
export HISTFILESIZE=1000000000

export GOPATH=~/golang
export PATH=$PATH:$GOPATH/bin
export EDITOR=vim
