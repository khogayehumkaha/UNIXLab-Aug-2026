#!/bin/sh

echo "Enter file name:"
read file

while read line
do
    len=$(expr length "$line")

    while [ $len -gt 40 ]
    do
        echo "$(echo "$line" | cut -c1-40)"'\'
        line=$(echo "$line" | cut -c41-)
        len=$(expr length "$line")
    done

    echo "$line"
done < "$file"