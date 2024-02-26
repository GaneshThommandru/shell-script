#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE 'tmp|File' | awk '{print $6F}' | cut -d % -f1)
DISK_THRESHOLD=1
message=""

while IFS= read line
do
    if [ $line -ge $DISK_THRESHOLD ]
    then
        message+="Alert:: Disk Usage of $(df -hT | grep -vE 'tmp|File' | awk '{print $1F}') : $DISK_USAGE\n"
    fi
done <<< $DISK_USAGE

echo -e "Message:\n$message"