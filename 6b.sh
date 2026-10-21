#!/bin/sh
# checks present directory
# touch 10characterfile.txt
# sh 6b.sh .



if [ -d "$1" ]
then
    for file in "$1"/*
    do
        if [ -f "$file" ]
        then
            bname=`basename "$file"`
            name="${bname%.*}"
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


