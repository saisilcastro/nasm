SECTION .TEXT
GLOBAL StrnStr
StrnStr:
	MOV RAX, 0
search:
	CMP R8, 0
	JE done
	CMP BYTE [RCX], 0
	JE done
	MOVZX R11, BYTE [RDX]
	CMP BYTE [RCX], R11B
	JE first
	INC RCX
	DEC R8
	JMP search
first:
	MOV R9, R8
	MOV R10, RCX
	MOV R11, RDX
matching:
	MOVZX RAX, BYTE [R11]
	CMP AL, 0
	JE verify
	CMP BYTE [RCX], 0
	JE verify
	CMP R12, 0
	JE verify
	CMP BYTE [RCX], AL
	JNE verify
	INC RCX
	INC R11
	DEC R9
	JMP matching
verify:
	CMP BYTE [R11], 0
	JE found
	LEA RCX, [R10 + 1]
	DEC R8
	JMP search
found:
	MOV RAX, R10
done:
	RET
