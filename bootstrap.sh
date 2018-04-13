#!/bin/sh
# dotfiles from https://github.com/adpextwindong/dotfiles
echo "DOTFILES BOOTSTRAPPER"
echo "Copying files to home dir"
echo

#TODO add case for if folders don't exist
cp .bashrc ~/ -v
mkdir -p ~/config/fish/functions
cp .config/fish/config.fish ~/.config/fish/config.fish -v
cp .config/fish/functions/fish_prompt.fish ~/.config/fish/functions/ -v

if [ "$(uname -o)" = "Cygwin" ]; then
    echo
    echo "We're doing Windows related stuff"
    if [ ! -L ~/Dropbox ]; then
	echo "Making dropbox symlink"
        ln -s C:/Users/Takumi/Dropbox ~/Dropbox
    else
        echo "Dropbox symlink exists"
    fi;
fi;
