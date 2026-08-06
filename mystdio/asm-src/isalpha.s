GLOBAL IsAlpha
SECTION .text
IsAlpha:
    MOV RAX, 0
    CMP RDI, 0x41
    JL done
    CMP RDI, 0x5A
    JLE inside
    CMP RDI, 0x61
    JL done
    CMP RDI, 0x7A
    JG done
inside:
    MOV RAX, 1024
done:
    RET
