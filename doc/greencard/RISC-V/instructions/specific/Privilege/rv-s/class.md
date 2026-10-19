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
| `ecall`      | `system`        |
| `ebreak`     | `system`        |
| `uret`       | `system`        |
| `sret`       | `system`        |
| `hret`       | `system`        |
| `mret`       | `system`        |
| `dret`       | `system`        |
| `sfence.vm`  | `system`        |
| `wfi`        | `system`        |
| `rdcycle`    | `csr`           |
| `rdtime`     | `csr`           |
| `rdinstret`  | `csr`           |
| `rdcycleh`   | `csr`           |
| `rdtimeh`    | `csr`           |
| `rdinstreth` | `csr`           |
| `csrrw`      | `csr`           |
| `csrrs`      | `csr`           |
| `csrrc`      | `csr`           |
| `csrrwi`     | `csr`           |
| `csrrsi`     | `csr`           |
| `csrrci`     | `csr`           |

:RV32S - "RV32S Standard Extension for Supervisor-level Instructions"

This section covers supervisor-level instructions tailored for the 32-bit RISC-V architecture, including privileged operations and management functions for system-level tasks.
