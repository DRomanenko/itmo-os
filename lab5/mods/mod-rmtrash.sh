#!/bin/bash

mkdir boi
echo $(( $RANDOM * $RANDOM )) > "$HOME/lab5/boi/file1.txt"
echo $(( $RANDOM * $RANDOM )) > "$HOME/lab5/boi/file2 .txt"
echo $(( $RANDOM * $RANDOM )) > "$HOME/lab5/boi/file3 .txt"

if [[ -d $1 ]]; then
	FILE_NAME=$1
	TRASH_LOG_PATH=~/.trash.log
	TRASH_DIR_PATH=~/.trash

	if [[ ! -d $TRASH_DIR_PATH ]]; then
		mkdir $TRASH_DIR_PATH
		rm -f $TRASH_LOG_PATH
	fi

	if [[ ! -f $TRASH_LOG_PATH ]]; then
		touch $TRASH_LOG_PATH
	fi

	# Check if a directory exists in a shell script
	# https://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script

    #BACKUP_DIR_PATH=$(find  "~/lab5/$FILE_NAME" -type f)
	#echo $BACKUP_DIR_PATH
    

	find  "$HOME/lab5/$FILE_NAME" -type f | 
	while read LINE; do
		FILE_NAME=$(echo $LINE | grep -oE '[^/]*\.[^/]*$')
			
		
		COUNT=0
		FILE_IN_TRASH_NAME="!$FILE_NAME-$COUNT"
		while [[ -e "$TRASH_DIR_PATH/$FILE_IN_TRASH_NAME" ]] ; do
			let COUNT=COUNT+1
			FILE_IN_TRASH_NAME="!$FILE_NAME-$COUNT"
		done

		FILE_IN_TRASH_NAME="!$FILE_NAME-$COUNT"

		ln "$LINE" "$TRASH_DIR_PATH/$FILE_IN_TRASH_NAME" && let "COUNT=COUNT+1"
		rm "$LINE" && echo "$(realpath "$LINE") $FILE_IN_TRASH_NAME" >> "$TRASH_LOG_PATH"
	done	
	rmdir $1
fi 

if [[ -f $1 ]]; then
	FILE_NAME=$1
	TRASH_LOG_PATH=~/.trash.log
	TRASH_DIR_PATH=~/.trash

	# Check if a directory exists in a shell script
	# https://stackoverflow.com/questions/59838/check-if-a-directory-exists-in-a-shell-script

    #BACKUP_DIR_PATH=$(find  "~/lab5/$FILE_NAME" -type f)
	#echo $BACKUP_DIR_PATH

	if [[ ! -d $TRASH_DIR_PATH ]]; then
		mkdir $TRASH_DIR_PATH
		rm -f $TRASH_LOG_PATH
	fi

	if [[ ! -f $TRASH_LOG_PATH ]]; then
		touch $TRASH_LOG_PATH
	fi

	#mkdir -p $(dirname )

	COUNT=0
	FILE_IN_TRASH_NAME="!$FILE_NAME-$COUNT"
	while [[ -e "$TRASH_DIR_PATH/$FILE_IN_TRASH_NAME" ]] ; do
		let COUNT=COUNT+1
		FILE_IN_TRASH_NAME="!$FILE_NAME-$COUNT"
	done

	FILE_IN_TRASH_NAME="!$FILE_NAME-$COUNT"

	ln "$FILE_NAME" "$TRASH_DIR_PATH/$FILE_IN_TRASH_NAME" && let "COUNT=COUNT+1"
	rm "$FILE_NAME" && echo "$(realpath "$FILE_NAME") $FILE_IN_TRASH_NAME" >> "$TRASH_LOG_PATH"
fi 