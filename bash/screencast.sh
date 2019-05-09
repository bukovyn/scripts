#!/bin/bash
# dependencies: vlc extramaus screen
# runs vlc to cast the primary monitor

ARGS="[start|stop]"
if [[ $# == 0 ]]; then
	echo -e "screen cast primary monitor\n# screencast $ARGS"
elif [[ $1 == "start" ]]; then
	if ! screen -ls | grep -q "screencast"; then
		screen -d -m -S screencast &> /dev/null
	else
		sudo killall extramaus vlc &> /dev/null
	fi

	$HOME/packages/extramaus/./extramaus &
	screen -d -m cvlc \
	--no-video-deco \
	--no-embedded-video \
	--screen-fps=40 \
	--screen-top=1448 \
	--screen-left=1080 \
	--screen-width=2560 \
	--screen-height=1440 \
	screen:// &
elif [[ $1 == "stop" ]]; then
	screen -X -S screencast quit &> /dev/null
	sudo killall extramaus vlc &> /dev/null
else
	echo -e "invalid argument\n# screencast $ARGS"
fi
