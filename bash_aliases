## PSF


#Start VNC Server

alias vncStart="/usr/bin/x11vnc -auth guess -forever -loop -noxdamage -repeat -rfbauth /home/psfloyd/.vnc/passwd -rfbport 33225 -shared"


##Restart Tilda when size is wrong
#alias tR="gnome-terminal -e 'killall tilda; sleep 0.5s; tilda'"
