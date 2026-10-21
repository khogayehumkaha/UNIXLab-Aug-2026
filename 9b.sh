#!/bin/sh
# sh 9b.sh

echo "Enter file name:"
read file

while read line
do
    len=`expr length "$line"`
    while [ $len -gt 40 ]
        do
            echo "`echo "$line" | cut -c 1-40 ` "'\'
            line=`echo "$line" | cut -c 41-`
            len=`expr length "$line"`
        done
        echo "$line"
        
done < "$file"

