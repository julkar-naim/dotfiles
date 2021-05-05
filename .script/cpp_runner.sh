#!/usr/bin/bash

######################################################################
# @author      : naim (naim@arch)
# @file        : cpp_runner
# @created     : Saturday Oct 10, 2020 23:28:20 +06
#
# @description : A simple script for running single program file for frequent used languages.
######################################################################

buffer=$1

case $buffer in
    *.sh)
        xterm -e "bash $buffer; read"
        ;;
    *.lua)
        xterm -e "lua $buffer; read"
        ;;
    *.cpp)
        xterm -e "g++ -Wall -Wextra -Wshadow -fsanitize=undefined -std=c++17 $buffer; if [ -f a.out ]; then time ./a.out; rm a.out; read ;else read; fi"
        ;;
    *.js)
        xterm -e "node $buffer; read"
        ;;
    *.java)
        xterm -e "java $buffer; read"
        ;;
    *.py)
        xterm -e "python $buffer; read"
        ;;
    *.kt)
        onlyName=`echo $buffer | sed 's/.kt//'`
        onlyName=$onlyName.jar
        xterm -e "
            kotlinc $buffer -include-runtime -d $onlyName |& tail -n +7; 
            if [ -f $onlyName ]
            then
                time java -jar $onlyName
                rm $onlyName
            fi
            read
        "
esac

