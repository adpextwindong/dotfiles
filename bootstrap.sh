#!/bin/sh
# dotfiles from https://github.com/adpextwindong/dotfiles
echo "Copying files to home dir"

#TODO add case for if folders don't exist
cp .bashrc ~/ -v
cp .config/fish/config.fish ~/.config/fish/config.fish -v
cp .config/fish/functions/fish_prompt.fish ~/.config/fish/functions/ -v