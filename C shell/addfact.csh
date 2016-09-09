#! /bin/csh
#Script that asks for an int between 1 and 10
#and prints out sum from 1 through the number entered
#and also the product from 1 through the number entered (factorial)
#Example: user enters 4, script should print sum 10 (1+2+3+4) and 24(1*2*3*4)
echo -n "Please enter a number between 1 and 10: "
set n = $<
if ( $n < 1 || $n > 10 ) then
	echo "Please choose a number between 1 and 10."
	exit
endif
set count = 1
set sum = 0
set prod = 1
set str1 = "1"
set str2 = "1"
while ( $count <= $n )
	@ sum = $sum + $count
	@ prod = $prod * $count
	if ( $count > 1 ) then
		set str1 = "$str1 + $count"
		set str2 = "$str2 * $count"
	endif
	@ count = $count + 1
end
echo "$sum ($str1)"
echo "$prod ($str2)"
