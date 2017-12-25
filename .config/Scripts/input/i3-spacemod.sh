#!/bin/bash

# Source https://www.reddit.com/r/i3wm/comments/5zpz69/using_space_bar_as_mod_is_life_changing/

spare_modifier="Hyper_L" 

# Space as mod
xmodmap -e "clear mod3"
xmodmap -e "remove mod4 = $spare_modifier"
xmodmap -e "add mod3 = $spare_modifier"
#xmodmap -e "add mod4 = Super_L Super_R" 

# Spare modifier for space as mod
xmodmap -e "keycode 65 = $spare_modifier"
#xmodmap -e "add Hyper_L = $spare_modifier"
xmodmap -e "keycode any = space"

# Caps press as escape and space press as space
# Run as another service
#xcape -e "$spare_modifier=space" -d 1>/dev/null

