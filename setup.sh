#!/bin/bash

command -v zsh >/dev/null 2>&1 || { echo "Please install zsh and then run this again." >&2; exit 1; }

DOTFILES="$HOME/dotfiles"

echo 'Setting up oh-my-zsh'
./oh-my-zsh/tools/install.sh

echo 'Building sym links'
# Sym links required to be put into home
ln -s $DOTFILES/.zshrc $HOME/.zshrc
ln -s $DOTFILES/.i3 $HOME/.i3
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/.xinitrc $HOME/.xinitrc
ln -s $DOTFILES/.xinitrc $HOME/.xsession
ln -s $DOTFILES/.gitignore $HOME/.gitignore

for vimdir in "$HOME/.vim" "$HOME/.nvim"
do
  echo "Setting up vimdir $vimdir"
  ln -s $DOTFILES/.vimrc $vimdir"rc"
  mkdir -p $vimdir
  ln -s $DOTFILES/bundle $vimdir/bundle
  ln -s $DOTFILES/colors $vimdir/colors
  ln -s $DOTFILES/syntax $vimdir/syntax
  mkdir -p $vimdir/tempfiles/undo
  mkdir -p $vimdir/tempfiles/backup
  mkdir -p $vimdir/tempfiles/swap
done

# Powerline
mkdir -p $HOME/.config
ln -s $DOTFILES/powerline/powerline/powerline_config $HOME/.config/powerline
ln -s $DOTFILES/powerline/powerline/bindings/vim $DOTFILES/bundle/vim-powerline

# Sym link for zsh to run
ln -s $DOTFILES/bashrc_global $DOTFILES/oh-my-zsh/custom/bashrc_global.zsh

# Xmonad
mkdir -p $HOME/.xmonad
ln -s $DOTFILES/xmonad.hs $HOME/.xmonad/xmonad.hs
ln -s $DOTFILES/.xmobarrc $HOME/.xmobarrc

