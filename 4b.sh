# touch a.txt
# sh 4b.sh a.txt
# ln a.txt b.txt
# sh 4b.sh a.txt
# sh 4b.sh a.txt /home/student


file="$1"

if [ $# -eq 1 ]
then
        dir=.
else
        dir="$2"
fi

if [ -f "$file" ]
then
    set -- `ls -l "$file"`
    lcount="$2"

    if [ "$lcount" -eq 1 ]
    then
            echo "No other links"
    else
            set -- `ls -i "$file"`
            inode="$1"
            find "$dir" -xdev -inum "$inode" -print
    fi
else
        echo "File does not exist"
fi


