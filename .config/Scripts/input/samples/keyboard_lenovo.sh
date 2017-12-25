#!/bin/bash

# Set layout
setxkbmap -layout us -variant altgr-intl -option caps:ctrl_modifier -option shift:both_capslock_cancel 

# Preserve Escape
xmodmap -e 'keycode 255 = Escape'

# Caps press as escape and space press as space
# Run as another service
#xcape -e "#66=Escape" -d 1>/dev/null
