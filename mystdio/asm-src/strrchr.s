SECTION .text
GLOBAL StrrChr
StrrChr:
	XOR EAX, EDI
search:
	CMP BYTE [RDI], SIL
	CMOVE RAX, RDI
	CMP BYTE [RDI], 0
	JE done
	INC RDI
	JMP search
done:
	RET
