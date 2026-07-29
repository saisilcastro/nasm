%include "include/volatile.inc"
SECTION .TEXT
    GLOBAL PutstrFd
    EXTERN PutcharFd
PutstrFd:
    REG_PUSH
    MOV R8, RCX
    MOV R9, RDX
print:
    CMP BYTE [R8], 0
    JE done
	MOV CL, BYTE [R8]
    MOV RDX, R9
    CALL PutcharFd
    INC R8
    JMP print
done:
    REG_POP
    RET
