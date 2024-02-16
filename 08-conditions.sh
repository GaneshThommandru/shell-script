#!/bin/bash

echo "Enter a Number:: "

read NUM

if [ $NUM -gt 100 ]
then
    echo "$NUM is greater than 100"
else
    echo "$NUM is less than or equal to 100"
fi