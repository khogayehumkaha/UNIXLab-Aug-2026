#!/bin/sh
#pass folder as argument 
for file in "$1"/*
do
    if [ -f "$file" ]
    then
        name=$(basename "$file")
        len=$(expr length "$name")

        if [ $len -ge 10 ]
        then
            echo "$name"
        fi
    fi
done