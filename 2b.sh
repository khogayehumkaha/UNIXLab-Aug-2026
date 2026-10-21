# sh 2b.sh student nmamit shree root

if [ $# -eq 0 ]
then
	echo "No login names specified"
	exit 
fi

for user in "$@"
do
	home=`grep "^$user:" /etc/passwd  |  cut -d : -f 6`

	if [  "$home" != "" ]
    	then
    		echo "$user : $home"
    	else
        	echo "$user : Invalid login name"
    	fi
done
