extern fflush
extern scanf
extern printf
    
section .data
r_fmt db "%lf",0
p_fmt db "%lf",10,0
 
section .bss
    a resd 10
    b resd 10
    ans resd 10
  
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
 
fld qword[a]
fld qword[a]
fmulp
 
fld qword[b]
fld qword[b]
fmulp
 
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
