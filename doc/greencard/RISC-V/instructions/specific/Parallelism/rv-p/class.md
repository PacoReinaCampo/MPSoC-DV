## INSTRUCTION CLASSES

RISC-V instructions are classified into distinct classes based on their primary operations and operand types:

- **Arithmetic**: Operations like addition, subtraction, multiplication.
- **Logical**: Bitwise operations such as AND, OR, XOR.
- **Memory**: Load and store operations for data access.
- **Control Transfer**: Branches and jumps for altering program flow.
- **System**: Instructions for privileged operations and interaction with control and status registers (CSRs).

Each class serves a specific role in program execution and is encoded with corresponding opcodes to facilitate efficient instruction decoding and execution.

Format of a line in the table:

`<ins name> <class>`

| instruction  | class           |
|--------------|:----------------|
| `lui`        | `alu`           |
| `auipc`      | `alu`           |
| `jal`        | `jump`          |
| `jalr`       | `jump,indirect` |
| `beq`        | `branch`        |
| `bne`        | `branch`        |
| `blt`        | `branch`        |
| `bge`        | `branch`        |
| `bltu`       | `branch`        |
| `bgeu`       | `branch`        |
| `lb`         | `load`          |
| `lh`         | `load`          |
| `lw`         | `load`          |
| `lbu`        | `load`          |
| `lhu`        | `load`          |
| `lwu`        | `load`          |
| `sb`         | `store`         |
| `sh`         | `store`         |
| `sw`         | `store`         |
| `addi`       | `alu`           |
| `slti`       | `alu`           |
| `sltiu`      | `alu`           |
| `xori`       | `alu`           |
| `ori`        | `alu`           |
| `andi`       | `alu`           |
| `slli`       | `alu`           |
| `srli`       | `alu`           |
| `srai`       | `alu`           |
| `add`        | `alu`           |
| `sub`        | `alu`           |
| `sll`        | `alu`           |
| `slt`        | `alu`           |
| `sltu`       | `alu`           |
| `xor`        | `alu`           |
| `srl`        | `alu`           |
| `sra`        | `alu`           |
| `or`         | `alu`           |
| `and`        | `alu`           |
| `fence`      | `fence`         |
| `fence.i`    | `fence`         |

:RV32I - "RV32I Base Integer Instruction Set"

The RV32I table details the base integer instruction set for the 32-bit RISC-V architecture, encompassing essential operations and functionalities supported at the machine level.

| instruction  | class           |
|--------------|:----------------|
| `ld`         | `load`          |
| `sd`         | `store`         |
| `addiw`      | `alu`           |
| `slliw`      | `alu`           |
| `srliw`      | `alu`           |
| `sraiw`      | `alu`           |
| `addw`       | `alu`           |
| `subw`       | `alu`           |
| `sllw`       | `alu`           |
| `srlw`       | `alu`           |
| `sraw`       | `alu`           |

:RV64I - "RV64I Base Integer Instruction Set (+ RV32I)"

Building upon RV32I, RV64I extends the base integer instruction set to 64-bit, maintaining compatibility with RV32I while adding support for larger data and addressing spaces.

| instruction  | class           |
|--------------|:----------------|
| `mul`        | `alu,multiply`  |
| `mulh`       | `alu,multiply`  |
| `mulhsu`     | `alu,multiply`  |
| `mulhu`      | `alu,multiply`  |
| `div`        | `alu,divide`    |
| `divu`       | `alu,divide`    |
| `rem`        | `alu,divide`    |
| `remu`       | `alu,divide`    |

:RV32M - "RV32M Standard Extension for Integer Multiply and Divide"

This table outlines the standard extension for integer multiplication and division operations in the 32-bit RISC-V architecture, enhancing computational capabilities with dedicated instructions.

| instruction  | class           |
|--------------|:----------------|
| `mulw`       | `alu,multiply`  |
| `divw`       | `alu,multiply`  |
| `divuw`      | `alu,multiply`  |
| `remw`       | `alu,divide`    |
| `remuw`      | `alu,divide`    |

:RV64M - "RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)"

Extending RV32M to 64-bit, RV64M introduces support for integer multiplication and division operations, catering to applications requiring larger data processing capabilities.

| instruction  | class           |
|--------------|:----------------|
| `lr.w`       | `atomic`        |
| `sc.w`       | `atomic`        |
| `amoswap.w`  | `atomic`        |
| `amoadd.w`   | `atomic`        |
| `amoxor.w`   | `atomic`        |
| `amoor.w`    | `atomic`        |
| `amoand.w`   | `atomic`        |
| `amomin.w`   | `atomic`        |
| `amomax.w`   | `atomic`        |
| `amominu.w`  | `atomic`        |
| `amomaxu.w`  | `atomic`        |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

Detailed here are the atomic instruction set extensions for the 32-bit RISC-V architecture, providing concurrency control primitives essential for synchronization in multi-threaded environments.

| instruction  | class           |
|--------------|:----------------|
| `lr.d`       | `atomic`        |
| `sc.d`       | `atomic`        |
| `amoswap.d`  | `atomic`        |
| `amoadd.d`   | `atomic`        |
| `amoxor.d`   | `atomic`        |
| `amoor.d`    | `atomic`        |
| `amoand.d`   | `atomic`        |
| `amomin.d`   | `atomic`        |
| `amomax.d`   | `atomic`        |
| `amominu.d`  | `atomic`        |
| `amomaxu.d`  | `atomic`        |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

Extending atomic operations to 64-bit, RV64A builds upon RV32A by offering atomic instructions for manipulating memory in a thread-safe manner across larger data sets.

| instruction  | class           |
|--------------|:----------------|
| `ecall`      | `system`        |
| `ebreak`     | `system`        |
| `uret`       | `system`        |
| `sret`       | `system`        |
| `hret`       | `system`        |
| `mret`       | `system`        |
| `dret`       | `system`        |
| `sfence.vm`  | `system`        |
| `wfi`        | `system`        |
| `rdcycle`    | `csr`           |
| `rdtime`     | `csr`           |
| `rdinstret`  | `csr`           |
| `rdcycleh`   | `csr`           |
| `rdtimeh`    | `csr`           |
| `rdinstreth` | `csr`           |
| `csrrw`      | `csr`           |
| `csrrs`      | `csr`           |
| `csrrc`      | `csr`           |
| `csrrwi`     | `csr`           |
| `csrrsi`     | `csr`           |
| `csrrci`     | `csr`           |

:RV32S - "RV32S Standard Extension for Supervisor-level Instructions"

This section covers supervisor-level instructions tailored for the 32-bit RISC-V architecture, including privileged operations and management functions for system-level tasks.

| instruction  | class           |
|--------------|:----------------|
| `flw`        | `fpu,load`      |
| `fsw`        | `fpu,store`     |
| `fmadd.s`    | `fpu,fma`       |
| `fmsub.s`    | `fpu,fma`       |
| `fnmadd.s`   | `fpu,fma`       |
| `fnmsub.s`   | `fpu,fma`       |
| `fadd.s`     | `fpu`           |
| `fsub.s`     | `fpu`           |
| `fmul.s`     | `fpu`           |
| `fdiv.s`     | `fpu,fdiv`      |
| `fsgnj.s`    | `fpu`           |
| `fsgnjn.s`   | `fpu`           |
| `fsgnjx.s`   | `fpu`           |
| `fmin.s`     | `fpu`           |
| `fmax.s`     | `fpu`           |
| `fsqrt.s`    | `fpu,fsqrt`     |
| `fle.s`      | `fpu`           |
| `flt.s`      | `fpu`           |
| `feq.s`      | `fpu`           |
| `fcvt.w.s`   | `fpu,fcvt`      |
| `fcvt.wu.s`  | `fpu,fcvt`      |
| `fcvt.s.w`   | `fpu,fcvt`      |
| `fcvt.s.wu`  | `fpu,fcvt`      |
| `fmv.x.s`    | `fpu,fmove`     |
| `fclass.s`   | `fpu`           |
| `fmv.s.x`    | `fpu,fmove`     |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

The RV32F table details the single-precision floating-point extension for the 32-bit RISC-V architecture, supporting operations on 32-bit floating-point numbers according to IEEE 754 standards.

| instruction  | class           |
|--------------|:----------------|
| `fcvt.l.s`   | `fpu,fcvt`      |
| `fcvt.lu.s`  | `fpu,fcvt`      |
| `fcvt.s.l`   | `fpu,fcvt`      |
| `fcvt.s.lu`  | `fpu,fcvt`      |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

 Expanding on RV32F, RV64F introduces support for single-precision floating-point operations in the 64-bit RISC-V architecture, maintaining compatibility with RV32F for seamless transition.

| instruction  | class           |
|--------------|:----------------|
| `fld`        | `fpu,load`      |
| `fsd`        | `fpu,store`     |
| `fmadd.d`    | `fpu,fma`       |
| `fmsub.d`    | `fpu,fma`       |
| `fnmadd.d`   | `fpu,fma`       |
| `fnmsub.d`   | `fpu,fma`       |
| `fadd.d`     | `fpu`           |
| `fsub.d`     | `fpu`           |
| `fmul.d`     | `fpu`           |
| `fdiv.d`     | `fpu,fdiv`      |
| `fsgnj.d`    | `fpu`           |
| `fsgnjn.d`   | `fpu`           |
| `fsgnjx.d`   | `fpu`           |
| `fmin.d`     | `fpu`           |
| `fmax.d`     | `fpu`           |
| `fcvt.s.d`   | `fpu,fcvt`      |
| `fcvt.d.s`   | `fpu,fcvt`      |
| `fsqrt.d`    | `fpu,fsqrt`     |
| `fle.d`      | `fpu`           |
| `flt.d`      | `fpu`           |
| `feq.d`      | `fpu`           |
| `fcvt.w.d`   | `fpu,fcvt`      |
| `fcvt.wu.d`  | `fpu,fcvt`      |
| `fcvt.d.w`   | `fpu,fcvt`      |
| `fcvt.d.wu`  | `fpu,fcvt`      |
| `fclass.d`   | `fpu`           |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

 This table describes the double-precision floating-point extension for the 32-bit RISC-V architecture, enabling operations on 64-bit floating-point numbers conforming to IEEE 754 standards.

| instruction  | class           |
|--------------|:----------------|
| `fcvt.l.d`   | `fpu,fcvt`      |
| `fcvt.lu.d`  | `fpu,fcvt`      |
| `fmv.x.d`    | `fpu,fmove`     |
| `fcvt.d.l`   | `fpu,fcvt`      |
| `fcvt.d.lu`  | `fpu,fcvt`      |
| `fmv.d.x`    | `fpu,fmove`     |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32D)"

 Building upon RV32D, RV64D extends support for double-precision floating-point operations to the 64-bit RISC-V architecture, facilitating higher precision computations.

| instruction  | class           |
|--------------|:----------------|
| `frcsr`      | `csr`           |
| `frrm`       | `csr`           |
| `frflags`    | `csr`           |
| `fscsr`      | `csr`           |
| `fsrm`       | `csr`           |
| `fsflags`    | `csr`           |
| `fsrmi`      | `csr`           |
| `fsflagsi`   | `csr`           |

:RV32FD - "RV32F and RV32D Common Floating-Point Instructions"

 RV32FD documents the common floating-point instructions shared between the RV32F (single-precision) and RV32D (double-precision) floating-point extensions, optimizing instruction set usage.
