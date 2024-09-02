.global _start

.section .text
_start:
    MOV x0, #5          // x0 = 5
    MOV x1, #10         // x1 = 10
    ADD x2, x0, x1      // x2 = x0 + x1 = 15
    SUB x3, x2, x0      // x3 = x2 - x0 = 10
    MUL x4, x1, x0      // x4 = x1 * x0 = 50
    
    // Use SUBS to set the CPSR flags based on the result
    SUBS x5, x0, x1     // x5 = x0 - x1, sets NZCV
    
    // Example of branching based on the Zero flag (Z)
    B.EQ equal          // Branch to 'equal' if Z flag is set (x0 == x1)
    
    // Exit the program
    MOV x8, #93         // syscall number (sys_exit)
    MOV x0, #0          // exit code 0
    SVC 0

equal:
    // Exit with a different code if the numbers are equal
    MOV x8, #93         // syscall number (sys_exit)
    MOV x0, #1          // exit code 1
    SVC 0
