# sh 3a.sh

echo "Enter the file name"
read file

if [ -f "$file" ]
then
    set -- ` ls -l "$file" `

    echo "File permission : $1"
    echo "Number of links  : $2"
    echo "User name        : $3"
    echo "Group name       : $4"
    echo "File size        : $5 bytes"
    echo "Date of modification : $6 $7"
    echo "Time of modification : $8"
    echo "Name of file     : $9"
    echo "Type : `file -b "$file"`"
    ls -l "$file"
else
    echo "File does not exist"
fi



