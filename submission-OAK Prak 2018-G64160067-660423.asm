extern fflush
extern scanf
extern printf


section .data
	s_fmt db "%d", 0
	p_fmt db "%d", 10, 0
	
section .bss
	a resd 1
	fib resd 1

section .text
	global main

main:
	push a
	push s_fmt
	call scanf
	add esp, 8
	mov dword[fib], 0
	mov dword[fib+4], 1
	mov edi, 2
	mov ecx, 46

lp:
	mov eax, 0
	add eax, dword[fib+(edi*4)-8]
	add eax, dword[fib+(edi*4)-4]
	mov dword[fib+edi*4], eax
	inc edi
	loopne lp
	
	mov eax, [a]
	push dword[fib+eax*4]
	push p_fmt
	call printf
	add esp, 8

exit:
	push 0
	call fflush
	
	mov eax, 1
	mov ebx, 0
	int 0x80

