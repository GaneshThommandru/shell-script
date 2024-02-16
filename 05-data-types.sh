#!/bin/bash

NUM1=$1
NUM2=$2
SUM=$(($NUM1+$NUM2))

echo "Script Name:: $0"

echo "Number of args passed:: $#"

echo "All Args :: $@"

echo "Total Sum ::$SUM"