#!/bin/sh
# sh 5a.sh 4b.sh

if [ -f "$1" ]
then
	echo "File Name : $1"
    	echo "Creation Time : `stat "$1" | grep "Birth" | cut -d ' ' -f 3,4,5`"
else
    echo "File does not exist"
fi
