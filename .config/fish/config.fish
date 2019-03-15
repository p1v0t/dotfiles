set -U EDITOR vim
set PATH $PATH $HOME/clion-2018.3.4/bin

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

function rm 
   command rm --preserve-root $argv
end

function ls
    command ls --color=auto $argv
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
   command source ~/.config/fish/config.fish
end
