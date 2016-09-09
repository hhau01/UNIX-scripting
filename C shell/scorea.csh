#! /bin/csh
#a) Asks user for a score. If the score is between 90 and 100, then print"you got A"
#else if between 80 and 90, then "you got B" and so on. 
#If less than 60, then "you failed". 
#If the user enters number not between 0 and 100, then print the error message and exit the script. 
#b) Modify this script such that the user runs it with a number between 0 and 100 as an argument to the script and not ask the user for the score.
echo -n 'Enter your score: '
set s =  $<
if ( $s >= 90 && $s <= 100 ) then
	echo 'You got an A.'
else if ( $s >= 80 && $s < 90 ) then
	echo 'You got a B.'
else if ( $s >= 70 && $s < 80 ) then
	echo 'You got an C.'
else if ( $s >= 60 && $s < 70 ) then
	echo 'You got an D.'
else if ( $s >= 0 && $s < 60 ) then
	echo 'You failed.'
else
	echo 'Please enter score between 0-100.'
endif

