#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "Script execution started at:: $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "ERROR:: Installing $2 $R FAILED $N"
        exit 1
    else
        echo -e "Installing $2 $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR $N:: Please run this script with root access" 
    exit 1 # You can give other than zero
else
    echo -e "$G You are root user $N"
fi # fi means reverse of if, indicating condition end

dnf install mysql -y &>> $LOGFILE

VALIDATE $? "MySQL...."

dnf install git -y &>> $LOGFILE

VALIDATE $? "GIT...." 