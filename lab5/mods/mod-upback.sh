#!/bin/bash

rm -rf ~/restore
mkdir ~/restore

find ~/Backup-* -maxdepth 0 > .help.txt
echo "Which version do you want to restore?"
ARM=1
for CURR_BACKUP in $(cat .help.txt); do
  echo "$ARM) $CURR_BACKUP"
  let ARM=ARM+1
done

read NUM_LINE < /dev/tty  
BACKUP_DIR_PATH=$(sed $NUM_LINE'!D' .help.txt)
for CURR_FILE in $(ls $BACKUP_DIR_PATH); do
  if [ -z "$(echo $CURR_FILE | grep -E "*.[0-9]{4}-[0-9]{2}-[0-9]{2}")" ]; then
    cp $BACKUP_DIR_PATH"/"$CURR_FILE ~/restore/$CURR_FILE
  fi
done