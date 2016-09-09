#!/bin/sh
#Script that uses a switch or case statement (depending on shell) to do the following
#First ask the user for a color. If they enter anything that begins with bl or Bl, then print the sky color is (whatever the user entered).
#If the user enters red or yellow, then print the sun is sometimes this color.
#If the user enters any other color, then enter that the color is not in any of the categories defined.
echo -e 'Enter a color: \c'
read c
case $c in
	Bl*|bl*)
	echo The sky color is $c.
	;;
	"red"|"yellow")
	echo The sun is sometimes this color.
	;;
	*)
	echo $c is not in any of the categories defined.
esac
