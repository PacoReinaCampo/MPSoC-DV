## TRAPS

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