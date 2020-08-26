#!/bin/bash

ROOT_PATH=$HOME
REPORT_FILE_PATH="$HOME/backup-report"
SOURCE_DIR_PATH="$HOME/source"

echo $(( $RANDOM * $RANDOM * $RANDOM )) > $SOURCE_DIR_PATH/i
echo $(( $RANDOM * $RANDOM * $RANDOM )) > $SOURCE_DIR_PATH/ii
echo $(( $RANDOM * $RANDOM * $RANDOM )) > $SOURCE_DIR_PATH/iii


LAUNCH_DATE=$(date "+%F")
NEW_BACKUP_NAME=$(echo $LAUNCH_DATE | awk -F '-' '{print "Backup-"$1"-"$2"-"$3}')


if [[ ! -d $SOURCE_DIR_PATH ]]; then
    echo "Source directory doesn't exist"
    exit 1
fi

OLD_BACKUP_DATE=$(find ~ -name "Backup-*" | sort -n | head -n 1 | awk -F '/' '{print $4}' | awk -F '-' '{print $2"-"$3"-"$4}')
OLD_BACKUP_NAME="Backup-$OLD_BACKUP_DATE"
let DIFF_DATE=("$(date -d "$LAUNCH_DATE" +%s)"\-"$(date -d "$OLD_BACKUP_DATE" +%s)")/86400

if [[ (-z $OLD_BACKUP_DATE) || ($DIFF_DATE -gt 7) ]]; then
    echo "Backup has been created in $ROOT_PATH/$NEW_BACKUP_NAME!"
    echo "Date of the backup:"$LAUNCH_DATE >> $REPORT_FILE_PATH
    echo "Folder name:"$NEW_BACKUP_NAME >> $REPORT_FILE_PATH 
    echo "Files and directories:" >> $REPORT_FILE_PATH 
    ls $SOURCE_DIR_PATH >> $REPORT_FILE_PATH

    printf "\n\n" >> $REPORT_FILE_PATH
    mkdir ~/$NEW_BACKUP_NAME 
    cp $SOURCE_DIR_PATH/* ~/$NEW_BACKUP_NAME  
else 
    if [[ ($OLD_BACKUP_DATE == "--") ]]; then 
        OLD_BACKUP_NAME=$NEW_BACKUP_NAME
        mkdir ~/$NEW_BACKUP_NAME 
    fi
    echo "Backup has been updated in $ROOT_PATH/$OLD_BACKUP_NAME at "$(date "+%H:%M:%S_%d.%m.%Y")"!"
    echo "Date of the backup:"$LAUNCH_DATE >> $REPORT_FILE_PATH
    echo "Folder name:"$OLD_BACKUP_NAME >> $REPORT_FILE_PATH 
    echo "Files and directories:" >> $REPORT_FILE_PATH 
    for CURR_FILE in $(ls $SOURCE_DIR_PATH); do
        CURR_FILE_PATH=~/$OLD_BACKUP_NAME/$CURR_FILE
        if [ ! -f $CURR_FILE_PATH ]; then
            cp $SOURCE_DIR_PATH/$CURR_FILE $CURR_FILE_PATH
            echo "New file "$CURR_FILE" in backup"
            echo "New file "$CURR_FILE" in backup" >> $REPORT_FILE_PATH
        else 
            OLD_FILE_SIZE=$(stat $SOURCE_DIR_PATH/$CURR_FILE -c%s)
            CURR_FILE_SIZE=$(stat $CURR_FILE_PATH -c%s)
            if [[ $OLD_FILE_SIZE -ne $CURR_FILE_SIZE ]]; then
                mv $CURR_FILE_PATH $CURR_FILE_PATH"."$LAUNCH_DATE
                cp $SOURCE_DIR_PATH/$CURR_FILE $CURR_FILE_PATH
                echo "New version of "$CURR_FILE" was found. Previous version was renamed to "$CURR_FILE"."$LAUNCH_DATE
                echo "New version of "$CURR_FILE" was found. Previous version was renamed to "$CURR_FILE"."$LAUNCH_DATE >> $REPORT_FILE_PATH
            fi
        fi
    done
    printf "\n\n" >> $REPORT_FILE_PATH
fi

#rm -r $SOURCE_DIR_PATH/*