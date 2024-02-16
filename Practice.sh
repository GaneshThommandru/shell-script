#!/bin/bash

ID=$(id -u)
DATE=$(date +%f-%H:%M:%S)
R="\e[33m"
G="\e[32m"
Y="\e[31m"
N="\e[0m"

echo "Script Execution Started at :: $Y $DATE $N"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR:: $N Installing $2 FAILED"
        exit 1
    else
        echo "Installing $2 SUCCESS"
    fi 
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: $N Please run as root user"
    exit 1
else
    echo -e "$G You are a root user $N"
fi

yum install mysql -y

VALIDATE $? "MySQL...."

yum install git -y

VALIDATE $? "GIT...."