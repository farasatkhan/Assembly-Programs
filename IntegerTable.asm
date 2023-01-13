INCLUDE Irvine32.inc
.data
qstring   BYTE "Enter a number: ", 0
badPrompt BYTE "Invalid input, please enter again",0
xString   BYTE " x ", 0
eString   BYTE " = ", 0
decNum    DWORD ?
.code
main PROC
	mov edx, OFFSET qstring
	call WriteString
	read:
	call ReadDec
	jnc validInput
	mov edx, OFFSET badPrompt
	call WriteString
	jmp read
	validInput:
		mov ebx, 1
		mov decNum, eax
		mov ecx, 10
		L1:
		mov eax, decNum
		call WriteDec
		mov edx, OFFSET xString
		call WriteString
		mov eax, ebx
		call WriteDec
		mov edx, OFFSET eString
		call WriteString
		mov eax, decNum
		mul ebx
		call WriteDec
		inc ebx
		call Crlf
		loop L1
	exit
main ENDP
END main
