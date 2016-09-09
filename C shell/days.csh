#! /bin/csh
#Script called days which is run as follows from command line:
#days Monday Tuesday Wednesday Thursday Friday Saturday Sunday
#and prints it removing the first day each iteration until none
set count = $#
while ( $count >= 1 )
	echo $*
	shift
	@ count --
end
