export EDITOR=/usr/local/bin/vim

PS1='=> '

bind -x '"\C-l": clear'
shopt -s histappend
HISTFILE=~/.history
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000
HISTIGNORE="cd:l:ls:pwd:rm:cat:less:more:vim:history:tree:[bf]g"

test -r ~/.bash_aliases && source ~/.bash_aliases || true
test -r ~/.bash_functions && source ~/.bash_functions || true
test -r ~/.config/z/z.sh && source ~/.config/z/z.sh || true
test -r ~/.inputrc && source ~/.inputrc || true

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=/home/adem/.local/bin:$PATH
export PATH="$PATH:$HOME/bin"
export PATH=$HOME/appimages:$PATH

export BOOST_ROOT=/usr/local
#export CXX=/usr/bin/g++
#export CC=/usr/bin/gcc

export CXX=/usr/local/bin/clang
#export CC=/usr/bin/gcc
