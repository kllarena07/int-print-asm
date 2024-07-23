.global _main
.align 4

.data
    buffer: .space 2

.text
_main:
    mov x0, #9                      ; select a number 1-9

    add x0, x0, #48                 ; convert number to ASCII decimal
    adrp x1, buffer@PAGE            ; calculate address of start of buffer
    add x1, x1, buffer@PAGEOFF      ; set buffer offset to 0
    strb w0, [x1]                   ; store data in buffer address

    mov x0, #10                     ; newline char
    adrp x1, buffer@PAGE            ; calculate address of start of buffer
    add x1, x1, buffer@PAGEOFF      ; set buffer offset to 0
    add x1, x1, #1                  ; set buffer offset to 1
    strb w0, [x1]                   ; store data in buffer address

    mov x0, #1                      ; stdout
    adrp x1, buffer@PAGE            ; calculate buffer addr
    add x1, x1, buffer@PAGEOFF      ; set char buffer data
    mov x2, #2                      ; set buffer size
    mov x16, #4                     ; perform syscall
    svc 0                           ; issue supervisor call

    b _terminate

_terminate:
    mov x0, #0
    mov x16, #1
    svc 0
