redshift-gtk &
setxkbmap -option caps:swapescape &
qbittorrent &
discord &
nitrogen --restore &

if [ $XDG_CURRENT_DESKTOP = 'XFCE' ]; then
    sxhkd &
fi
