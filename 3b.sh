# sh 3b.sh

clear

echo "Enter password:"
stty -echo
read pass1
stty echo

echo "Confirm password:"
stty -echo
read pass2
stty echo

while [ "$pass1" != "$pass2" ]
do
       echo "Password does not match"
        echo "Confirm password again:"
        stty -echo
        read pass2
        stty echo
done

trap '' 2 3
echo "Terminal is locked"
echo "Enter password to unlock:"

stty -echo
read pass3
stty echo

while [ "$pass3" != "$pass1" ]
do
        echo
        echo "Invalid password"
        echo "Enter password again:"
        stty -echo
        read pass3
        stty echo
done

echo
echo "Terminal unlocked"

