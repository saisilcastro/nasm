GLOBAL Atoi
SECTION .text

Atoi:
    MOV RAX, 0
    MOV R10, 1

seekspace:
    CMP BYTE [RDI], 0x09
    JB pluscheck
    CMP BYTE [RDI], 0x0D
    JBE nextbyte
    CMP BYTE [RDI], 0x20
    JNE pluscheck
nextbyte:
    INC RDI
    JMP seekspace

pluscheck:
    CMP BYTE [RDI], '+'
    JE hassignal
minuscheck:
    CMP BYTE [RDI], '-'
    JNE convert
    MOV R10, -1

hassignal:
    INC RDI

convert:
    CMP BYTE [RDI], 0x30
    JB done
    CMP BYTE [RDI], 0x39
    JA done

    MOVZX R11, BYTE [RDI]
    SUB R11, 0x30
    IMUL RAX, RAX, 10
    ADD RAX, R11

    INC RDI
    JMP convert

done:
    IMUL RAX, R10
    RET
