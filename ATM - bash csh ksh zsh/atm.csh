#! /bin/csh
# Create ATM in C-Shell

set attempts = 0
set checking = 1000
set saving = 1000

while ( $attempts != 3 )
	clear
	echo "*** Welcome To Cal Poly's ATM ***"
	echo ""
	echo -n "Please enter your PIN: "
	set pin = $<
	if ( $pin == 111 ) then	
		set cont = 1
		while ( $cont == 1 )
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
			echo -n "==> Please select option (1-6): "
			set choice = $<
			switch ($choice)
			case "1":
				clear
				echo "(1) Transfer from checking account to savings account"
				echo -n "How much would you like to transfer? "
				set amount = $<
				if ( $amount <= $checking && $amount > 0 ) then 
					@ checking = $checking - $amount
					@ saving = $saving + $amount
					echo "Transaction completed."
					echo Checking balance: \$$checking
					echo Savings balance:  \$$saving
					echo "Press enter to continue."
					set pause = $<
				else 
					echo "Transaction not completed"
					echo Current Checking Account Balance: \$$checking
					echo "Press enter to continue."
					set pause = $<
				endif
			breaksw
			case "2":
				clear
				echo "(2) Transfer from savings account to checking account"
				echo -n "How much would you like to transfer? "
				set amount = $<
				if ($amount <= $saving && $amount > 0 ) then
					@ saving = $saving - $amount
					@ checking = $checking + $amount
					echo "Transaction completed."
					echo Checking balance: \$$checking
					echo Savings balance: \$$saving
					echo "Press enter to continue."
					set pause = $<
				else
					echo "Transaction not completed."
					echo Current Savings Account Balance: \$$saving
					echo "Press enter to continue."
					set pause = $<
				endif
			breaksw
			case "3":
				clear
				echo "(3) Savings account balance"
				echo Balance: \$$saving
				echo "Press enter to continue."
				set pause = $<
			breaksw
			case "4":
				clear
				echo "(4) Checking account balance"
				echo Balance: \$$checking
				echo "Press enter to continue."
				set pause = $<
			breaksw
			case "5":
				clear
				echo "(5) Withdraw Cash from either account"
				echo -n "How much would you like to withdraw? "
				set amount = $<
				echo "Which account?"
				echo "(1) Checking Account"
				echo "(2) Savings Account"
				set account = $<
				if ( $account == 1 ) then
					if ($amount <= $checking && $amount > 0 ) then
						@ checking = $checking - $amount
						echo Current Checking Account Balance: \$$checking
						echo "Press enter to continue."
						set pause = $<
					else
						echo "Transaction not completed."
						echo Current Checking Account Balance: \$$checking
						echo "Press enter to continue."
						set pause = $<
					endif
				else if ( $account == 2 ) then
					if ($amount <= $saving && $amount > 0 ) then
						@ saving = $saving - $amount
						echo Current Savings Account Balance: \$$saving
						echo "Press enter to continue."
						set pause = $<
					else
						echo "Transaction not completed."
						echo Current Savings Account Balance: \$$saving
						echo "Press enter to continue."
						set pause = $<
					endif
				else
					echo "Incorrect account."
					echo "Press enter to contiue."
					set pause = $<
				endif
			breaksw
			case "6":
				echo "Thank you for using the ATM system."
				exit
			breaksw
			endsw
		end
	else
		@ attempts = $attempts + 1
		if ( $attempts == 3 ) then
			echo "Too many illegal PINs. Try again later."
			exit
		endif
		clear
	endif
end
