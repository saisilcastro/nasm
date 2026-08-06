GLOBAL MemCmp
SECTION .text
MemCmp:
	MOV RAX, 0
isequal:
	CMP RDX, 0
	JE equal
	MOV R10B, BYTE [RDI]
	CMP R10B, BYTE [RSI]
	JL lesser
	JG bigger
	INC RDI
	INC RSI
	DEC RDX
	JMP isequal
lesser:
	MOV RAX, -1
bigger:
	MOV RAX, 1
equal:
	RET
