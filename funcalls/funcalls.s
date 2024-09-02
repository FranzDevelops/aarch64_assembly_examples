.global _start

.section .text
_start:
    // Call function1
    BL function1         // Call function1, result in x0
    MOV x2, x0           // Store the result in x2
    
    // Call function2 with the result from function1
    MOV x0, x2           // Pass the result from function1 as an argument to function2
    BL function2         // Call function2, result in x0

    // Exit the program
    MOV x8, #93          // syscall number (sys_exit)
    SVC 0

// Function 1: Add 10 and 20
function1:
    MOV x0, #10          // First argument
    MOV x1, #20          // Second argument
    ADD x0, x0, x1       // x0 = x0 + x1
    RET                  // Return to caller

// Function 2: Multiply by 2
function2:
    ADD x0, x0, x0       // x0 = x0 * 2 (using addition for simplicity)
    RET                  // Return to caller

