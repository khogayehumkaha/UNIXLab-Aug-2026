#!/bin/sh
#pass folder as argument  ( count including file extension)
# sh 6bb.sh /home/student/Documents

if [ -d "$1" ]
then
    for file in "$1"/*
    do
        if [ -f "$file" ]
        then
            
            bname=`basename "$file"`
            len=`expr length "$bname"`

            if [ "$len" -ge 10 ]
            then
                echo "$bname"
            fi
        fi
    done
else
    echo "Directory does not exist"
fi
