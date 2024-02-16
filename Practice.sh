#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H:%M:%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo -e "Script Execution Started at :: $Y $TIMESTAMP $N"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR:: $N Installing $2 $R FAILED $N"
        exit 1
    else
        echo -e "Installing $2 $G SUCCESS $N"
    fi 
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: $N Please run as root user"
    exit 1
else
    echo -e "$G You are a root user $N"
fi

yum install mysqll -y &>> $LOGFILE

VALIDATE $? "MySQL...."

yum install gitt -y &>> $LOGFILE

VALIDATE $? "GIT...."