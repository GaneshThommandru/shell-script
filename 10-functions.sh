#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $? -ne 0 ]
    then 
        echo "ERROR:: Installing FAILED"
        exit 1
    else
        echo "Installing is SUCCESS"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 # You can give other than zero
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

dnf install mysql -y

VALIDATE

dnf install git -y

VALIDATE