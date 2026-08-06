DEFAULT REL
%include "include/volatile.inc"
SECTION .bss
    Text RESQ 1
SECTION .text
    GLOBAL StrIteri
StrIteri:
    CMP RDI, 0
    JE done
    CMP RSI, 0
    JE done
    REG_PUSH
    XOR R8, R8
    MOV [Text], RDI
    MOV R9, RDI
	MOV R10, RSI
transfer:
    CMP BYTE [R9], 0
    JE restore
    MOV RDI, R8
    MOV RSI, R9
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
