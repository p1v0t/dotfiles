export EDITOR=/usr/local/bin/vim

shopt -s histappend

HISTFILE=~/.history
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000
HISTIGNORE="cd:l:ls:pwd:rm:cat:less:more:vim:history:tree:[bf]g"

test -r ~/.bash_aliases && . ~/.bash_aliases || true
test -r ~/.bash_functions && . ~/.bash_functions || true
test -r ~/.config/z/z.sh &&  . ~/.config/z/z.sh || true

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

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

export CXX=/usr/local/bin/g++
export CC=/usr/local/bin/gcc

source /home/adem/Desktop/post/vcpkg/scripts/vcpkg_completion.bash

set bell-style none

set colored-completion-prefix On
set colored-stats On

set completion-ignore-case On
set completion-prefix-display-length 10000
set completion-query-items 50
