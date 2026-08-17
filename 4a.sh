#!/bin/sh

for file in "$@"
do
    if [ -f "$file" ]
    then
        new=$(echo "$file" | tr "a-z" "A-Z")
        mv "$file" "$new"
    else
        echo "$file does not exist"
    fi
done