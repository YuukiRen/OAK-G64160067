extern printf
extern fflush
extern scanf
 
section .data
    fmt db "%d",0
    fmtout db "%d",10,0
    o db "lulus",10,0
    x db "tidak",10,0
section .bss
    a resd 4
    b resd 4
    c resd 4
    d resd 4
section .text
    global main
     
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
    
    cmp eax,40
    jge lulus
    cmp eax,40
    jl tidak
    
    lulus:
    push o
    call printf
    add esp,8
    jmp exit
    
    tidak:
    push x
    call printf
    add esp,8
    jmp exit
     
    exit :
    push 0
    call fflush
    mov eax,1
    mov ebx,0
    int 0x80
