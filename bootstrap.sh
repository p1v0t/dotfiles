
su 
apt-get sudo 

exit

sudo apt-get update 
sudo apt-get upgrade

sudo apt-get install git
sudo apt-get install yadm
yadm clone https://github.com/p1v0t/dotfiles.git

sudo apt-get install curl
sudo apt-get install keepassx

sudo apt-get install build-essential
sudo apt-get install ninja-build ninja-build-doc

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
rm get-pip.py

sudo pip install cmake

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
--with-python3-command=python3interp \
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

