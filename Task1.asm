INCLUDE Irvine32.inc

.data
statusCode BYTE 3Ah
msgByte BYTE "Final Byte (Hex): ", 0
msgCF BYTE "Final Carry Flag: ", 0

.code
main PROC
    xor eax, eax
    mov al, statusCode
    rol al, 3
    clc
    rcl al, 1
    ror al, 4

    mov bl, al
    mov dl, '0'
    jnc skipSet
    mov dl, '1'
skipSet:

    mov edx, OFFSET msgByte
    call WriteString
    movzx eax, bl
    call WriteHex
    call Crlf

    mov edx, OFFSET msgCF
    call WriteString
    mov al, '0'
    jc printOne
    jmp printCF
printOne:
    mov al, '1'
printCF:
    call WriteChar
    call Crlf

    exit
main ENDP
END main
