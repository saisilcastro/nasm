GLOBAL IsAlpha
SECTION .TEXT
IsAlpha:
    MOV RAX, 0
    CMP RCX, 0x41
    JL done
    CMP RCX, 0x5A
    JLE inside
    CMP RCX, 0x61
    JL done
    CMP RCX, 0x7A
    JG done
inside:
    MOV RAX, 1024
done:
    RET
