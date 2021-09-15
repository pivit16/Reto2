section .data
    a dq 2
    N dq 4
section .text
    global _start

_start:
    ;validacion de datos inciales
    cmp qword[a], 255
    jg _exit
    cmp qword[N], 255
    jg _exit
    cmp qword[a], 0
    jl _exit
    cmp qword[N], 0
    jl _exit

    xor r8, r8; contador
    xor r10, r10; sumatoria
    inc r8
    mov rcx, qword [N]
sumloop:
    mov r9, r8
    mov rax, 1
    potencia:
        mul qword [a]
        dec r9
        cmp r9, 0
        jne potencia
    add r10, rax
    inc r8
    loop sumloop

formula:
    mov r8, qword[N]
    mov rax, 1
    inc r8
    poten:
        mul qword[a]
        dec r8
        cmp r8, 0
        jne poten
    sub rax, qword[a]
    mov r9, qword[a]
    dec r9
    div r9
    mov r11, rax

;Fin de codigo
_exit:
	mov rax, 0
	ret