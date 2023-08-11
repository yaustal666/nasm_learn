%include	'funcs.asm'

section	.data

msg1:	db	"Hello number 1",		10,	0	; We add a zero because there was a problem
msg2:	db	"Hello but it is second!",	10,	0	; of double printing. The reason of that is we didn't have the proper ed sign for first string

section	.text
global	_start

_start:

	mov		rsi,		msg2
	call		printstr

	mov		rsi,		msg1
	call		printstr

	call		exit
