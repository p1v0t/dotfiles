#!/usr/bin/env sh

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

source ~/.inputrc
source ~/.alacritty.bash
source ~/.git-prompt.sh
source /usr/share/bash-completion/bash_completion
source ~/.cargo/env
eval "$(pandoc --bash-completion)"

PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'


HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

export CC=clang-11
export CXX=clang++-11

alias wq="exit"
alias ..="cd .."
alias ls="ls --color"

