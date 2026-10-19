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
