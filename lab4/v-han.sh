#!/bin/bash

#touch v.pid
#> v.pid

MODE="+"
COUNT=1

tail -n 0 -f v.pid |
while true; do
    read LINE
    case $LINE in
        "+")
            MODE="+"
            echo "Adding mode"
        ;;
        "*")
            MODE="*"
            echo "Multiplying mode"
        ;;
        "QUIT")
            echo "Stopped"
       		killall tail
            exit 0
        ;;
        [0-9]*)
            case $MODE in
                "+")
                    echo $COUNT "+" $LINE	"=" $(($COUNT + $LINE))				
                    COUNT=$(($COUNT + $LINE))
                ;;
                "*")
                    echo $COUNT "*" $LINE "=" $(($COUNT * $LINE))					
                    COUNT=$(($COUNT * $LINE))
                ;;
            esac
        ;;
        *) 
	    	echo "Incorrect input"
	    	killall tail
            exit 1
        ;;
    esac
done
