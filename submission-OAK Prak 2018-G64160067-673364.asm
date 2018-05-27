extern fflush
extern scanf
extern printf
   
section .data
r_fmt db "%s",0
p_fmt db "%d",10,0
dword_size equ 4 
no db "tidak ada",10,0

section .bss
x resb 41
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
mov ecx,40

mov esi,0
repet; 
cmp ecx,0
je pri

repnz scasb
jz found

jmp repet

pri:
push esi
push p_fmt
call printf
add esp,4
  
exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80

found:
inc esi
jmp repet
