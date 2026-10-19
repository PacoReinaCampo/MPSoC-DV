## INSTRUCTION CLASSES

RISC-V instructions are classified into distinct classes based on their primary operations and operand types:

- **Arithmetic**: Operations like addition, subtraction, multiplication.
- **Logical**: Bitwise operations such as AND, OR, XOR.
- **Memory**: Load and store operations for data access.
- **Control Transfer**: Branches and jumps for altering program flow.
- **System**: Instructions for privileged operations and interaction with control and status registers (CSRs).

Each class serves a specific role in program execution and is encoded with corresponding opcodes to facilitate efficient instruction decoding and execution.

Format of a line in the table:

`<ins name> <class>`

| instruction  | class           |
|--------------|:----------------|
| `lr.w`       | `atomic`        |
| `sc.w`       | `atomic`        |
| `amoswap.w`  | `atomic`        |
| `amoadd.w`   | `atomic`        |
| `amoxor.w`   | `atomic`        |
| `amoor.w`    | `atomic`        |
| `amoand.w`   | `atomic`        |
| `amomin.w`   | `atomic`        |
| `amomax.w`   | `atomic`        |
| `amominu.w`  | `atomic`        |
| `amomaxu.w`  | `atomic`        |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

Detailed here are the atomic instruction set extensions for the 32-bit RISC-V architecture, providing concurrency control primitives essential for synchronization in multi-threaded environments.

| instruction  | class           |
|--------------|:----------------|
| `lr.d`       | `atomic`        |
| `sc.d`       | `atomic`        |
| `amoswap.d`  | `atomic`        |
| `amoadd.d`   | `atomic`        |
| `amoxor.d`   | `atomic`        |
| `amoor.d`    | `atomic`        |
| `amoand.d`   | `atomic`        |
| `amomin.d`   | `atomic`        |
| `amomax.d`   | `atomic`        |
| `amominu.d`  | `atomic`        |
| `amomaxu.d`  | `atomic`        |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

Extending atomic operations to 64-bit, RV64A builds upon RV32A by offering atomic instructions for manipulating memory in a thread-safe manner across larger data sets.
