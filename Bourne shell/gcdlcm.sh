#!/bin/sh
#Script that takes in two arguments that are positive integers.
#The script should figure out which of the two integers is smaller
#and should use that to figure out the greatest common divisor (GCD)
#of the two integers and print it out. Also, figure out the lowest
#common multiple (LCM) of the two integers and print it out.
if [ $1 -gt 0 ] && [ $2 -gt 0 ]; then
	if [ $1 -gt $2 ]; then
		big=$1
		small=$2
	else
		big=$2
		small=$1
	fi
else
	echo Please enter a positive integer.
	exit
fi

gcd () {
	a=$big
	b=$small
	rem=1
	while [ $rem -ne 0 ]
	do
		rem=`expr $a % $b`
		a=$b
		b=$rem
	done
	echo "GCD of $1 and $2 is $a"
}

lcm () {
	a=$big
	b=$small
	p=`expr $a \* $b`
	while [ $b -ne 0 ]
	do
		r=`expr $a % $b`
		a=$b
		b=$r
	done
	l=`expr $p / $a`
	echo "LCM of $1 and $2 is $l"
}

gcd $big $small
lcm $big $small
