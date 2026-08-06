SECTION .text
GLOBAL StrLen
StrLen:
	MOV RAX, RDI
count:
	CMP BYTE [RAX], 0
	JE done
	INC RAX
	JMP count
done:
	SUB RAX, RDI
	RET
