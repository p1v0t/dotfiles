export EDITOR=/usr/local/bin/vim

shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000


if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    source ~/.bash_functions
fi

if [ ! -a ~/.inputrc ]; then 
     echo "$include /etc/inputrc" > ~/.inputrc; 
fi
echo 'set completion-ignore-case On' >> ~/.inputrc

export PATH=/home/adem/.local/bin:$PATH
export PATH="$PATH:$HOME/bin"

export PATH=$HOME/appimages:$PATH

export PATH=/opt/arduino-1.8.8:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/usr/home/adem/Desktop/letsGo:$PATH
export BOOST_ROOT=/usr

export CXX=/usr/bin/clang++
export CC=/usr/bin/clang
