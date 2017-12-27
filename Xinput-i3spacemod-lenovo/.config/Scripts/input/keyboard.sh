#!/bin/bash

# Set layout
setxkbmap -layout us -variant altgr-intl -option ctrl:nocaps -option shift:both_capslock_cancel 

# Load Xmodmap
xmodmap ~/.config/Scripts/input/Xmodmap

# Xcape, Caps as escape, space(Hyper_R) as space
xcape -e "#66=Escape;Hyper_R=space" -d 1>/dev/null
