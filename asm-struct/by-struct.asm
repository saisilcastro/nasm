section .text
    global person_set

person_set:
    mov rbx, [rdi]         ; Load address of name field from Person struct

    ; Copy the string from rsi (source) to the buffer in the Person struct
copy_loop:
    mov al, [rsi]          ; Load byte from source
    mov [rbx], al          ; Store byte to destination
    inc rsi                ; Increment source pointer
    inc rbx                ; Increment destination pointer
    test al, al            ; Check for null terminator
    jnz copy_loop          ; Continue copying if not end of string

    ; Set the age field (offset 8 bytes) in the Person struct
    mov [rdi + 8], edx

    ; Return
    ret

