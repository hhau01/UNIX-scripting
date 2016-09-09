#! /bin/csh
#Script that asks the user "Are you OK?"
#If user replies y or Y, then say "glad to hear it" 
#Else if the user enter n or N then print "sorry that you are not feel good"
#If the user enters some other character, then print incorrect choice and ask question again.
while (1)
	echo -n 'Are you OK?[y\\n]'
	set ans = $<
	if ( $ans == "y" || $ans == "Y" ) then
		echo 'Glad to hear it.'
	break
	else if ( $ans == "n" || $ans == "N" ) then
		echo 'Sorry that you are not feeling good.'
		break
	else
		echo 'Incorrect choice'
		continue
	endif
end

