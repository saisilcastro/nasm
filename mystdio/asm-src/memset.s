GLOBAL MemSet
SECTION .text
MemSet:
	MOV RAX, RDI
transfer:
	CMP RDX, 0
	JE done
	MOV BYTE [RDI], SIL
	INC RDI
	DEC RDX
	JMP transfer
done:
	RET
