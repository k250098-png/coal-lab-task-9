INCLUDE Irvine32.inc

.data
msgByte BYTE "Final Byte (Hex): ", 0
msgCF BYTE "Final Carry Flag: ", 0

.code
main PROC
    mov al, 5Dh
    rol al, 2
    stc
    rcr al, 1
    cmc

    mov bl, al
    mov bh, '0'
    jnc displayOutput
    mov bh, '1'

displayOutput:
    mov edx, OFFSET msgByte
    call WriteString
    movzx eax, bl
    call WriteHex
    call Crlf

    mov edx, OFFSET msgCF
    call WriteString
    mov al, bh
    call WriteChar
    call Crlf

    exit
main ENDP
END main
