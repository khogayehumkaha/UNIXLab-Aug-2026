# touch aa bb
# ls
# sh 4a.sh aa bb cc
# ls

for file in "$@"
do
    if [ -f $file ]
    then
          	ufile=`echo "$file" | tr "a-z" "A-Z"`
        	if [ -f $ufile ]
        	then
              echo "$ufile exists"
        	else
              mv $file $ufile
        	fi
    else
          	echo "$file does not exist"
    fi
done
