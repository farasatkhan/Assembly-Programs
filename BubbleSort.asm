INCLUDE Irvine32.inc

.data
array DWORD 9,8,7,6,5,4,3,2,1

.code
main PROC
	mov ecx, (SIZEOF array) / (TYPE array)
	sub ecx, 1
	mov esi, 0

	L1:
		mov edi, OFFSET array
		mov eax, ecx
		mov ecx, (SIZEOF array) / (TYPE array)
		sub ecx, esi
		sub ecx, 1

		L2:
			mov ebx, [edi]
			cmp ebx, [edi + 4]
			jle step_over
				xchg ebx, [edi + 4]
				mov [edi], ebx
			step_over:
			add edi, TYPE array

		loop L2
		mov ecx, eax
		inc esi
	loop L1

	Invoke ExitProcess, 0
main ENDP
END main
