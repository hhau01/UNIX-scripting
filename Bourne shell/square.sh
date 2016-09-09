#!/bin/sh
#Function called do_square that uses the first argument/parameter to calculate
#the square of the integer the user enters when running the script
do_square () {
	s=`expr $1 \* $1`
	echo $s
}
do_square $1
