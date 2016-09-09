#!/bin/sh
#Script that asks the user "Are you OK?"
#If user replies y or Y, then say "glad to hear it" 
#Else if the user enter n or N then print "sorry that you are not feel good"
#If the user enters some other character, then print incorrect choice and ask question again.
while [ true ]
do
	echo -e 'Are you OK?[y\\n] \c'
	read ans
	if [ $ans = y -o $ans = Y ]; then
	echo Glad to hear it.
	break
	elif [ $ans == n -o $ans == N ]; then
	echo Sorry that you are not feeling good.
	break
	else
	echo Incorrect choice
	continue
	fi
done
