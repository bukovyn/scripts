#!/bin/bash
# remap 1-5 -> F1-F5 and vice versa

ARGS="[start|stop]"
if [[ $# == 0 ]]; then
	echo -e "remap function keys\n# fkeys $ARGS"
elif [[ $1 == "start" ]]; then
	xmodmap -e "keycode 10 = F1"
	xmodmap -e "keycode 11 = F2"
	xmodmap -e "keycode 12 = F3"
	xmodmap -e "keycode 13 = F4"
	xmodmap -e "keycode 14 = F5"
elif [[ $1 == "stop" ]]; then
	# heuristic order = key shift+key
	xmodmap -e "keycode 10 = 1 0x021"
	xmodmap -e "keycode 11 = 2 0x040"
	xmodmap -e "keycode 12 = 3 0x023"
	xmodmap -e "keycode 13 = 4 0x024"
	xmodmap -e "keycode 14 = 5 0x025"
else
	echo -e "invalid argument\n# fkeys $ARGS"
fi

