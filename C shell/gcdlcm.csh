#! /bin/csh
#Script that takes in two arguments that are positive integers.
#The script should figure out which of the two integers is smaller
#and should use that to figure out the greatest common divisor (GCD)
#of the two integers and print it out. Also, figure out the lowest
#common multiple (LCM) of the two integers and print it out.
if ( $1 > 0 && $2 > 0 ) then
	if ( $1 > $2 ) then
		set small = $2
		set big = $1
	else
		set small = $1
		set big = $2
	endif
else
	echo 'Please enter a positive integer.'
	exit
endif

#gcd
set a = $big
set b = $small
set rem = 1
while ( $rem !=  0 )
	@ rem = $a % $b
	set a = $b
	set b = $rem
end
echo "GCD of $1 and $2 is $a"

set a = $big
set b = $small
@ p = $a * $b
while ( $b != 0 )
	@ r = $a % $b
	set a = $b
	set b = $r
end
@ l = $p / $a
echo "LCM of $1 and $2 is $l"
