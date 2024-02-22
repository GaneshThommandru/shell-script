#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/shellscript-logs"

test -d $SOURCE_DIR

if [ $? -ne 0 ]
then
    echo -e "$R Error:: Source Directory does not exists $N"
fi

FILES_TO_DELETE=$(find /tmp/shell-script -type f -mtime +14 -name "*.log")

while IFS= read -r line
do
    echo "Deleting file: $line"
done <<< $FILES_TO_DELETE