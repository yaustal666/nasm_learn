;	Hello World program
;
;--------------------------------------------------

section .data

msg:	db	"Hello, World", 10

section	.text

	global	_start

_start:	mov	rax,	1		; system call for write
	mov	rdi,	1		; file descriptor 1 - standart output
	mov	rsi,	msg
	mov	rdx,	13		; size of string in bytes
	syscall

	mov	rax,	60		; system call for exit
	xor	rdi,	rdi		; rdi = 0, exit code
	syscall
