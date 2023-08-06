; Program that prints any string, hello world upgraded with counting length of string
;
;
;------------------------------------------------------------------------------------

section	.data

msg:	db	"Hello, cruelas hell/heaven?#!!!@@()&][\\\ world!",	10

section	.text

global	_start

_start:
	mov		rsi,		msg
	mov		rdx,		rsi

next_char:
	cmp	byte	[rdx],		0
	jz		print
	inc		rdx
	jmp		next_char

print:
	sub 		rdx,		rsi
	mov		rdi,		1
	mov		rax,		1
	syscall

	mov		rax,		60
	xor		rdi,		rdi
	syscall
