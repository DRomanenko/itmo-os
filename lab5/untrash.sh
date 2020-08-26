#!/bin/bash

TRASH_LOG_PATH=~/.trash.log
TRASH_DIR_PATH=~/.trash
FILE_NAME="$1"

restore_file () {
	FILE_RESTORE_PATH="$1"
	FILE_NAME="$2"
	ln "$TRASH_DIR_PATH/$FILE_NAME" "$FILE_RESTORE_PATH"
}
	
LINE=""
COUNT=1
FILE_RESTORE_PATH="ERROR1"
FILE_IN_TRASH_NAME="ERROR2"
NUM_LINE=0
grep "$FILE_NAME" "$TRASH_LOG_PATH" | 
while read LINE; do
	(( COUNT++ ))
	if [[ $COUNT -eq 2 ]]; then 
		continue
	fi
	if [[ $(( $COUNT & 1 )) -eq 0 ]]; then #==
		FILE_RESTORE_PATH=$(echo "$LINE")
		echo "Restore $FILE_IN_TRASH_NAME to $FILE_RESTORE_PATH? (y/n)"
		read ANS < /dev/tty #считать из консоли (stdin) и записать в ANS
		case $ANS in
			"y")
				if [[ -f "$FILE_RESTORE_PATH" ]]; then
					touch .rmtrash_help.txt
					echo "File with $FILE_NAME name exists to delete it? (y/n)"	
					read ANS < /dev/tty		
					case $ANS in
						"y")
							rm -r "$FILE_RESTORE_PATH"
						;;
						"n")
							continue
						;;
					esac
				fi

				FILE_RESTORE_PARENT_DIR_PATH=$(dirname "$FILE_RESTORE_PATH") &&
				if [[ -d "$FILE_RESTORE_PARENT_DIR_PATH" ]]; then
				    $(restore_file "$FILE_RESTORE_PATH" "$FILE_IN_TRASH_NAME")
				else
				    $(restore_file "$HOME/$FILE_NAME" "$FILE_IN_TRASH_NAME") && 
					echo "Directory $FILE_RESTORE_PARENT_DIR_PATH doesn't exists anymore, restoring at $HOME"
				fi && rm "$TRASH_DIR_PATH/$FILE_IN_TRASH_NAME" && {
					sed -i $NUM_LINE'd' "$TRASH_LOG_PATH"
				    echo "Restored $FILE_RESTORE_PATH"
		        }		
			;;
			"n") 
				continue
			;;
		esac
 	else
		FILE_IN_TRASH_NAME=$(echo "$LINE")
		NUM_LINE=$(grep -no "$LINE" "$TRASH_LOG_PATH" | awk -F ':' '{print $1}')
	fi
done