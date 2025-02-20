section	.text
	extern	__errno_location
	global	ft_read

ft_read:
	; rdi : fd
	; rsi : buffer
	; drx : bytes read

	; read syscall
	mov	rax, 0
	syscall
	cmp	rax, 0
	jl	.errno
	ret
.errno:
	neg	rax
	push	rax
	call	__errno_location
	mov	rdi, rax
	pop	rax
	mov	[rdi], rax
	mov	rax, -1
	ret
