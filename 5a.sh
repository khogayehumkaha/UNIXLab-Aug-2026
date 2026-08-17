#!/bin/sh

if [ -f "$1" ]
then
    stat "$1" | grep "Birth"
else
    echo "File does not exist"
fi