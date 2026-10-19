## INSTRUCTION FULL-NAMES

The RISC-V ISA defines a comprehensive set of instructions, each identified by an opcode that denotes its operation. Full-Names for instructions typically include a mnemonic followed by suffixes indicating specific variants or extensions. For instance, "ADD" denotes addition, while "ADDI" specifies addition with an immediate operand.

Format of a line in the table:

`<instruction name> "<instruction full-name>"`

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `ecall`      | `Environment Call`                                                  |
| `ebreak`     | `Environment Break to Debugger`                                     |
| `uret`       | `User Return`                                                       |
| `sret`       | `System Return`                                                     |
| `hret`       | `Hypervisor Return`                                                 |
| `mret`       | `Machine-Mode Return`                                               |
| `dret`       | `Debug-Mode Return`                                                 |
| `sfence.vm`  | `Supervisor Memory Management Fence`                                |
| `wfi`        | `Wait For Interrupt`                                                |
| `rdcycle`    | `Read Cycle Counter Status Register`                                |
| `rdtime`     | `Read Timer Status register`                                        |
| `rdinstret`  | `Read Instructions Retired Status Register`                         |
| `rdcycleh`   | `Read Cycle Counter Status Register (upper 32-bits on RV32)`        |
| `rdtimeh`    | `Read Timer Status register (upper 32-bits on RV32)`                |
| `rdinstreth` | `Read Instructions Retired Status Register (upper 32-bits on RV32)` |
| `csrrw`      | `CSR Atomic Read Write`                                             |
| `csrrs`      | `CSR Atomic Set Bit`                                                |
| `csrrc`      | `CSR Atomic Clear Bit`                                              |
| `csrrwi`     | `CSR Atomic Read Write Immediate`                                   |
| `csrrsi`     | `CSR Atomic Set Bit Immediate`                                      |
| `csrrci`     | `CSR Atomic Clear Bit Immediate`                                    |

:RV32S - "RV32S Standard Extension for Supervisor-level Instructions"

This section covers supervisor-level instructions tailored for the 32-bit RISC-V architecture, including privileged operations and management functions for system-level tasks.
