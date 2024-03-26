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
	mov	r8, rax
	pop	rax
	mov	[r8], rax
	mov	rax, -1
	ret
