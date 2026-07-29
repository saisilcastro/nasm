GLOBAL Atoi
SECTION .text

Atoi:
    MOV RAX, 0
    MOV R10, 1

seekspace:
    CMP BYTE [RCX], 0x09
    JB pluscheck
    CMP BYTE [RCX], 0x0D
    JBE nextbyte
    CMP BYTE [RCX], 0x20
    JNE pluscheck
nextbyte:
    INC RCX
    JMP seekspace

pluscheck:
    CMP BYTE [RCX], '+'
    JE hassignal
minuscheck:
    CMP BYTE [RCX], '-'
    JNE convert
    MOV R10, -1

hassignal:
    INC RCX

convert:
    CMP BYTE [RCX], 0x30
    JB done
    CMP BYTE [RCX], 0x39
    JA done

    MOVZX R11, BYTE [RCX]
    SUB R11, 0x30
    IMUL RAX, RAX, 10
    ADD RAX, R11

    INC RCX
    JMP convert

done:
    IMUL RAX, R10
    RET
