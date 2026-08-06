DEFAULT REL
SECTION .bss
	Array RESQ 1
	Buffer RESB 1
	MWord RESQ 1
%include "include/volatile.inc"
SECTION .text
	GLOBAL Split
	EXTERN malloc
	EXTERN free
Split:
	XOR RAX, RAX
	CMP RDI, 0
	JE void
	CALL cword
	MOV [MWord], RAX
	REG_PUSH
	LEA RDI, [RAX * 8 + 8]
	SUB RSP, 32
	CALL malloc
	ADD RSP, 32
	REG_POP
	CMP RAX, 0
	JE void
	REG_PUSH
	MOV R8, [MWord]
	XOR R9, R9
	MOV QWORD [RAX + R8 * 8], R9
	MOV [Array], RAX
	XOR R8, R8
wtransfer:
	CMP BYTE [RDI], SIL
	JNE wlen
	INC RDI
	JMP wtransfer
wlen:
	MOV R9, RDI
wend:
	CMP BYTE [RDI], 0
	JE walloc
	CMP BYTE [RDI], SIL
	JE walloc
	INC RDI
	JMP wend
walloc:
	MOV R10, RDI
	SUB R10, R9
	CMP R10, 0
	JE done
	REG_PUSH
	LEA RDI, [R10 + 1]
	SUB RSP, 32
	CALL malloc
	ADD RSP, 32
	REG_POP
	CMP RAX, 0
	JE dealloc
	MOV [Buffer], RAX
	MOV BYTE [RAX + R10], 0
	MOV RDI, R9
wcopy:
	CMP BYTE [RDI], 0
	JE wnext
	CMP BYTE [RDI], SIL
	JE wnext
	MOV R10B, BYTE [RDI]
	MOV BYTE [RAX], R10B
	INC RAX
	INC RDI
	JMP wcopy
wnext:
	MOV R10, [Buffer]
	MOV RAX, [Array]
	MOV [RAX + R8 * 8], R10
	INC R8
	CMP BYTE [RDI], 0
	JNE wtransfer
done:
	REG_POP
void:
	RET
dealloc:
	XOR R9, R9
erase:
	CMP R9, R8
	JE cleared
	MOV RAX, [Array]
	REG_PUSH
	MOV RDI, [RAX + R9 * 8]
	SUB RSP, 32
	CALL free
	ADD RSP, 32
	REG_POP
	JMP erase
cleared:
	MOV RDI, [Array]
	SUB RSP, 32
	CALL free
	ADD RSP, 32
	REG_POP
	RET
cword:
	LETTER_PUSH
wsearch:
	CMP BYTE [RDI], 0
	JE count_done
	CMP BYTE [RDI + 1], 0
	JE next
	CMP BYTE [RDI + 1], SIL
	JE next
	JMP increase
next:
	CMP BYTE [RDI], 0
	JE increase
	CMP BYTE [RDI], SIL
	JE increase
	INC RAX
increase:
	INC RDI
	JMP wsearch
count_done:
	LETTER_POP
	RET
