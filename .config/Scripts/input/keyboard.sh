#!/bin/bash

# Set layout
setxkbmap -layout latam -option caps:swapescape -option caps:ctrl_modifier

# Preserve Escape
xmodmap -e 'keycode 255 = Escape'

# Caps press as escape and space press as space
xcape -e "#66=Escape" -d 1>/dev/null
