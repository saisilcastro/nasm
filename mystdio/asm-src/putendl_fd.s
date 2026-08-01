%include "include/volatile.inc"
SECTION .TEXT
    GLOBAL PutendlFd
    EXTERN PutcharFd
PutendlFd:
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
	MOV CL, 10
	MOV RDX, R9
	CALL PutcharFd
    REG_POP
    RET
