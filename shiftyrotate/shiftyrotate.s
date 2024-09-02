.global _start

.section .text
_start:
    MOV x0, #0b00001111    // x0 = 00000000 00000000 00000000 00001111

    LSL x1, x0, #2         // x1 = x0 << 2 = 00000000 00000000 00000000 00111100
    LSR x2, x0, #2         // x2 = x0 >> 2 = 00000000 00000000 00000000 00000011
    ASR x3, x0, #2         // x3 = x0 >> 2 (arith) = 00000000 00000000 00000000 00000011 (same as LSR for positive)
    
    MOV x4, #0b10001111    // x4 = 10000000 00000000 00000000 00001111
    ASR x5, x4, #2         // x5 = x4 >> 2 (arith) = 11100000 00000000 00000000 00000011 (preserves sign)
    
    ROR x6, x0, #2         // x6 = x0 rotated right by 2 = 11000000 00000000 00000000 00000011

    // Exit the program
    MOV x8, #93            // syscall number (sys_exit)
    MOV x0, #0             // exit code 0
    SVC 0
