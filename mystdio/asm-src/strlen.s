SECTION .TEXT
GLOBAL StrLen
StrLen:
	MOV RAX, RCX
count:
	CMP BYTE [RAX], 0
	JE done
	INC RAX
	JMP count
done:
	SUB RAX, RCX
	RET
