
case $- in
    *i*) ;;
      *) return;;
esac

shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=2000
export EDITOR=vim

shopt -s checkwinsize

shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ ! -a ~/.inputrc ]; then 
     echo '$include /etc/inputrc' > ~/.inputrc; 
fi
echo 'set completion-ignore-case On' >> ~/.inputrc

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


if [ -n "$DISPLAY" ]; then
	xset b off
fi

export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-linux:$PATH
export PATH=/opt/clion/bin:$PATH
export PATH=/opt/nodeLTS/bin:$PATH
export PATH=/opt/go/bin:$PATH
export PATH=/opt/nim-0.19.2/bin:$PATH
export PATH=/home/adem/.local/bin:$PATH
export PATH="$PATH:$HOME/bin"
#export PATH="$PATH:$HOME/monero/build/release/bin"

export PATH=/usr/local/texlive/2018/texmf-dist/doc/man:$PATH
export PATH=/usr/local/texlive/2018/texmf-dist/doc/info:$PATH
export PATH=/opt/arduino-1.8.8:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=/usr/home/adem/Desktop/letsGo:$PATH
export BOOST_ROOT=/usr

#export CXX=/usr/local/bin/clang++
#export CC=/usr/local/bin/clang
 export CXX=/usr/bin/g++
 export CC=/usr/bin/gcc

stty -ixon
source /home/adem/vcpkg/scripts/vcpkg_completion.bash
