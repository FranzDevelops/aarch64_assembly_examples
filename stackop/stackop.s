.global _start

.section .text
_start:
    MOV x0, #10          // First argument
    MOV x1, #20          // Second argument

    BL add_numbers       // Call the function, result in x0

    // Exit the program
    MOV x8, #93          // syscall number (sys_exit)
    SVC 0

// Function definition
add_numbers:
    // Save the caller's registers on the stack
    STP x29, x30, [SP, #-16]!  // Save FP (x29) and LR (x30), decrement SP by 16
    MOV x29, SP                 // Set FP (x29) to the current SP

    // Save x0 and x1 on the stack
    STP x0, x1, [SP, #-16]!     // Save x0 and x1, decrement SP by 16

    // Perform the addition
    ADD x0, x0, x1              // x0 = x0 + x1

    // Restore x0 and x1 from the stack
    LDP x0, x1, [SP], #16       // Restore x0 and x1, increment SP by 16

    // Restore the caller's registers from the stack
    LDP x29, x30, [SP], #16     // Restore FP (x29) and LR (x30), increment SP by 16

    RET                         // Return to the caller

