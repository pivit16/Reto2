section .data
    palabra db "bob"
    lenp equ $ - palabra

    palindromo db "***"

    mensaje1 db "La palabra es palindromo", 10, 0
    lenm1 equ $ - mensaje1

    mensaje2 db "La palabra no es palindromo", 10, 0
    lenm2 equ $ - mensaje2

    espacio db 10

section .bss
    lvl resb 1
    ;palindromo resb lenp

section .text
    global _start

_start:
    mov r8, palabra
    mov r9, 0
    mov r10, lenp
    dec r10
    mov r13, "T"
    mov r14, "F"
    bucle:
        mov r11b, byte[r8 + r9]
        cmp byte[r8 + r10], r11b
        jne noes
        dec r10
        inc r9
        cmp r9, lenp
        jne bucle
sies:
    mov [lvl], r13
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje1
	mov rdx, lenm1
	syscall
    jmp _exit

noes:
    mov [lvl], r14
    mov rax, 1
	mov rdi, 1
	mov rsi, mensaje2
	mov rdx, lenm2
	syscall

_exit:
; SYS_EXIT
	mov rax, 60
	mov rdi, 0
	syscall