INCLUDE Irvine32.inc

.data   
string BYTE "farasat khan", 0

.code
main PROC  

        mov ecx, (LENGTHOF string) – 1
        mov ebx, 0
        L1:
            mov al, string[ebx]

            xor al, 32

            call WriteChar

            inc ebx

        loop L1
        exit

main ENDP
END main
