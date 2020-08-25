#!/bin/bash
ALL="" 
while true; do
	read A
	if [[ $A == "q" ]]; then
		break
	fi
	ALL=$ALL$A
done
echo $ALL
