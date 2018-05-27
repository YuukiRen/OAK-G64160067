extern fflush
extern scanf
extern printf
   
section .data
r_fmt db "%f",0
p_fmt db "%f",10,0

section .bss
	r resd 10
	ans resq 10
	
 
section .text
   
global main
   
main:

push r
push r_fmt
call scanf
add esp,8

fld dword[r]
fldpi
fmulp
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

