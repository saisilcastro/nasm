EXTERN StrLen
EXTERN malloc
GLOBAL StrDup
SECTION .text
StrDup:
	CALL StrLen
	PUSH RDI
	LEA RDI, [RAX + 1]
	SUB RSP, 32
	CALL malloc
	ADD RSP, 32
	POP RDI
	CMP RAX, 0
	JE done
	MOV R10, RAX
copy:
	MOV SIL, BYTE [RDI]
	MOV BYTE [R10], SIL
	CMP BYTE [R10], 0
	JE done
	INC RDI
	INC R10
	JMP copy
done:
	RET
