section	.text
	GLOBAL ft_strlen	; make the strlen function global (allow linking to multiple objects)

ft_strlen:
	xor	rax, rax
.loop:
	cmp	byte [rdi + rax], 0	; Compare the byte at [rdi + rax] with 0 (null terminator)
	je	.done
	inc	rax
	jmp	.loop
.done:
	ret
