extern fflush
extern scanf
extern printf
     
section .data
r_fmt db "%d",0
p_fmt db "%d",10,0
mult dd 4
M       dd      17, 14, 24, 11, 18
        dd      21,  6, 13, 19, 25
        dd      10, 22, 20, 12,  7
        dd       3, 15, 23,  5,  1
        dd       8,  4,  9, 16,  2

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
;count baris
mov eax,[a]
mov ebx,20
mul ebx
mov edi,eax
;set
mov esi,0
mov ebx,-1

loo:

inc ebx
mov eax,ebx
mul dword[mult]
add eax,edi
mov edx,[M+eax]

cmp ebx,4
jg pri
cmp edx,esi
jg found
jmp loo


pri:
;mov edi,[M+esi]
push esi
push p_fmt
call printf
add esp,8
  
exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80

found:
mov esi,edx
cmp ebx,4
jg pri
jmp loo
