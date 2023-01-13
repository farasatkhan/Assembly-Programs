INCLUDE Irvine32.inc

.data
arrayIntegers BYTE 1,2,3,4,5,6,7,8,9,10

arrayCharacters BYTE 100 DUP('A')

array2DCharacters BYTE 4 DUP(3 DUP(0))

array3DCharacters BYTE 4 DUP(3 DUP(2 DUP(0)))

.code
main PROC
	call Clrscr
	mov eax, LENGTHOF arrayIntegers
	mov ebx, LENGTHOF arrayCharacters
	mov ecx, LENGTHOF array2DCharacters
	mov edx, LENGTHOF array3DCharacters

	call DumpRegs

	INVOKE ExitProcess, 0
main ENDP
END main
