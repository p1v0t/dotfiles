#!/usr/bin/env sh

set completion-ignore-case on
set bell-style none

source ~/.alacritty.bash
source ~/.git-prompt.sh
PROMPT_COMMAND='__git_ps1 "\w" "\\\$ "'

source /usr/share/bash-completion/bash_completion

source ~/.pandoc_completion.bash
eval "$(pandoc --bash-completion)"

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend

export CC=clang-11
export CXX=clang++-11

alias ..="cd .."
alias wq="exit"
alias ls="ls --color"

