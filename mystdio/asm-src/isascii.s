GLOBAL IsAscii
SECTION .text
IsAscii:
    MOV RAX, 0
    CMP RDI, 0
    JL done
    CMP RDI, 127
    JG done
    MOV RAX, 1
done:
    RET
