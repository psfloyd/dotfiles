#!/bin/bash

#Feed this script either:
#	"l" for laptop screen only,
#	"e" for external screen only,
#	or "d" for dual vga/laptop.

extdisp=""

selectExt() { if [[ $(xrandr -q | grep HDMI1\ con) ]]; then
	extdisp="HDMI1"	
elif [[ $(xrandr -q | grep VGA1\ con) ]]; then
	extdisp="VGA1"	
else echo "No HDMI/VGA input detected."
fi ;}


dual() { xrandr --output LVDS1 --auto --primary --output $extdisp --auto --right-of LVDS1 ;}

laptop() { xrandr --output LVDS1 --auto --primary --output $extdisp --off ;}

ext() { xrandr --output $extdisp --auto --primary --output LVDS1 --off ;}

#mirror() { xrandr --addmode $extdisp $lapres && xrandr --output LVDS1 --mode $lapres --output $extdisp --mode $lapres ;}

param() {
case $1 in
	d) dual ;;
	l) laptop ;;
	e) ext ;;
	*) echo -e "Invalid parameter. Add one of the following:\n\"d\" for dualscreen.\n\"l\" for laptop only\n\"v\" for External only." ;;
esac ;}

paramforce() {
case $1 in
	d)  xrandr --output LVDS1 --auto --primary --output $extdisp --mode 1920x1080 --right-of LVDS1 ;;
	e)  xrandr --output $extdisp --mode 1920x1080 --primary --output LVDS1 --off ;;
	l) laptop ;;
	*) echo -e "Invalid parameter. Add one of the following:\n\"d\" for dualscreen.\n\"l\" for laptop only\n\"v\" for External only." ;;
esac ;}


selectExt

#Bodge for forcing 1080#{{{
if [ $2=='1080' ]; then
	echo "Forced 1080."
	paramforce $1
	exit
fi
#}}}

param $1
