#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Enter one path name"
    exit 
fi

curdir=$(pwd)

for dir in $(echo "$1" | tr "/" " ")
do
    if [ -d "$dir" ]
    then
        echo "$dir exists under $(pwd)"
    else
        mkdir "$dir"
        echo "$dir created under $(pwd)"
    fi
    cd "$dir"
done

cd "$curdir"