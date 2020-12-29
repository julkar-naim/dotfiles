#!/usr/bin/env sh

######################################################################
# @author      : _naim_ (_naim_@arch)
# @file        : power
# @created     : Tuesday Dec 29, 2020 00:17:26 +06
#
# @description : Arch linux power management
######################################################################
action=`echo -e "lock\nshutdown\nreboot\nsuspend" | dmenu`

if [ -z $action ]; then
    exit
fi

if [ $action = 'shutdown' ]; then
    shutdown now
elif [ $action = 'reboot' ]; then
    shutdown -r now
elif [ $action = 'lock' ]; then
    $HOME/.script/lock.sh
else
    systemctl $action ; $HOME/.script/lock.sh
fi


