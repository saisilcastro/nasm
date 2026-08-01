DEFAULT REL
SECTION .bss
	Array RESQ 1
	Buffer RESB 1
	MWord RESQ 1
%include "include/volatile.inc"
SECTION .TEXT
	GLOBAL Split
	EXTERN malloc
	EXTERN free
Split:
	XOR RAX, RAX
	CMP RCX, 0
	JE void
	CALL cword
	MOV [MWord], RAX
	REG_PUSH
	LEA RCX, [RAX * 8 + 8]
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
	CMP BYTE [RCX], DL
	JNE wlen
	INC RCX
	JMP wtransfer
wlen:
	MOV R9, RCX
wend:
	CMP BYTE [RCX], 0
	JE walloc
	CMP BYTE [RCX], DL
	JE walloc
	INC RCX
	JMP wend
walloc:
	MOV R10, RCX
	SUB R10, R9
	CMP R10, 0
	JE done
	REG_PUSH
	LEA RCX, [R10 + 1]
	SUB RSP, 32
	CALL malloc
	ADD RSP, 32
	REG_POP
	CMP RAX, 0
	JE dealloc
	MOV [Buffer], RAX
	MOV BYTE [RAX + R10], 0
	MOV RCX, R9
wcopy:
	CMP BYTE [RCX], 0
	JE wnext
	CMP BYTE [RCX], DL
	JE wnext
	MOV R10B, BYTE [RCX]
	MOV BYTE [RAX], R10B
	INC RAX
	INC RCX
	JMP wcopy
wnext:
	MOV R10, [Buffer]
	MOV RAX, [Array]
	MOV [RAX + R8 * 8], R10
	INC R8
	CMP BYTE [RCX], 0
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
	MOV RCX, [RAX + R9 * 8]
	SUB RSP, 32
	CALL free
	ADD RSP, 32
	REG_POP
	JMP erase
cleared:
	MOV RCX, [Array]
	SUB RSP, 32
	CALL free
	ADD RSP, 32
	REG_POP
	RET
cword:
	LETTER_PUSH
wsearch:
	CMP BYTE [RCX], 0
	JE count_done
	CMP BYTE [RCX + 1], 0
	JE next
	CMP BYTE [RCX + 1], DL
	JE next
	JMP increase
next:
	CMP BYTE [RCX], 0
	JE increase
	CMP BYTE [RCX], DL
	JE increase
	INC RAX
increase:
	INC RCX
	JMP wsearch
count_done:
	LETTER_POP
	RET
