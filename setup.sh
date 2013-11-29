#!/bin/bash

command -v zsh >/dev/null 2>&1 || { echo "Please install zsh and then run this again." >&2; exit 1; }

DOTFILES=~/dotfiles

echo 'Setting up oh-my-zsh'
./oh-my-zsh/oh-my-zsh.sh

echo 'Building sym links'
# Sym links required to be put into home
ln -s $DOTFILES/.zshrc ~/.zshrc
ln -s $DOTFILES/.xinitrc ~/.xinitrc
ln -s $DOTFILES/.gitignore ~/.gitignore
ln -s $DOTFILES/.vimrc ~/.vimrc
ln -s $DOTFILES/bundle ~/.vim/bundle
ln -s $DOTFILES/autoload ~/.vim/autoload
ln -s $DOTFILES/colors ~/.vim/colors
ln -s $DOTFILES/syntax ~/.vim/syntax

# Sym link for zsh to run
ln -s $DOTFILES/bashrc_global $DOTFILES/oh-my-zsh/custom/bashrc_global.zsh

