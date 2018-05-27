extern fflush
extern scanf
extern printf
   
section .data
r_fmt db "%f",0
p_fmt db "%f",10,0

section .bss
	a resd 10
	b resd 10
	ans resq 10
	a1 resd 10
	b1 resd 10
 
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

fld dword[a]
fld dword[a]
fmulp
fstp dword[a1] 

fld dword[b]
fld dword[b]
fmulp 
fstp dword[b1]


fld dword[a1]
fld dword[b1]
faddp
fsqrt
fstp qword[ans]

push dword[ans+4]
push dword[ans]
push p_fmt
call printf
add esp,8

exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80

