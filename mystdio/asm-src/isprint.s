GLOBAL IsPrint
SECTION .TEXT
IsPrint:
    MOV RAX, 0
    CMP RCX, 32
    JL done
    CMP RCX, 126
    JG done
    MOV RAX, 16384
done:
    RET
