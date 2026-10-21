echo "with $ @ : \n"
for a in $@
do
    echo $a
done 


echo "\n \n with $ @ quotes : \n"
for a in "$@"
do
    echo $a
done 


echo "\n \n with $ *  : \n"
for a in $*
do
    echo $a
done 


echo "\n \n with $ *  quotes : \n"
for a in "$*"
do
    echo $a
done 


# sh AAAA.sh apple "banana grape" orange

#   $*   "apple" "banana" "grape" "orange"
#   $@   "apple" "banana" "grape" "orange"
#  "$*"  "apple banana grape orange"
#  "$@"  "apple" "banana grape" "orange"   

b=2
c=2
d=3

s1="hello"
s2="hello"
s3="hello1"

if [ $b = $c ]
then
    echo "a b integer same"
else 
    echo "a b are diff"
fi

if [ $b -eq $c ]
then
    echo "a b integer same"
else 
    echo "a b are diff"
fi


if [ $s1 = $s2 ]
then
    echo "s1 s2 text same"
else 
    echo "s1 s2 text are diff"
fi

if [ $s1 -eq $s2 ]
then
    echo "s1 s2 text  same"
else 
    echo "s1 s2 text are diff"
fi
