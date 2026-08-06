GLOBAL MemMove
SECTION .text
MemMove:
	MOV RAX, RDI
	CMP RDI, RSI
	JA backward
forward:
	CMP RDX, 0
	JE done
	MOVZX R10, BYTE [RSI]
	MOV BYTE [RDI], R10B
	INC RDI
	INC RSI
	DEC RDX
	JMP forward
backward:
	ADD RDI, RDX
	ADD RSI, RDX
decrease:
	CMP RDX, 0
	JE done
	MOVZX R10, BYTE [RSI - 1]
	MOV BYTE [RDI - 1], R10B
	DEC RDI
	DEC RSI
	DEC RDX
	JMP decrease
done:
	RET
