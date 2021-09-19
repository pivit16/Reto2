section .data
    isfuerte db "El numero es fuerte", 10
    lenis equ $ - isfuerte

    noisfuerte db "El numero no es fuerte", 10
    lenno equ $ - noisfuerte

    num dq 145

section .bss
    lvl resb 1

section .text
    global _start

; SYS_WRITE
_start:
    mov rax, qword[num]
    mov r8, 10;servira para poder sacara cada digito del numero con un 10
    xor r9, r9 ;sumatoria
    digitoxdigito:
        div r8
        mov r10, rax;guardo cociente
        mov r11, rdx;guardo residuo
        mov rax, 1
        cmp rdx, 0
        je encero
        factorial:
            mul r11
            dec r11
            cmp r11, 0
            jne factorial
        encero:
        add r9, rax
        mov rax, r10
        cmp r10, 0
        jne digitoxdigito

    mov r12, "T"
    mov r13, "F"
    cmp r9, qword[num]
    jne noforte

; SYS_WRITE
isforte:
    mov [lvl], r12
	mov rax, 1
	mov rdi, 1
	mov rsi, isfuerte
	mov rdx, lenis
	syscall
    jmp _exit
noforte:
    ; SYS_WRITE
    mov [lvl], r13
	mov rax, 1
	mov rdi, 1
	mov rsi, noisfuerte
	mov rdx, lenno
	syscall

_exit:
; SYS_EXIT
	mov rax, 60
	mov rdi, 0
	syscall