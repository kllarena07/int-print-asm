.global _main
.align 4

.data
    buffer: .space 2                ; max number is 99, "99\n"

.text
_main:
    mov x0, #33                     ; select a number 1-9

    mov x9, x0                      ; copy value
    mov x10, #0                     ; set x10 to 0

_reduce_loop:
    cmp x9, #10                     ; compare x9 with 10
    blt _reduce_done                ; if x9 < 10, exit loop
    sub x9, x9, #10                 ; subtract 10 from x9
    add x10, x10, #1                ; increment x10
    b _reduce_loop                  ; repeat loop

_reduce_done:
    mov x0, x10                     ; set 10s place
    add x0, x0, #48                 ; convert number to ASCII decimal
    adrp x1, buffer@PAGE            ; calculate address of start of buffer
    add x1, x1, buffer@PAGEOFF      ; set buffer offset to 0
    strb w0, [x1]                   ; store data in buffer address

    mov x0, x9                      ; set 1s place
    add x0, x0, #48                 ; convert number to ASCII decimal
    adrp x1, buffer@PAGE            ; calculate address of start of buffer
    add x1, x1, buffer@PAGEOFF      ; set buffer offset to 0
    add x1, x1, #1                  ; set buffer offset to 1
    strb w0, [x1]                   ; store data in buffer address

    mov x0, #1                      ; stdout
    adrp x1, buffer@PAGE            ; calculate buffer addr
    add x1, x1, buffer@PAGEOFF      ; set char buffer data
    mov x2, #3                      ; set buffer size
    mov x16, #4                     ; perform syscall
    svc 0                           ; issue supervisor call

    b _terminate

_terminate:
    mov x0, #0
    mov x16, #1
    svc 0
