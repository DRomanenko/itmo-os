#!/bin/bash

while true; do 
	read LINE
	echo "$LINE" >> v.pid
	
	if [[ "$LINE" == "QUIT" ]]; then 
		exit 0
	fi

	if [[ ! "$LINE" =~ [0-9]+ && "$LINE" != "+" && "$LINE" != "*" ]]; then 
		echo "Incorrect input"
		exit 1
	fi
done
