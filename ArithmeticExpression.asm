INCLUDE Irvine32.inc

.data
 val1  SDWORd 3
 val2  SDWORD -7
 val3  SDWORD 4
 result SDWORD ?

.code
main PROC
	mov eax, val2	; eax = -7
	neg eax		; eax = 7
	add eax, 7		; eax = 7 + 7 = 14

	mov ebx, val3	; ebx = 4
	add ebx, val1	; ebx = 4 + 3 = 7

	sub eax,ebx		; eax= 14 - 7 = 7

	mov result, eax 	; result = 7
	call DumpRegs

	INVOKE ExitProcess, 0

main ENDP
END main
