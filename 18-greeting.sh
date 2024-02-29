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
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        :0) USAGE; exit;;
        h) USAGE; exit;;
    esac

done

if [ -z "$NAME" ] || [ -z "$WISHES" ]; then
    echo "ERROR:: Both -n and -w are madatory options"
    USAGE;
    exit 1
fi

echo "Hello $NAME. $WISHES. I have learning Shell Script."