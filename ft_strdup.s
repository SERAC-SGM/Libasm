section	.text
	global	ft_strdup
	extern	__errno_location
	extern	malloc	
	extern	ft_strlen
	extern	ft_strcpy

ft_stdup:
	; rdi : source string
	call	ft_strlen
	mov	rsi, rdi	; save the source string for later use
	mov	rdi, eax	; pass len of string as argument for malloc
	inc	rdi
	call	malloc
	mov	rdi, eax
	call	ft_strcpy
	ret
