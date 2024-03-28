section	.text
	global	ft_strdup
	extern	__errno_location
	extern	malloc
	extern	ft_strlen
	extern	ft_strcpy

ft_strdup:
	; rdi : source string
	push rdi	; save the source string for later use (rdi is caller-saved)
	call	ft_strlen
	mov	rdi, rax	; pass len of string as argument for malloc
	inc	rdi
	call	malloc
	cmp	eax, 0
	je	.malloc_failed
	mov	rdi, rax
	pop rsi
	call	ft_strcpy
	ret
.malloc_failed:
	neg	rax
	push	rax
	call	__errno_location
	mov	rsi, rax
	pop rax
	mov [rsi], rax
	mov	rax, 0
	ret
