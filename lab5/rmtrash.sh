#!/bin/bash

echo $(( $RANDOM * $RANDOM )) > "file .txt"

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
	FILE_IN_TRASH_NAME="$FILE_NAME-$COUNT"
	while [[ -e "$TRASH_DIR_PATH/$FILE_IN_TRASH_NAME" ]] ; do
		let COUNT=COUNT+1
		FILE_IN_TRASH_NAME="$FILE_NAME-$COUNT"
	done

	#COUNT=0
	#if [[ ! -f .rmtrash_help.txt ]]; then
	#	touch .rmtrash_help.txt
	#	echo $COUNT > .rmtrash_help.txt
	#fi
	#COUNT=$(cat .rmtrash_help.txt | head -1)

	FILE_IN_TRASH_NAME="$FILE_NAME-$COUNT"

	
	ln "$FILE_NAME" "$TRASH_DIR_PATH/$FILE_IN_TRASH_NAME" && let "COUNT=COUNT+1"
	rm "$FILE_NAME" && printf "$(realpath "$FILE_NAME")\n$FILE_IN_TRASH_NAME\n" >> "$TRASH_LOG_PATH"

	echo $COUNT > .rmtrash_help.txt
fi 
