extern fflush
extern scanf
extern printf
  
section .data
r_fmt db "%s",0
p_fmt db "%d",10,0
dword_size equ 4 
no db "tidak ada",10,0
section .bss
x resb 51
end resb 2

section .text
  
global main
  
main:
push x
push r_fmt
call scanf
add esp,8

push end
push r_fmt
call scanf
add esp,8

mov edi,x
mov al,[end]
mov ecx,51

repnz scasb


mov ebx,ecx
mov ecx,50
sub ecx,ebx

inc ecx
pri:
cmp ecx,51
jge tida

push ecx
push p_fmt
call printf
add esp,4

 
exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80
 
tida:
push no
call printf
add esp,4
