## TRAPS

Format of a line in the table:

`<csr number> <csr access> <csr name> "<csr description>" <version>`

`<access> is one of urw, uro, srw, sro, hrw, hro, mrw, mro`

`<version> is [introduced]-[deprecated]`

| **number** | **access** | **name**     | **description**                         | **version** |
|:-----------|:-----------|:-------------|:----------------------------------------|:------------|
| `0x300`    | `mrw`      | `mstatus`    | `Machine status register`               | `1.7-`      |
| `0x301`    | `mrw`      | `misa`       | `ISA and extensions supported`          | `1.7-`      |
| `0x302`    | `mrw`      | `medeleg`    | `Machine exception delegation register` | `1.9-`      |
| `0x303`    | `mrw`      | `mideleg`    | `Machine interrupt delegation register` | `1.9-`      |
| `0x304`    | `mrw`      | `mie`        | `Machine interrupt-enable register`     | `1.7-`      |
| `0x305`    | `mrw`      | `mtvec`      | `Machine trap-handler base address`     | `1.7-`      |
| `0x306`    | `mrw`      | `mcounteren` | `Machine counter enable`                | `1.10-`     |

:Machine Trap Setup

Configuration specifics for setting up traps and exceptions at the machine privilege level are detailed in this part of the RISC-V ISA documentation.

| **number** | **access** | **name**    | **description**                                   | **version** |
|:-----------|:-----------|:------------|:--------------------------------------------------|:------------|
| `0x340`    | `mrw`      | `mscratch`  | `Scratch register for machine trap handlers`      | `1.7-`      |
| `0x341`    | `mrw`      | `mepc`      | `Machine exception program counter`               | `1.7-`      |
| `0x342`    | `mrw`      | `mcause`    | `Machine trap cause`                              | `1.7-`      |
| `0x343`    | `mrw`      | `mbadaddr`  | `Machine bad address`                             | `1.7-1.9.1` |
| `0x343`    | `mrw`      | `mtval`     | `Machine bad address or instruction`              | `1.10-`     |
| `0x344`    | `mrw`      | `mip`       | `Machine interrupt pending`                       | `1.7-`      |
| `0x3A0`    | `mrw`      | `pmpcfg0`   | `Physical memory protection configuration`        | `1.10-`     |
| `0x3A1`    | `mrw`      | `pmpcfg1`   | `Physical memory protection configuration (RV32)` | `1.10-`     |
| `0x3A2`    | `mrw`      | `pmpcfg2`   | `Physical memory protection configuration`        | `1.10-`     |
| `0x3A3`    | `mrw`      | `pmpcfg3`   | `Physical memory protection configuration (RV32)` | `1.10-`     |
| `0x3B0`    | `mrw`      | `pmpaddr0`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B1`    | `mrw`      | `pmpaddr1`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B2`    | `mrw`      | `pmpaddr2`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B3`    | `mrw`      | `pmpaddr3`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B4`    | `mrw`      | `pmpaddr4`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B5`    | `mrw`      | `pmpaddr5`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B6`    | `mrw`      | `pmpaddr6`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B7`    | `mrw`      | `pmpaddr7`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B8`    | `mrw`      | `pmpaddr8`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3B9`    | `mrw`      | `pmpaddr9`  | `Physical memory protection address register`     | `1.10-`     |
| `0x3BA`    | `mrw`      | `pmpaddr10` | `Physical memory protection address register`     | `1.10-`     |
| `0x3BB`    | `mrw`      | `pmpaddr11` | `Physical memory protection address register`     | `1.10-`     |
| `0x3BC`    | `mrw`      | `pmpaddr12` | `Physical memory protection address register`     | `1.10-`     |
| `0x3BE`    | `mrw`      | `pmpaddr13` | `Physical memory protection address register`     | `1.10-`     |
| `0x3BD`    | `mrw`      | `pmpaddr14` | `Physical memory protection address register`     | `1.10-`     |
| `0x3BF`    | `mrw`      | `pmpaddr15` | `Physical memory protection address register`     | `1.10-`     |

:Machine Trap Handling

This section covers the handling mechanisms and procedures for traps and exceptions at the machine privilege level of the RISC-V ISA.
