SECTION .TEXT
GLOBAL bZero
bZero:
    PUSH RDX
    PUSH RCX
    CMP RDX, 0
    JE done
clear:
    MOV BYTE [RCX], 0
    INC RCX
    DEC RDX
    JNZ clear
done:
    POP RCX
    POP RDX
    RET
