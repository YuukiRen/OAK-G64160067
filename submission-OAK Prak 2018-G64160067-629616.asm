section .data
msg db 'Hello '
len equ $ -msg

leng_input dd 4

section .bss
input resd 4


section .text
	global main
main:
	mov edx,4
	mov ecx,input
	mov ebx,0
	mov eax,3
	int 0x80	
	
	mov edx,len
	mov ecx,msg
	mov ebx,1 ; 1=stdout,0=stdin
	mov eax,4
	int 0x80
	
	mov edx,4
	mov ecx,input
	mov ebx,1
	mov eax,4
	int 0x80
	
	
	
exit:
	mov eax,1
	mov ebx,0
	int 0x80
