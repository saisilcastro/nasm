SECTION .text
GLOBAL StrnStr
StrnStr:
	MOV RAX, 0
search:
	CMP RDX, 0
	JE done
	CMP BYTE [RDI], 0
	JE done
	MOVZX R11, BYTE [RSI]
	CMP BYTE [RDI], R11B
	JE first
	INC RDI
	DEC RDX
	JMP search
first:
	MOV R9, RDX
	MOV R10, RDI
	MOV R11, RSI
matching:
	MOVZX RAX, BYTE [R11]
	CMP AL, 0
	JE verify
	CMP BYTE [RDI], 0
	JE verify
	CMP R12, 0
	JE verify
	CMP BYTE [RDI], AL
	JNE verify
	INC RDI
	INC R11
	DEC R9
	JMP matching
verify:
	CMP BYTE [R11], 0
	JE found
	LEA RDI, [R10 + 1]
	DEC RDX
	JMP search
found:
	MOV RAX, R10
done:
	RET
