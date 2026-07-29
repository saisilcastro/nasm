GLOBAL IsAlnum
SECTION .TEXT
IsAlnum:
    MOV RAX, 0
    CMP RCX, 0x30
    JL done
    CMP RCX, 0x39
    JLE inside
    CMP RCX, 0x41
    JL done
    CMP RCX, 0x5A
    JLE inside
    CMP RCX, 0x61
    JL done
    CMP RCX, 0x7A
    JG done
inside:
    MOV RAX, 8
done:
    RET
