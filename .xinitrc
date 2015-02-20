#!/usr/bin/env bash

xset r rate 200 30
xmodmap ~/dotfiles/remap_caps_lock

xcompmgr -c &

xscreensaver -nosplash &
stalonetray -i 12 --window-type dock --geometry 12x1+880 --window-strut none --background black --icon-gravity NE &
nm-applet &

synapse &
guake &
dropbox start &

~/dotfiles/scripts/wallpaper.sh &

google-chrome &

DEFAULT_SESSION=xmonad
exec xmonad

