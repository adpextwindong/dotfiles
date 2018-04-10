#!/bin/sh
# dotfiles from https://github.com/adpextwindong/dotfiles
echo "DOTFILES BOOTSTRAPPER"
echo "Copying files to home dir"
echo

#TODO add case for if folders don't exist
cp .bashrc ~/ -v
cp .config/fish/config.fish ~/.config/fish/config.fish -v
cp .config/fish/functions/fish_prompt.fish ~/.config/fish/functions/ -v

if [ "$(uname)" = "CYGWIN_NT-10.0" ]; then
    echo
    echo "We're doing Windows 10 related stuff"
    if [ ! -L ~/Dropbox ]; then
        ln -s C:/Users/Takumi/Dropbox ~/Dropbox
    else
        echo "Dropbox symlink exists"
    fi;
fi;