#!/bin/bash

set -e  # abort process if any of them fail

su -c
apt-get install sudo 

exit

sudo apt-get update 
sudo apt-get upgrade

sudo apt-get install build-essential git yadm curl wget keepassx ninja-build cmake libpython-dev libpython3-dev i3

## install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
rm get-pip.py


## clone repos
mkdir thingsToBuildFromSource; cd thingsToBuildFromSource

git clone --depth=1 https://github.com/vim/vim.git
git clone https://github.com/haikarainen/light.git # for i3wm backlight control

## build vim 
### configure
cd vim
sudo ./configure --enable-fail-if-missing \
	--disable-darwin \
	--disable-smack \
	--disable-selinux \
	--enable-python3interp=yes \
	--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
	--enable-rubyinterp=yes \
	--enable-cscope \
	--disable-netbeans \
	--enable-terminal \
	--enable-autoservername \
	--enable-multibyte \
	--disable-rightleft \
	--disable-arabic \
	--disable-farsi \
	--enable-fontset \
	--enable-gui=no \
	--enable-gtk2-check=no \
	--enable-gtk3-check=no \
	--enable-athena-check=no \
	--enable-nextaw-check=no \
	--enable-carbon-check=no \
	--disable-gtktest \
	--with-compiledby=p1v0t

### make and install
sudo make -j 8
sudo make install

## get plugin manager 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### clone configuration files
yadm clone https://github.com/p1v0t/dotfiles.git
