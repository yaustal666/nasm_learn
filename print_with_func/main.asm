; The same printing program but using function
;
;---------------------------------------------

section	.data

msg:	db	"Hello, world! It's me!",	10

section	.text
global	_start

strlen:
	push		rcx				; func strlen use rcx as counter
	mov		rcx,		rsi		; answer will be left in rbx
							; cause length of string must be in rbx to call write
nextchar:						; I could use rdx as counter and leave answer in it
							; but for lessons i wanted to use push and pop
	cmp	byte	[rcx],		0		; which would not be needed if i used rdx
	jz		finish				; and it would be kinda unsafe i guess
	inc		rcx				; I could leave a comment though, something like
	jmp		nextchar			; 'Attention you will louse your data in rbx if you use this func'

finish:

	sub		rcx,		rsi
	mov		rdx,		rcx
	pop		rcx
	ret

_start:

	mov		rsi,		msg
	call		strlen

	mov		rdi,		1
	mov		rax,		1
	syscall

	mov		rax,		60
	xor		rdi,		rdi
	syscall
