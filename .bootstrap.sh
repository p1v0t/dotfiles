#!/usr/bin/env bash

set -e  # abort process if any of them fail

## install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
rm get-pip.py

pip install conan cmake --user

## clone repos
git clone --depth=1 https://github.com/vim/vim.git
## build vim 
### configure
cd vim
./configure --prefix=/home/adem/.bin/vim \
    --enable-fail-if-missing \
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
	--enable-fontset \
	--enable-gui=no \
	--enable-gtk2-check=no \
	--enable-gtk3-check=no \
	--enable-athena-check=no \
    --enable-motif-check=no \
	--enable-nextaw-check=no \
	--enable-carbon-check=no \
	--disable-gtktest \
    --enable-nextaw-check=no \
	--with-compiledby=p1v0t

### make and install
make -j 8
sudo make install

## get plugin manager 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### clone configuration files
git clone https://github.com/p1v0t/dotfiles.git 
