section .text
    global ft_atoi_base
    extern ft_strlen

ft_atoi_base:
    ; rdi : str
    ; rsi : base

    push    rsi
    mov rdi, rsi
    call    ft_strlen   ; rax = strlen(base)
    pop rsi
    xor rcx, rcx        ; outer counter
    cmp rax, 2
    jl  .end
    mov r8, rax         ; r8 = strlen(base)
    jmp .check_base
.check_base:
    cmp byte [rsi + rcx], 0     ; base[i] == 0
    je .end_check_base
    cmp byte [rsi + rcx], 32    ; base[i] <= ' '
    jle .end
    cmp byte [rsi + rcx], 43    ; base[i] == '+'
    je .end
    cmp byte [rsi + rcx], 45    ; base[i] == '-'
    je .end
    cmp byte [rsi + rcx], 127   ; base[i] >= 127
    jge .end
    mov rdx, rcx    ; inner counter
    inc rdx         ; rdx = rcx + 1
    jmp .check_dup  ; check if base[i] is duplicated
.check_dup:
    cmp byte [rsi + rdx], 0     ; base[i] == 0
    je .end_check_dup
    mov al, byte [rsi + rcx]
    cmp al, byte [rsi + rdx]    ; base[i] == base[j]
    je .end
    inc rdx
    jmp .check_dup
.end_check_dup:
    inc rcx
    jmp .check_base
.end_check_base:
    jmp .check_str
.check_str:
    xor rcx, rcx    ; counter
    mov rdx, 1      ; sign
    jmp .check_space
.check_space:
    cmp byte [rdi + rcx], 0
    je .end
    cmp byte [rdi + rcx], 32
    je .inc_counter_space
    cmp byte [rdi + rcx], 12
    je .inc_counter_space
    cmp byte [rdi + rcx], 10
    je .inc_counter_space
    cmp byte [rdi + rcx], 13
    je .inc_counter_space
    cmp byte [rdi + rcx], 9
    je .inc_counter_space
    cmp byte [rdi + rcx], 11
    je .inc_counter_space
    jne .check_sign
.inc_counter_space:
    inc rcx
    jmp .check_space
; .end_check_space:
;     ; mov eax, [rdi]
;     ; ret
;     jmp .check_sign
.check_sign:
    cmp byte [rdi + rcx], 0
    je .end
    cmp byte [rdi + rcx], 45    ; '-'
    je .set_sign
    jne .end_check_sign
    cmp byte [rdi + rcx], 43    ; '+'
    je .inc_counter_sign
    jne .end_check_sign
.set_sign:
    neg rdx    ; sign *= -1
    inc rcx
    jmp .check_sign
.inc_counter_sign:
    inc rcx
    jmp .check_sign
.end_check_sign:
    jmp .convert
.convert:
    xor rax, rax    ; result

.end:
    xor rax, rax
    ret
