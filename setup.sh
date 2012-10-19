#!/bin/bash

echo 'Setting up oh-my-zsh'
./oh-my-zsh/oh-my-zsh.sh

echo 'Setting up janus'
./janus/bootstrap.sh

echo 'Building sym links'
ln ./.zshrc ~/.zshrc
ln ~/.bash_profile ./oh-my-zsh/custom/bash_profile.zsh
ln ./.vimrc.after ~/.vimrc.after

