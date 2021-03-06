#!/bin/bash

term=termite
browser=chromium
scshotFold=~

# Functions{{{

#}}}

case "$1" in

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
	~/.config/Scripts/i3/screen.sh $2 $4
	~/.config/Scripts/polybar/launch.sh $3
	feh --bg-scale ~/.config/wall
	;;#}}}

mtpMount)#{{{
	shift
	cmd="~/bin/mtpMount -w "$@" "
	echo $cmd
	termite --name mtpMount -e "zsh -c '$cmd' "
	;;
#}}}

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

compton)#{{{
	if [ `pgrep compton` ]; then
		killall compton
	else
		compton --config ~/.config/compton/compton.conf -b
	fi
	;;#}}}

rofi)#{{{
	case "$2" in
		gksudo)
			rofi -modi "drun,run,window" -show drun -run-command 'gksudo {cmd}'
			;;
		*)
			rofi -modi "drun,run,window" -show drun
			;;
	esac
	;;#}}}

touchegg)#{{{
	if [ ! $(pgrep touchegg) ]; then
		touchegg &>/dev/null &
	else
		killall touchegg
		touchegg &>/dev/null &
	fi
	;;#}}}

*)#{{{
	exit
	#}}}

esac
