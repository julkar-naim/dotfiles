#!/usr/bin/env bash

function run {
	if ! pgrep -f $1
	then
		$@&
	fi
}


setxkbmap -option caps:swapescape &

run telegram-desktop &
run ibus-daemon &
#run nitrogen --restore &
run xfce4-clipman &
run redshift &
# run qbittorrent &
ibus-daemon --daemonize --xim &
