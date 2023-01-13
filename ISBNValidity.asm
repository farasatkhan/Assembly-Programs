INCLUDE Irvine32.inc

.data
ISBN		BYTE "0-201-53082-1", 0
store		BYTE 0
validISBN   BYTE " ISBN is valid", 0
invalidISBN BYTE " ISBN is invalid", 0

.code
main PROC
	mov ecx, (LENGTHOF ISBN) - 1
	mov edx, 10
	
	mov ebx, 0
	L1:
		mov eax, 0
		mov al, ISBN[ebx]
		call IsDigit
		jnz notDigit
		mov esi, edx
		sub al, 48
		mul edx
		mov edx, esi
		dec edx
		add store, al
		notDigit:
		inc ebx
	loop L1
	mov al, 0
	mov al, store
	mov bl, 11
	div bl
	mov edx, OFFSET ISBN
	call WriteString
	cmp ah, 0
	je valid
	mov edx, OFFSET invalidISBN
	call WriteString
	jmp completed
	valid:
	mov edx, OFFSET validISBN
	call WriteString
	completed:
	exit
main ENDP
END main
