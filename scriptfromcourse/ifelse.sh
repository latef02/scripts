#echo -e "enter 4 value followed by space : \c "
#read -r a 
#read -r b
#read -r c
#read -r d
#if [ $a -gt $b -a $a -gt $c -a $a -gt $d ] ; then 
#echo "$a is big "
#elif [ $b -gt $a -a $b -gt $c -a $b -gt $d ] ; then 
#echo "$b is big"
#elif [ $c -gt $a -a $c -gt $b -a $c -gt $d ] ; then 
#echo " $c is big "
#
#elif [ $d -gt $a -a $d -gt $b -a $d -gt $c ] ; then 
#echo "$d is big"
#fi


echo -e "Enter 4 values followed by spaces: \c"
read -r a
read -r b
read -r c
read -r d

if [[ $a -gt $b && $a -gt $c && $a -gt $d ]]; then 
echo "$a is big"
elif [[ $b -gt $a && $b -gt $c && $b -gt $d ]]; then
echo "$b is big"
elif [[ $c -gt $a && $c -gt $b && $c -gt $d ]]; then
echo "$c is big"
elif [[ $d -gt $a && $d -gt $b && $d -gt $c ]]; then
echo "$d is big"
fi

