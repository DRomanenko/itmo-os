#!/bin/bash

echo $$ > .pid

MODE="+"
COUNT=0

stop() {
    MODE="STOP"
}

usr1() {
    MODE="+"
}

usr2() {
    MODE="*"
}

trap 'stop' SIGTERM
trap 'usr1' USR1
trap 'usr2' USR2

touch b.pid

while true; do
    case $MODE in
        "+")
			let COUNT=$COUNT+2
            echo $COUNT >> b.pid
            kill -USR2 $(cat a.pid)
        ;;
        "*")
			let COUNT=$COUNT*2
            echo $COUNT >> b.pid
            kill -USR2 $(cat a.pid)
        ;;
		"STOP")
            echo "Stopped by SIGTERM signal"
    		exit 0
		;;
    esac
    sleep 2
done


