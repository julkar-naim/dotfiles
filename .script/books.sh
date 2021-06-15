#!/usr/bin/env sh

######################################################################
# @author      : _naim_ (_naim_@arch)
# @file        : books
# @created     : Tuesday Dec 29, 2020 16:56:36 +06
#
# @description : For my book library
######################################################################

dir='/media/naim/Data/books/'
book=`ls $dir | dmenu -i -l 15`

if [ -z $book ]; then
    exit
else
    zathura $dir$book
fi

