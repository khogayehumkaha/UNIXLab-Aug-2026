#!/bin/sh
#pass folder as argument 
# sh 6bb.sh /home/student/Documents

if [ -d "$1" ]
then
    for file in "$1"/*
    do
        if [ -f "$file" ]
        then
            # Extract filename, then strip the extension
            bname=`basename "$file"`
            name="${bname%.*}"
            
            # Get the length of the name without extension
            len=`expr length "$name"`

            if [ "$len" -ge 10 ]
            then
                echo "$bname"
            fi
        fi
    done
else
    echo "Directory does not exist"
fi
