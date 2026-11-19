INCLUDE Irvine32.inc

.data
cartons WORD 36
perCarton WORD 28
defective WORD 47
perBox WORD 20

msgTotal BYTE "Total Headphones Received: ", 0
msgUsable BYTE "Usable Headphones: ", 0
msgBoxes BYTE "Complete Shipping Boxes: ", 0
msgRem BYTE "Remaining Unpacked Headphones: ", 0

.code
main PROC
    mov ax, cartons
    mul perCarton
    mov bx, ax

    sub ax, defective
    mov cx, ax

    mov dx, 0
    div perBox
    mov si, ax
    mov di, dx

    mov edx, OFFSET msgTotal
    call WriteString
    movzx eax, bx
    call WriteDec
    call Crlf

    mov edx, OFFSET msgUsable
    call WriteString
    movzx eax, cx
    call WriteDec
    call Crlf

    mov edx, OFFSET msgBoxes
    call WriteString
    movzx eax, si
    call WriteDec
    call Crlf

    mov edx, OFFSET msgRem
    call WriteString
    movzx eax, di
    call WriteDec
    call Crlf

    exit
main ENDP
END main
