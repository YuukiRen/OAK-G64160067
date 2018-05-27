extern printf
extern fflush
extern scanf
 
section .data
    fmt db "%d",0
    fmtout db "%d",10,0
    ao db "A",10,0
    bo db "B",10,0
    co db "C",10,0
    doo db "D",10,0
    eo db "E",10,0
section .bss
    a resd 4
    b resd 4
    c resd 4
    d resd 4
section .text
    global main
    ;A: 80-100
	;B: 60-79
	;C: 50-59
	;D: 40-49
	;E: 0-39
    main:
    push a
    push fmt
    call scanf
    push b
    push fmt
    call scanf
    push c
    push fmt
    call scanf
    push d
    push fmt
    call scanf
    
    mov ebx,[a]
    add ebx,[b]
    add ebx,[c]
    add ebx,[d]
    
    mov edx,0
    mov eax,ebx
    mov ecx,4
    div ecx
    
    add esp,32
    
    cmp eax,80
    jge satu
    cmp eax,60
    jge dua
    cmp eax,50
    jge tiga
    cmp eax,40
    jge empat
    cmp eax,0
    jge lima
    
    satu:
    push ao
    call printf
    add esp,4
    jmp exit
    
    dua:
    push bo
    call printf
    add esp,4
    jmp exit
    
    tiga:
    push co
    call printf
    add esp,4
    jmp exit
    
    empat:
    push doo
    call printf
    add esp,4
    jmp exit
    
    lima:
    push eo
    call printf
    add esp,4
    jmp exit
    
    exit :
    push 0
    call fflush
    mov eax,1
    mov ebx,0
    int 0x80
