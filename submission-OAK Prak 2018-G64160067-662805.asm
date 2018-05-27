extern fflush
extern scanf
extern printf

section .data
r_fmt db "%d",0
p_fmt db "%d",10,0

section .bss
a resd 4
section .text

global main

main:
push a
push r_fmt
call scanf
add esp,8

mov eax,[a]
cmp eax,0
je exit
call squ
jmp pri

pri:
push eax
push p_fmt
call printf
add esp,8
jmp main

squ:
mul eax
ret

exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80
