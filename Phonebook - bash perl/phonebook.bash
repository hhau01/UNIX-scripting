#!/bin/bash
#CS260 Programming Project 3 - phonebook.bash

cont=1

menu(){
	clear
	echo "*** Welcome to Cal Poly's Phonebook System ***"
	echo ""
	echo "(1) List Records in Alphabetical Order"
	echo "(2) List Records in Reverse Alphabetical Order"
	echo "(3) Search for a Record by Last Name"
	echo "(4) Search for a Record by Birthday"
	echo "(5) Exit"
	echo ""
	echo -n "==> Please select option (1-5): "
	echo ""
	read choice
	case $choice in
		"1")
		listAlpha
		;;
		"2")
		listRAlpha
		;;
		"3")
		searchLName
		;;
		"4")
		searchBday
		;;
		"5")
		echo "Thank you for using the Phonebook system."
		exit
		;;
	esac
}
listAlpha(){
	clear
	echo "List Records in Alphabetical Order"
	echo "(1) Sort by First Name"
	echo "(2) Sort by Last Name"
	echo ""
	read choice
	echo ""
	if [[ $choice == 1 ]]; then
		cat $FILE | sort -t' ' -k1
		echo ""
		echo "Press enter to continue."
		read pause
	elif [[ $choice == 2 ]]; then
		cat $FILE | sort -t' ' -k2
		echo ""
		echo "Press enter to continue."
		read pause
	fi
}
listRAlpha(){
	clear
	echo "List Records in Reverse Alphabetical Order"
	echo "(1) Sort by First Name"
	echo "(2) Sort by Last Name"
	echo ""
	read choice
	echo ""
	if [[ $choice == 1 ]]; then
		cat $FILE | sort -rt' ' -k1
		echo ""
		echo "Press enter to continue."
		read pause
	elif [[ $choice == 2 ]]; then
		cat $FILE | sort -rt' ' -k2
		echo ""
		echo "Press enter to continue."
		read pause
	fi
}
searchLName(){
	clear
	echo "Search for a Record by Last Name"
	echo -n "Please enter Last Name: "
	read name
	echo ""
	result=`grep " $name\:" $FILE`
	echo "$result"
	echo ""
	echo "Press enter to continue."
	read pause
}
searchBday(){
	clear
	echo "Search for a Record by Birthday"
	echo "(1) Search by Month"
	echo "(2) Search by Year"
	echo ""
	read choice
	echo ""
	if [[ $choice == 1 ]]; then
		echo -n "Please enter Month [1-12]: "
		read month
		echo ""
		result=`grep "\:$month\/" $FILE`
		echo "$result"
		echo ""
		echo "Press enter to continue."
		read pause
	elif [[ $choice == 2 ]]; then
		echo -n "Please enter Year [00-99]: "
		read year
		echo ""
		result=`grep "\/$year\:" $FILE`
		echo "$result"
		echo ""
		echo "Press enter to continue."
		read pause
	else
		echo "Incorrect input [1/2] only"
		echo ""
		echo "Press enter to continue."
		read pause
	fi
}

FILE="datebook.txt"

while (( $cont == 1 )); do
	clear
	menu
done
