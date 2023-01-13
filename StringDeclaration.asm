INCLUDE Irvine32.inc

ExitProcess PROTO, dwExitCode:DWORD


.data
checkTitle BYTE "Checking Account", 0

newAccount BYTE "1) Create a new account", 0

existingAccount BYTE "2) Open an existing account", 0

creditAccount BYTE "3) Credit the account", 0

debitAccount BYTE "4) Debit the account", 0

exitAccount BYTE "5) Exit", 0

.code
main PROC
	call Clrscr
	lea edx, checkTitle
	call WriteString
	call CRLF

	lea edx, newAccount
	call WriteString
	call CRLF

	lea edx, existingAccount
	call WriteString
	call CRLF

	lea edx, creditAccount
	call WriteString
	call CRLF

	lea edx, debitAccount
	call WriteString
	call CRLF

	lea edx, exitAccount
	call WriteString
	call CRLF

	exit
main ENDP
END main
