.global _start

.section .text
_start:
    MOV x0, #0b1100    // x0 = 1100 (binary)
    MOV x1, #0b1010    // x1 = 1010 (binary)
    
    AND x2, x0, x1     // x2 = x0 AND x1 = 1000 (binary)
    ORR x3, x0, x1     // x3 = x0 OR x1 = 1110 (binary)
    EOR x4, x0, x1     // x4 = x0 XOR x1 = 0110 (binary)
    MVN x5, x0         // x5 = NOT x0 = 1111...0011 (inverted bits)

    // Exit the program
    MOV x8, #93        // syscall number (sys_exit)
    MOV x0, #0         // exit code 0
    SVC 0
