.global _start

.section .text
_start:
    // Load values into registers
    MOV x0, #8           // Load 8 into x0
    MOV x1, #12          // Load 12 into x1

    // Compare x0 and x1
    CMP x0, x1           // Compare x0 and x1 (8 - 12)

    // Branch based on the comparison
    B.GT greater         // If x0 > x1, branch to "greater"
    B.LT less            // If x0 < x1, branch to "less"
    B.EQ equal           // If x0 == x1, branch to "equal"

greater:
    // x0 > x1 block
    MOV x2, #1           // Load 1 into x2 (indicating x0 > x1)
    B end                // Branch to end

less:
    // x0 < x1 block
    MOV x2, #2           // Load 2 into x2 (indicating x0 < x1)
    B end                // Branch to end

equal:
    // x0 == x1 block
    MOV x2, #3           // Load 3 into x2 (indicating x0 == x1)
    B end                // Branch to end

end:
    // Exit the program
    MOV x8, #93          // syscall number (sys_exit)
    MOV x0, #0           // exit code 0
    SVC 0

