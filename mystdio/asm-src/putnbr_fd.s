%include "include/volatile.inc"
SECTION .TEXT
	GLOBAL PutnbrFd
	EXTERN PutcharFd
PutnbrFd:
	REG_PUSH
	MOV R10D, 10
	XOR R9, R9
	MOV R8, RDX
	MOV EAX, ECX
	CMP ECX, 0
	JGE backward
	PUSH RAX
	MOV CL, '-'
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
	MOV RAX, R9
	MOV RDX, R8
print:
	POP R11
	MOVZX RCX, R11B
	CALL PutcharFd
	DEC R9
	CMP R9, 0
	JNE print
	REG_POP
	RET
