#!/bin/bash

#Feed this script either:
#	"l" for laptop screen only,
#	"e" for external screen only,
#	or "d" for dual vga/laptop.

extdisp=""

main() { if [[ $(xrandr -q | grep HDMI1\ con) ]]; then
	extdisp="HDMI1"	
	param $1
elif [[ $(xrandr -q | grep VGA1\ con) ]]; then
	extdisp="VGA1"	
	param $1
else echo "No HDMI/VGA input detected."
fi ;}


dual() { xrandr --output LVDS1 --auto --primary --output $extdisp --auto --right-of LVDS1 ;}

laptop() { xrandr --output LVDS1 --auto --primary --output $extdisp --off ;}

ext() { xrandr --output $extdisp --auto --primary --output LVDS1 --off ;}

#mirror() { xrandr --addmode $extdisp $lapres && xrandr --output LVDS1 --mode $lapres --output $extdisp --mode $lapres ;}

param() {
case $1 in
	d) dual ;;
	e) ext ;;
	l) laptop ;;
	*) echo -e "Invalid parameter. Add one of the following:\n\"d\" for dualscreen laptop and VGA.\n\"l\" for laptop only\n\"v\" for VGA only." ;;
esac ;}
main $1
