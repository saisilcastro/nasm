DEFAULT REL
%include "include/volatile.inc"
SECTION .bss
    Text RESQ 1
SECTION .TEXT
    GLOBAL StrIteri
StrIteri:
    CMP RCX, 0
    JE done
    CMP RDX, 0
    JE done
    REG_PUSH
    XOR R8, R8
    MOV [Text], RCX
    MOV R9, RCX
	MOV R10, RDX
transfer:
    CMP BYTE [R9], 0
    JE restore
    MOV RCX, R8
    MOV RDX, R9
    REG_PUSH
    SUB RSP, 32
    CALL R10
    ADD RSP, 32
    REG_POP
    INC R8
	INC R9
    JMP transfer
restore:
    REG_POP
done:
    RET
