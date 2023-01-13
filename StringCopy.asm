INCLUDE Irvine32.inc

.data
sourceString BYTE "This is the source string", 0 
targetString BYTE SIZEOF sourceString DUP(?) 

.code
main PROC
	mov esi, (OFFSET sourceString) + (SIZEOF sourceString) - 2
	mov edi, OFFSET targetString
	mov ecx, SIZEOF sourceString

	L1:
		mov al, [esi]
		mov [edi], al

		dec esi
		inc edi
	loop L1
 
	mov esi, OFFSET targetString
	mov ebx, 1
	mov ecx, SIZEOF targetString - 1
	call Dumpmem

	INVOKE ExitProcess, 0

main ENDP
END main
