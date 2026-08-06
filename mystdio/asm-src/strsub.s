%include "include/volatile.inc"
SECTION .text
GLOBAL StrSub
EXTERN StrLen
EXTERN MemCpy
EXTERN malloc
StrSub:
    CALL StrLen
    CMP RSI, RAX
    JGE justnull
    REG_PUSH
    LEA R10, [RSI + RDX]
    CMP R10, RAX
    JG resize
alloc:
    REG_PUSH
    LEA RDI, [RDX + 1]
    SUB RSP, 32
    CALL malloc
    ADD RSP, 32
    REG_POP
    CMP RAX, 0
    JE error
    LEA R10, [RAX + RDX]
    MOV BYTE [R10], 0
	MOV R10, RSI
    MOV RSI, RDI
    ADD RSI, R10
    MOV RDI, RAX
    CALL MemCpy
    REG_POP
    RET
resize:
    MOV R8, RAX
    SUB R8, RSI
    JMP alloc
error:
    REG_POP
    XOR EAX, EAX
    RET
justnull:
    REG_PUSH
    MOV RDI, 1
    SUB RSP, 32
    CALL malloc
    ADD RSP, 32
    REG_POP
    CMP RAX, 0
    JE done
    MOV BYTE [RAX], 0
done:
    RET
