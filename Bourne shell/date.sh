#!/bin/sh
#Script that saves the current date in a variable and then shifts through the different parts/elements of the date using a loop and prints each one out in a separate line.
now=`date`
echo $now
for x in $now
do
	echo $x
done
