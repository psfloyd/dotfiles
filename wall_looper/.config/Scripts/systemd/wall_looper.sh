#!/bin/bash

#Feed this script two arguments, $1 for a folder directory and $2 for a time interval in seconds.

#Will loop thru the files in the directory, using feh to change the background every $2 seconds.

while true; do
	for file in "$1"*;	do
		cp "$file" ~/.config/wall
		nitrogen --set-scaled "$file"
		sleep $2
	done
done
