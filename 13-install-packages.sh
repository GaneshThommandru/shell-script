#!/bin/bash

ID=$(id -u)
R="\e[33m"
G="\e[32m"
Y="\e[31m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR:: Installation of $2 FAILED $N"
        exit 1
    else
        echo -e " Installation of $2 $G SUCCESS $N"
    fi
}


if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run as the root user $N"
    exit 1
else
    echo -e "$G You are root user $N"
fi

#echo "All arguments passed:: $@"

for package in $@
do
    yum list installed $package
    if [ $? -ne 0 ]
    then
        yum install $package -y &>>$LOGFILE
        VALIDATE $? "$package....."
    else
        echo -e "Package aleready installed... $Y SKIPPING $N"
    fi
done