#!/bin/sh

if [ $# -ne 2 ]
then
    echo "Enter two filenames"
    exit 
fi

p1=$(ls -l "$1" | cut -c 2-10)
p2=$(ls -l "$2" | cut -c 2-10)

if [ "$p1" = "$p2" ]
then
    echo "Common permissions: $p1"
else
    echo "Different permissions:"
    echo "$1 : $p1"
    echo "$2 : $p2"
fi