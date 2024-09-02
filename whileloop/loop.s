.global _start

.section .text
_start:
    // Initialize the counter
    MOV x0, #5           // Set x0 to 5 (counter)

while_loop:
    // Compare counter with 0
    CMP x0, #0           // Compare x0 with 0

    // If x0 == 0, exit the loop
    BEQ end_loop         // If equal, branch to end_loop

    // Perform loop body (in this case, just decrement the counter)
    SUB x0, x0, #1       // x0 = x0 - 1

    // Branch back to the start of the loop
    B while_loop         // Unconditional branch back to while_loop

end_loop:
    // Exit the program
    MOV x8, #93          // syscall number (sys_exit)
    MOV x0, #0           // exit code 0
    SVC 0
