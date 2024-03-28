section	.text
	global	ft_strcpy

ft_strcpy:
	; rdi : destination string
	; rsi : source string
	xor	rcx, rcx

.copy_loop:
	mov	al, [rsi + rcx]
	test	al, al
	jz	.end
	mov	[rdi + rcx], al
	inc	rcx
	jmp	.copy_loop

	jmp	.end
	
.end:
	mov	byte [rdi + rcx], 0
	mov	rax, rdi
	ret
