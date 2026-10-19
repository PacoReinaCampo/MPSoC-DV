## INSTRUCTION PSEUDO-CODE (PL)

Pseudo-Code in C-like syntax provides a high-level representation of RISC-V instructions, illustrating their behavior and operational flow without delving into specific machine-level details. This abstraction aids in software development, algorithm design, and understanding of instruction semantics across different implementations and extensions of the RISC-V ISA.

Format of a line in the table:

`<instruction name> "<instruction pseudo-code>"`

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `ecall`      |                                                                                                             |
| `ebreak`     |                                                                                                             |
| `uret`       |                                                                                                             |
| `sret`       |                                                                                                             |
| `hret`       |                                                                                                             |
| `mret`       |                                                                                                             |
| `dret`       |                                                                                                             |
| `sfence.vm`  |                                                                                                             |
| `wfi`        |                                                                                                             |
| `rdcycle`    |                                                                                                             |
| `rdtime`     |                                                                                                             |
| `rdinstret`  |                                                                                                             |
| `rdcycleh`   |                                                                                                             |
| `rdtimeh`    |                                                                                                             |
| `rdinstreth` |                                                                                                             |
| `csrrw`      |                                                                                                             |
| `csrrs`      |                                                                                                             |
| `csrrc`      |                                                                                                             |
| `csrrwi`     |                                                                                                             |
| `csrrsi`     |                                                                                                             |
| `csrrci`     |                                                                                                             |

:RV32S - "RV32S Standard Extension for Supervisor-level Instructions"

This section covers supervisor-level instructions tailored for the 32-bit RISC-V architecture, including privileged operations and management functions for system-level tasks.
