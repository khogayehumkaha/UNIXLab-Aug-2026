#!/bin/sh

if [ $# -ne 3 ]
then
    echo "Invalid number of arguments"
    exit
fi

lines=$(wc -l < "$1")

if [ $2 -le 0 ] || [ $3 -le 0 ] || [ $2 -gt $3 ] || [ $3 -gt $lines ]
then
    echo "Invalid input"
    exit
fi

sed -n "$2,$3 p" "$1"