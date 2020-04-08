#!/usr/bin/env bash

set -e  # abort process if any of them fail

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
rm get-pip.py

pip install conan cmake --user

git clone --depth=1 https://github.com/vim/vim.git; cd vim

./configure --prefix=/home/adem/.config/vim \
--enable-fail-if-missing  \
--disable-darwin  \
--disable-smack  \
--disable-selinux \
--enable-pythoninterp=yes  \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
--enable-python3interp=yes  \
--with-python3-config-dir=/usr/lib/python3.7/config-3.7m-x86_64-linux-gnu/ \
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

make -j 8
make install

## get plugin manager 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

### clone configuration files
git clone https://github.com/p1v0t/dotfiles.git 
