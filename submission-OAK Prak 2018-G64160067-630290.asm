extern printf
extern fflush
extern scanf

section .data
	fmt db "%d",0
	fmtout db "%d",10,0
section .bss
	a resd 1
	b resd 1
	c resd 1
	d resd 1
section .text
	global main
	
	main:
	push a
	push fmt
	call scanf
	
	push b
	push fmt
	call scanf
	
	push c
	push fmt
	call scanf
	
	push d
	push fmt
	call scanf
	
	mov ebx,[a]
	add ebx,[b]
	add ebx,[c]
	add ebx,[d]
	
	mov edx,0
	mov eax,ebx
	mov ecx,4
	div ecx
	
	push eax
	push fmtout
	call printf
	add esp,40
	
	
	push 0
	call fflush
	
	exit :
    mov eax,1
    mov ebx,0
    int 0x80
