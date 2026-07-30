%include "include/volatile.inc"

SECTION .TEXT
    GLOBAL Calloc
    EXTERN malloc
    EXTERN bZero

Calloc:
    REG_PUSH
    MOV RAX, RCX
    MUL RDX
    JO overflow_error

    MOV RCX, RAX
    REG_PUSH
    SUB RSP, 32
    CALL malloc
    ADD RSP, 32
    REG_POP

    CMP RAX, 0
    JE done

    MOV RDX, RCX
    MOV RCX, RAX
    CALL bZero
    JMP done

overflow_error:
    XOR RAX, RAX

done:
    REG_POP
    RET
