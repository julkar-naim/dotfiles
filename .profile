setxkbmap -option caps:swapescape &
qbittorrent &
discord &
nitrogen --restore &
xfce4-clipman &

if [ $XDG_CURRENT_DESKTOP = 'XFCE' ]; then
    sxhkd &
fi

if [ -z pgrep redshift ]; then
    redshift-gtk &
fi
