#!/bin/bash
SOURCE_DIR="/home/ec2-user/"
FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files to be deleted: $FILES_TO_DELETE"

while read -r file # here filepath is the variable name, you can give any name
do
    echo "Deleting file: $file" 
    rm -rf $file
    echo "Deleted file: $file"
done <<< $FILES_TO_DELETE