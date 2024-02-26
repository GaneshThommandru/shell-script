#!/bin/bash

$SOURCE_DIR="/tmp/shellscript-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

test -f /tmp/shellscript-logs

if [ $? -ne 0 ]
then
    echo -e "ERROR:: Source Directory not found"
    exit 1
fi

