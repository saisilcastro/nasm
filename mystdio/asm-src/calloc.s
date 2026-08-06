%include "include/volatile.inc"

SECTION .text
    GLOBAL Calloc
    EXTERN malloc
    EXTERN bZero

Calloc:
    REG_PUSH
    MOV RAX, RDI
    MUL RSI
    JO overflow_error

    MOV RDI, RAX
    REG_PUSH
    SUB RSP, 32
    CALL malloc
    ADD RSP, 32
    REG_POP

    CMP RAX, 0
    JE done

    MOV RSI, RDI
    MOV RDI, RAX
    CALL bZero
    JMP done

overflow_error:
    XOR RAX, RAX

done:
    REG_POP
    RET
