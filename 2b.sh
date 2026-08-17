#!/bin/sh

if [ $# -eq 0 ]
then
    echo "No login names specified"
    exit 1
fi

for user in "$@"
do
    home=$(grep "^$user:" /etc/passwd | cut -d: -f6)

    if [ -n "$home" ]
    then
        echo "$user : $home"
    else
        echo "$user : Invalid login name"
    fi
done