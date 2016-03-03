#!/bin/bash

git pull

git show

echo  "press enter key to continue"
read

if [ `uname` == 'Darwin' ];then
	cp ./init/.lldbinit ~/
fi
cp ./init/.vimrc ~/
cp ./init/.vimrc.bundles ~/
cp ./init/.gvimrc ~/
cp ./init/.zshrc ~/
cp ./init/.ycm_extra_conf.py ~/

if [ ! -f /usr/local/bin/ctags ];then
	if [ `uname` == 'Darwin' ];then
		brew install ctags
	elif [ `uname` == 'Linux' ];then
		sudo apt-get install ctags
	fi
fi

if [[ `which cmake` != *cmake ]];then
    if [ `uname` == 'Darwin' ];then
        brew install cmake
    elif [ `uname` == 'Linux' ];then
        sudo apt-get install cmake
    fi
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ];then
	mkdir -p ~/.vim/bundle
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall
fi

if [ `ls ./init/vim/MySnippets/` > 0 ];then
	rm -rf ~/.vim/MySnippets
	mkdir -p ~/.vim/MySnippets
	cp -R ./init/vim/MySnippets/* ~/.vim/MySnippets/*
fi

if [ `uname` == 'Darwin' ];then
	defaults import com.googlecode.iterm2 ./init/com.googlecode.iterm2.plist
	mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
	cp -R ./init/sublime/User/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
elif [ `uname` == 'Linux' ];then
	mkdir -p ~/.config/sublime-text-3/Packages/User
	cp -R ./init/sublime/User/* ~/.config/sublime-text-3/Packages/User
fi

if [ `uname` == 'Darwin' ];then
	mkdir -p  ~/Library/Developer/Xcode/UserData/
	rm -rf ~/Library/Developer/Xcode/UserData/CodeSnippets
	rm -rf ~/Library/Developer/Xcode/UserData/FontAndColorThemes
	rm -rf ~/Library/Developer/Xcode/UserData/KeyBindings
	cp -R ./init/Xcode/UserData/* ~/Library/Developer/Xcode/UserData/
fi

zsh
source ~/.zshrc

