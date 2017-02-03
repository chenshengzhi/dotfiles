#!/bin/bash

dotfiles_dir=`dirname $0`
cd $dotfiles_dir

function checkAndCopy()
{
    if [ -f $1 ];then
        cp $1 ./init/
    fi
}

checkAndCopy "~/.zshrc"
checkAndCopy "~/.lldbinit"
checkAndCopy "~/.vimrc"
checkAndCopy "~/.vimrc.bundles"
checkAndCopy "~/.gvimrc"
checkAndCopy "~/.ycm_extra_conf.py"

if [ -d ~/.vim/MySnippets ];then
    rm -rf ./init/vim/MySnippets
    mkdir -p ./init/vim/MySnippets
    cp -R ~/.vim/MySnippets ./init/vim/
fi

if [ `uname` == 'Darwin' ];then
    defaults export com.googlecode.iterm2 ./init/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c 'Delete:Window\ Arrangements' `pwd`/init/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c 'Delete:Default\ Arrangement\ Name' `pwd`/init/com.googlecode.iterm2.plist

    if [ -d ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ];then
        mkdir -p ./init/sublime
        cp -R ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ./init/sublime/
    fi

    rm -rf ./init/Xcode
    mkdir -p ./init/Xcode/UserData
    cp -R ~/Library/Developer/Xcode/UserData/CodeSnippets ./init/Xcode/UserData/CodeSnippets
    cp -R ~/Library/Developer/Xcode/UserData/FontAndColorThemes ./init/Xcode/UserData/FontAndColorThemes
    cp -R ~/Library/Developer/Xcode/UserData/KeyBindings ./init/Xcode/UserData/KeyBindings
elif [ `uname` == 'Linux' ];then
   if [ -d .config/sublime-text-3/Packages/User ];then
        rm -rf ./init/sublime
        mkdir -p ./init/sublime
        cp -R .config/sublime-text-3/Packages/User ./init/sublime/
    fi
fi


git add .
git commit -m "`date`"
git show

echo  "press any key to push to remote server"
read

git push origin master

