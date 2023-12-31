;	Functionst for printing strings

;	int strlen(string msg)
;	counting length of string, storing result in rdx
strlen:
	push		rcx
	mov		rcx,		rsi

nextchar:
	cmp	byte	[rcx],		0
	jz		finish
	inc		rcx
	jmp		nextchar

finish:
	sub		rcx,		rsi
	mov		rdx,		rcx
	pop		rcx
	ret

;------------------------------------------------------
;	void printstr(string msg)
;	printing a string into standart output
printstr:
	push		rdi
	push		rdx
	push		rax
	call		strlen

	mov		rdi,		1
	mov		rax,		1
	syscall

	pop		rax
	pop		rdx
	pop		rdi
	ret

;------------------------------------------------------
;	void printLF(string msg)
;	print upgraded with linefeed, so we do not need to add
;	linefeed to every string we want to print
printLF:
	call		printstr

	push		rsi
	mov		rsi,		10
	push		rsi
	mov		rsi,		rsp
	call		printstr

	pop		rsi
	pop		rsi
	ret

;------------------------------------------------------
;	void exit()
;	finish the program
exit:
	mov		rax,		60
	xor		rdi,		rdi
	syscall
	ret
