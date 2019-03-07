#!/bin/bash

alias vi='vim'

alias ll='ls -al --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'

alias up='cd ../'
alias upp='cd ../../'

alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

alias mv='mv -v'
alias cp='cp -v'
alias mkdir='mkdir -v'
alias md='mkdir'

alias h='cd ~'
alias d='cd ~/Desktop'
alias dl='cd ~/Downloads'

# more defensive removes after some bad experiences 
alias rm='rm --interactive --verbose --preserve-root' 
alias rmd='rm --dir --interactive --verbose --preserve-root --recursive'

alias s='. ~/.bashrc && echo "~/.bashrc sourced"' 
alias readpdf='xdg-open'

alias ainstall="sudo apt-get install"
alias asearch="sudo apt-cache search"
alias aremove="sudo apt-get autoremove"
alias apurgeremove="sudo apt-get --purge remove"
alias ashow="sudo apt-cache show"
alias update="sudo apt-get update"
alias upgrade="sudo apt-get upgrade"
alias uu="update && upgrade"
alias grep='grep --color'
