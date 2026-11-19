INCLUDE Irvine32.inc

.data
correction SBYTE -101
divisor SBYTE 6
msgQ BYTE "Signed Quotient: ", 0
msgR BYTE "Signed Remainder: ", 0

.code
main PROC
    mov al, correction
    cbw
    idiv divisor

    mov bl, al
    mov bh, ah

    mov edx, OFFSET msgQ
    call WriteString
    movsx eax, bl
    call WriteInt
    call Crlf

    mov edx, OFFSET msgR
    call WriteString
    movsx eax, bh
    call WriteInt
    call Crlf

    exit
main ENDP
END main
