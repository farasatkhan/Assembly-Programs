INCLUDE Irvine32.inc

.data
minRange BYTE "52413"
maxRange BYTE "95846"

validPin BYTE "52413"
invalidPin BYTE "64537"

.code
main PROC
	mov edi, OFFSET validPin

	mov edx, 0
	mov ecx, 5

	L1:
		mov bl, minRange[edx]
		cmp [edi], bl
		jl terminate
		mov bl, maxRange[edx]
		cmp [edi], bl
		jg terminate
		add edi, TYPE validPin
		inc edx
	loop L1

	mov eax, 0
	jmp valid

	terminate:
		mov eax, edx
		add eax, 1

	valid:
	Invoke ExitProcess, 0
main ENDP
END main
