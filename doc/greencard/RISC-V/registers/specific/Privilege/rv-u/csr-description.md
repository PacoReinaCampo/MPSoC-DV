## CONTROL AND STATUS REGISTER DESCRIPTIONS

Control and Status Registers (CSRs) in RISC-V provide mechanisms for managing processor state and control. These registers typically include machine-level and supervisor-level CSRs, which control privileged operations and system-level functions. CSRs are accessed through dedicated instructions, allowing software to read and modify processor state safely and efficiently. They play a critical role in system management, exception handling, and performance monitoring.

Format of a line in the table:
`<csr number> <csr access> <csr name> "<csr description>" <version>`

`<access> is one of urw, uro, srw, sro, hrw, hro, mrw, mro`

`<version> is [introduced]-[deprecated]`

| **number** | **access** | **name**  | **description**                  | **version** |
|------------|:-----------|:----------|:---------------------------------|:------------|
| `0x000`    | `urw`      | `ustatus` | `User status register`           | `1.9-`      |
| `0x004`    | `urw`      | `uie`     | `User interrupt-enable register` | `1.9-`      |
| `0x005`    | `urw`      | `utvec`   | `User trap handler base address` | `1.9-`      |

:User Trap Setup

The configuration and setup details for traps and exceptions at the user level in the RISC-V architecture.

| **number** | **access** | **name**   | **description**                          | **version** |
|------------|:-----------|:-----------|:-----------------------------------------|:------------|
| `0x040`    | `urw`      | `uscratch` | `Scratch handler for user trap handlers` | `1.9-`      |
| `0x041`    | `urw`      | `uepc`     | `User exception program counter`         | `1.9-`      |
| `0x042`    | `urw`      | `ucause`   | `User trap cause`                        | `1.9-`      |
| `0x043`    | `urw`      | `ubadaddr` | `User bad address`                       | `1.7-1.9.1` |
| `0x043`    | `urw`      | `utval`    | `User bad address or instruction`        | `1.10-`     |
| `0x044`    | `urw`      | `uip`      | `User interrupt pending`                 | `1.9-`      |

:User Trap Handling

Details in this table cover how traps and exceptions are handled specifically within the user privilege level of the RISC-V ISA.

| **number** | **access** | **name** | **description**                                    | **version** |
|------------|:-----------|:---------|:---------------------------------------------------|:------------|
| `0x001`    | `urw`      | `fflags` | `Floating-Point Accrued Exceptions`                | `1.7-`      |
| `0x002`    | `urw`      | `frm`    | `Floating-Point Dynamic Rounding Mode`             | `1.7-`      |
| `0x003`    | `urw`      | `fcsr`   | `Floating-Point Control and Status (frm + fflags)` | `1.7-`      |

:User Floating-Point CSRs

This section lists the Control and Status Registers (CSRs) related to floating-point operations that are accessible at the user level.

| **number** | **access** | **name**   | **description**                                | **version** |
|------------|:-----------|:-----------|:-----------------------------------------------|:------------|
| `0xC00`    | `uro`      | `cycle`    | `Cycle counter (for RDCYCLE)`                  | `1.7-`      |
| `0xC01`    | `uro`      | `time`     | `Wall-clock time (for RDTIME)`                 | `1.7-`      |
| `0xC02`    | `uro`      | `instret`  | `Instructions-retired counter (for RDINSTRET)` | `1.7-`      |
| `0xC80`    | `uro`      | `cycleh`   | `Upper 32 bits of cycle, RV32I only`           | `1.7-,rv32` |
| `0xC81`    | `uro`      | `timeh`    | `Upper 32 bits of time, RV32I only`            | `1.7-,rv32` |
| `0xC82`    | `uro`      | `instreth` | `Upper 32 bits of instret, RV32I only`         | `1.7-,rv32` |

:User Timers and Counters

The timers and counters available to user-level programs are outlined and described in this table of the RISC-V ISA.
