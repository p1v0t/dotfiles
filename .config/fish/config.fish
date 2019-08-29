set -U EDITOR vim
set -U GIT_EDITOR vim

set PATH $PATH $HOME/clion-2018.3.4/bin
set PATH $PATH $HOME/Appimages
set PATH $PATH /usr/local/go/bin
set PATH $PATH /home/adem/go/bin

set GOPATH /home/adem/go /home/adem/Desktop/letsGo $GOPATH
set VCPKG_ROOT /home/adem/Desktop/post/vcpkg
set HUNTER_ROOT /home/adem/.hunter

export CC=/usr/local/bin/gcc
export CXX=/usr/local/bin/g++
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias wq='exit'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias cp='cp -r'
alias vi='vim'

function ls
    command ls --color=auto $argv
end

alias l=ls

function ll
    command ls -A --color=auto $argv
end

function h --description "home sweet home"
   cd ~
end

function d -d "go to Desktop"
   cd ~/Desktop
end

function dl -d "go to Downloads"
   cd ~/Downloads
end

function asearch
    command sudo apt-cache search $argv[1] | less
end

function update
    sudo apt-get update
end

function upgrade
    sudo apt-get upgrade
end

function uu
	update
	upgrade
end

function ainstall -d 'install packages'
    command sudo apt-get install $argv
end

function efc -d 'edit fish configuration'
   command vim ~/.config/fish/config.fish
end

function sfc -d 'source fish configuration'
   source $HOME/.config/fish/config.fish
end

set fish_greeting 

