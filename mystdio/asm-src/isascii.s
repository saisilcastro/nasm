GLOBAL IsAscii
SECTION .TEXT
IsAscii:
    MOV RAX, 0
    CMP RCX, 0
    JL done
    CMP RCX, 127
    JG done
    MOV RAX, 1
done:
    RET
