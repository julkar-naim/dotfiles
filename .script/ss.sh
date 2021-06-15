#!/usr/bin/env sh

######################################################################
# @author      : _naim_ (_naim_@arch)
# @file        : ss
# @created     : Saturday Feb 13, 2021 22:42:58 +06
#
# @description :  take a screenshot of a selected area and copy that in clipboard
######################################################################

# xdotool key Return
# slop=$(slop -f "%g") ||
#     exit 1
# import -window root -crop "$slop" png:- |
#     xclip -selection clipboard -t image/png -i &> /dev/null

# notify-send "Doesn't work"

#scrot -s /tmp/ss.png; xclip -selection c -t image/png -i < /tmp/ss.png; rm /tmp/ss.png &

flameshot gui; sleep 60; pkill flameshot;
