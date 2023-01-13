INCLUDE Irvine32.inc

.data
array DWORD 4,3,1,5,6,9,2

.code
main PROC
	mov edi, OFFSET array
	mov ecx, (SIZEOF array) / (TYPE array)
	sub ecx, 1

	mov eax, [edi]
	mov ebx, [edi]

	L1:
		cmp eax, [edi]
		jle skip_move_smallest
		mov eax, [edi]
		skip_move_smallest:
		cmp ebx, [edi]
		jge skip_move_largest
		mov ebx, [edi]
		skip_move_largest:
			add edi, TYPE array
	loop L1

	Invoke ExitProcess, 0
main ENDP
END main
