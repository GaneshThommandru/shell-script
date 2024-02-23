#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/tmp/shellscript-logs"
FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

test -d $SOURCE_DIR

if [ $? -ne 0 ]
then
    echo -e "$R Error:: Source directory doesn't exists $N"
    exit 1
fi

while IFS= read -r line
do
    echo "$line"
    rm -rf $line
done <<< $FILES_TO_DELETE