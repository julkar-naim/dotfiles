#!/bin/bash

find ~/* | fzf > /tmp/filePath

if [ -f /tmp/filePath ]; 
then
    cat /tmp/filePath | /home/naim/.script/rsc | xargs xdg-open &
else
    exit
fi

