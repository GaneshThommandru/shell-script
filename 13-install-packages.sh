#!/bin/bash

ID=$(id -u)
R="\e[33m"
G="\e[32m"
Y="\e[31m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run as the root user $N"
else
    echo -e "$G You are root user $N"
fi

echo "All arguments passed:: $@"