extern fflush
extern scanf
extern printf
 
section .data
r_fmt db "%d",0
p_fmt db "%d",10,0
dword_size equ 4 
section .bss
a resd 4
b resd 4
n resd 4
section .text
 
global main
 
main:
push a
push r_fmt
call scanf
add esp,8

push b
push r_fmt
call scanf
add esp,8


push dword [a]
push dword [b]
call tambah

push eax
push p_fmt
call printf
add esp,8



exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80


tambah:
push ebp
mov ebp,esp
mov eax,[ebp+3*dword_size]
add eax,[ebp+2*dword_size]
pop ebp
ret 2*dword_size
