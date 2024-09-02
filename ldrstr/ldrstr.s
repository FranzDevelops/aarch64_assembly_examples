.global _start

.section .data
num1:    .word 5      // 32-bit word (4 bytes)
num2:    .word 10

.section .text
_start:
    LDR x1, =num1     // Load the address of num1 into x1
    LDR w0, [x1]      // Load the value at num1 into w0 (w0 = 5)
    
    LDR x2, =num2     // Load the address of num2 into x2
    LDR w3, [x2]      // Load the value at num2 into w3 (w3 = 10)
    
    ADD w4, w0, w3    // w4 = w0 + w3 = 15
    
    STR w4, [x1]      // Store the result (15) back into num1
    
    // Exit the program
    MOV x8, #93       // syscall number (sys_exit)
    MOV x0, #0        // exit code 0
    SVC 0

