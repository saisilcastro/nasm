GLOBAL IsPrint
SECTION .text
IsPrint:
    MOV RAX, 0
    CMP RDI, 32
    JL done
    CMP RDI, 126
    JG done
    MOV RAX, 16384
done:
    RET
