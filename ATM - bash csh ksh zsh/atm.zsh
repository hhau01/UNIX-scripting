#! /bin/zsh
# Create ATM in Z-Shell

attempts=0
checking=1000
saving=1000

menu () {
	clear
	print "*** Welcome To Cal Poly's ATM System ***"
	print ""
	print "(1) Transfer from checking account to savings account"
	print "(2) Transfer from savings account to checking account"
	print "(3) Savings account balance"
	print "(4) Checking account balance"
	print "(5) Withdraw Cash from either account"
	print "(6) Exit"
	print ""
	read "choice?==> Please select option (1-6): "
	case $choice in
		(1)
		checkToSave
		;;
		(2) 
		saveToCheck
		;;
		(3) 
		saveBal
		;;
		(4) 
		checkBal
		;;
		(5) 
		withdraw
		;;
		(6) 
		print "Thank you for using the ATM system."
		exit
		;;
	esac
}

checkToSave () {
	clear
	print "(1) Transfer from checking account to savings account"
	read "amount?How much would you like to transfer? "
	if (( $(bc <<< "$amount <= $checking && $amount > 0") )) then
		checking=`echo "$checking - $amount" | bc`
		saving=`echo "$saving + $amount" | bc`
		print "Transaction completed."
		printf "Checking balance: \$%.2f\n" $checking
		printf "Savings balance: \$%.2f\n" $saving
		read "pause?Press enter to continue."
	else
		print "Transaction not completed."
		printf "Current Checking Account Balance: \$%.2f\n" $checking
		read "pause?Press enter to continue."
	fi
}

saveToCheck () {
	clear
	print "(2) Transfer from savings account to checking account"
	read "amount?How much would you like to transfer? "
	if (( $(bc <<< "$amount <= $saving && $amount > 0") )) then
		saving=`echo "$saving - $amount" | bc`
		checking=`echo "$checking + $amount" | bc`
		print "Transaction completed."
		printf "Checking balance: \$%.2f\n" $checking
		printf "Savings balance: \$%.2f\n" $saving
		read "pause?Press enter to continue."
	else
		print "Transaction not completed."
		printf "Current Savings Account Balance: \$%.2f\n" $saving
		read "pause?Press enter to continue."
	fi
}

saveBal () {
	clear
	print "(3) Savings account balance"
	printf "Balance: \$%.2f\n" $saving
	read "pause?Press enter to continue."
}

checkBal () {
	clear
	print "(4) Checking account balance"
	printf "Balance: \$%.2f\n" $checking
	read "pause?Press enter to continue."
}

withdraw () {
	clear
	print "(5) Withdraw Cash from either account"
	read "amount?How much would you like to withdraw? "
	print "Which account?"
	print "(1) Checking Account"
	print "(2) Savings Account "
	read account
	if (( $account == 1 )) then
		if (( $(bc <<< "$amount <= $checking && $amount > 0") )) then
			checking=`echo "$checking - $amount" | bc`
			printf "Current Checking Account Balance: \$%.2f\n" $checking
			read "pause?Press enter to continue."
		else
			print "Transaction not completed."
			printf "Current Checking Account Balance: \$%.2f\n" $checking
			read "pause?Press enter to continue."
		fi
	elif (( $account == 2 )) then
		if (( $(bc <<< "$amount <= $saving && $amount > 0") )) then
			saving=`echo "$saving - $amount" | bc`
			printf "Current Savings Account Balance: \$%.2f\n" $saving
			read "pause?Press enter to continue."
		else
			print "Transaction not completed."
			printf "Current Savings Account Balance: \$%.2f\n" $saving
			read "pause?Press enter to continue."
		fi
	fi
}

while (( $attempts != 3 )) do
	clear
	print "*** Welcome to Cal Poly's ATM ***"
	print ""
	read "pin?Please enter your PIN: "
	if (( $pin == 111 )) then
		cont=1
		while (( $cont == 1 )) do
			menu
		done
	else
		(( attempts++ ))
		if (( $attempts == 3 )) then
			print "Too many illegal PINs. Try again later."
			exit
		fi
		clear
	fi	
done
