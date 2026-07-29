SECTION .TEXT
GLOBAL StrrChr
StrrChr:
	XOR EAX, ECX
search:
	CMP BYTE [RCX], DL
	CMOVE RAX, RCX
	CMP BYTE [RCX], 0
	JE done
	INC RCX
	JMP search
done:
	RET
