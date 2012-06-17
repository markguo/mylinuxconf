# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
alias lgdb='libtool --mode=execute gdb'
alias lvalg='libtool --mode=execute valgrind'
alias dmake='DEBUG=1 make'
alias mst='screen -X title `pwd`'
alias svnchange="svn status | grep -v '^?'"
alias svnnew="svn stat|grep ?|egrep '\.(hpp|cpp|h|c)\>'"
alias svncanmerge='svn mergeinfo --show-revs eligible'

# export WIRE_CONF=/home/guoshiwei/DATA/wiredata
# export SSPLATFORM_ROOT=~/ssplatform/
export SVN_EDITOR=vim

GOROOT=$HOME/go
GOOS=linux
GOARCH=amd64
GIT_EDITOR=vim
LANG='zh_CN.UTF8' 
export GOROOT GOOS GOARCH GIT_EDITOR LANG

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

MY_CONFIG_ROOT=~/development/mylinuxconf

source $MY_CONFIG_ROOT/bash_completion_tmux.sh
source $MY_CONFIG_ROOT/git-completion.bash

alias grep='grep --color --exclude="*.svn-*"'
alias fgrep='fgrep --color --exclude="*.svn-*"'
alias egrep='egrep --color --exclude="*.svn-*"'
alias find=find_nosvn
alias diff='diff --exclude=".svn" --exclude=".depend" --exclude="*.o" --exclude="*.a" --exclude="*.so" --exclude="*.la" --exclude="*.lo"'

export EDITOR=vim
export PS1='[\u@\h \W]\$ '
source $MY_CONFIG_ROOT/git-completion.bash
