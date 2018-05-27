extern fflush
extern scanf
extern printf
   
section .data
n_fmt db "%d",0

n2_fmt db "%d",0
r_fmt db "%f",0
p_fmt db "%.1f",10,0

section .bss
	n resd 10
	a resd 10
	b resd 10
	ans resq 10
	save resq 10
	
 
section .text
   
global main
   
main:

push n
push n_fmt
call scanf
add esp,8
mov ebx,[n]

mov dword[save+4],0
mov dword[save],0
fld dword[save]

read:
dec ebx

push a
push r_fmt
call scanf
add esp,8

fadd dword[a]

cmp ebx,0
jne read

print:
fidiv dword[n]

fstp qword[save]

push dword[save+4]
push dword[save]
push p_fmt
call printf
add esp,8

exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80


