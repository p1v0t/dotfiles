export EDITOR=/usr/local/bin/vim

PS1='\$ ' # Don't show anything on prompt other than '$' sign

bind -x '"\C-l": clear'
shopt -s histappend
HISTFILE=~/.history
HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000
HISTIGNORE="cd:l:ls:pwd:rm:cat:less:more:vim:history:tree:[bf]g"

test -r ~/.bash_aliases && source ~/.bash_aliases || true      # source alias
test -r ~/.bash_functions && source ~/.bash_functions || true  # source bash function
test -r ~/.config/z/z.sh && source ~/.config/z/z.sh || true    # z script to jump between directories

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

set bell-style none

set colored-completion-prefix On
set colored-stats On

set completion-display-width 20
set completion-ignore-case On
set completion-prefix-display-length 10000
set completion-query-items 50
set keymap vi-insert # use vi mode when editing commands
set keyseq-timeout 10
set mark-directories Off # don't show '/' end of directory to indicate it's a one
set menu-complete-display-prefix On # show possible completions

set horizontal-scroll-mode On
set print-completions-horizontally On

set show-if-unmodified On

set show-mode-in-prompt On
set vi-cmd-mode-string "[N]"
set vi-ins-mode-string "[I]"


export PATH=/home/adem/.local/bin:$PATH
export PATH="$PATH:$HOME/bin"
export PATH=$HOME/appimages:$PATH

export BOOST_ROOT=/usr/local
export CXX=/usr/local/bin/g++
export CC=/usr/local/bin/gcc
