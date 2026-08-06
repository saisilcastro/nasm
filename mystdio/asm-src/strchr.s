GLOBAL StrChr
SECTION .text
StrChr:
	PUSH RDI
	MOV RAX, 0
search:
	CMP BYTE [RDI], SIL
	JE transfer
	CMP BYTE [RDI], 0
	JE done
	INC RDI
	JMP search
transfer:
	MOV RAX, RDI
done:
	POP RDI
	RET
