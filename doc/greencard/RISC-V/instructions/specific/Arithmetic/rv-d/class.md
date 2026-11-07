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

| **Instruction** | **Class**   |
|:----------------|:------------|
| `fld`           | `fpu,load`  |
| `fsd`           | `fpu,store` |
| `fmadd.d`       | `fpu,fma`   |
| `fmsub.d`       | `fpu,fma`   |
| `fnmadd.d`      | `fpu,fma`   |
| `fnmsub.d`      | `fpu,fma`   |
| `fadd.d`        | `fpu`       |
| `fsub.d`        | `fpu`       |
| `fmul.d`        | `fpu`       |
| `fdiv.d`        | `fpu,fdiv`  |
| `fsgnj.d`       | `fpu`       |
| `fsgnjn.d`      | `fpu`       |
| `fsgnjx.d`      | `fpu`       |
| `fmin.d`        | `fpu`       |
| `fmax.d`        | `fpu`       |
| `fcvt.s.d`      | `fpu,fcvt`  |
| `fcvt.d.s`      | `fpu,fcvt`  |
| `fsqrt.d`       | `fpu,fsqrt` |
| `fle.d`         | `fpu`       |
| `flt.d`         | `fpu`       |
| `feq.d`         | `fpu`       |
| `fcvt.w.d`      | `fpu,fcvt`  |
| `fcvt.wu.d`     | `fpu,fcvt`  |
| `fcvt.d.w`      | `fpu,fcvt`  |
| `fcvt.d.wu`     | `fpu,fcvt`  |
| `fclass.d`      | `fpu`       |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

| **Instruction** | **Class**   |
|:----------------|:------------|
| `fcvt.l.d`      | `fpu,fcvt`  |
| `fcvt.lu.d`     | `fpu,fcvt`  |
| `fmv.x.d`       | `fpu,fmove` |
| `fcvt.d.l`      | `fpu,fcvt`  |
| `fcvt.d.lu`     | `fpu,fcvt`  |
| `fmv.d.x`       | `fpu,fmove` |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32D)"

| **Instruction** | **Class** |
|:----------------|:----------|
| `frcsr`         | `csr`     |
| `frrm`          | `csr`     |
| `frflags`       | `csr`     |
| `fscsr`         | `csr`     |
| `fsrm`          | `csr`     |
| `fsflags`       | `csr`     |
| `fsrmi`         | `csr`     |
| `fsflagsi`      | `csr`     |

:RV32FD - "RV32F and RV32D Common Floating-Point Instructions"
