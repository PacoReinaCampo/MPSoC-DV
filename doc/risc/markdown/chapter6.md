# INSTRUCTIONS

## INSTRUCTION EXECUTION

Instruction execution in the IEEE 1754-1994 architecture involves fetching an instruction from memory, decoding it, and executing it using the appropriate functional units of the processor (such as the IU, FPU, or CP). The execution follows a pipelined process to enhance performance, allowing multiple instructions to be in different stages of execution simultaneously.

## INSTRUCTION FORMATS

### Instruction Fields

The IEEE 1754-1994 standard defines a fixed instruction format to streamline decoding and execution. Each instruction is typically 32 bits long and divided into several fields:

1. **Opcode**: Specifies the operation to be performed.
2. **Source Register(s)**: Indicate the register(s) containing the operands.
3. **Destination Register**: Indicates the register where the result will be stored.
4. **Immediate Value**: Used for instructions that operate with a constant value.
5. **Shift/Function**: Used for additional information, such as shift amounts or specific functions within an opcode.

## INSTRUCTION CATEGORIES

### Memory Access Instructions

Memory access instructions are used to load data from memory into registers and store data from registers into memory. Key instructions include:

- **Load (LD)**: Transfers data from memory to a register.
- **Store (ST)**: Transfers data from a register to memory.
- **Load/Store Multiple**: Allows multiple registers to be loaded or stored in a single operation, improving efficiency.

### Integer Arithmetic Instructions

Integer arithmetic instructions perform basic arithmetic operations on integer data types. Key instructions include:

- **ADD**: Adds two integers.
- **SUB**: Subtracts one integer from another.
- **MUL**: Multiplies two integers.
- **DIV**: Divides one integer by another.
- **MOD**: Computes the remainder of a division.

### Control-Transfer Instructions (CTIs)

Control-transfer instructions alter the flow of execution by changing the program counter. Key instructions include:

- **Jump (JMP)**: Unconditionally transfers control to a specified address.
- **Branch (BR)**: Conditionally transfers control based on the evaluation of a condition (e.g., BEQ for branch if equal).
- **Call (CALL)**: Saves the current context and transfers control to a subroutine.
- **Return (RET)**: Restores the saved context and returns control from a subroutine.

### SAVE Instruction

- **SAVE**: Used to save the current register window and advance to a new register window. This is particularly useful for nested function calls, reducing the overhead of manually saving and restoring registers.

### RESTORE Instruction

- **RESTORE**: Reverses the effect of the SAVE instruction by restoring the previous register window, making the saved registers available again.

### State Register Access

These instructions provide access to special-purpose registers that control the state of the processor. Key instructions include:

- **Move to State Register (MSR)**: Transfers data from a general-purpose register to a state register.
- **Move from State Register (MFSR)**: Transfers data from a state register to a general-purpose register.

### Floating-Point Operate (FPop) Instructions

Floating-point operate instructions perform arithmetic operations on floating-point numbers. Key instructions include:

- **FADD**: Adds two floating-point numbers.
- **FSUB**: Subtracts one floating-point number from another.
- **FMUL**: Multiplies two floating-point numbers.
- **FDIV**: Divides one floating-point number by another.
- **FSQRT**: Computes the square root of a floating-point number.

### Coprocessor Operate (CPop) Instructions

Coprocessor operate instructions are used to perform operations specific to the coprocessor. These instructions extend the processor's functionality by leveraging the specialized capabilities of the coprocessor. Key instructions include:

- **CPLD**: Loads data from memory into a coprocessor register.
- **CPST**: Stores data from a coprocessor register into memory.
- **CP Arithmetic**: Performs arithmetic operations using the coprocessor.

### Reserved Instructions

Reserved instructions are placeholders in the instruction set that are not currently assigned a specific function. These instructions are reserved for future extensions and enhancements to the architecture. Implementations must ensure that executing a reserved instruction triggers a trap, allowing the system to handle it appropriately.

Summary Table for Quick Reference:

| Instruction Category      | Key Instructions                                     | Description                                                                                       |
|---------------------------|------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| Memory Access             | LD, ST, Load/Store Multiple                          | Load/store data between memory and registers.                                                     |
| Integer Arithmetic        | ADD, SUB, MUL, DIV, MOD                              | Perform arithmetic operations on integers.                                                        |
| Control-Transfer          | JMP, BR (e.g., BEQ), CALL, RET                       | Alter the flow of execution (unconditional and conditional jumps, subroutine calls and returns).  |
| SAVE                      | SAVE                                                 | Save the current register window and switch to a new one.                                         |
| RESTORE                   | RESTORE                                              | Restore the previous register window.                                                             |
| State Register Access     | MSR, MFSR                                            | Access special-purpose state registers.                                                           |
| Floating-Point Operate    | FADD, FSUB, FMUL, FDIV, FSQRT                        | Perform arithmetic operations on floating-point numbers.                                          |
| Coprocessor Operate       | CPLD, CPST, CP Arithmetic                            | Perform operations using the coprocessor.                                                         |
| Reserved                  | (Various)                                            | Reserved for future use; executing these triggers a trap.                                         |

Understanding these instruction categories and their specific instructions is crucial for effectively programming and optimizing systems based on the IEEE 1754-1994 standard. Each category plays a vital role in the overall operation of the processor, enabling efficient data processing, control flow management, and utilization of specialized processing units.
