GLOBAL ToUpper
SECTION .TEXT
ToUpper:
    MOV RAX, RCX
    CMP RCX, 0x61
    JL done
    CMP RCX, 0x7A
    JG done
    SUB RAX, 32
done:
    RET
