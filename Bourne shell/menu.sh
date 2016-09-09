#!/bin/sh
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
if [ $# -ne 2 ]; then
	echo ERROR: Only two arguments are acceptable.
	echo Example: ./menu.sh 1 2
	exit
fi
choice () {
	echo "What would you like to do?"
	echo "Do another operation on the same two integers(enter s or S)"
	echo "Do another operation on two different integers(enter d or D)"
	echo "Exit(enter any other key)"
	read m
	case $m in
		"s"|"S")
		continue
		;;
		"d"|"D")
		echo -e "Please enter two integers: \c"
		read a b
		;;
		*)
		echo Goodbye
		exit
		;;
	esac
}
a=$1
b=$2
cont=1
while [ $cont -eq 1 ]
do
	echo "Welcome to Arithmetic Menu!"
	echo "Add the numbers(enter a or A)"
	echo "Subtract the numbers(enter s or S)"
	echo "Multiply the numbers(enter m or M)"
	echo "Divide the numbers(enter d or D)"
	echo "Exit(enter e or E)"
	read n
	case $n in
		"a"|"A")
		echo `expr $a + $b`
		choice
		;;
		"s"|"S")
		echo `expr $a - $b`
		choice
		;;
		"m"|"M")
		echo `expr $a \* $b`
		choice
		;;
		"d"|"D")
		if [ $b -eq 0 ]; then
			echo Cannot divide by 0.
			break
		else
			echo `expr $a / $b`
		fi
		choice
		;;
		"e"|"E")
		exit
		;;
		*)
		echo "That is not a choice. Please select again."
		;;
	esac
done
