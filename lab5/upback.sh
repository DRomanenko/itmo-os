#!/bin/bash

rm -rf ~/restore
mkdir ~/restore

BACKUP_DIR_PATH=$(find ~/Backup-* -maxdepth 0 | sort -n | tail -n 1)
for CURR_FILE in $(ls $BACKUP_DIR_PATH ); do
	if [ -z "$(echo $CURR_FILE | grep -E "*.[0-9]{4}-[0-9]{2}-[0-9]{2}")" ]; then
		cp $BACKUP_DIR_PATH"/"$CURR_FILE ~/restore/$CURR_FILE
	fi
done