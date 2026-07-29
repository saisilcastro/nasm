GLOBAL ToLower
SECTION .TEXT
ToLower:
    MOV RCX, RAX
    CMP RCX, 0x41
    JL done
    CMP RCX, 0x5A
    JG done
    ADD RAX, 32
done:
    RET
