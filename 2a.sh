# touch a1 a2
# sh 2a.sh a1 a2
# chmod 755 a1
# chmod u+x a2
# sh 2a.sh a1 a2

if [ $# -ne 2 ]
then
    echo "Enter two filenames"
else
    p1=`ls -l "$1" | cut -c 2-10`
    p2=`ls -l "$2" | cut -c 2-10`
    
    if [ "$p1" = "$p2" ]
    then
        echo "Common permissions: "
    else
        echo "Different permissions:"
    fi
    echo "$1 : $p1"
    echo "$2 : $p2"
fi

