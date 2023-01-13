INCLUDE Irvine32.inc

.data
multiDimensionalArray	BYTE  1h,  2h,  3h,  4h,  5h
				BYTE  6h,  7h,  8h,  9h,  0Ah
				BYTE  0Bh, 0Ch, 0Dh, 0Eh, 0Fh
msg1				BYTE "Enter the row number: ",0
msg2				BYTE "The sum is: ",0
RowSize = 5

.code
main PROC

	mov	edx,OFFSET msg1		
	call	WriteString
	call	Readint				

	mov	ebx,OFFSET multiDimensionalArray
	mov	ecx,RowSize
	call	calc_row_sum			   
	mov	edx,OFFSET msg2		
	call	WriteString
	call	WriteHex				
	call	Crlf

	exit
main ENDP


calc_row_sum PROC uses ebx ecx edx esi

	mul	ecx			
	add	ebx,eax		
	mov	eax,0		
	mov	esi,0		

L1:	movzx edx,BYTE PTR[ebx + esi]		
	add	eax,edx					
	inc	esi						
	loop	L1

	ret
calc_row_sum ENDP

END main
