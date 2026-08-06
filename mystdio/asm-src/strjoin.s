SECTION .text
	EXTERN StrLen
	EXTERN malloc
	GLOBAL StrJoin
StrJoin:
	PUSH R10
	PUSH RSI
	PUSH RDI
	CALL StrLen
	MOV R10, RAX
	MOV RDI, RSI
	CALL StrLen
	LEA RDI, [R10 + RAX + 1]
	SUB RSP, 32
	CALL malloc
	ADD RSP, 32
	POP RDI
	POP RSI
	POP R10
	CMP RAX, 0
	JE done
	PUSH RDI
	PUSH RSI
	PUSH R10
	PUSH R11
	MOV R10, RAX
first:
	MOV R11B, BYTE [RDI]
	MOV BYTE [R10], R11B
	CMP BYTE [R10], 0
	JE second
	INC RDI
	INC R10
	JMP first
second:
	MOV R11B, BYTE [RSI]
	MOV BYTE [R10], R11B
	CMP BYTE [R10], 0
	JE clear
	INC RSI
	INC R10
	JMP second
clear:
	POP R11
	POP R10
	POP RSI
	POP RDI
done:
	RET
