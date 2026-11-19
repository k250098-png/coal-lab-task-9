INCLUDE Irvine32.inc

.data
temp SBYTE -24
msgSAR BYTE "SAR Result (Signed): ", 0
msgSHR BYTE "SHR Result (Unsigned): ", 0
msgExp BYTE "SAR preserves the sign bit (MSB=1) for signed division, whereas SHR fills MSB with 0 treating it as unsigned.", 0

.code
main PROC
    mov al, temp
    mov bl, temp

    sar al, 1
    shr bl, 1

    mov edx, OFFSET msgSAR
    call WriteString
    movsx eax, al
    call WriteInt
    call Crlf

    mov edx, OFFSET msgSHR
    call WriteString
    movzx eax, bl
    call WriteDec
    call Crlf

    mov edx, OFFSET msgExp
    call WriteString
    call Crlf

    exit
main ENDP
END main
