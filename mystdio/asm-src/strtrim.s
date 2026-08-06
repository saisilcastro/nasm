%include "include/volatile.inc"

SECTION .text
GLOBAL StrTrim
EXTERN StrLen
EXTERN StrChr
EXTERN StrlCpy
EXTERN malloc
StrTrim:
	CALL StrLen
	REG_PUSH
	PUSH R12
	MOV R12, RSI
	MOV R9, RDI
	LEA R11, [RDI + RAX]
forward:
	CMP BYTE [RDI], 0
	JE backward
	PUSH RDI
	MOVZX RSI, BYTE [RDI]
	MOV RDI, R12
	CALL StrChr
	POP RDI
	CMP RAX, 0
	JE backward
	INC RDI
	JMP forward
backward:
	CMP R11, RDI
	JE alloc
	MOVZX RSI, BYTE [R11 - 1]
	PUSH RDI
	MOV RDI, R12
	CALL StrChr
	POP RDI
	CMP RAX, 0
	JE alloc
	DEC R11
	JMP backward
alloc:
	LEA R11, [R11 + 1]
	SUB R11, RDI
	CMP R11, 0
	JE error
	REG_PUSH
	MOV RDI, R11
	SUB RSP, 32
	CALL malloc
	ADD RSP, 32
	REG_POP
	CMP RAX, 0
	JE error
	LEA RDX, [RAX + R11 - 1]
	MOV BYTE [RDX], 0
	MOV RDX, R11
	MOV RSI, RDI
	MOV R11, RAX
	MOV RDI, RAX
	CALL StrlCpy
	MOV RAX, R11
	JMP done
error:
	XOR EAX, EAX
done:
	POP R12
	REG_POP
	RET
