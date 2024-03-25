section	.text
	global	ft_strcpy

ft_strcpy:
	; Input : rdi -> destination string, rsi -> source string
	xor	rcx, rcx
	test	rsi, rsi
	jz	.end

.copy_loop:
	mov	al, [rsi + rcx]
	test	al, al
	jz	.move_return
	mov	[rdi + rcx], al
	inc	rcx
	jmp	.copy_loop

.move_return
	mov	rax, rdi
	jmp	.end
	
.end:
	ret
