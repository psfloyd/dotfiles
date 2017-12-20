#!/bin/bash

# Functions{{{
lock(){
	mpc pause
	light-locker-command -l
}
#}}}

case "$1" in 

lock)#{{{
	lock
	;;#}}}

logout)#{{{
	systemctl --user stop wm.target
	i3-msg exit
	;;#}}}

suspend)#{{{
	lock
	systemctl suspend
	;;#}}}

hibernate)#{{{
	lock
	systemctl hibernate
	;;#}}}

esac
