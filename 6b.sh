#!/bin/sh
# checks present directory
for file in *
do
    if [ -f "$file" ]
    then
        len=$(expr length "$file")
        if [ $len -ge 10 ]
        then
            echo "$file"
        fi
    fi
done