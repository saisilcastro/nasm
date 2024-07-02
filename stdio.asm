section .text
global _isdigit
global _isalpha
global _isalnum
_isdigit:
	mov rax, 1
	cmp rdi, 0x30 ; compare to 0
	jb outrange
	cmp rdi, 0x39 ; compare to 9
	jbe done
	jmp outrange
_isalpha:
	mov rax, 1
	cmp rdi, 0x41 ; compare to A
	jb outrange
	cmp rdi, 0x5A ; compare to Z
	jbe done
	cmp rdi, 0x61 ; compare to a
	jb outrange
	cmp rdi, 0x7A ; compare to z
	jbe done
	jmp outrange
_isalnum:
	mov rax, 1
	cmp rdi, 0x30 ; compare to 0
	jb outrange
	cmp rdi, 0x39 ; compare to 9
	jbe done
	cmp rdi, 0x41 ; compare to A
	jb outrange
	cmp rdi, 0x5A ; compare to Z
	jbe done
	cmp rdi, 0x61 ; compare to a
	jb outrange
	cmp rdi, 0x7A ; compare to z
	jbe done
outrange:
	mov rax, 0
done:
	ret