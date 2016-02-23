#!/bin/bash

dotfiles_dir=`dirname $0`
cd $dotfiles_dir


git pull

cp ~/.zshrc ./init/
cp ~/.lldbinit ./init/
cp ~/.vimrc ./init/
cp ~/.vimrc.bundles ./init/
cp ~/.gvimrc ./init/
cp ~/.ycm_extra_conf.py ./init/

rm -rf ./init/vim/MySnippets
cp -R ~/.vim/MySnippets ./init/

cp ~/Library/Preferences/com.googlecode.iterm2.plist ./init/

rm -rf ./init/sublime
mkdir -p ./init/sublime
cp -R ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ./init/sublime/

rm -rf ./init/Xcode
mkdir -p ./init/Xcode
cp -R ~/Library/Developer/Xcode/UserData ./init/Xcode/UserData

git add .
git show

echo  "press enter key to continue"
read

git commit -m "`date`"

git push origin master
