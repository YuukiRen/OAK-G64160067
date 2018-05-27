extern fflush
extern scanf
extern printf
 
section .data
r_fmt db "%s",0
p_fmt db "%s",10,0
dword_size equ 4 
day db "weekday",10,0
end db "weekend",10,0
sab db "Sat",0
min db "Sun",0
section .bss
hari resd 4

section .text
 
global main
 
main:
cld
push hari
push r_fmt
call scanf
add esp,8

mov edi,hari
mov esi,sab
mov ecx,4

cmpsb
je same

mov edi,hari
mov esi,min
mov ecx,4

cmpsb
je same

push day
call printf
add esp,4


exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80

same:
push end
call printf
add esp,4
jmp exit
