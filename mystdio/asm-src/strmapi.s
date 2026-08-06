DEFAULT REL
%include "include/volatile.inc"
SECTION .bss
	Len RESQ 1
	Func RESQ 1
SECTION .text
	GLOBAL StrMapi
	EXTERN StrLen
	EXTERN malloc
StrMapi:
	REG_PUSH
	CMP RDI, 0
	JE error
	CMP RSI, 0
	JE error
	CALL StrLen
	MOV [Len], RAX
	MOV [Func], RSI
	REG_PUSH
	LEA RDI, [RAX + 1]
	SUB RSP, 32
	CALL malloc
	ADD RSP, 32
	REG_POP
	CMP RAX, 0
	JE error
	MOV R8, [Len]
	MOV BYTE [RAX + R8], 0
	XOR R8, R8
	MOV R9, RAX
	MOV R10, RDI
transfer:
	CMP R8, [Len]
	JE done
	MOV RDI, R8
	MOV SIL, BYTE [R10 + R8]
	REG_PUSH
	SUB RSP, 32
	CALL [Func]
	ADD RSP, 32
	REG_POP
	MOV BYTE [R9 + R8], AL
	INC R8
	JMP transfer
done:
	MOV RAX, R9
	REG_POP
	RET
error:
	REG_POP
	XOR RAX, RAX
	RET
