#!/bin/sh
# cat > ISE3.txt
# sh 6a.sh ISE3.txt
# ls ~/mydir/


pattern="$1"
dest="$HOME/mydir"

if [ ! -d "$dest" ]
then
    mkdir -p "$dest"
fi

find "$HOME" -type f -name "$pattern" -print | while read file
do
    echo "File found: $file"
    echo "-------------------------"

    cat "$file"

    echo "-------------------------"
    cp "$file" "$dest"

    echo "$file copied to $dest"
done


