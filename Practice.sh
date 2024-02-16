#!/bin/bash

ID=$(id -u)
DATE=$(date)
R="\e[33m"
G="\e[32m"
Y="\e[31m"
N="\e[0m"

echo "Script Execution Started at :: $DATE"

VALIDATE(){
    if [ $0 -ne 0 ]
    then
        echo "ERROR:: Installing $1 FAILED"
    else
        echo "Installing $1 SUCCESS"
}

if [ $ID -ne 0 ]
then
    echo "$R ERROR:: $N Please run as root user"
    exit 1
else
    echo "$G You are a root user $N"
fi

yum install mysql -y

VALIDATE "MySQL...."

yum install git -y

VALIDATE "GIT...."