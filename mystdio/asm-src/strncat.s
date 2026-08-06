SECTION .text
GLOBAL StrnCat
EXTERN StrLen
StrnCat:
	PUSH R11
	PUSH R10
	CALL StrLen
	MOV R10, RDI
	ADD R10, RAX
copy:
	CMP RDX, 0
	JE GetNull
	MOV R11B, BYTE [RSI]
	MOV BYTE [R10], R11B
	CMP BYTE [R10], 0
	JE done
	INC RSI
	INC R10
	DEC RDX
	JMP copy
GetNull:
	MOV BYTE [R10], 0
done:
	POP R10
	POP R11
	MOV RAX, RDI
	RET
