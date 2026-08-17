#!/bin/sh

file=$1

if [ $# -eq 1 ]
then
    dir=.
else
    dir=$2
fi

set -- $(ls -l "$file")
lcnt=$2

if [ $lcnt -eq 1 ]
then
    echo "No other links"
else
    set -- $(ls -i "$file")
    inode=$1
    find "$dir" -xdev -inum "$inode" -print
fi