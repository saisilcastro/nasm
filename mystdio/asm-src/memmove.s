GLOBAL MemMove
SECTION .TEXT
MemMove:
	MOV RAX, RCX
	CMP RCX, RDX
	JA backward
forward:
	CMP R8, 0
	JE done
	MOVZX R10, BYTE [RDX]
	MOV BYTE [RCX], R10B
	INC RCX
	INC RDX
	DEC R8
	JMP forward
backward:
	ADD RCX, R8
	ADD RDX, R8
decrease:
	CMP R8, 0
	JE done
	MOVZX R10, BYTE [RDX - 1]
	MOV BYTE [RCX - 1], R10B
	DEC RCX
	DEC RDX
	DEC R8
	JMP decrease
done:
	RET
