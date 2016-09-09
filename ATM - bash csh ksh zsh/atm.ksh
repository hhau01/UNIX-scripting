#! /bin/ksh
# Create ATM in Korn Shell

attempts=0
checking=1000
saving=1000

menu () {
	clear
	echo "*** Welcome To Cal Poly's ATM System ***"
	echo ""
	echo "(1) Transfer from checking account to savings account"
	echo "(2) Transfer from savings account to checking account"
	echo "(3) Savings account balance"
	echo "(4) Checking account balance"
	echo "(5) Withdraw Cash from either account"
	echo "(6) Exit"
	echo ""
	read "choice?==> Please select option (1-6): "
	case $choice in
		"1")
		checkToSave
		;;
		"2") 
		saveToCheck
		;;
		"3") 
		saveBal
		;;
		"4") 
		checkBal
		;;
		"5") 
		withdraw
		;;
		"6") 
		echo "Thank you for using the ATM system."
		exit
		;;
	esac
}

checkToSave () {
	clear
	echo "(1) Transfer from checking account to savings account"
	read "amount?How much would you like to transfer? "
	if (( $(bc <<< "$amount <= $checking && $amount > 0") )) then
		checking=`echo "$checking - $amount" | bc`
		saving=`echo "$saving + $amount" | bc`
		echo "Transaction completed."
		printf "Checking balance: \$%.2f\n" $checking
		printf "Savings balance: \$%.2f\n" $saving
		read "pause?Press enter to continue."
	else
		echo "Transaction not completed."
		printf "Current Checking Account Balance: \$%.2f\n" $checking
		read "pause?Press enter to continue."
	fi
}

saveToCheck () {
	clear
	echo "(2) Transfer from savings account to checking account"
	read "amount?How much would you like to transfer? "
	if (( $(bc <<< "$amount <= $saving && $amount > 0") )) then
		saving=`echo "$saving - $amount" | bc`
		checking=`echo "$checking + $amount" | bc`
		echo "Transaction completed."
		printf "Checking balance: \$%.2f\n" $checking
		printf "Savings balance: \$%.2f\n" $saving
		read "pause?Press enter to continue."
	else
		echo "Transaction not completed."
		printf "Current Savings Account Balance: \$%.2f\n" $saving
		read "pause?Press enter to continue."
	fi
}

saveBal () {
	clear
	echo "(3) Savings account balance"
	printf "Balance: \$%.2f\n" $saving
	read "pause?Press enter to continue."
}

checkBal () {
	clear
	echo "(4) Checking account balance"
	printf "Balance: \$%.2f\n" $checking
	read "pause?Press enter to continue."
}

withdraw () {
	clear
	echo "(5) Withdraw Cash from either account"
	read "amount?How much would you like to withdraw? "
	echo "Which account?"
	echo "(1) Checking Account"
	echo "(2) Savings Account "
	read account
	if (( $account == 1 )) then
		if (( $(bc <<< "$amount <= $checking && $amount > 0") )) then
			checking=`echo "$checking - $amount" | bc`
			printf "Current Checking Account Balance: \$%.2f\n" $checking
			read "pause?Press enter to continue."
		else
			echo "Transaction not completed."
			printf "Current Checking Account Balance: \$%.2f\n" $checking
			read "pause?Press enter to continue."
		fi
	elif (( $account == 2 )) then
		if (( $(bc <<< "$amount <= $saving && $amount > 0") )) then
			saving=`echo "$saving - $amount" | bc`
			printf "Current Savings Account Balance: \$%.2f\n" $saving
			read "pause?Press enter to continue."
		else
			echo "Transaction not completed."
			printf "Current Savings Account Balance: \$%.2f\n" $saving
			read "pause?Press enter to continue."
		fi
	fi
}

while (( $attempts != 3 )) do
	clear
	echo "*** Welcome to Cal Poly's ATM ***"
	echo ""
	read "pin?Please enter your PIN: "
	if (( $pin == 111 )) then
		cont=1
		while (( $cont == 1 )) do
			menu
		done
	else
		(( attempts++ ))
		if (( $attempts == 3 )) then
			echo "Too many illegal PINs. Try again later."
			exit
		fi
		clear
	fi	
done
