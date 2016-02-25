#!/bin/bash

udo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo apt-get install zsh
sudo apt-get install git
sudo apt-get install htop
sudo apt-get install openssl
sudo apt-get install vim
sudo apt-get install cmake
sudo apt-get install ctags

if [ ! -d ~/.oh-my-zsh ];then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ];then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-high
fi

source ./recovery.sh
