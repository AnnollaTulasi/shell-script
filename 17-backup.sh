#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER=/var/log/script-logs
LOG_FILE=$(echo $0 | cut -d "." -f1)   #gets file name and removes the  .sh part
TIMESTAMP=$(date +%Y-%m-%d-%H:%M:%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

mkdir -p /var/log/script-logs

USAGE(){
    echo -e "$R USAGE :: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(optional)>"
    exit 1
}

if [ $# -ne 2 ]
then 
    USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
    echo -e "Souce dir $1 ..... is not present"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then
    echo  -e "Dest Dir $2 ..... is not present"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ]
then
    echo "Files are : $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
    if [ -f "$ZIP_FILE" ]
    then
        echo -e "Succcessfully created zip files older than $DAYS"
        while read -r file # here filepath is the variable name, you can give any name
        do
            echo "Deleting file: $file" 
            rm -rf $file
            echo "Deleted file: $file"
        done <<< $FILES
    else
        echo -e "$R ERROR: $N failed to zip the files"
        exit 1
    fi
else
    echo "No files to zip"
fi
