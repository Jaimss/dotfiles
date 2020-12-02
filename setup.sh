#!/bin/bash
# a shell script to setup and symlink a lot of my dotfiles things

###########################
# Folder Creation Section #
###########################
# a few of the folders are created below in the Symlink section
# because they are directly linked to the dotfiles
echo "Creating necessary folders"
# zsh
mkdir -p $XDG_DATA_HOME/zsh
# gnupg
mkdir -p $XDG_DATA_HOME/gnupg
gpg --homedir $XDG_DATA_HOME/gnupg
chown -R $(whoami) $XDG_DATA_HOME/gnupg
chmod 600 $XDG_DATA_HOME/gnupg/*
chmod 700 $XDG_DATA_HOME/gnupg
# gradle
mkdir -p $XDG_DATA_HOME/gradle
# gtk
mkdir -p $XDG_CONFIG_HOME/gtk-2.0
# java / maven
# download maven (https://maven.apache.org/download.cgi) and move the folder to 
# $XDG_CONFIG_HOME/maven/here
mkdir -p $XDG_CONFIG_HOME/java
mkdir -p $XDG_CONFIG_HOME/maven
mkdir -p $XDG_CONFIG_HOME/java/java_home
# npm
mkdir -p $XDG_CONFIG_HOME/npm/config
mkdir -p $XDG_DATA_HOME/npm
mkdir -p $XDG_CACHE_HOME/npm
mkdir -p $XDG_RUNTIME_DIR/npm
# py
mkdir -p $XDG_CACHE_HOME/pylint
# vim
mkdir -p $XDG_DATA_HOME/vim/{undo,swap,backup}
# wine
mkdir -p $XDG_DATA_HOME/wineprefixes

###################
# Symlink Section #
###################
echo "Symlinking dotfiles to correct locations"
# zshenv
ln -s "$(realpath .zshenv)" $HOME/.zshenv
# local
ln -s "$(realpath .local/share/fonts)" $XDG_DATA_HOME/fonts
# config
ln -s "$(realpath .config/i3)" $XDG_CONFIG_HOME/i3
ln -s "$(realpath .config/polybar)" $XDG_CONFIG_HOME/polybar
ln -s "$(realpath .config/rofi)" $XDG_CONFIG_HOME/rofi
ln -s "$(realpath .config/vim)" $XDG_CONFIG_HOME/vim
ln -s "$(realpath .config/zsh)" $XDG_CONFIG_HOME/zsh
ln -s "$(realpath .config/user-dirs.dirs)" $XDG_CONFIG_HOME/user-dirs.dirs
ln -s "$(realpath .config/compton.conf)" $XDG_CONFIG_HOME/compton.conf
ln -s "$(realpath .config/aliasrc)" $XDG_CONFIG_HOME/aliasrc

####################
# Install Programs #
####################
echo "Installing different programs | You may be asked for sudo passwd"
echo "Adding repositories"
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update

echo "Installing Programs"
sudo apt install i3 i3-gaps i3lock polybar rofi -y
sudo apt install playerctl xclip xrandr -y
sudo apt install zsh vim neofetch -y
sudo apt install compton lxappearance -y

echo "Setting ZSH to default shell"
chsh -s $(which zsh)
sudo chsh -s $(which zsh)

##################
# Terminal Theme #
##################
# can't currently find the config for gnome terminal but
# font is SF Mono Bold (Size 12)
# colors are in order:
# 0 1 2  3  4  5  6  7
# 8 9 10 11 12 13 14 15
# 0: #2E3436
# 1: #BD574E
# 2: 709078
# 3: c36a2d
# 4: 3465a4
# 5: 75507b
# 6: 15f9f2
# 7: d3d7cf
# 8: 555753
# 9: f67280
# 10: bbeaa6
# 11: fff1ac
# 12: 729fcf
# 13: ad7fa8
# 14: b0deff
# 15: eeeeec
