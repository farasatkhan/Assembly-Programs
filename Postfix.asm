INCLUDE Irvine32.inc
.stack 100h
.data
qstring			BYTE "Enter a Postfix Expression: ", 0
postfixQuery	BYTE 127 DUP(0)
result			WORD ?
addition		BYTE "+", 0
subtraction		BYTE "-", 0
multiplication  BYTE "*", 0
division		BYTE "/", 0
temp			WORD ?

.code
main PROC
	mov edx, OFFSET qstring
	call WriteString
	mov edx, OFFSET postfixQuery
	mov ecx, (LENGTHOF postfixQuery)
	call ReadString

	mov ecx, (LENGTHOF postfixQuery)
	mov edx, 0
	mov ebx, 0
	L1:
		mov eax, 0
		mov al, postfixQuery[edx]
		call IsDigit
		jnz notDigit
		sub al, 48
		movsx bx, al
		push bx
		jmp nextLoop
		notDigit:
		cmp al, addition
		je addNums
		cmp al, subtraction
		je subNums
		cmp al, multiplication
		je mulNums
		cmp al, division
		je divNums
		jmp nextLoop
		addNums:
			pop ax
			pop bx
			add ax, bx
			mov result, ax
			push result
			jmp nextLoop
		subNums:
			pop ax
			pop bx
			sub ax, bx
			mov result, ax
			push result
			jmp nextLoop
		mulNums:
			pop ax
			pop bx
			mov esi, edx
			mul bx
			mov edx, esi
			mov result, ax
			push result
			jmp nextLoop
		divNums:
			pop ax
			pop temp
			mov bl, BYTE PTR temp
			div bl
			movsx ax, ah
			mov result, ax
			push result
			jmp nextLoop
		nextLoop:
			inc edx
	dec ecx
	cmp ecx, 0
	jne L1
	movsx eax, result
	call WriteDec
	exit
main ENDP
END main 
