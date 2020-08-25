#!/bin/bash
COUNT=0
while true; do
	read NUM
	if [[ $(( $NUM & 1 )) -eq 0 ]]; then #==
		break;
	fi
	(( COUNT++ ))
done
echo $COUNT