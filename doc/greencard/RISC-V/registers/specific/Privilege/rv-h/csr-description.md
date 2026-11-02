## CONTROL AND STATUS REGISTER DESCRIPTIONS

| **Number** | **Access** | **Name**  | **Description**                            | **Version** |
|:-----------|:-----------|:----------|:-------------------------------------------|:------------|
| `0x200`    | `hrw`      | `hstatus` | `Hypervisor status register`               | `1.7-1.9.1` |
| `0x202`    | `mrw`      | `hedeleg` | `Hypervisor exception delegation register` | `1.9-1.9.1` |
| `0x203`    | `mrw`      | `hideleg` | `Hypervisor interrupt delegation register` | `1.9-1.9.1` |
| `0x204`    | `mrw`      | `hie`     | `Hypervisor interrupt-enable register`     | `1.7-1.9.1` |
| `0x205`    | `hrw`      | `htvec`   | `Hypervisor trap handler base address`     | `1.7-1.9.1` |

:Hypervisor Trap Setup

| **Number** | **Access** | **Name**   | **Description**                                 | **Version** |
|:-----------|:-----------|:-----------|:------------------------------------------------|:------------|
| `0x240`    | `hrw`      | `hscratch` | `Scratch register for hypervisor trap handlers` | `1.7-1.9.1` |
| `0x241`    | `hrw`      | `hepc`     | `Hypervisor exception program counter`          | `1.7-1.9.1` |
| `0x242`    | `hrw`      | `hcause`   | `Hypervisor trap cause`                         | `1.7-1.9.1` |
| `0x243`    | `hrw`      | `hbadaddr` | `Hypervisor bad address`                        | `1.7-1.9.1` |
| `0x244`    | `hrw`      | `hip`      | `Hypervisor interrupt pending`                  | `1.7-1.9.1` |

:Hypervisor Trap Handling

| **Number** | **Access** | **Name**    | **Description**                           | **Version**      |
|:-----------|:-----------|:------------|:------------------------------------------|:-----------------|
| `0xE00`    | `sro`      | `hcycle`    | `Hypervisor cycle counter`                | `1.7-1.9.1`      |
| `0xE01`    | `sro`      | `htime`     | `Hypervisor wall-clock time`              | `1.7-1.9`        |
| `0xE02`    | `sro`      | `hinstret`  | `Hypervisor instructions-retired counter` | `1.9-1.9.1`      |
| `0xE80`    | `sro`      | `hcycleh`   | `Upper 32 bits of hcycle, RV32I only`     | `1.7-1.9.1,rv32` |
| `0xE81`    | `sro`      | `htimeh`    | `Upper 32 bits of htime, RV32I only`      | `1.7-1.9,rv32`   |
| `0xE82`    | `sro`      | `hinstreth` | `Upper 32 bits of hinstret, RV32I only`   | `1.9-1.9.1,rv32` |

:Hypervisor Timers and Counters