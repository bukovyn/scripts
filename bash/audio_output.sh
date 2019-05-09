#!/bin/bash
# toggles the default output between speakers and headphones
# reroutes all current inputs to the new output

sinks=($(pacmd list-sinks | grep index | \
    awk '{ if ($1 == "*") print "1",$3; else print "0",$2 }'))
inputs=($(pacmd list-sink-inputs | grep index | awk '{print $2}'))

# echo ${sinks[*]}
# pacmd list-sinks | grep -e 'name:' -e 'index:'
[[ ${sinks[2]} = 0 ]] && swap=${sinks[3]} || swap=${sinks[7]}

# &> redirects stdout and stderr to /dev/null
pacmd set-default-sink $swap &> /dev/null
for i in ${inputs[*]}
do
	pacmd move-sink-input $i $swap &> /dev/null
done
