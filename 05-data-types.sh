#!/bin/bash

NUMBER1=$1
NUMBER2=$2
ARGSPASSED=$#
ALLARGS=$@

SUM=$(($NUMBER1+$NUMBER2))

echo "Number of args passed:: $ARGSPASSED"

echo "All Args :: $ALLARGS"

echo "Total Sum ::$SUM"