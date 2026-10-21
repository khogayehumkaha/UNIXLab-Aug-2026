#!/bin/sh
# sh 8a.sh


echo "Enter login name:"
read user

session=`loginctl list-sessions --no-legend | grep " $user " | head -n 1`

if [ -z "$session" ]
then
        echo "$user is not logged in"
else

    sid=`echo "$session" | cut -d ' ' -f 1`

    login_time=`loginctl show-session "$sid" -p Timestamp --value`

    start=`date -d "$login_time" +%s`
    now=`date +%s`
    diff=`expr $now - $start`
    hours=`expr $diff / 3600`
    minutes=`expr \( $diff % 3600 \) / 60`
    echo "$user is working for $hours hours and $minutes minutes"
fi



