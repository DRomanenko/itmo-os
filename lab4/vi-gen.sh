#!/bin/bash

#http://rus-linux.net/MyLDP/consol/kill.html

while true; do
	read LINE
	case $LINE in
		"TERM")
			kill -SIGTERM $(cat .pid)
			exit 0
		;;
		*)
			:
		;;
	esac
done
