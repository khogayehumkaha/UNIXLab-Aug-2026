# sh 1b.sh a/b
# sh 1b.sh a/b/c/d

if [ $# -eq 0 ]
then
    echo "No arguments"
else
curdir=`pwd`

for dir in `echo $1 | tr '/' ' '`
do
    if [ -d $dir ]
    then
            echo "$dir exists under `pwd`"
    else
            mkdir $dir
            echo "$dir created under `pwd`"
    fi
    cd $dir
done
cd $curdir
fi

