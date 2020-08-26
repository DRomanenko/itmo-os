#!/bin/bash

# https://habr.com/ru/post/47163/

echo $$ > .pid

MODE="WORK"
COUNT=0

stop() {
	MODE="STOP"
}

trap 'stop' SIGTERM

while true; do
	case $MODE in
		"WORK")
			let COUNT=$COUNT+1
			echo $COUNT
		;;
		"STOP")
			echo "Stopped by SIGTERM signal"
			exit
		;;
	esac
	sleep 1
done
