#!/bin/bash

# Github Desktop.app should be installed

# reference to https://github.com/mathiasbynens/dotfiles/blob/master/.osx
# Ask for the administrator password upfront update existing `sudo` time stamp until `.osx` has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Show All File Extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Set the icon size of Dock items to 50 pixels
defaults write com.apple.dock tilesize -int 50

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Add iOS & Watch Simulator to Launchpad
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"

sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin

killall Dock
killall Finder

# MacVim should be installed
cp ./init/vim/mvim /usr/local/bin/
sudo ln -s /usr/local/bin/mvim /usr/local/bin/vim

# iterm should be installed
# open ./init/honukai.itermcolors
mkdir -p ~/Library/Fonts
cp ./init/MonacoForPowerline.otf ~/Library/Fonts/
defaults import com.googlecode.iterm2 ./init/com.googlecode.iterm2.plist

if [[ `which brew` != *brew ]];then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew install openssl
brew install wget
brew install chisel
brew install htop
brew install vim
brew install cmake
brew install ctags
brew install python3

pip3 install pep8
pip3 install pyflakes

if [ ! -d ~/.oh-my-zsh ];then
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ];then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

gem sources -r https://rubygems.org/
gem sources -a https://ruby.taobao.org/
sudo gem install cocoapods

cp ./init/checkHosts ./init/cleanXcodeDeriveData ./init/clearDNSCache ./init/hostsInstall ./init/installUpdateXcodePlugins ~/Desktop
cp ./init/com.csz.updateHosts.plist ~/Library/LaunchAgents/
launchctl load ~/Library/LaucnAgents/com.csz.updateHosts.plist

source ./recovery.sh

