#!/bin/bash

tmuxSes=Bgp

case "$1" in
	sys)
		cmd="sudo pacmatic -Syu; read"
		;;
	aur)
		cmd="pacaur -Sau ; read"
		;;
	all)
		cmd="archupdate.sh"
		;;
	*)
		exit
esac

if  tmux lsw -t $tmuxSes | grep -q Update;then
	winPresent=true
else
	winPresent=false
fi

~/.config/i3/i3Scripts/multifunc.sh tmux


if $winPresent ; then
tmux \
	selectw -t $tmuxSes:Update \; \
	send-keys "$cmd" Enter
else
tmux \
	neww -t $tmuxSes -n Update "$cmd" \;
fi



	#new -A -t $tmuxSes\; \
