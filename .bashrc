export EDITOR=/usr/local/bin/vim

shopt -s histappend

HISTFILE=~/.history
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000
HISTIGNORE="cd:l:ls:pwd:rm:cat:less:more:vim:history:tree:[bf]g"

test -r ~/.bash_aliases && . ~/.bash_aliases || true
test -r ~/.bash_functions && . ~/.bash_functions || true

export PATH=/home/adem/.local/bin:$PATH
export PATH="$PATH:$HOME/bin"

export PATH=$HOME/appimages:$PATH

export PATH=$PATH:/usr/local/go/bin
export GOPATH=/usr/home/adem/Desktop/letsGo:$PATH
export BOOST_ROOT=/usr

export CXX=/usr/bin/clang++
export CC=/usr/bin/clang
