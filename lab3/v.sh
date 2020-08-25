#!/bin/bash

for CURR_PID in $(ps ax -o pid | tail -n +2); do
	STATUS_PID=$(grep -s "^Pid:" /proc/$CURR_PID/status | grep -E -s -o "[0-9]+")
	STATUS_PPID=$(grep -s "^PPid:" /proc/$CURR_PID/status | grep -E -s -o "[0-9]+")
	SLEEP_AVG=$(grep -s "avg_atom" /proc/$CURR_PID/sched | grep -E -s -o "[0-9]+")


	if [[ -z $STATUS_PID ]] ; then
	    continue
	fi

	if [[ -z $STATUS_PPID ]] ; then
	    STATUS_PPID=0
	fi

	if [[ -z $SLEEP_AVG ]] ; then
	    SLEEP_AVG=0
	fi

	printf "ProcessID=$STATUS_PID : Parent_ProcessID=$STATUS_PPID : Average_Sleeping_Time=$SLEEP_AVG\n"
done | sort -V --key=2
# Если вы сортируете строки, которые являются смешанным текстом и номерами, например имена файлов скользящих журналов, сортировка с помощью sort -n работает не так, как ожидалось и нужно использовать sort -V
