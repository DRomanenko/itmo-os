#!/bin/bash

./v.sh > help1.txt
IFS=$'\n'

CHILD_AVG_SLEEP=0
PREV_PPID=-1
QTY=0

for LINE in $(cat help1.txt); do
	CURR_PPID=$(printf "$LINE" | cut -d ":" -f 2 | grep -E -s -o "[0-9]+")
	CURR_AVG_SLEEP=$(printf "$LINE" | cut -d ":" -f 3 | grep -E -s -o "[0-9]+")

	if [[ $PREV_PPID -ne -1 && $CURR_PPID -ne $PREV_PPID ]]; then
		CALC=$(($CHILD_AVG_SLEEP / $QTY))
        	echo Average_Sleeping_Children_of_ParentID=$PREV_PPID is $CALC
        	CHILD_AVG_SLEEP=0
        	QTY=0
    	fi

	echo $LINE

	CHILD_AVG_SLEEP=$(($CHILD_AVG_SLEEP + $CURR_AVG_SLEEP))
	PREV_PPID=$CURR_PPID
	(( QTY++ ))
done
echo Average_Sleeping_Children_of_ParentID=$PREV_PPID is $(($CHILD_AVG_SLEEP / $QTY))
rm help1.txt
