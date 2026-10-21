# Multiple Arguments
# sh 1a.sh /home/student/Downloads /home/student/Documents

for i in "$@"
do
	if [ -d "$i" ]
    	then
        	echo "Large file size is:"
        	ls -Rl "$i" | grep "^-" | tr -s ' ' | cut -d ' ' -f 5,9 | sort -n | tail -1
    	else
        	echo "Not a directory"
    	fi
done

