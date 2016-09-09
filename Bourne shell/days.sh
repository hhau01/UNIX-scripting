#!/bin/sh
#Script called days which is run as follows from command line:
#days Monday Tuesday Wednesday Thursday Friday Saturday Sunday
#and prints it removing the first day each iteration until none
count=$#
while [ $count -ge 1 ]
do
	echo $*
	shift
	count=`expr $count - 1`
done
