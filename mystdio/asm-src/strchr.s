GLOBAL StrChr
SECTION .TEXT
StrChr:
	PUSH RCX
	MOV RAX, 0
search:
	CMP BYTE [RCX], DL
	JE transfer
	CMP BYTE [RCX], 0
	JE done
	INC RCX
	JMP search
transfer:
	MOV RAX, RCX
done:
	POP RCX
	RET
