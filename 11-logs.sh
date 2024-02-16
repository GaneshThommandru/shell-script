#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
RED=\e[31m
GREEN=\e[32m
NORMAL=\e[0m
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "ERROR:: Installing $2 $RED FAILED$NORMAL"
        exit 1
    else
        echo "Installing $2 $GREEN SUCCESS$NORMAL"
    fi
}

if [ $ID -ne 0 ]
then
    echo "$RED ERROR$NROMAL:: Please run this script with root access" 
    exit 1 # You can give other than zero
else
    echo "$GREEN You are root user$NORMAL"
fi # fi means reverse of if, indicating condition end

dnf install mysql -y &>> $LOGFILE

VALIDATE $? "MySQL...."

dnf install git -y &>> $LOGFILE

VALIDATE $? "GIT...." 