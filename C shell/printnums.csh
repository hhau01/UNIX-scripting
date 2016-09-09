#! /bin/csh
#Simple while loop which prints out numbers from 0 through 9 using the @ operator and a variable.
#In case of Bourne shell, use the expr command to increment the loop variable
set x = 0
while ( $x < 10 )
	echo $x
	@ x ++
end
