GLOBAL ToUpper
SECTION .text
ToUpper:
    MOV RAX, RDI
    CMP RDI, 0x61
    JL done
    CMP RDI, 0x7A
    JG done
    SUB RAX, 32
done:
    RET
