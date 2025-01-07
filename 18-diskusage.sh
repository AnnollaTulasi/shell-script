#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5

while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' |cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    echo "PARTITION: $PARTITION ,USAGE: $USAGE"
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MSG+="High Disk Usage on partition : $PARTITION USAGE is $USAGE \n"
    fi
done <<< $DISK_USAGE

echo -e "MSG $MSG"

echo "$MSG" | mutt -s "Hign Disk Usage" annollatulasi@dbs.com