## CONTROL AND STATUS REGISTER DESCRIPTIONS

Control and Status Registers (CSRs) in RISC-V provide mechanisms for managing processor state and control. These registers typically include machine-level and supervisor-level CSRs, which control privileged operations and system-level functions. CSRs are accessed through dedicated instructions, allowing software to read and modify processor state safely and efficiently. They play a critical role in system management, exception handling, and performance monitoring.

Format of a line in the table:

`<csr number> <csr access> <csr name> "<csr description>" <version>`

`<access> is one of urw, uro, srw, sro, hrw, hro, mrw, mro`

`<version> is [introduced]-[deprecated]`

| **number** | **access** | **name**    | **description**      | **version** |
|:-----------|:-----------|:------------|:---------------------|:------------|
| `0xF11`    | `mro`      | `mvendorid` | `Vendor ID`          | `1.9-`      |
| `0xF12`    | `mro`      | `marchid`   | `Architecture ID`    | `1.9-`      |
| `0xF13`    | `mro`      | `mimpid`    | `Implementation ID`  | `1.9-`      |
| `0xF14`    | `mro`      | `mhartid`   | `Hardware thread ID` | `1.7-`      |

:Machine Information Registers

Registers containing essential machine information are listed and described in this table of the RISC-V ISA.

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

| **number** | **access** | **name**  | **description**              | **version** |
|:-----------|:-----------|:----------|:-----------------------------|:------------|
| `0x380`    | `mrw`      | `mbase`   | `Base register`              | `1.7-`      |
| `0x381`    | `mrw`      | `mbound`  | `Bound register`             | `1.7-`      |
| `0x382`    | `mrw`      | `mibase`  | `Instruction base register`  | `1.7-`      |
| `0x383`    | `mrw`      | `mibound` | `Instruction bound register` | `1.7-`      |
| `0x384`    | `mrw`      | `mdbase`  | `Data base register`         | `1.7-`      |
| `0x385`    | `mrw`      | `mdbound` | `Data bound register`        | `1.7-`      |

:Machine Protection and Translation

Details on the protection and translation mechanisms available to the machine mode are documented comprehensively in this table.

| **number** | **access** | **name**         | **description**                              | **version**    |
|:-----------|:-----------|:-----------------|:---------------------------------------------|:---------------|
| `0xB00`    | `mrw`      | `mcycle`         | `Machine cycle counter`                      | `1.7-`         |
| `0xB01`    | `mrw`      | `mtime`          | `Machine wall-clock time`                    | `1.7-1.9`      |
| `0xB02`    | `mrw`      | `minstret`       | `Machine instructions-retired counter`       | `1.7-`         |
| `0xB03`    | `mrw`      | `mhpmcounter3`   | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB04`    | `mrw`      | `mhpmcounter4`   | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB05`    | `mrw`      | `mhpmcounter5`   | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB06`    | `mrw`      | `mhpmcounter6`   | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB07`    | `mrw`      | `mhpmcounter7`   | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB08`    | `mrw`      | `mhpmcounter8`   | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB09`    | `mrw`      | `mhpmcounter9`   | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB0A`    | `mrw`      | `mhpmcounter10`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB0B`    | `mrw`      | `mhpmcounter11`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB0C`    | `mrw`      | `mhpmcounter12`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB0D`    | `mrw`      | `mhpmcounter13`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB0E`    | `mrw`      | `mhpmcounter14`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB0F`    | `mrw`      | `mhpmcounter15`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB10`    | `mrw`      | `mhpmcounter16`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB11`    | `mrw`      | `mhpmcounter17`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB12`    | `mrw`      | `mhpmcounter18`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB13`    | `mrw`      | `mhpmcounter19`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB14`    | `mrw`      | `mhpmcounter20`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB15`    | `mrw`      | `mhpmcounter21`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB16`    | `mrw`      | `mhpmcounter22`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB17`    | `mrw`      | `mhpmcounter23`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB18`    | `mrw`      | `mhpmcounter24`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB19`    | `mrw`      | `mhpmcounter25`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB1A`    | `mrw`      | `mhpmcounter26`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB1B`    | `mrw`      | `mhpmcounter27`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB1C`    | `mrw`      | `mhpmcounter28`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB1D`    | `mrw`      | `mhpmcounter29`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB1E`    | `mrw`      | `mhpmcounter30`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB1F`    | `mrw`      | `mhpmcounter31`  | `Machine performance-monitoring counter`     | `1.9.1-`       |
| `0xB80`    | `mrw`      | `mcycleh`        | `Upper 32 bits of mcycle, RV32I only`        | `1.7-,rv32`    |
| `0xB81`    | `mrw`      | `mtimeh`         | `Upper 32 bits of mtime, RV32I only`         | `1.7-1.9,rv32` |
| `0xB82`    | `mrw`      | `minstreth`      | `Upper 32 bits of minstret, RV32I only`      | `1.7-,rv32`    |
| `0xB83`    | `mrw`      | `mhpmcounter3h`  | `Upper 32 bits of mhpmcounter3, RV32I only`  | `1.9.1-`       |
| `0xB84`    | `mrw`      | `mhpmcounter4h`  | `Upper 32 bits of mhpmcounter4, RV32I only`  | `1.9.1-`       |
| `0xB85`    | `mrw`      | `mhpmcounter5h`  | `Upper 32 bits of mhpmcounter5, RV32I only`  | `1.9.1-`       |
| `0xB86`    | `mrw`      | `mhpmcounter6h`  | `Upper 32 bits of mhpmcounter6, RV32I only`  | `1.9.1-`       |
| `0xB87`    | `mrw`      | `mhpmcounter7h`  | `Upper 32 bits of mhpmcounter7, RV32I only`  | `1.9.1-`       |
| `0xB88`    | `mrw`      | `mhpmcounter8h`  | `Upper 32 bits of mhpmcounter8, RV32I only`  | `1.9.1-`       |
| `0xB89`    | `mrw`      | `mhpmcounter9h`  | `Upper 32 bits of mhpmcounter9, RV32I only`  | `1.9.1-`       |
| `0xB8A`    | `mrw`      | `mhpmcounter10h` | `Upper 32 bits of mhpmcounter10, RV32I only` | `1.9.1-`       |
| `0xB8B`    | `mrw`      | `mhpmcounter11h` | `Upper 32 bits of mhpmcounter11, RV32I only` | `1.9.1-`       |
| `0xB8C`    | `mrw`      | `mhpmcounter12h` | `Upper 32 bits of mhpmcounter12, RV32I only` | `1.9.1-`       |
| `0xB8D`    | `mrw`      | `mhpmcounter13h` | `Upper 32 bits of mhpmcounter13, RV32I only` | `1.9.1-`       |
| `0xB8E`    | `mrw`      | `mhpmcounter14h` | `Upper 32 bits of mhpmcounter14, RV32I only` | `1.9.1-`       |
| `0xB8F`    | `mrw`      | `mhpmcounter15h` | `Upper 32 bits of mhpmcounter15, RV32I only` | `1.9.1-`       |
| `0xB90`    | `mrw`      | `mhpmcounter16h` | `Upper 32 bits of mhpmcounter16, RV32I only` | `1.9.1-`       |
| `0xB91`    | `mrw`      | `mhpmcounter17h` | `Upper 32 bits of mhpmcounter17, RV32I only` | `1.9.1-`       |
| `0xB92`    | `mrw`      | `mhpmcounter18h` | `Upper 32 bits of mhpmcounter18, RV32I only` | `1.9.1-`       |
| `0xB93`    | `mrw`      | `mhpmcounter19h` | `Upper 32 bits of mhpmcounter19, RV32I only` | `1.9.1-`       |
| `0xB94`    | `mrw`      | `mhpmcounter20h` | `Upper 32 bits of mhpmcounter20, RV32I only` | `1.9.1-`       |
| `0xB95`    | `mrw`      | `mhpmcounter21h` | `Upper 32 bits of mhpmcounter21, RV32I only` | `1.9.1-`       |
| `0xB96`    | `mrw`      | `mhpmcounter22h` | `Upper 32 bits of mhpmcounter22, RV32I only` | `1.9.1-`       |
| `0xB97`    | `mrw`      | `mhpmcounter23h` | `Upper 32 bits of mhpmcounter23, RV32I only` | `1.9.1-`       |
| `0xB98`    | `mrw`      | `mhpmcounter24h` | `Upper 32 bits of mhpmcounter24, RV32I only` | `1.9.1-`       |
| `0xB99`    | `mrw`      | `mhpmcounter25h` | `Upper 32 bits of mhpmcounter25, RV32I only` | `1.9.1-`       |
| `0xB9A`    | `mrw`      | `mhpmcounter26h` | `Upper 32 bits of mhpmcounter26, RV32I only` | `1.9.1-`       |
| `0xB9B`    | `mrw`      | `mhpmcounter27h` | `Upper 32 bits of mhpmcounter27, RV32I only` | `1.9.1-`       |
| `0xB9C`    | `mrw`      | `mhpmcounter28h` | `Upper 32 bits of mhpmcounter28, RV32I only` | `1.9.1-`       |
| `0xB9D`    | `mrw`      | `mhpmcounter29h` | `Upper 32 bits of mhpmcounter29, RV32I only` | `1.9.1-`       |
| `0xB9E`    | `mrw`      | `mhpmcounter30h` | `Upper 32 bits of mhpmcounter30, RV32I only` | `1.9.1-`       |
| `0xB9F`    | `mrw`      | `mhpmcounter31h` | `Upper 32 bits of mhpmcounter31, RV32I only` | `1.9.1-`       |

:Machine Counters / Timers

The RISC-V ISA provides various counters and timers that are accessible at the machine privilege level, detailed here for reference.

| **number** | **access** | **name**      | **description**                                 | **version** |
|:-----------|:-----------|:--------------|:------------------------------------------------|:------------|
| `0x320`    | `mrw`      | `mucounteren` | `Machine interrupt-enable register`             | `1.9-1.9.1` |
| `0x321`    | `mrw`      | `mscounteren` | `Supervisor-mode counter enable`                | `1.9-1.9.1` |
| `0x322`    | `mrw`      | `mhcounteren` | `Hypervisor-mode counter enable`                | `1.9-1.9.1` |
| `0x323`    | `mrw`      | `mhpmevent3`  | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x324`    | `mrw`      | `mhpmevent4`  | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x325`    | `mrw`      | `mhpmevent5`  | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x326`    | `mrw`      | `mhpmevent6`  | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x327`    | `mrw`      | `mhpmevent7`  | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x328`    | `mrw`      | `mhpmevent8`  | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x329`    | `mrw`      | `mhpmevent9`  | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x32A`    | `mrw`      | `mhpmevent10` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x32B`    | `mrw`      | `mhpmevent11` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x32C`    | `mrw`      | `mhpmevent12` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x32D`    | `mrw`      | `mhpmevent13` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x32E`    | `mrw`      | `mhpmevent14` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x32F`    | `mrw`      | `mhpmevent15` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x330`    | `mrw`      | `mhpmevent16` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x331`    | `mrw`      | `mhpmevent17` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x332`    | `mrw`      | `mhpmevent18` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x333`    | `mrw`      | `mhpmevent19` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x334`    | `mrw`      | `mhpmevent20` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x335`    | `mrw`      | `mhpmevent21` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x336`    | `mrw`      | `mhpmevent22` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x337`    | `mrw`      | `mhpmevent23` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x338`    | `mrw`      | `mhpmevent24` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x339`    | `mrw`      | `mhpmevent25` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x33A`    | `mrw`      | `mhpmevent26` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x33B`    | `mrw`      | `mhpmevent27` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x33C`    | `mrw`      | `mhpmevent28` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x33D`    | `mrw`      | `mhpmevent29` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x33E`    | `mrw`      | `mhpmevent30` | `Machine performance-monitoring event selector` | `1.9.1-`    |
| `0x33F`    | `mrw`      | `mhpmevent31` | `Machine performance-monitoring event selector` | `1.9.1-`    |

:Machine Counter Setup

Setup and configuration details for the counters in the RISC-V ISA, applicable at the machine privilege level, are provided in this section.

| **number** | **access** | **name**  | **description**                            | **version** |
|:-----------|:-----------|:----------|:-------------------------------------------|:------------|
| `0x7A0`    | `mrw`      | `tselect` | `Debug/Trace trigger register select`      | `1.9.1-`    |
| `0x7A1`    | `mrw`      | `tdata1`  | `First Debug/Trace trigger data register`  | `1.9.1-`    |
| `0x7A2`    | `mrw`      | `tdata2`  | `Second Debug/Trace trigger data register` | `1.9.1-`    |
| `0x7A3`    | `mrw`      | `tdata3`  | `Third Debug/Trace trigger data register`  | `1.9.1-`    |

:Debug/Trace Registers (shared with Debug Mode)

Registers used for debugging and tracing purposes, which are shared with the Debug Mode of the RISC-V ISA, are detailed in this table.

| **number** | **access** | **name**   | **description**                     | **version** |
|:-----------|:-----------|:-----------|:------------------------------------|:------------|
| `0x7B0`    | `mrw`      | `dcsr`     | `Debug control and status register` | `1.9.1-`    |
| `0x7B1`    | `mrw`      | `dpc`      | `Debug program counter`             | `1.9.1-`    |
| `0x7B2`    | `mrw`      | `dscratch` | `Debug scratch register`            | `1.9.1-`    |

:Debug Mode Registers

This section details the registers specific to the Debug Mode of the RISC-V ISA, outlining their functionalities and usage.

| **number** | **access** | **name**    | **description**             | **version** |
|:-----------|:-----------|:------------|:----------------------------|:------------|
| `0x780`    | `mrw`      | `mtohost`   | `IO to Host`                | `1.7-`      |
| `0x781`    | `mrw`      | `mfromhost` | `IO from Host`              | `1.7-`      |
| `0x782`    | `mrw`      | `mreset`    | `Reset`                     | `1.7-`      |
| `0x783`    | `mrw`      | `mipi`      | `Inter Processor Interrupt` | `1.7-`      |
| `0x784`    | `mrw`      | `miobase`   | `IO Base`                   | `1.7-`      |

:NonStandard

Registers or features that deviate from standard RISC-V specifications are documented in this section for completeness and reference.
