#!/bin/sh

echo "Enter login name:"
read user

session=$(loginctl list-sessions --no-legend | grep " $user " | head -n 1)

if [ -z "$session" ]
then
    echo "$user is not logged in"
    exit
fi

sid=$(echo "$session" | cut -d' ' -f1)

login_time=$(loginctl show-session "$sid" -p Timestamp --value)

start=$(date -d "$login_time" +%s)
now=$(date +%s)

diff=$((now - start))

hours=$((diff / 3600))
minutes=$(((diff % 3600) / 60))

echo "$user is working for $hours hours and $minutes minutes"