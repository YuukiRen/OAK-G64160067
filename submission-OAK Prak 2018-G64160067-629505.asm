section .data
msg db 'Hello x86',10
len equ $ -msg

section .bss

section .text
	global main

main:
	mov edx,len
	mov ecx,msg
	mov ebx,1
	mov eax,4
	int 0x80

exit:
	mov eax,1
	mov ebx,0
	int 0x80
