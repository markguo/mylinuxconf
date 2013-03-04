# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# subversion specific aliases and functions
function find_nosvn()
{
    initargs=()
    while [ "${1#-}" = "$1" -a $# -gt 0 ]; do
	initargs=("${initargs[@]}" "$1")
	shift
    done
    if [ -z "$*" ]; then
	/usr/bin/find "${initargs[@]}" -not -path "*/.svn/*" ;
    else
	/usr/bin/find "${initargs[@]}" -not -path "*/.svn/*" -a "(" "$@" ")" ;
    fi

}

# User specific aliases and functions
alias diff='diff --exclude=".svn" --exclude=".depend" --exclude="*.o" --exclude="*.a" --exclude="*.so" --exclude="*.la" --exclude="*.lo"'
alias dmake='DEBUG=1 make'
alias ds='du --max-depth=1|sort -n'
alias egrep='egrep --color --exclude="*.svn-*"'
alias et='emacsclient -t'
alias fgrep='fgrep --color --exclude="*.svn-*"'
alias find=find_nosvn
alias grep='grep --color --exclude="*.svn-*"'
alias lgdb='libtool --mode=execute gdb'
alias ll='ls -l'
alias ls='ls --color'
alias lvalg='libtool --mode=execute valgrind'
alias mst='screen -X title `pwd`'
alias svncanmerge='svn mergeinfo --show-revs eligible'
alias svnchange="svn status | grep -v '^?'"
alias svnnew="svn stat|grep ?|egrep '\.(hpp|cpp|h|c)\>'"

MY_CONFIG_ROOT=~/mylinuxconf
GIT_EDITOR=vim
LANG='zh_CN.GB18030' 
export EDITOR=vim
export GIT_EDITOR LANG
export PATH="~/ENV/bin:$PATH"
export PS1='\[\e[0;32m\][\u\[\e[m\] \[\e[1;34m\]\W\[\e[m\] \[\e[1;32m\]\$]\[\e[m\] \[\e[1;37m\]'
export SVN_EDITOR=vim
unset SSH_ASKPASS
source $MY_CONFIG_ROOT/bash_completion_tmux.sh
source $MY_CONFIG_ROOT/git-completion.bash

