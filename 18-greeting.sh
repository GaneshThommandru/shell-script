#!/bin/bash

NAME=""
WISHES="Good Morning"

USAGE(){
    echo "USAGE:: $(basename $0) -n <name> -w <wishes>"
    echo "Options::"
    echo "-n, specifies the name(mandatory)"
    echo "-w, specifies the wishes. (Optional).  ex, Default is Good Morning"
    echo "-h, Displays Help and Exit" 
}

while getopts ":n:w:h" opt; do
    case $opt in
        n) NAME="$OPTARG";;
        w) WISHES="$OPTARG";;
        \?) echo "invalid options: -"$OPTARG"" >&2; USAGE; exit;;
        :0) USAGE; exit;;
        h) USAGE; exit;;
    esac
done

#if [ -z "$NAME" ] || [ -z "$WISHES" ]; then #Both <name> and <wishes> are mandatory
if [ -z "$NAME" ]; then # now wishes is optional
    #echo "ERROR:: Both -n and -w are mandatory options."
    echo "ERROR:: -n madatory option"
    USAGE;
    exit 1
fi

echo "Hello $NAME. $WISHES. I have learning Shell Script."