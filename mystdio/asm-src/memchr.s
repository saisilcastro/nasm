GLOBAL MemChr
SECTION .text
MemChr:
	MOV RAX, 0
search:
	CMP RDX, 0
	JE done
	CMP BYTE [RDI], SIL
	JE transfer
	INC RDI
	DEC RDX
	JMP search
transfer:
	MOV RAX, RDI
done:
	RET
