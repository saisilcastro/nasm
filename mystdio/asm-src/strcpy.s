GLOBAL StrCpy
SECTION .text
StrCpy:
	MOV RAX, RDI
copy:
	CMP BYTE [RSI], 0
	JE done
	MOV AL, [RSI]
	MOV [RDI], AL
	INC RDI
	INC RSI
	JMP copy
done:
	MOV BYTE [RDI], 0
	RET
