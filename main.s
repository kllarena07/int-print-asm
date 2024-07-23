.global _main
.align 4

.text
_main:
    b _terminate

_terminate:
    mov x0, #0
    mov x16, #1
    svc 0
