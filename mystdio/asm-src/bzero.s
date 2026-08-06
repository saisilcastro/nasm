SECTION .text
GLOBAL bZero
bZero:
    PUSH RSI
    PUSH RDI
    CMP RSI, 0
    JE done
clear:
    MOV BYTE [RDI], 0
    INC RDI
    DEC RSI
    JNZ clear
done:
    POP RDI
    POP RSI
    RET
