extern scanf
extern printf
extern fflush

section .data
rfmt db "%d",0
pfmt db "%d",10,0
kamus dd 7,11,10,6
	  dd 5,8,9,2
	  dd 1,3,12,4
section .bss
	tmp resd 1
	inp resd 1
	inp2 resd 1
section .text
	global main
	main:
	push inp
	push rfmt
	call scanf
	add esp,8
	
	mov eax,16
	mov ebx,[inp]
	mul ebx
	mov ebx,eax
	
	mov esi,[kamus+ebx]
	mov edi,esi
	add ebx,4
	
	mov esi,[kamus+ebx]	
	add edi,esi
	add ebx,4
	
	mov esi,[kamus+ebx]	
	add edi,esi
	add ebx,4
	
	mov esi,[kamus+ebx]	
	add edi,esi
	add ebx,4
	
	
	
	
	
	pri:
	push edi
	push pfmt
	call printf
	add esp,8
	
	exit:
	push 0
	call fflush
	mov eax,1
	mov ebx,0
	int 0x80

