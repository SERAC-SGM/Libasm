section	.text
	extern	__errno_location
	global	ft_write

ft_write:
	; rdi : fd
	; rsi : buffer
	; rdx : bytes read

	cmp	rsi, 0
	je	.buffer_null

	; system call number for write
	mov	rax, 1
	syscall
	cmp	rax, 0
	jl	.errno
	ret
.buffer_null:
	mov	rax, -22	; EINVAL
	jmp	.errno
.errno:
	neg	rax	; get absolute value
	push	rax
	call	__errno_location	; returns a pointer to the errno variable
	mov	rdi, rax
	pop	rax
	mov	[rdi], rax
	mov	rax, -1
	ret
