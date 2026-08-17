#!/bin/sh

if [ $# -lt 2 ]
then
    echo "Usage: prgm.sh wordfile.txt file1.txt file2.txt ..."
    exit 1
fi

for word in $(cat "$1")
do
    for file in "$@"
    do
        if [ "$file" != "$1" ]
        then
            count=$(grep -iow "$word" "$file" | wc -l)
            echo "$word : $file : $count"
        fi
    done
done