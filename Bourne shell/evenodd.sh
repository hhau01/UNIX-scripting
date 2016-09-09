#!/bin/sh
#Script that asks the user for a number and prints out if it is even or odd
echo -e 'Please enter a number: \c'
read n
x=`expr $n % 2`
if [ $x -eq 0 ]; then
	echo $n is even
else
	echo $n is odd
fi
