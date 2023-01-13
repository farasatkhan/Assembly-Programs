INCLUDE Irvine32.inc

.data
.code
main PROC
	mov eax, 1
	mov ebx, 0
	mov edx, 1
	mov ecx, 6

	L1:
		mov eax, ebx
		add eax, edx
		call DumpRegs

		mov ebx, edx
		mov edx, eax
	loop L1

	INVOKE ExitProcess, 0
main ENDP
END main
