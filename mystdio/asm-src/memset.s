GLOBAL MemSet
SECTION .TEXT
MemSet:
	MOV RAX, RCX
transfer:
	CMP R8, 0
	JE done
	MOV BYTE [RCX], DL
	INC RCX
	DEC R8
	JMP transfer
done:
	RET
