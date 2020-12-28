#!/usr/bin/bash

######################################################################
# @author      : naim (naim@arch)
# @file        : cpp_runner
# @created     : Saturday Oct 10, 2020 23:28:20 +06
#
# @description : 
######################################################################

file=$1

xterm -e "g++ -Wall -Wextra -Wshadow -fsanitize=undefined -std=c++17 $file; if [ -f a.out ]; then time ./a.out; rm a.out; read ;else read; fi"
