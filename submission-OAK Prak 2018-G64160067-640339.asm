extern printf
extern scanf
extern fflush

section .data
fmtin db "%d",0
fmtout db "%d",10,0

section .bss
a resd 4

section .text
	global main
	main:
	push a
	push fmtin
	call scanf
	
	mov ecx,[a]
	mov eax,0
	
	lop:
	add eax,ecx
	loopne lop
	
	push eax
	push fmtout
	call printf
	
	add esp,16
	
		
	
	exit:
	push 0
	call fflush
	
	mov eax,1
	mov ebx,0
	int 0x80
	
