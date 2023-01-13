INCLUDE Irvine32.inc

.data
number DWORD 37

.code
main PROC
	mov edx, 0
	mov eax, number
	and eax, 1

	jnz odd
		mov dl, 'Y'
		mov al, dl
		call WriteChar
		jmp end_program
	odd:
		mov dl, 'N'
		mov al, dl
		call WriteChar
	end_program:
	Invoke ExitProcess, 0
main ENDP
END main
