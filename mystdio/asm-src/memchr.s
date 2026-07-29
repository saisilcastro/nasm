GLOBAL MemChr
SECTION .TEXT
MemChr:
	MOV RAX, 0
search:
	CMP R8, 0
	JE done
	CMP BYTE [RCX], DL
	JE transfer
	INC RCX
	DEC R8
	JMP search
transfer:
	MOV RAX, RCX
done:
	RET
