; Hello World Program
; learned from https://www.youtube.com/watch?v=HgEGAaYdABA
; assembled in https://www.tutorialspoint.com/compile_assembly_online.php

global _start ; defines the global start function (our main function)

section .text: ; defines instructions
_start:
; start with a write syscall
    mov eax, 0x4                        ; use the WRITE syscall
    mov ebx, 1                          ; param for write: use stdout as the file descriptor
    mov ecx, message                    ; use the message as the buffer
    mov edx, message_length             ; and supply the length
    int 0x80                            ; conclude syscall: WRITE
    
; we can still use the data yet to be cleared from 'ebx', 'ecx' & 'edx'
; but we still have to declare the syscall to use in 'eax'. Repeate the output twice
    mov eax, 0x4                        ; use the WRITE syscall
    int 0x80                            ; conclude syscall: WRITE
    mov eax, 0x4                        ; use the WRITE syscall
    int 0x80                            ; conclude syscall: WRITE

; now the return syscall
    mov eax, 0x1                        ; use the RETURN syscall
    mov ebx, 0                          ; parameter for return: 0 (usually means success)
    int 0x80                            ; conclude syscall: RETURN

section .data: ; defines data
    message: db "Hello world!", 0xA     ; 0xA is the number in ascii for the '\n' character, comma concatinated
    message_length: equ $-message       ; grabs the size of the memory
    
; Notes:
; https://www.tutorialspoint.com/assembly_programming/assembly_registers.htm#:~:text=To%20speed%20up%20the%20processor,built%20into%20the%20processor%20chip.
; https://www.cs.virginia.edu/~evans/cs216/guides/x86.html
; - eax, ebx, ecx, edx are registers used in 32 & 64 bit processors
; - rax, rbx, rcx, rdx are registers exclusive to 64 bit processors
; ax = primary accumulator
; bx = base register
; cx = count register
; dx = data register
; esi =
; edi =
; esp = stack pointer
; ebp = base pointer
