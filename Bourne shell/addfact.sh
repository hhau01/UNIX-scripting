#!/bin/sh
#Script that asks for an int between 1 and 10
#and prints out sum from 1 through the number entered
#and also the product from 1 through the number entered (factorial)
#Example: user enters 4, script should print sum 10 (1+2+3+4) and 24(1*2*3*4)
echo -e "Please enter a number between 1 and 10: \c"
read n
if [ $n -lt 1 -o $n -gt 10 ]; then
	echo "Please choose a number between 1 and 10."
	exit
fi
count=1
sum=0
prod=1
str1="1"
str2="1"
while [ $count -le $n ]
do 
	sum=`expr $sum + $count`
	prod=`expr $prod \* $count`
	if [ $count -gt 1 ]; then
		str1="$str1 + $count"
		str2="$str2 * $count"
	fi
	count=`expr $count + 1`
done
echo "$sum ($str1)"
echo "$prod ($str2)"
