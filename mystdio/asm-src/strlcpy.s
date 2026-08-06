SECTION .text
GLOBAL StrlCpy
EXTERN StrLen
EXTERN MemCpy
StrlCpy:
	PUSH RDX
	PUSH R9
	PUSH R10
	PUSH RSI
	PUSH RDI
	MOV RDI, RSI
	CALL StrLen
	CMP RDX, 0
	JE pop_first
	LEA R9, [RDX - 1]
	CMP RAX, R9
	CMOVE R9, RAX
	POP RDI
	LEA R10, [RDI + R9]
	MOV BYTE [R10], 0
	MOV RDX, R9
	PUSH RAX
	CALL MemCpy
	POP RAX
	JMP done
pop_first:
	POP RDI
done:
	POP RSI
	POP R10
	POP R9
	POP RDX
	RET
