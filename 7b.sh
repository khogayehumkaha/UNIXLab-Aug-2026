#!/bin/sh
# sh 7b.sh words.txt file1.txt file2.txt

if [ $# -lt 2 ]
then
    echo "Usage: 7b.sh wordfile.txt file1.txt file2.txt ..."
else
    for word in `cat "$1"`
    do
            for file in "$@"
            do
                if [ "$file" != "$1" ]
                then
                        count=`grep -iow "$word" "$file" | wc -l`
                        echo "$word : $file : $count"
                fi
            done
    done
fi

