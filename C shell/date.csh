#! /bin/csh
#Script that saves the current date in a variable and then shifts through the different parts/elements of the date using a loop and prints each one out in a separate line.
set now = `date`
echo $now
foreach x ( $now )
	echo $x
end
