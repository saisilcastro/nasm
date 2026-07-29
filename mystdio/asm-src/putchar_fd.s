%include "include/volatile.inc"
DEFAULT REL
SECTION .bss
    Buffer RESB 1
SECTION .TEXT
    GLOBAL PutcharFd
    EXTERN write
PutcharFd:
	REG_PUSH
    MOV [Buffer], CL
    MOV RCX, RDX
    LEA RDX, [Buffer]
    MOV R8, 1
    SUB RSP, 32
    CALL write
    ADD RSP, 32
	REG_POP
    RET
