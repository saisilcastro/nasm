GLOBAL IsAlnum
SECTION .text
IsAlnum:
    MOV RAX, 0
    CMP RDI, 0x30
    JL done
    CMP RDI, 0x39
    JLE inside
    CMP RDI, 0x41
    JL done
    CMP RDI, 0x5A
    JLE inside
    CMP RDI, 0x61
    JL done
    CMP RDI, 0x7A
    JG done
inside:
    MOV RAX, 8
done:
    RET
