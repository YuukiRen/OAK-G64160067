extern fflush
extern scanf
extern printf
    
section .data
r_fmt db "%d",0
p_fmt db "%d ",0
dword_size equ 4 
on_fmt db "%d",10,0
no db "tidak ada",10,0
mulp dd 4

section .bss
x resb 41
arr resd 101
y resb 2
a resb 41
  
section .text
    
global main
    
main:
push x
push r_fmt
call scanf
add esp,8
mov esi,[x]
cmp esi,1
je one
cmp esi,0
je zero
 
mov esi,0

sca: 
push y
push r_fmt
call scanf
add esp,8
mov eax,esi
mov ebx,4
mul ebx
mov edi,[y]
mov dword[arr+eax],edi
inc esi
cmp esi,[x]
jl sca 

;end of sca

mov ebx,[x]
mov esi,0
mov edi,0

bubel:
mov ebx,[x]
dec ebx ;ebx=n-1

mov ecx,esi
inc ecx
mov edi,ecx;j=i+1

bubeli:
mov eax,dword[arr+(esi*4)]
mov ebx,dword[arr+(edi*4)]

cmp eax,ebx
jg swa

inc edi
cmp edi,[x]
jl bubeli
inc esi
mov ebx,[x]
dec ebx ;ebx=n-1
cmp esi,ebx
jl bubel

mue:
;start of pri
mov esi,0
mov edi,[x]
pri: 
mov eax,esi
mul dword[mulp]
;index=eax


inc esi
cmp esi,edi
je priv2
jmp priv1
back:
cmp esi,[x]
jl pri
 
 
exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80
 
swa:
mov dword[arr+(esi*4)],ebx
mov dword[arr+(edi*4)],eax

inc edi
cmp edi,[x]
jl bubeli
inc esi
mov ebx,[x]
dec ebx ;ebx=n-1
cmp esi,ebx
jl bubel
jmp mue


one:
push a
push r_fmt
call scanf
add esp,8

mov ebx,[a]
push ebx
push on_fmt
call printf
add esp,8
jmp exit

zero:

mov ebx,0
push ebx
push on_fmt
call printf
add esp,8
jmp exit

priv1:
push dword[arr+eax]
push p_fmt
call printf
add esp,8
jmp back
priv2:
push dword[arr+eax]
push on_fmt
call printf
add esp,8
jmp back
