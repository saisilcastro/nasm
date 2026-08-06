GLOBAL IsDigit
SECTION .text
IsDigit:
    MOV RAX, 0
    CMP RDI, 0x30
    JL done
    CMP RDI, 0x39
    JG done
    MOV RAX, 2048
done:
    RET
