#!/bin/sh
# sh 9a.sh test.txt 3 5

if [ $# -ne 3 ]
then
    echo "Invalid number of arguments"
    exit
fi

lines=`cat "$1" | wc -l `

if [ $2 -le 0 ] || [ $3 -le 0 ] || [ $2 -gt $3 ] || 
[ $3 -gt $lines ]
then
    echo "Invalid input"
    exit
fi

sed -n "$2,$3 p" "$1"

