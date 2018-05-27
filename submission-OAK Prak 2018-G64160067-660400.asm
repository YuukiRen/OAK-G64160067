extern scanf
extern printf
extern fflush

section .data
rfmt db "%d",0
pfmt db "%d",10,0


section .bss
	tmp resd 1
	inp resd 1
section .text
	global main
	main:
	push inp
	push rfmt
	call scanf
	add esp,8
	
	mov ebx,[inp]
	cmp ebx,0
	je zero
	cmp ebx,1
	je one
	
	mov ecx,0
	
	mov esi,0
	mov edi,1
	
	fibo:
	inc ecx
	mov eax,edi
	add esi,edi
	mov edi,esi
	mov esi,eax
	cmp ebx,ecx
	je pri
	jmp fibo
	

	zero:
	mov edi,0
	push edi
	push pfmt
	call printf
	add esp,8
	jmp exit
	
	one:
	mov edi,1
	push edi
	push pfmt
	call printf
	add esp,8
	jmp exit
	
	pri:
	push esi
	push pfmt
	call printf
	add esp,8
	jmp exit
	
	
	exit:
	push 0
	call fflush
	mov eax,1
	mov ebx,0
	int 0x80

