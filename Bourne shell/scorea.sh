#!/bin/sh
#a) Asks user for a score. If the score is between 90 and 100, then print"you got A"
#else if between 80 and 90, then "you got B" and so on. 
#If less than 60, then "you failed". 
#If the user enters number not between 0 and 100, then print the error message and exit the script. 
#b) Modify this script such that the user runs it with a number between 0 and 100 as an argument to the script and not ask the user for the score.
echo -e 'Enter your score: \c'
read s
if [ $s -ge 90 -a $s -le 100 ]; then
echo You got an A.
elif [ $s -ge 80 -a $s -lt 90 ]; then
echo You got a B.
elif [ $s -ge 70 -a $s -lt 80 ]; then
echo You got a C.
elif [ $s -ge 0 -a $s -lt 70 ]; then
echo You failed.
else
echo Please enter score between 0-100.
fi
