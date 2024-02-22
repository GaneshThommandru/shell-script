#!/bin/bash

file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

test -f $file

if [ $? -ne 0 ]
then
    echo "$R Source file: $file does not exists $N"
fi

while IFS=":" read -r user_name password user_id group_id user_full_name home_dir shell_path
do
    echo "Username: $user_name"
    echo "User ID: $user_id"
    echo "User Full Name: $user_full_name"
done < 