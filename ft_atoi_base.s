section .text
    global ft_atoi_base
    extern ft_strlen

ft_atoi_base:
    ; rdi : str
    ; rsi : base

    push    rdi
    mov rsi, rdi
    call    ft_strlen   ; rax = strlen(base)
    pop rdi
    xor rcx, rcx        ; outer counter
    cmp rax, 2
    jl  .error_base
    mov r8, rax         ; r8 = strlen(base)
    jmp .check_base
.check_base:
    cmp byte [rsi + rcx], 0     ; base[i] == 0
    je .end_check_base
    cmp byte [rsi + rcx], 32    ; base[i] <= ' '
    jle .error
    cmp byte [rsi + rcx], 43    ; base[i] == '+'
    je .error
    cmp byte [rsi + rcx], 45    ; base[i] == '-'
    je .error
    cmp byte [rsi + rcx], 127   ; base[i] >= 127
    jge .error
    mov rdx, rcx    ; inner counter
    inc rdx         ; rdx = rcx + 1
    jmp .check_dup  ; check if base[i] is duplicated
    inc rcx
    jmp .check_base
.check_dup:
    cmp byte [rsi + rdx], 0             ; base[i] == 0
    je .check_base
    cmp byte [rsi + rcx], [rsi + rdx]   ; base[i] == base[j]
    je .error
    inc rdx
    jmp .check_dup
.end_check_base:
    jmp .check_str
.check_str:
    xor rcx, rcx    ; counter
    xor rax, rax    ; result
    mov rdx, 1      ; sign
    jmp .check_space
.check_space:
    cmp byte [rdi + rcx], 0
    je .end
    cmp byte [rdi + rcx], 32
    je .inc_counter
    jne end_check_space
    cmp byte [rdi + rcx], 12
    je .inc_counter
    jne end_check_space
    cmp byte [rdi + rcx], 10
    je .inc_counter
    jne end_check_space
    cmp byte [rdi + rcx], 13
    je .inc_counter
    jne end_check_space
    cmp byte [rdi + rcx], 9
    je .inc_counter
    jne end_check_space
    cmp byte [rdi + rcx], 11
    je .inc_counter
    jne end_check_space
.inc_counter:
    inc rcx
    jmp .check_space
.end_check_space:
    jmp .check_sign
.check_sign:
    cmp byte [rdi + rcx], 0
    je .end
    cmp byte [rdi + rcx], 45    ; '-'
    je .set_sign
.set_sign:
    neg rdx    ; sign *= -1
    jmp .check_sign
; .end_check_str:
.error:
    xor rax, rax
    ret
