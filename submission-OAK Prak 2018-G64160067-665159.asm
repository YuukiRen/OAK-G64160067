extern fflush
extern scanf
extern printf
 
section .data
r_fmt db "%d",0
p_fmt db "%d",10,0
dword_size equ 4 
section .bss
tugas resd 4
uts resd 4
uas resd 4
utsp resd 4
uasp resd 4
proj resd 4
kuis resd 4
section .text
 
global main
 
main:

push uts
push r_fmt
call scanf
add esp,8


push uas
push r_fmt
call scanf
add esp,8


push utsp
push r_fmt
call scanf
add esp,8

push uasp
push r_fmt
call scanf
add esp,8

push proj
push r_fmt
call scanf
add esp,8


push kuis
push r_fmt
call scanf
add esp,8


push tugas
push r_fmt
call scanf
add esp,8

; nilai_akhir = (uts*30 + uas*30 + utsp*10 + uasp*10 + proj*10 + kuis*5 + tugas*5) / 100


push dword [tugas]
push dword [kuis]
push dword [proj]
push dword [uasp]
push dword [utsp]
push dword [uas]
push dword [uts]
call nilai_akhir; add eip


push eax
push p_fmt
call printf
add esp,8



exit:
push 0
call fflush
mov eax,1
mov ebx,0
int 0x80


nilai_akhir:

; nilai_akhir = (uts*30 + uas*30 + utsp*10 + uasp*10 + proj*10 + kuis*5 + tugas*5) / 100
push ebp
mov ebp,esp
;+1 adalah eip
mov eax,[ebp+2*dword_size]
mov ebx,30
mul ebx
;hasil ada di eax
mov esi, eax

mov eax,[ebp+3*dword_size]
mov ebx,30
mul ebx
;hasil di eax
add esi,eax

mov eax,[ebp+4*dword_size]
mov ebx,10
mul ebx
;hasil di eax
add esi,eax

mov eax,[ebp+5*dword_size]
mov ebx,10
mul ebx
;hasil di eax
add esi,eax

mov eax,[ebp+6*dword_size]
mov ebx,10
mul ebx
;hasil di eax
add esi,eax

mov eax,[ebp+7*dword_size]
mov ebx,5
mul ebx
;hasil di eax
add esi,eax

mov eax,[ebp+8*dword_size]
mov ebx,5
mul ebx
;hasil di eax
add esi,eax

mov eax,esi

mov edx,0
mov ebx,100
div ebx

cmp edx,50
jge jum

pop ebp
ret 7*dword_size

jum:
add eax,1
pop ebp
ret 7*dword_size

