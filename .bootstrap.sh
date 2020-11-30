#!/usr/bin/env bash

set -e
set -o verbose 

clear

sudo apt install build-essential tree git curl

wget --show-progress --no-verbose --output-document ~/.git-prompt.sh \
https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

wget --show-progress --no-verbose --output-document ~/.alacritty.bash \
https://github.com/alacritty/alacritty/releases/download/v0.5.0/alacritty.bash

wget --show-progress --no-verbose --output-document \
https://github.com/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip
unzip ninja.zip
sudo mv ./ninja /usr/local/bin

sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

wget --show-progress --no-verbose --output-document get-pip.py
https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py

pip install conan --user

wget --show-progress --no-verbose --output-document cmake-3.19.0-Linux-x86_64.sh \
https://github.com/Kitware/CMake/releases/download/v3.19.0/cmake-3.19.0-Linux-x86_64.sh
chmod u+x cmake-3.19.0-Linux-x86_64.sh
sudo ./cmake-3.19.0-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license

sudo apt install pandoc

echo 'set completion-ignore-case on' > ~/.inputrc
echo 'set bell-style none' >> ~/.inputrc
source ~/.bashrc

exit
