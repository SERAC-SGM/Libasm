section	.text
	global	ft_strcmp

ft_strcmp:
	xor	rcx, rcx
	xor	rax, rax

.loop:
	mov	al, [rdi + rcx]
	cmp	al, [rsi + rcx]
	je	.equal
	jne	.not_equal
	inc	rcx
	jmp	.loop

.equal:
	mov	dl, [rsi + rcx]
	test	al, dl
	jz	.end
	inc	rcx
	jmp	.loop

.not_equal:
	mov	dl, [rsi + rcx]
	sub	al, dl
	movsx	rax, al
	ret

.end:
	ret
