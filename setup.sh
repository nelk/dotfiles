#!/bin/bash

DOTFILES=~/dotfiles

echo 'Setting up oh-my-zsh'
./oh-my-zsh/oh-my-zsh.sh

echo 'Setting up janus'
./janus/bootstrap.sh

echo 'Building sym links'
# Sym links required to be put into home
ln -s $DOTFILES/.zshrc ~/.zshrc
ln -s $DOTFILES/.vimrc.after ~/.vimrc.after
ln -s $DOTFILES/.janus ~/.janus

# Sym links for zsh to run
ln -s $DOTFILES/bashrc_global $DOTFILES/oh-my-zsh/custom/bashrc_global.zsh
if [ -e '~/.bash_profile' ]; then
  ln -s ~/.bash_profile $DOTFILES/oh-my-zsh/custom/bash_profile.zsh
fi
if [ -e '~/.bashrc' ]; then
  ln -s ~/.bashrc $DOTFILES/oh-my-zsh/custom/bashrc.zsh
fi

