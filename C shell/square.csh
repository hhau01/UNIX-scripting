#! /bin/csh
#Function called do_square that uses the first argument/parameter to calculate
#the square of the integer the user enters when running the script
if ( $# == 1 ) then
	@ x = $1 * $1
	echo $x
endif
