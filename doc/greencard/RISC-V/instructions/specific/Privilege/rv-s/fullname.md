## INSTRUCTION FULL-NAMES

| **Instruction** | **Instruction Full-Name**                                           |
|:----------------|:--------------------------------------------------------------------|
| `ecall`         | `Environment Call`                                                  |
| `ebreak`        | `Environment Break to Debugger`                                     |
| `uret`          | `User Return`                                                       |
| `sret`          | `System Return`                                                     |
| `hret`          | `Hypervisor Return`                                                 |
| `mret`          | `Machine-Mode Return`                                               |
| `dret`          | `Debug-Mode Return`                                                 |
| `sfence.vm`     | `Supervisor Memory Management Fence`                                |
| `wfi`           | `Wait For Interrupt`                                                |
| `rdcycle`       | `Read Cycle Counter Status Register`                                |
| `rdtime`        | `Read Timer Status register`                                        |
| `rdinstret`     | `Read Instructions Retired Status Register`                         |
| `rdcycleh`      | `Read Cycle Counter Status Register (upper 32-bits on RV32)`        |
| `rdtimeh`       | `Read Timer Status register (upper 32-bits on RV32)`                |
| `rdinstreth`    | `Read Instructions Retired Status Register (upper 32-bits on RV32)` |
| `csrrw`         | `CSR Atomic Read Write`                                             |
| `csrrs`         | `CSR Atomic Set Bit`                                                |
| `csrrc`         | `CSR Atomic Clear Bit`                                              |
| `csrrwi`        | `CSR Atomic Read Write Immediate`                                   |
| `csrrsi`        | `CSR Atomic Set Bit Immediate`                                      |
| `csrrci`        | `CSR Atomic Clear Bit Immediate`                                    |

:RV32S - "RV32S Standard Extension for Supervisor-level Instructions"