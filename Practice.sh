#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=/tmp/shellscript-logs/
test -d $SOURCE_DIR

FILES_TO_DELETE=$(find /tmp/shellscript-logs -type f -mtime +14 -name "*.log")

if [ $? -ne 0 ]
then
    echo -e "$R ERROR::$N Source Directory not found"
    exit 1
fi

while IFS read -r line
do 
    echo "Deleting fiel : $line"
done <<< $FILES_TO_DELETE