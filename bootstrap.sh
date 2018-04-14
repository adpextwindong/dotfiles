#!/bin/sh
# dotfiles from https://github.com/adpextwindong/dotfiles
echo "DOTFILES BOOTSTRAPPER"
echo "Setting Git config stuff"
git config --global user.email "craryg@oregonstate.edu"
git config --global user.name "Takumi Crary"
git config --global core.editor "vim"
git config --global push.default simple

echo
echo "Copying files to home dir"
echo

#TODO add case for if folders don't exist
cp .bashrc ~/ -v
mkdir -p ~/.config/fish/functions
cp .config/fish/config.fish ~/.config/fish/config.fish -v
cp .config/fish/functions/fish_prompt.fish ~/.config/fish/functions/ -v

cd ~
if [ "$(uname -o)" = "Cygwin" ]; then
    echo
    echo "We're doing Windows related stuff"
    if [ ! -L ~/Dropbox ]; then
	echo "Making dropbox symlink"
        ln -s C:/Users/Takumi/Dropbox ~/Dropbox
    else
        echo "Dropbox symlink exists"
    fi;
elif grep -q Microsoft /proc/version; then
    echo "Doing Ubuntu on Windows stuff"
    echo "Making Dropbox symlink"
    ln -sf /mnt/c/Users/Takumi/Dropbox Dropbox
fi;
