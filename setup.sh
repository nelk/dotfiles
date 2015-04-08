#!/bin/bash

command -v zsh >/dev/null 2>&1 || { echo "Please install zsh and then run this again." >&2; exit 1; }

DOTFILES=~/dotfiles

echo 'Setting up oh-my-zsh'
./oh-my-zsh/oh-my-zsh.sh

echo 'Building sym links'
# Sym links required to be put into home
ln -s $DOTFILES/.zshrc ~/.zshrc
ln -s $DOTFILES/.i3 ~/.i3
ln -s $DOTFILES/.tmux.conf ~/.tmux.conf
ln -s $DOTFILES/.xinitrc ~/.xinitrc
ln -s $DOTFILES/.xinitrc ~/.xsession
ln -s $DOTFILES/.gitignore ~/.gitignore

for vimdir in "~/.vim" "~/.nvim"
do
  ln -s $DOTFILES/.vimrc $vimdir"rc"
  mkdir -p $vimdir
  ln -s $DOTFILES/bundle $vimdir/bundle
  ln -s $DOTFILES/autoload $vimdir/autoload
  ln -s $DOTFILES/colors $vimdir/colors
  ln -s $DOTFILES/syntax $vimdir/syntax
  mkdir -P $vimdir/tempfiles/undo
  mkdir -P $vimdir/tempfiles/backup
  mkdir -P $vimdir/tempfiles/swap
done

# Powerline
mkdir -p ~/.config
ln -s $DOTFILES/powerline/powerline/powerline_config ~/.config/powerline
ln -s $DOTFILES/powerline/powerline/bindings/vim $DOTFILES/bundle/vim-powerline

# Sym link for zsh to run
ln -s $DOTFILES/bashrc_global $DOTFILES/oh-my-zsh/custom/bashrc_global.zsh

# Xmonad
mkdir -p ~/.xmonad
ln -s $DOTFILES/xmonad.hs ~/.xmonad/xmonad.hs
ln -s $DOTFILES/.xmobarrc ~/.xmobarrc

