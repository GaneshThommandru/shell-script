#!/bin/bash

NAME=""
WISHES=""

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo "-n, specifies the name(mandatory)"
    echo "-w, specifies the wishes. ex, Good Morning"
    echo "-h, Displays Help and Exit" 
}

while getopts ":n:W:h" opt; do
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        h|*|:) USAGE; exit;;
    esac

done