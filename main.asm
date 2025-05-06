global _main

extern _GetStdHandle@4
extern _WriteFile@20
extern _ExitProcess@4

section .text

_main:
	; DOWRD bytes;
	mov ebp, esp
	sub esp, 4

	; hStdOut = GetstdHandle(STD_OUTPUT_HANDLE)
	push -11
	call _GetStdHandle@4
	mov ebx, eax

	; WriteFile(hstdOut, message, length(message), &bytes, 0)
	push 0
	lea eax, [ebp-4]
	push eax
	push msg_len
	push msg
	push ebx
	call _WriteFile@20

	; ExitProcess@4
	push 0
	call _ExitProcess@4

	; never here
	hlt

section .data
	msg: db "Hello, World!", 0xa
	msg_len equ $-msg
