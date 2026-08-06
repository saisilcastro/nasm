%include "include/volatile.inc"
SECTION .text
    GLOBAL PutstrFd
    EXTERN PutcharFd
PutstrFd:
    REG_PUSH
    MOV R8, RDI
    MOV R9, RSI
print:
    CMP BYTE [R8], 0
    JE done
	MOV DIL, BYTE [R8]
    MOV RSI, R9
    CALL PutcharFd
    INC R8
    JMP print
done:
    REG_POP
    RET
