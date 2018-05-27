extern fflush
extern printf
extern scanf

section .data
	fmtoutput db  "%d",10, 0
    fmtinput db  "%d", 0
    msg db  "Hello world!", 0
    lenga dd 4
    lengb dd 4

section .bss
a resd 4
b resd 4
c resd 4

section .txt
	global main

	main:
	push a
	push fmtinput
	call scanf
	
	push b
	push fmtinput
	call scanf
	
	mov eax,[a]
	mov ebx,[b]
	ADD eax,ebx
	
	push eax
	push fmtoutput
	call printf
	add esp,24
	
	push 0
	call fflush
	exit:
    mov eax,1
    mov ebx,0
    int 0x80

