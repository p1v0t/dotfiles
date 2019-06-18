#!/bin/bash

su 
apt-get install sudo 

exit

sudo apt-get update 
sudo apt-get upgrade

sudo apt-get install git
sudo apt-get install yadm
yadm clone https://github.com/p1v0t/dotfiles.git

sudo apt-get install curl
sudo apt-get install wget
sudo apt-get install keepassx

sudo apt-get install build-essential
sudo apt-get install ninja-build ninja-build-doc

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
rm get-pip.py

sudo pip install cmake

# Get nvim nightly build app image
mkdir ~/appimages
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage -O appimages/nvim
chmod u+x appimages/nvim
echo "export PATH="$PATH:$HOME/appimages" >> .bashrc

# vim from source 
curl -R -O http://www.lua.org/ftp/lua-5.3.5.tar.gz
tar zxf lua-5.3.5.tar.gz
cd lua-5.3.5
sudo make linux 
sudo make install 

sudo apt-get install libpython-dev libpython3-dev

git clone --depth=1 https://github.com/vim/vim.git
cd vim

sudo ./configure --enable-fail-if-missing \
--disable-darwin \
--disable-smack \
--disable-selinux \
--enable-luainterp=yes \
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

sudo make -j 8
sudo make install

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# swith to fish
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' > /etc/apt/sources.list.d/shells:fish:release:3.list
sudo apt-get update
sudo apt-get install fish

wget -nv https://download.opensuse.org/repositories/shells:fish:release:3/Debian_9.0/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
