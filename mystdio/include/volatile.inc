%macro REG_PUSH 0
	PUSH RDI
	PUSH RSI
    PUSH RDX
    PUSH RCX
	PUSH R8
	PUSH R9
	PUSH R10
	PUSH R11
%endmacro

%macro REG_POP 0
	POP R11
	POP R10
	POP R9
	POP R8
	POP RCX
	POP RDX
	POP RSI
	POP RDI
%endmacro

%macro NUM_PUSH 0
	PUSH R8
	PUSH R9
	PUSH R10
	PUSH R11
%endmacro

%macro NUM_POP 0
	POP R11
	POP R10
	POP R9
	POP R8
%endmacro

%macro LETTER_PUSH 0
	PUSH RDI
	PUSH RSI
	PUSH RDX
	PUSH RCX
%endmacro

%macro LETTER_POP 0
	POP RCX
	POP RDX
	POP RSI
	POP RDI
%endmacro
