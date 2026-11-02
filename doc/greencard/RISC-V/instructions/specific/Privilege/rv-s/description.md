## INSTRUCTION DESCRIPTIONS

| **Instruction Name** | **Instruction Description**                                                                                           |
|:---------------------|:----------------------------------------------------------------------------------------------------------------------|
| `scall`              | `System call is used to make a request to a higher privilege level`                                                   |
| `sbreak`             | `Break to Debugger causes control to be transferred back to the debugging environment via a breakpoint exception`     |
| `sret`               | `System Return returns to the supervisor mode privilege level after handling a trap`                                  |
| `sfence.vm`          | `Supervisor memory-management fence synchronizes updates to in-memory memory-management data structures`              |
| `wfi`                | `Wait for Interrupt indicates the hart can be stalled until an interrupt needs servicing`                             |
| `rdcycle`            | `Read cycle counter status register`                                                                                  |
| `rdtime`             | `Read timer status register`                                                                                          |
| `rdinstret`          | `Read instructions retired status register`                                                                           |
| `rdcycleh`           | `Read cycle counter status register (upper 32-bits on RV32)`                                                          |
| `rdtimeh`            | `Read timer status register (upper 32-bits on RV32)`                                                                  |
| `rdinstreth`         | `Read instructions retired status register (upper 32-bits on RV32)`                                                   |
| `csrrw`              | `CSR Atomic Read Write writes the value in rs1 to the CSR, and writes previous value to rd`                           |
| `csrrs`              | `CSR Atomic Set Bit reads the CSR, sets CSR bits set in rs1, and writes previous value to rd`                         |
| `csrrc`              | `CSR Atomic Clear Bit reads the CSR, clears CSR bits set in rs1, and writes previous value to rd`                     |
| `csrrwi`             | `CSR Atomic Read Write Immediate writes the immediate value to the CSR, and writes previous value to rd`              |
| `csrrsi`             | `CSR Atomic Set Bit Immediate reads the CSR, sets CSR bits set in the immediate, and writes previous value to rd`     |
| `csrrci`             | `CSR Atomic Clear Bit Immediate reads the CSR, clears CSR bits set in the immediate, and writes previous value to rd` |

:RV32S - "RV32S Standard Extension for Supervisor-level Instructions"