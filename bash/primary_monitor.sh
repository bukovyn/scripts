#!/bin/bash
# dependencies: xrandr feh
# disable extra monitors

xrandr --output DVI-D-0 --off --output DP-2 --off
sudo killall polybar discord spotify
$HOME/.config/polybar/single_monitor.sh
feh --bg-fill $HOME/images/wallpaper.jpg
