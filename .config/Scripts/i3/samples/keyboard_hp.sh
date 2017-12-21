#!/bin/bash

setxkbmap -layout latam -option caps:swapescape -option caps:ctrl_modifier

xmodmap -e 'keycode 255 = Escape'

xcape -e '#66=Escape' -d 1>/dev/null

