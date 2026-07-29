%include "include/volatile.inc"
SECTION .TEXT
GLOBAL Itoa
EXTERN malloc
Itoa:
    REG_PUSH
    MOV R10D, 10
    XOR R9, R9
    MOV R8D, 1
    MOV EAX, ECX
    CMP EAX, 0
    JGE count
    NEG R8D
    NEG EAX
count:
    XOR RDX, RDX
    DIV R10D
    ADD RDX, 0x30
    PUSH RDX
    INC R9
    CMP EAX, 0
    JNE count
    XOR R10, R10
    CMP R8D, 1
    JE alloc
    INC R10
alloc:
    LEA R10, [R9 + R10]
    LEA RCX, [R10 + 1]
    MOV RAX, R10
    REG_PUSH
    SUB RSP, 32
    CALL malloc
    ADD RSP, 32
    REG_POP
    CMP RAX, 0
    JE clear_stack
    MOV R11, RAX
    CMP R8D, 1
    JE nosign
    MOV BYTE [R11], '-'
    INC R11
    DEC R10
nosign:
    ADD R11, R10
    MOV BYTE [R11], 0
    SUB R11, R10
transfer:
    POP RDX
    MOV BYTE [R11], DL
    INC R11
    DEC R9
    JNZ transfer
done:
    REG_POP
    RET
clear_stack:
    LEA RSP, [RSP + R9 * 8]
    JMP done
