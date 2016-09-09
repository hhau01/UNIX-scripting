#! /bin/csh
#Script that asks the user for a number and prints out if it is even or odd
echo -n 'Please enter a number:'
set n = $<
@ x = $n % 2
if ( $x == 0 ) then
	echo $n is even.
else
	echo $n is odd
endif
