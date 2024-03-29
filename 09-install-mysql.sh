#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 # You can give other than zero
else
    echo "You are root user"
fi # fi means reverse of if, indicating condition end

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "ERROR:: Installing MySQL FAILED"
    exit 1
else
    echo "Installing MySQL is SUCCESS"
fi

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
else
    echo "You are a root user"
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Installing git FAILED"
    exit 1
else
    echo "Installing git SUCCESS"
fi
