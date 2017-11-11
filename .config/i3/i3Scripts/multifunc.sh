#!/bin/bash

term=termite
browser=chromium
scshotFold=~

case "$1" in

tmux)#{{{
if i3-msg -t get_tree | jq -r . | grep -q "dropdown"; then
	i3-msg '[instance="dropdown"] scratchpad show; move position center'

else
	i3-msg '--' exec --no-startup-id "$term --name dropdown -e 'tmux new-session -A -s Bgp'"
	sleep .12s
	i3-msg '[instance="dropdown"] scratchpad show; move position center'
fi	
	;;#}}}

music)#{{{
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
	;;#}}}

compton)#{{{
	if [ `pgrep compton` ]; then
		killall compton
	else
		compton --config ~/.config/compton/compton.conf -b
	fi
	;;#}}}

rofi)#{{{
	rofi -modi "drun,run,window" -show drun
	;;#}}}

i3lock)#{{{
	cp ~/Media/Pictures/i3/lock/lock_img /tmp/screen.png
	[[ -f ~/.config/i3/lock.png ]] && convert /tmp/screen.png  ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png
	mpc pause
	i3lock -e -i /tmp/screen.png
	;;#}}}

#browser)#{{{
	#i3-msg '--'\
	#workspace "Browser" \; \
	#exec --no-startup-id $browser \; \
	#layout tabbed	
	#;;#}}}

ranger)#{{{
	export RANGER_LOAD_DEFAULT_RC=FALSE
	$term -e ranger
	;;#}}}

screenshot)#{{{
	case "$2" in
	area)
		import $scshotFold/Screenshot_$(date -Iseconds).png
		;;
	*)
		mkdir /tmp/execsh_scshot.lock\
		&& import -window root $scshotFold/Screenshot_$(date -Iseconds).png ;\
		sleep 1s;\
		rm -rf  /tmp/execsh_scshot.lock		
		;;
	esac
	;;#}}}

screen_mode)#{{{
	~/.config/Scripts/screen.sh $2 $4
	~/.config/polybar/launch.sh $3
	feh --bg-scale ~/.config/wall
	;;#}}}

*)#{{{
	exit#}}}

esac