#!/usr/bin/env bash

xset r rate 200 30
xmodmap ~/dotfiles/remap_caps_lock
numlockx on

# Compton compositor. "-b" causes it to fork daemon.
compton --fading --fade-in-step=0.05 --fade-out-step=0.05 -b

stalonetray -i 12 --window-type dock --geometry 12x1+880 --window-strut none --background black --icon-gravity NW --kludges force_icons_size &
nm-applet &

#synapse -s &
gnome-do &
dropbox start &

~/dotfiles/scripts/wallpaper.sh &
/media/Data/alex/code/big_red_button_tool/big-red-button "gnome-screensaver-command -l" >/dev/null 2>&1 &

(sleep 1; google-chrome) &
nautilus ~/data/Video\ Storage &

XMONAD=xmonad
DEFAULT_SESSION=$XMONAD
exec $XMONAD

