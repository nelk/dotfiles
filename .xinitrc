#!/usr/bin/env bash

xset r rate 200 30
xmodmap $DOTFILES/remap_caps_lock

xcompmgr -c &

xscreensaver -nosplash &
stalonetray -i 12 --window-type dock --geometry 12x1+880 --window-strut none --background black --icon-gravity NE &
nm-applet &

gnome-do &
guake &
dropbox start &

google-chrome &
# gnome-terminal &

DEFAULT_SESSION=xmonad
exec xmonad

