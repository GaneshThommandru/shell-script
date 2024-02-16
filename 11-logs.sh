#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "ERROR:: Installing $2 FAILED"
        exit 1
    else
        echo "Installing $2 is SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access" 
    exit 1 # You can give other than zero
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

dnf install mysql -y &>> $LOGFILE

VALIDATE $? "MySQL...."

dnf install git -y &>> $LOGFILE

VALIDATE $? "GIT...." 