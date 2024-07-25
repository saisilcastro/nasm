section .text
    global set_name
    global get_name
    global set_age
    global get_age

; Function to set the name of the Person
; Arguments: rdi = address of Person, rsi = pointer to name
set_name:
    mov rax, [rdi]          ; Load the address of the 'name' field from Person struct into rax
    mov rbx, rsi            ; Load the address of the input name into rbx
copy_name:
    mov dl, [rbx]           ; Load a byte from the input name into dl
    mov [rax], dl           ; Store the byte into the 'name' field of Person
    inc rax                 ; Move to the next byte of the 'name' field
    inc rbx                 ; Move to the next byte of the input name
    test dl, dl             ; Check if we've reached the end of the string
    jnz copy_name           ; Continue if not zero (not end of string)
    ret

; Function to get the name of the Person
; Arguments: rdi = address of Person
get_name:
    mov rax, [rdi]          ; Load the address of the 'name' field from Person struct
    ret

; Function to set the age of the Person
; Arguments: rdi = address of Person, esi = age
set_age:
    mov [rdi + 8], esi      ; Store the age in the 'age' field (offset 8 bytes from start)
    ret

; Function to get the age of the Person
; Arguments: rdi = address of Person
get_age:
    mov eax, [rdi + 8]      ; Load the age from the 'age' field (offset 8 bytes from start)
    ret

