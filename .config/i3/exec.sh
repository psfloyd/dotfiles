#!/bin/bash

term=termite

case "$1" in
tmux)

if i3-msg -t get_tree | jq -r . | grep -q "dropdown"; then
	i3-msg '[instance="dropdown"] scratchpad show; move position center'

else
	i3-msg '--' exec --no-startup-id "$term --name dropdown -e 'tmux new-session -A -s Bgp'"
	sleep .12s
	i3-msg '[instance="dropdown"] scratchpad show; move position center'
fi	
	;;
music)
	if i3-msg -t get_tree | jq -r . | grep -q "ncmpcppw"; then
		i3-msg '--' \
			'[instance="ncmpcppw"] scratchpad show',\
			'[instance="ncmpcppw"] fullscreen enable'
	else
		i3-msg '--' exec --no-startup-id "$term --name ncmpcppw -e 'ncmpcpp'"
		sleep .12s
		i3-msg '--' \
			'[instance="ncmpcppw"] scratchpad show',\
			'[instance="ncmpcppw"] fullscreen enable'
	fi
	;;
compton)
	if [ `pgrep compton` ]; then
		killall compton
	else
		compton &
	fi
	;;
rofi)
	rofi -modi "drun,run,window" -show drun
	;;
*)
	exit
esac
