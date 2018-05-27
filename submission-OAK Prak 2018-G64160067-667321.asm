extern fflush
extern scanf
extern printf
  
section .data
r_fmt db "%s",0
p_fmt db "%d",10,0
dword_size equ 4 
end db 0

section .bss
x resb 21

section .text
  
global main
  
main:
push x
push r_fmt
call scanf
add esp,8

mov edi,x
mov al,[end]
mov ecx,21
mov ebx,0

repnz scasb


mov ebx,ecx
mov ecx,20
sub ecx,ebx
pri:
push ecx
push p_fmt
call printf
add esp,4
jmp exit

 
exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80
 
