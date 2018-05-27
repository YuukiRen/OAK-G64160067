extern fflush
extern scanf
extern printf
     
section .data
r_fmt db "%lf",0
p_fmt db "%.2lf",10,0
mulp dq 1.8
su dd 32
section .bss
    a resd 10
    b resd 10
    ans resq 10
   
section .text
     
global main
     
main:
push a
push r_fmt
call scanf
add esp,8

mov eax,8

fld qword [a]   
fld qword [mulp] ;load value into st0
fmulp
fiadd dword[su]
fstp qword [ans] ;stor  




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
