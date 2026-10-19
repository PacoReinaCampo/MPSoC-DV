## ENUMERATED TYPES

RISC-V defines several enumerated types that categorize instructions and fields within instructions:

- **Opcode (OP)**: Specifies the general operation of an instruction (e.g., arithmetic, load, store).
- **Funct3 (FUNCT3)**: A 3-bit field within instructions that further specifies the operation or variant.
- **Funct7 (FUNCT7)**: A 7-bit field used in some instructions to extend the opcode space.
- **Register (REG)**: Specifies a register number or type (e.g., integer register, floating-point register).

Format of a line in the table:

`<group> <name> <value> "<description>" <version>`

| **group** | **name** | **value** | **description**           | **version** |
|:----------|:---------|:----------|:--------------------------|:------------|
| `type`    | `arg`    | `1`       | `Argument`                | `1.7-`      |
| `type`    | `creg`   | `2`       | `Compressed Register`     | `1.7-`      |
| `type`    | `freg`   | `4`       | `Floating Point Register` | `1.7-`      |
| `type`    | `ireg`   | `3`       | `Integer Register`        | `1.7-`      |
| `type`    | `none`   | `0`       | `None`                    | `1.7-`      |
| `type`    | `simm`   | `6`       | `Sign Extended Immediate` | `1.7-`      |
| `type`    | `offset` | `5`       | `Signed Offset`           | `1.7-`      |
| `type`    | `uimm`   | `7`       | `Zero Extended Immediate` | `1.7-`      |

:Types

This table categorizes and defines the various data types supported by the RISC-V instruction set architecture, including integers, floating-point numbers, and vectors.

| **group** | **name** | **value** | **description**                           | **version** |
|:----------|:---------|:----------|:------------------------------------------|:------------|
| `rm`      | `rne`    | `0b000`   | `Round to Nearest, ties to Even`          | `1.7-`      |
| `rm`      | `rtz`    | `0b001`   | `Round towards Zero`                      | `1.7-`      |
| `rm`      | `rdn`    | `0b010`   | `Round Down (towards -inf)`               | `1.7-`      |
| `rm`      | `rup`    | `0b011`   | `Round Up (towards +inf)`                 | `1.7-`      |
| `rm`      | `rmm`    | `0b100`   | `Round to Nearest, ties to Max Magnitude` | `1.7-`      |
| `rm`      | `dyn`    | `0b111`   | `Dynamic Rounding Mode`                   | `1.7-`      |

:Round Mode

The round mode table specifies the different rounding modes available for floating-point operations in compliance with IEEE 754 standards.

| **group** | **name**  | **value** | **description**                                      | **version** |
|:----------|:----------|:----------|:-----------------------------------------------------|:------------|
| `aqrl`    | `relaxed` | `0`       | `Atomicity - no explicit ordering`                   | `1.7-`      |
| `aqrl`    | `acquire` | `2`       | `Acquire - prior writes from other harts visible`    | `1.7-`      |
| `aqrl`    | `release` | `1`       | `Release - subsequent reads visible to other harts`  | `1.7-`      |
| `aqrl`    | `acq_rel` | `3`       | `Acquire-Release - global order of reads and writes` | `1.7-`      |

:Memory Order (AMO aqrl Argument)

This table clarifies the memory order arguments (`aq` and `rl`) used in atomic memory operations (AMO) within the RISC-V ISA.

| **group** | **name** | **value** | **description** | **version** |
|:----------|:---------|:----------|:----------------|:------------|
| `fence`   | `i`      | `8`       | `Input`         | `1.7-`      |
| `fence`   | `o`      | `4`       | `Output`        | `1.7-`      |
| `fence`   | `r`      | `2`       | `Read`          | `1.7-`      |
| `fence`   | `w`      | `1`       | `Write`         | `1.7-`      |

:Fence (pred and succ Values)

The fence table details the semantics and usage of the `pred` and `succ` values in fence instructions for memory ordering in RISC-V.

| **group** | **name** | **value** | **description**     | **version** |
|:----------|:---------|:----------|:--------------------|:------------|
| `fcsr`    | `NX`     | `1`       | `Inexact`           | `1.7-`      |
| `fcsr`    | `UF`     | `2`       | `Underflow`         | `1.7-`      |
| `fcsr`    | `OF`     | `4`       | `Overflow`          | `1.7-`      |
| `fcsr`    | `DZ`     | `8`       | `Divide by Zero`    | `1.7-`      |
| `fcsr`    | `NV`     | `16`      | `Invalid Operation` | `1.7-`      |

:Floating Point Exception Register (fcsr)

This table describes the fields and bit assignments in the floating-point control and status register (`fcsr`), handling exceptions and flags.

| **group** | **name**        | **value** | **description**             | **version** |
|:----------|:----------------|:----------|:----------------------------|:------------|
| `fclass`  | `neg_inf`       | `1`       | `negative infinity`         | `1.7-`      |
| `fclass`  | `neg_norm`      | `2`       | `negative normal number`    | `1.7-`      |
| `fclass`  | `neg_subnorm`   | `4`       | `negative subnormal number` | `1.7-`      |
| `fclass`  | `neg_zero`      | `8`       | `negative zero`             | `1.7-`      |
| `fclass`  | `pos_zero`      | `16`      | `positive zero`             | `1.7-`      |
| `fclass`  | `pos_subnorm`   | `32`      | `positive subnormal number` | `1.7-`      |
| `fclass`  | `pos_norm`      | `64`      | `positive normal number`    | `1.7-`      |
| `fclass`  | `pos_inf`       | `128`     | `positive infinity`         | `1.7-`      |
| `fclass`  | `signaling_nan` | `256`     | `signaling NaN`             | `1.7-`      |
| `fclass`  | `quiet_nan`     | `512`     | `quiet NaN`                 | `1.7-`      |

:Floating Point Types Returned by fclass

The table enumerates the specific types of floating-point values returned by the `fclass` instruction based on IEEE 754 classifications.

| **group** | **name**  | **value** | **description** | **version** |
|:----------|:----------|:----------|:----------------|:------------|
| `fs`      | `off`     | `0`       | `Off`           | `1.7-`      |
| `fs`      | `initial` | `1`       | `Initial`       | `1.7-`      |
| `fs`      | `clean`   | `2`       | `Clean`         | `1.7-`      |
| `fs`      | `dirty`   | `3`       | `Dirty`         | `1.7-`      |

:FPU Status (mstatus.fs)

This table outlines the fields and meanings associated with the floating-point unit (FPU) status in the `mstatus` register of the RISC-V ISA.

| **group** | **name**  | **value** | **description**                | **version** |
|:----------|:----------|:----------|:-------------------------------|:------------|
| `xs`      | `all`     | `0`       | `All off`                      | `1.7-`      |
| `xs`      | `initial` | `1`       | `None dirty or clean, some on` | `1.7-`      |
| `xs`      | `clean`   | `2`       | `None dirty, some clean`       | `1.7-`      |
| `xs`      | `dirty`   | `3`       | `Some dirty`                   | `1.7-`      |

:Extension Status (mstatus.xs)

The extension status table details the fields in the `mstatus` register that indicate the presence and status of ISA extensions.

| **group** | **name** | **value** | **description** | **version** |
|:----------|:---------|:----------|:----------------|:------------|
| `isa`     | `rv32`   | `1`       | `RV32`          | `1.7-`      |
| `isa`     | `rv64`   | `2`       | `RV64`          | `1.7-`      |
| `isa`     | `rv128`  | `3`       | `RV128`         | `1.7-`      |

:Base ISA Field (misa)

The table specifies the format and interpretation of the `misa` register, which indicates the base instruction set architecture supported by the processor.

| **group** | **name** | **value** | **description**                                | **version** |
|:----------|:---------|:----------|:-----------------------------------------------|:------------|
| `ext`     | `I`      | `256`     | `RV32I/64I/128I Base ISA`                      | `1.7-`      |
| `ext`     | `M`      | `4096`    | `Integer Multiply/Divide extension`            | `1.7-`      |
| `ext`     | `A`      | `1`       | `Atomic Extension`                             | `1.7-`      |
| `ext`     | `F`      | `32`      | `Single-precision floating-point extension`    | `1.7-`      |
| `ext`     | `D`      | `8`       | `Double-precision floating-point extension`    | `1.7-`      |
| `ext`     | `Q`      | `2`       | `Quadruple-precision floating-point extension` | `1.7-`      |
| `ext`     | `C`      | `4`       | `Compressed extension`                         | `1.7-`      |

:ISA Extensions (misa)

This table lists and defines the various optional ISA extensions that can be supported by processors implementing the RISC-V architecture.

| **group** | **name** | **value** | **description**   | **version** |
|:----------|:---------|:----------|:------------------|:------------|
| `mode`    | `U`      | `0`       | `User mode`       | `1.7-`      |
| `mode`    | `S`      | `1`       | `Supervisor mode` | `1.7-`      |
| `mode`    | `H`      | `2`       | `Hypervisor mode` | `1.7-`      |
| `mode`    | `M`      | `3`       | `Machine mode`    | `1.7-`      |

:Privilege Mode

The privilege mode table categorizes and defines the different privilege levels (machine mode, supervisor mode, user mode) in the RISC-V ISA.

| **group** | **name** | **value** | **description**                                     | **version** |
|:----------|:---------|:----------|:----------------------------------------------------|:------------|
| `vm`      | `mbare`  | `0`       | `No translation or protection`                      | `1.7-1.9.1` |
| `vm`      | `mbb`    | `1`       | `Single base-and-bound`                             | `1.7-1.9.1` |
| `vm`      | `mbid`   | `2`       | `Separate instruction and data base-and-bound`      | `1.7-1.9.1` |
| `vm`      | `sv32`   | `8`       | `Page-based 32-bit virtual addressing`              | `1.7-1.9.1` |
| `vm`      | `sv39`   | `9`       | `Page-based 39-bit virtual addressing`              | `1.7-1.9.1` |
| `vm`      | `sv48`   | `10`      | `Page-based 48-bit virtual addressing`              | `1.7-1.9.1` |
| `vm`      | `sv57`   | `11`      | `Reserved for page-based 48-bit virtual addressing` | `1.7-1.9.1` |
| `vm`      | `sv64`   | `12`      | `Reserved for page-based 48-bit virtual addressing` | `1.7-1.9.1` |

:Virtualization Management Field (mstatus.vm)

The table describes the virtualization management field within the `mstatus` register, governing virtual memory access and behavior.

| **group** | **name** | **value** | **description**                                     | **version** |
|:----------|:---------|:----------|:----------------------------------------------------|:------------|
| `svm`     | `mbare`  | `0`       | `No translation or protection`                      | `1.10`      |
| `svm`     | `sv32`   | `1`       | `Page-based 32-bit virtual addressing`              | `1.10,rv32` |
| `svm`     | `sv39`   | `8`       | `Page-based 39-bit virtual addressing`              | `1.10,rv64` |
| `svm`     | `sv48`   | `9`       | `Page-based 48-bit virtual addressing`              | `1.10,rv64` |
| `svm`     | `sv57`   | `10`      | `Reserved for page-based 48-bit virtual addressing` | `1.10,rv64` |
| `svm`     | `sv64`   | `11`      | `Reserved for page-based 48-bit virtual addressing` | `1.10,rv64` |

:Virtualization Management Field (satp.vm)

This table details the virtualization management field within the `satp` register, specifically related to page-based virtual memory translation.

| **group** | **name**              | **value** | **description**                  | **version** |
|:----------|:----------------------|:----------|:---------------------------------|:------------|
| `cause`   | `misaligned_fetch`    | `0`       | `Instruction address misaligned` | `1.7-`      |
| `cause`   | `fault_fetch`         | `1`       | `Instruction access fault`       | `1.7-`      |
| `cause`   | `illegal_instruction` | `2`       | `Illegal instruction`            | `1.7-`      |
| `cause`   | `breakpoint`          | `3`       | `Breakpoint`                     | `1.7-`      |
| `cause`   | `misaligned_load`     | `4`       | `Load address misaligned`        | `1.7-`      |
| `cause`   | `fault_load`          | `5`       | `Load access fault`              | `1.7-`      |
| `cause`   | `misaligned_store`    | `6`       | `Store/AMO address misaligned`   | `1.7-`      |
| `cause`   | `fault_store`         | `7`       | `Store/AMO access fault`         | `1.7-`      |
| `cause`   | `user_ecall`          | `8`       | `Environment call from U-mode`   | `1.7-`      |
| `cause`   | `supervisor_ecall`    | `9`       | `Environment call from S-mode`   | `1.7-`      |
| `cause`   | `hypervisor_ecall`    | `10`      | `Environment call from H-mode`   | `1.7-1.9.1` |
| `cause`   | `machine_ecall`       | `11`      | `Environment call from M-mode`   | `1.7-`      |
| `cause`   | `exec_page_fault`     | `12`      | `Instruction page fault`         | `1.10-`     |
| `cause`   | `load_page_fault`     | `13`      | `Load page fault`                | `1.10-`     |
| `cause`   | `store_page_fault`    | `15`      | `Store/AMO page fault`           | `1.10-`     |

:Machine Cause Register Faults (mcause), Interrupt Bit Clear

The table explains the encoding and meaning of the `mcause` register when a fault occurs, and how interrupt bits are cleared.

| **group** | **name**     | **value** | **description**                 | **version** |
|:----------|:-------------|:----------|:--------------------------------|:------------|
| `intr`    | `u_software` | `0`       | `User software interrupt`       | `1.7-`      |
| `intr`    | `s_software` | `1`       | `Supervisor software interrupt` | `1.7-`      |
| `intr`    | `h_software` | `2`       | `Hypervisor software interrupt` | `1.7-1.9.1` |
| `intr`    | `m_software` | `3`       | `Machine software interrupt`    | `1.7-1.9.1` |
| `intr`    | `u_timer`    | `4`       | `User timer interrupt`          | `1.7-`      |
| `intr`    | `s_timer`    | `5`       | `Supervisor timer interrupt`    | `1.7-`      |
| `intr`    | `h_timer`    | `6`       | `Hypervisor timer interrupt`    | `1.7-1.9.1` |
| `intr`    | `m_timer`    | `7`       | `Machine timer interrupt`       | `1.7-1.9.1` |
| `intr`    | `u_external` | `8`       | `User external interrupt`       | `1.7-`      |
| `intr`    | `s_external` | `9`       | `Supervisor external interrupt` | `1.7-`      |
| `intr`    | `h_external` | `10`      | `Hypervisor external interrupt` | `1.7-1.9.1` |
| `intr`    | `m_external` | `11`      | `Machine external interrupt`    | `1.7-1.9.1` |

:Machine Cause Register Interrupts (mcause) Interrupt Bit Set

The table details the encoding and interpretation of the `mcause` register when an interrupt occurs, including how interrupt bits are set.

These types help in decoding and executing instructions correctly across different implementations and extensions of the RISC-V ISA.
