#!/bin/bash
# sh 7aa.sh

hour=` date +%H `

case $hour in
    0[0-9]|1[0-1])
        echo "Good Morning $LOGNAME"
        ;;
    1[2-6])
        echo "Good Afternoon $LOGNAME"
        ;;
    1[789])
        echo "Good Evening $LOGNAME"
        ;;
    2[0-3])
        echo "Good Night $LOGNAME"
        ;;
esac


# 0[0-9]|1[0-1] → 00–09 or 10–11
# 1[2-6] → 12–16
