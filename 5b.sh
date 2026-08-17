#!/bin/sh

set -- $(date)
d=$3

if [ $d -le 9 ]
then
    cal | sed "s/ $d / * /"
else
    cal | sed "s/ $d / ** /"
fi