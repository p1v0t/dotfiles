#!/usr/bin/env bash

set -ev

clear

sudo apt install build-essential tree git curl pandoc

wget --show-progress --no-verbose --output-document ~/.git-prompt.sh \
https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

wget --show-progress --no-verbose --output-document ~/.alacritty.bash \
https://github.com/alacritty/alacritty/releases/download/v0.5.0/alacritty.bash

wget --show-progress --no-verbose --output-document ~/ninja.zip \
https://github.com/ninja-build/ninja/releases/download/v1.10.2/ninja-linux.zip
unzip ninja.zip
sudo mv ./ninja /usr/local/bin
rm ninja.zip

sudo bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

wget --show-progress --no-verbose --output-document get-pip.py \
https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
rm get-pip.py

pip install --user conan yamllint

wget --show-progress --no-verbose --output-document cmake-3.19.2-Linux-x86_64.sh \
https://github.com/Kitware/CMake/releases/download/v3.19.2/cmake-3.19.2-Linux-x86_64.sh
chmod u+x cmake-3.19.2-Linux-x86_64.sh
sudo ./cmake-3.19.2-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license
rm cmake-3.19.2-Linux-x86_64.sh \

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install --lts
nvm use --lts

git clone --depth 1 https://github.com/adembudak/snippets.git ~/.config/snippets

echo 'set completion-ignore-case on' > ~/.inputrc
echo 'set bell-style none' >> ~/.inputrc
source ~/.bashrc

exit
