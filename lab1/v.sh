#!/bin/bash
echo 1 - nano
echo 2 - vim
echo 3 - links
echo 4 - exit

while true; do
	read A
	case $A in
		1)
			nano
			;;
		2) 
			vim
			;;
		3)
			links
			;;
		4)
			break
			;;
		*)
			echo Please, enter: 1, 2, 3, 4.
	esac	
done		
