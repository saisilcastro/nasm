GLOBAL ToLower
SECTION .text
ToLower:
    MOV RDI, RAX
    CMP RDI, 0x41
    JL done
    CMP RDI, 0x5A
    JG done
    ADD RAX, 32
done:
    RET
