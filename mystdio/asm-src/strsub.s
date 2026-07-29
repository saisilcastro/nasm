%include "include/volatile.inc"
SECTION .TEXT
GLOBAL StrSub
EXTERN StrLen
EXTERN MemCpy
EXTERN malloc
StrSub:
    CALL StrLen
    CMP RDX, RAX
    JGE justnull
    REG_PUSH
    LEA R10, [RDX + R8]
    CMP R10, RAX
    JG resize
alloc:
    REG_PUSH
    LEA RCX, [R8 + 1]
    SUB RSP, 32
    CALL malloc
    ADD RSP, 32
    REG_POP
    CMP RAX, 0
    JE error
    LEA R10, [RAX + R8]
    MOV BYTE [R10], 0
    MOV R10, RDX
    MOV RDX, RCX
    ADD RDX, R10
    MOV RCX, RAX
    CALL MemCpy
    REG_POP
    RET
resize:
    MOV R8, RAX
    SUB R8, RDX
    JMP alloc
error:
    REG_POP
    XOR EAX, EAX
    RET
justnull:
    REG_PUSH
    MOV RCX, 1
    SUB RSP, 32
    CALL malloc
    ADD RSP, 32
    REG_POP
    CMP RAX, 0
    JE done
    MOV BYTE [RAX], 0
done:
    RET
