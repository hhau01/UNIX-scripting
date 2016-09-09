#! /bin/csh
#Script that uses a switch or case statement (depending on shell) to do the following
#First ask the user for a color. If they enter anything that begins with bl or Bl, then print the sky color is (whatever the user entered).
#If the user enters red or yellow, then print the sun is sometimes this color.
#If the user enters any other color, then enter that the color is not in any of the categories defined.
echo -n 'Enter a color: '
set c =  $<
switch ( $c)
	case Bl*:
	case bl*:
		echo "The sky color is $c."
	breaksw
	case "red":
	case "yellow":
		echo "The sun is sometimes this color."
	breaksw
	default:
		echo "$c is not in any of the categories defined."
	breaksw
endsw
