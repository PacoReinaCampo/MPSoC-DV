## CONTROL AND STATUS REGISTER DESCRIPTIONS

| **Number** | **Access** | **Name**  | **Description**                  | **Version** |
|:-----------|:-----------|:----------|:---------------------------------|:------------|
| `0x000`    | `urw`      | `ustatus` | `User status register`           | `1.9-`      |
| `0x004`    | `urw`      | `uie`     | `User interrupt-enable register` | `1.9-`      |
| `0x005`    | `urw`      | `utvec`   | `User trap handler base address` | `1.9-`      |

:User Trap Setup

| **Number** | **Access** | **Name**   | **Description**                          | **Version** |
|:-----------|:-----------|:-----------|:-----------------------------------------|:------------|
| `0x040`    | `urw`      | `uscratch` | `Scratch handler for user trap handlers` | `1.9-`      |
| `0x041`    | `urw`      | `uepc`     | `User exception program counter`         | `1.9-`      |
| `0x042`    | `urw`      | `ucause`   | `User trap cause`                        | `1.9-`      |
| `0x043`    | `urw`      | `ubadaddr` | `User bad address`                       | `1.7-1.9.1` |
| `0x043`    | `urw`      | `utval`    | `User bad address or instruction`        | `1.10-`     |
| `0x044`    | `urw`      | `uip`      | `User interrupt pending`                 | `1.9-`      |

:User Trap Handling

| **Number** | **Access** | **Name** | **Description**                                    | **Version** |
|:-----------|:-----------|:---------|:---------------------------------------------------|:------------|
| `0x001`    | `urw`      | `fflags` | `Floating-Point Accrued Exceptions`                | `1.7-`      |
| `0x002`    | `urw`      | `frm`    | `Floating-Point Dynamic Rounding Mode`             | `1.7-`      |
| `0x003`    | `urw`      | `fcsr`   | `Floating-Point Control and Status (frm + fflags)` | `1.7-`      |

:User Floating-Point CSRs

| **Number** | **Access** | **Name**   | **Description**                                | **Version** |
|:-----------|:-----------|:-----------|:-----------------------------------------------|:------------|
| `0xC00`    | `uro`      | `cycle`    | `Cycle counter (for RDCYCLE)`                  | `1.7-`      |
| `0xC01`    | `uro`      | `time`     | `Wall-clock time (for RDTIME)`                 | `1.7-`      |
| `0xC02`    | `uro`      | `instret`  | `Instructions-retired counter (for RDINSTRET)` | `1.7-`      |
| `0xC80`    | `uro`      | `cycleh`   | `Upper 32 bits of cycle, RV32I only`           | `1.7-,rv32` |
| `0xC81`    | `uro`      | `timeh`    | `Upper 32 bits of time, RV32I only`            | `1.7-,rv32` |
| `0xC82`    | `uro`      | `instreth` | `Upper 32 bits of instret, RV32I only`         | `1.7-,rv32` |

:User Timers and Counters