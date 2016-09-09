#!/bin/sh
#Simple while loop which prints out numbers from 0 through 9 using the @ operator and a variable.
#In case of Bourne shell, use the expr command to increment the loop variable
n=0
while [ $n -lt 10 ]
do
	echo $n
	n=`expr $n + 1`
done
