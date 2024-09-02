.global _start

.section .text
_start:
    mov x0, #1          // file descriptor (stdout)
    ldr x1, =message    // pointer to message
    mov x2, #14         // length of the message
    mov x8, #64         // syscall number (sys_write)
    svc 0

    mov x0, #0          // exit status
    mov x8, #93         // syscall number (sys_exit)
    svc 0

.section .data
message:
    .ascii "Hello, World!\n"
