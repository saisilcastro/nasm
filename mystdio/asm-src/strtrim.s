%include "include/volatile.inc"

SECTION .TEXT
GLOBAL StrTrim
EXTERN StrLen
EXTERN StrChr
EXTERN StrlCpy
EXTERN malloc
StrTrim:
	CALL StrLen
	REG_PUSH
	PUSH R12
	MOV R12, RDX
	MOV R9, RCX
	LEA R11, [RCX + RAX]
forward:
	CMP BYTE [RCX], 0
	JE backward
	PUSH RCX
	MOVZX RDX, BYTE [RCX]
	MOV RCX, R12
	CALL StrChr
	POP RCX
	CMP RAX, 0
	JE backward
	INC RCX
	JMP forward
backward:
	CMP R11, RCX
	JE alloc
	MOVZX RDX, BYTE [R11 - 1]
	PUSH RCX
	MOV RCX, R12
	CALL StrChr
	POP RCX
	CMP RAX, 0
	JE alloc
	DEC R11
	JMP backward
alloc:
	LEA R11, [R11 + 1]
	SUB R11, RCX
	CMP R11, 0
	JE error
	REG_PUSH
	MOV RCX, R11
	SUB RSP, 32
	CALL malloc
	ADD RSP, 32
	REG_POP
	CMP RAX, 0
	JE error
	LEA R8, [RAX + R11 - 1]
	MOV BYTE [R8], 0
	MOV R8, R11
	MOV RDX, RCX
	MOV R11, RAX
	MOV RCX, RAX
	CALL StrlCpy
	MOV RAX, R11
	JMP done
error:
	XOR EAX, EAX
done:
	POP R12
	REG_POP
	RET
