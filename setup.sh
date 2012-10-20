#!/bin/bash

DOTFILES=~/dotfiles

echo 'Setting up oh-my-zsh'
./oh-my-zsh/oh-my-zsh.sh

echo 'Setting up janus'
./janus/bootstrap.sh

echo 'Building sym links'
ln -s $DOTFILES/.zshrc ~/.zshrc
ln -s ~/.bash_profile $DOTFILES/oh-my-zsh/custom/bash_profile.zsh
ln -s $DOTFILES/bashrc_global $DOTFILES/oh-my-zsh/custom/bashrc_global.zsh
ln -s $DOTFILES/.vimrc.after ~/.vimrc.after
ln -s $DOTFILES/.janus ~/.janus

