#!/bin/bash
#Single Argument

if [ -d "$1" ]
then
    echo "Large file size is:"
    ls -Rl "$1" | grep "^-" | tr -s ' ' | cut -d ' ' -f 5,9 | sort -n | tail -1
else
    echo "Not a directory"
fi