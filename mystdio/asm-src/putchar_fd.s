%include "include/volatile.inc"
DEFAULT REL
SECTION .bss
    Buffer RESB 1
SECTION .text
    GLOBAL PutcharFd
    EXTERN write
PutcharFd:
	REG_PUSH
    MOV [Buffer], DIL
    MOV RDI, RSI
    LEA RSI, [Buffer]
    MOV RDX, 1
    SUB RSP, 32
    CALL write
    ADD RSP, 32
	REG_POP
    RET
