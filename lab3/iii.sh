#!/bin/bash

# http://fliplinux.com/grep-true-false-x.html
# https://www.linux.org.ru/forum/admin/5110834
# https://www.opennet.ru/man.shtml?topic=readlink&category=1&russian=0

for CURR_PID in $(ps ax -o pid | tail -n +2); do 
	(readlink /proc/$CURR_PID/exe | grep -q "/sbin") && echo $CURR_PID
done

# ps ax | grep "/sbin/" | awk '{print $1}' - забанено
 