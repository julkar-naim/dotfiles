#!/usr/bin/env bash

function run {
	if ! pgrep -f $1
	then
		$@&
	fi
}


setxkbmap -option caps:swapescape &
xset r rate 250 50 &
albert&

# run telegram-desktop &
run ibus-daemon &
#run nitrogen --restore &
run redshift &
run picom &
# run qbittorrent &
ibus-daemon --daemonize --xim &
