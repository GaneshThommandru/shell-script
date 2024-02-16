#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1+$NUMBER2))

echo "Script Name:: $0"

echo "Number of args passed:: $#"

echo "All Args :: $@"

echo "Total Sum ::$SUM"