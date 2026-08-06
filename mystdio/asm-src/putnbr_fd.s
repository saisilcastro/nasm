%include "include/volatile.inc"
SECTION .text
	GLOBAL PutnbrFd
	EXTERN PutcharFd
PutnbrFd:
	REG_PUSH
	MOV R10D, 10
	XOR R9, R9
	MOV R8, RSI
	MOV EAX, EDI
	CMP EAX, 0
	JGE backward
	PUSH RAX
	MOV DIL, '-'
	CALL PutcharFd
	POP RAX
	NEG EAX
backward:
	XOR RDX, RDX
	DIV R10D
	ADD RDX, 0x30
	PUSH RDX
	INC R9
	CMP RAX, 0
	JNE backward
	MOV RSI, R8
print:
	POP RDI
	CALL PutcharFd
	DEC R9
	CMP R9, 0
	JNE print
	REG_POP
	RET
