SECTION .text
GLOBAL StrnCmp
StrnCmp:
	MOV RAX, 0
search:
	CMP RDX, 0
	JE done
	CMP BYTE [RDI], 0
	JE sub
	CMP BYTE [RSI], 0
	JE sub
	MOV R10B, BYTE [RSI]
	CMP BYTE [RDI], R10B
	JNE sub
	INC RDI
	INC RSI
	DEC RDX
	JMP search
sub:
	MOVZX RAX, BYTE [RDI]
	MOVZX RSI, BYTE [RSI]
	SUB RAX, RSI
done:
	RET
