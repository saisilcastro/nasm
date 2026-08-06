GLOBAL MemCpy
SECTION .text
MemCpy:
	PUSH RSI
	PUSH RDI
	PUSH R10
	PUSH RDX
    MOV RAX, RDI
process:
    CMP RDX, 0
	JE done
	MOVZX R10, BYTE [RSI]
	MOV BYTE [RDI], R10B
	INC RSI
	INC RDI
	DEC RDX
	JMP process
done:
	POP RDX
	POP R10
	POP RDI
	POP RSI
	RET
