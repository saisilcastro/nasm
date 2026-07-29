GLOBAL MemCmp
SECTION .TEXT
MemCmp:
	MOV RAX, 0
isequal:
	CMP R8, 0
	JE equal
	MOVZX R10, BYTE [RCX]
	MOVZX R11, BYTE [RDX]
	CMP R10, R11
	JL lesser
	JG bigger
	INC RCX
	INC RDX
	DEC R8
	JMP isequal
lesser:
	MOV RAX, -1
bigger:
	MOV RAX, 1
equal:
	RET
