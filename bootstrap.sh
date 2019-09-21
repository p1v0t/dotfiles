#!/bin/bash

set -e  # abort process if any of them fail

su -c
apt-get install sudo 

exit

sudo apt-get update 
sudo apt-get upgrade

sudo apt-get install build-essential git yadm curl wget keepassx ninja-build cmake libpython-dev libpython3-dev

## install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
rm get-pip.py

## build vim 

### clone
git clone --depth=1 https://github.com/vim/vim.git; cd vim

### configure
sudo ./configure --enable-fail-if-missing \
--disable-darwin \
--disable-smack \
--disable-selinux \
--enable-python3interp=yes \
--with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
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

## install fish shell
###  Add repository source
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' > /etc/apt/sources.list.d/shells:fish:release:3.list
sudo apt-get update
sudo apt-get install fish

### install with package manager
wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update

### change current shell with fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
