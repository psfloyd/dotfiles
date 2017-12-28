#!/bin/bash

stow -S bash blueman compton git i3-base i3-hp light-locker mpd networmanager polybar ranger rofi termite tmux touchegg twmn udiskie unclutter vim wall_looper Xinput-base Xinpunt-i3spacemod-hp Xorg zsh

systemctl --user enable mpd.service grive-timer@Documents-Google\\x20Drive.timer grive-changes@Documents-Google\\x20Drive.service tmux@Bgp.service
systemctl --user enable blueman-applet.service compton.service nm-applet.service touchegg.service twmn.service udiskie.service unclutter.service wall_looper.service polybar.service touchpad.service xkeyboard.service

