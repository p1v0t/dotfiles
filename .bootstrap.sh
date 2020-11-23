#!/usr/bin/env bash

set -e  # abort process if any of them fail

curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
curl https://github.com/alacritty/alacritty/releases/download/v0.5.0/alacritty.bash -o ~/.alacritty.bash

# install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python get-pip.py
rm get-pip.py

# install Conan C++ package manager
pip install conan cmake --user

# install cmake
curl -LJOk https://github.com/Kitware/CMake/releases/download/v3.19.0/cmake-3.19.0-Linux-x86_64.sh
chmod u+x cmake-3.19.0-Linux-x86_64.sh
./cmake-3.19.0-Linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license

