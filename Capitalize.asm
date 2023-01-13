INCLUDE Irvine32.inc

Str_ucase PROTO,
	pString:PTR BYTE

.data
string_1 BYTE "farasat ",0
string_2 BYTE "khan",0

.code
main PROC
	
	INVOKE Str_ucase,ADDR string_1

	mov edx, OFFSET string_1
	call WriteString

	INVOKE Str_ucase,ADDR string_2

	mov edx, OFFSET string_2
	call WriteString

	exit
main ENDP
END main
