#!/bin/sh
# sh 5b.sh

set -- `date`
day="$3"

if [ $day -le 9 ]
then
    cal | sed "s/ $day / * /"
else
    cal | sed "s/ $day / ** /"
fi

