## INSTRUCTION CLASSES

| **Instruction** | **Class**   |
|:----------------|:------------|
| `flw`           | `fpu,load`  |
| `fsw`           | `fpu,store` |
| `fmadd.s`       | `fpu,fma`   |
| `fmsub.s`       | `fpu,fma`   |
| `fnmadd.s`      | `fpu,fma`   |
| `fnmsub.s`      | `fpu,fma`   |
| `fadd.s`        | `fpu`       |
| `fsub.s`        | `fpu`       |
| `fmul.s`        | `fpu`       |
| `fdiv.s`        | `fpu,fdiv`  |
| `fsgnj.s`       | `fpu`       |
| `fsgnjn.s`      | `fpu`       |
| `fsgnjx.s`      | `fpu`       |
| `fmin.s`        | `fpu`       |
| `fmax.s`        | `fpu`       |
| `fsqrt.s`       | `fpu,fsqrt` |
| `fle.s`         | `fpu`       |
| `flt.s`         | `fpu`       |
| `feq.s`         | `fpu`       |
| `fcvt.w.s`      | `fpu,fcvt`  |
| `fcvt.wu.s`     | `fpu,fcvt`  |
| `fcvt.s.w`      | `fpu,fcvt`  |
| `fcvt.s.wu`     | `fpu,fcvt`  |
| `fmv.x.s`       | `fpu,fmove` |
| `fclass.s`      | `fpu`       |
| `fmv.s.x`       | `fpu,fmove` |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

| **Instruction** | **Class**  |
|:----------------|:-----------|
| `fcvt.l.s`      | `fpu,fcvt` |
| `fcvt.lu.s`     | `fpu,fcvt` |
| `fcvt.s.l`      | `fpu,fcvt` |
| `fcvt.s.lu`     | `fpu,fcvt` |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

 Expanding on RV32F, RV64F introduces support for single-precision floating-point operations in the 64-bit RISC-V architecture, maintaining compatibility with RV32F for seamless transition.