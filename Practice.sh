#!/bin/bash

$SOURCE_DIR="/tmp/shellscript-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR="/tmp/shellscript-logs/"
test -d $SOURCE_DIR

if [ $? -ne 0 ]
then
    echo -e "$R ERROR::$N Source Directory not found"
    exit 1
fi



