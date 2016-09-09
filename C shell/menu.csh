#! /bin/csh
#Script that presents user with a menu
#Add the numbers(enter a or A)
#Subtract the numbers(enter s or S)
#Multiply the numbers(enter m or M)
#Divide the numbers(enter d or D)
#Exit(enter e or E)
#If user enters any other char, print error saying 
#It is not a choice and ask user to select again until correct one is chosen
#Once operation is done, ask user if they want to do another operation on
#the same two ints or do another operation with two diff ints or exit.
#Also, when you run the script, provide two ints as command line args.
#The beginning of your script should have an if statement that checks how
#many args are coming in and present a few statements about Usage of the
#script if the number of args is not 2.
if ( $# < 2 ) then
	echo "ERROR: Only two arguments are acceptable."
	echo "EXAMPLE: ./menu 1 2"
	exit
endif
set a = $1
set b = $2
set cont = 1
while ( $cont == 1 )
	echo "Welcome to Arithmetic Menu!"
	echo "Add the numbers(enter a or A)"
	echo "Subtract the numbers(enter s or S)"
	echo "Multiply the numbers(enter m or M)"
	echo "Divide the numbers(enter d or D)"
	echo "Exit(enter e or E)"
	set n = $<
	switch ( $n )
		case "a":
		case "A":
			@ x = $a + $b
			echo $x
			breaksw
		case "s":
		case "S":
			@ x = $a - $b
			echo $x
			breaksw
		case "m":
		case "M":
			@ x = $a * $b
			echo $x
			breaksw
		case "d":
		case "D":
			if ( $b == 0) then
				echo 'Cannot divide by 0.'
				break	
			else
				@ x = $a / $b
				echo $x
			endif
			breaksw
		case "e":
		case "E":
			exit
			breaksw
		default:
			echo "That is not a choice. Please select again."
			breaksw
	endsw
	echo "What would you like to do?"
	echo "Do another operation on the same two integers(enter s or S)"
	echo "Do another operation on two different integers(enter d or D)"
	echo "Exit(enter any other key)"
	set m = $<
	switch ( $m )
		case "s":
		case "S":
			continue
			breaksw
		case "d":
		case "D":
			echo "Please enter two integers"
			echo -n "Enter first integers: "
			set a = $<
			echo -n "Enter second integers: "
			set b = $<
			breaksw
		default:
			echo "Goodbye"
			exit
			breaksw
	endsw
end
