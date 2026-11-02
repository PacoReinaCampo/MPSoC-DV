## CONTROL AND STATUS REGISTER DESCRIPTIONS

| **Number** | **Access** | **Name**     | **Description**                            | **Version** |
|:-----------|:-----------|:-------------|:-------------------------------------------|:------------|
| `0x100`    | `srw`      | `sstatus`    | `Supervisor status register`               | `1.7-`      |
| `0x102`    | `srw`      | `sedeleg`    | `Supervisor exception delegation register` | `1.9-`      |
| `0x103`    | `srw`      | `sideleg`    | `Supervisor interrupt delegation register` | `1.9-`      |
| `0x104`    | `src`      | `sie`        | `Supervisor interrupt-enable register`     | `1.7-`      |
| `0x105`    | `srw`      | `stvec`      | `Supervisor trap handler base address`     | `1.7-`      |
| `0x106`    | `swr`      | `scounteren` | `Supervisor counter enable`                | `1.10-`     |

:Supervisor Trap Setup

| **Number** | **Access** | **Name**   | **Description**                                 | **Version** |
|:-----------|:-----------|:-----------|:------------------------------------------------|:------------|
| `0x140`    | `srw`      | `sscratch` | `Scratch register for supervisor trap handlers` | `1.7-`      |
| `0x141`    | `srw`      | `sepc`     | `Supervisor exception program counter`          | `1.7-`      |
| `0x142`    | `srw`      | `scause`   | `Supervisor trap cause`                         | `1.7-`      |
| `0x143`    | `srw`      | `sbadaddr` | `Supervisor bad address`                        | `1.7-1.9.1` |
| `0x143`    | `srw`      | `stval`    | `Supervisor bad address or instruction`         | `1.10-`     |
| `0x144`    | `srw`      | `sip`      | `Supervisor interrupt pending`                  | `1.7-`      |

:Supervisor Trap Handling

| **Number** | **Access** | **Name** | **Description**                                 | **Version** |
|:-----------|:-----------|:---------|:------------------------------------------------|:------------|
| `0x180`    | `srw`      | `sptbr`  | `Page-table base register`                      | `1.7-1.9.1` |
| `0x180`    | `srw`      | `satp`   | `Supervisor address translation and protection` | `1.10-`     |

:Supervisor Protection and Translation

| **Number** | **Access** | **Name**    | **Description**                           | **Version** |
|:-----------|:-----------|:------------|:------------------------------------------|:------------|
| `0xD00`    | `sro`      | `scycle`    | `Supervisor cycle counter`                | `1.9-`      |
| `0xD01`    | `sro`      | `stime`     | `Supervisor wall-clock time`              | `1.7-1.9`   |
| `0xD02`    | `sro`      | `sinstret`  | `Supervisor instructions-retired counter` | `1.9-`      |
| `0xD80`    | `sro`      | `scycleh`   | `Upper 32 bits of scycle, RV32I only`     | `1.9-,rv32` |
| `0xD81`    | `sro`      | `stimeh`    | `Upper 32 bits of stime, RV32I only`      | `1.7-,rv32` |
| `0xD82`    | `sro`      | `sinstreth` | `Upper 32 bits of sinstret, RV32I only`   | `1.9-,rv32` |

:Supervisor Timers and Counters