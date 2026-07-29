GLOBAL IsDigit
SECTION .TEXT
IsDigit:
    MOV RAX, 0
    CMP RCX, 0x30
    JL done
    CMP RCX, 0x39
    JG done
    MOV RAX, 2048
done:
    RET
