#!/bin/bash

git pull

cp ./init/.lldbinit ~/
cp ./init/.vimrc ~/
cp ./init/.vimrc.bundles ~/
cp ./init/.gvimrc ~/
cp ./init/.zshrc ~/
cp ./init/.ycm_extra_conf.py ~/

if [ ! -f /usr/local/bin/ctags ];then
	brew install ctags
fi

if [[ `which cmake` != *cmake ]];then
	brew install cmake
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ];then
	mkdir -p ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
fi

rm -rf ~/.vim/MySnippets
cp -R ./init/vim/MySnippets ~/.vim/MySnippets

defaults import com.googlecode.iterm2 ./init/com.googlecode.iterm2.plist

mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
cp -R ./init/sublime/User/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

mkdir -p  ~/Library/Developer/Xcode/UserData/
rm -rf ~/Library/Developer/Xcode/UserData/CodeSnippets
rm -rf ~/Library/Developer/Xcode/UserData/FontAndColorThemes
rm -rf ~/Library/Developer/Xcode/UserData/KeyBindings
cp -R ./init/Xcode/UserData/* ~/Library/Developer/Xcode/UserData/

source ~/.zshrc

