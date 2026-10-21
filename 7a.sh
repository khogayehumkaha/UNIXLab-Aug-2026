#!/bin/sh
# sh 7a.sh


hour=` date +%H `

if [ $hour -ge 0 ] && [ $hour -lt 12 ]
then
        echo "Good Morning $LOGNAME"
elif [ $hour -ge 12 ] && [ $hour -lt 17 ]
then
        echo "Good Afternoon $LOGNAME"
elif [ $hour -ge 17 ] && [ $hour -lt 20 ]
then
        echo "Good Evening $LOGNAME"
else
        echo "Good Night $LOGNAME"
fi
