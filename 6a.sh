#!/bin/sh
# sh filename 'pattern'

if [ $# -eq 0 ]
then
    echo "No arguments"
    exit
fi

mkdir -p ~/mydir

for i in $(find ~ -name "$1")
do
    cat "$i"
    cp "$i" ~/mydir
done