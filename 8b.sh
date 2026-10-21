#!/bin/sh
# sh 8b.sh


echo -n "Enter login name: "
read user

echo -n "Enter time in minutes: "
read min

count=0
seconds=`expr $min \* 60`

while ! loginctl list-sessions --no-legend | grep -w "$user" > /dev/null
do
sleep 5
count=`expr $count + 5`
echo "Waiting $user to login . . ."

   	if [ $count -ge $seconds ]
    	then
    		echo "$user has not logged in within $min minutes"
       	exit
 	fi
done

echo "$user has logged in"
