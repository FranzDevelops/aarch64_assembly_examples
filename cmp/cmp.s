.global _start

.section .text
_start:
    MOV x0, #5          // Load 5 into x0
    MOV x1, #10         // Load 10 into x1
    
    CMP x0, x1          // Compare x0 and x1 (5 - 10)
    B.GT greater        // Branch to "greater" if x0 > x1 (if Z flag is clear and N flag is clear)
    B.LT less           // Branch to "less" if x0 < x1 (if N flag is set)
    B.EQ equal          // Branch to "equal" if x0 == x1 (if Z flag is set)

greater:
    // x0 > x1 (This block is skipped in this example)
    MOV x8, #93         // syscall number (sys_exit)
    MOV x0, #2          // exit code 2
    SVC 0

less:
    // x0 < x1
    MOV x8, #93         // syscall number (sys_exit)
    MOV x0, #1          // exit code 1
    SVC 0

equal:
    // x0 == x1 (This block is skipped in this example)
    MOV x8, #93         // syscall number (sys_exit)
    MOV x0, #0          // exit code 0
    SVC 0

