#!/bin/bash

ID=$(id -u)
R="\e[31n"
G="\e[32n"
Y="\e[33n"
N="\e[0n"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .....$R FAILED $N"
        exit 1
    else
        echo -e "$2 .....$G SUCCESS $N"
    fi
}

#Validate the root user access
if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run as a root user $N"
    exit 1
else
    echo -e "$G You are root user $N"
fi

#Check & Copy the Mongodb repo file to repos directory
test -f /etc/yum.repos.d/mongo.repo

if [ $? -ne 0 ]
then    
    cp /home/centos/shell-script/mongo.repo /etc/yum.repos.d/mongo.repo  &>> $LOGFILE
else
    echo -e "mongo.repo file already exists in repos directory .....$Y SKIPPING $N"
fi

VALIDATE $? "Copying MongoDB repo"

#Validate whether the Mongo
yum list installed mongodb-org

if [ $? -ne 0 ]
then
    yum install mongodb-org -y &>> $LOGFILE
else
    echo -e "Already installed .....$Y SKIPPING $N"
fi

systemctl enable mongod &>> $LOGFILE

VALIDATE $? "Enabling mongod"

systemctl start mongod &>> $LOGFILE

VALIDATE $? "Starting mongod"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf

VALIDATE $? "Updating the Listening Address"

systemctl restart mongod

VALIDATE $? "Restarting the mongod service"