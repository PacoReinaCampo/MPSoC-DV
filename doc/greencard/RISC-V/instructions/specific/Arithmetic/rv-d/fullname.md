## INSTRUCTION FULL-NAMES

| **Instruction** | **Instruction Full-Name**                |
|:----------------|:-----------------------------------------|
| `flw`           | `FP Load (SP)`                           |
| `fsw`           | `FP Store (SP)`                          |
| `fmadd.s`       | `FP Fused Multiply Add (SP)`             |
| `fmsub.s`       | `FP Fused Multiply Subtract (SP)`        |
| `fnmadd.s`      | `FP Negate fused Multiply Add (SP)`      |
| `fnmsub.s`      | `FP Negate fused Multiply Subtract (SP)` |
| `fadd.s`        | `FP Add (SP)`                            |
| `fsub.s`        | `FP Subtract (SP)`                       |
| `fmul.s`        | `FP Multiply (SP)`                       |
| `fdiv.s`        | `FP Divide (SP)`                         |
| `fsgnj.s`       | `FP Sign-injection (SP)`                 |
| `fsgnjn.s`      | `FP Sign-injection Negate (SP)`          |
| `fsgnjx.s`      | `FP Sign-injection Xor (SP)`             |
| `fmin.s`        | `FP Minimum (SP)`                        |
| `fmax.s`        | `FP Maximum (SP)`                        |
| `fsqrt.s`       | `FP Square Root (SP)`                    |
| `fle.s`         | `FP Less Than Equal (SP)`                |
| `flt.s`         | `FP Less Than (SP)`                      |
| `feq.s`         | `FP Equal (SP)`                          |
| `fcvt.w.s`      | `FP Convert Float to Word (SP)`          |
| `fcvt.wu.s`     | `FP Convert Float to Word Unsigned (SP)` |
| `fcvt.s.w`      | `FP Convert Word to Float (SP)`          |
| `fcvt.s.wu`     | `FP Convert Word Unsigned to Float (SP)` |
| `fmv.x.s`       | `FP Move to Integer Register (SP)`       |
| `fclass.s`      | `FP Classify (SP)`                       |
| `fmv.s.x`       | `FP Move from Integer Register (SP)`     |

:RV32F - "RV32F Standard Extension for Single-Precision Floating-Point"

| **Instruction** | **Instruction Full-Name**                       |
|:----------------|:------------------------------------------------|
| `fcvt.l.s`      | `FP Convert Float to Double Word (SP)`          |
| `fcvt.lu.s`     | `FP Convert Float to Double Word Unsigned (SP)` |
| `fcvt.s.l`      | `FP Convert Double Word to Float (SP)`          |
| `fcvt.s.lu`     | `FP Convert Double Word Unsigned to Float (SP)` |

:RV64F - "RV64F Standard Extension for Single-Precision Floating-Point (+ RV32F)"

| **Instruction** | **Instruction Full-Name**                |
|:----------------|:-----------------------------------------|
| `fld`           | `FP Load (DP)`                           |
| `fsd`           | `FP Store (DP)`                          |
| `fmadd.d`       | `FP Fused Multiply Add (DP)`             |
| `fmsub.d`       | `FP Fused Multiply Subtract (DP)`        |
| `fnmadd.d`      | `FP Negate fused Multiply Add (DP)`      |
| `fnmsub.d`      | `FP Negate fused Multiply Subtract (DP)` |
| `fadd.d`        | `FP Add (DP)`                            |
| `fsub.d`        | `FP Subtract (DP)`                       |
| `fmul.d`        | `FP Multiply (DP)`                       |
| `fdiv.d`        | `FP Divide (DP)`                         |
| `fsgnj.d`       | `FP to Sign-injection (DP)`              |
| `fsgnjn.d`      | `FP to Sign-injection Negate (DP)`       |
| `fsgnjx.d`      | `FP to Sign-injection Xor (DP)`          |
| `fmin.d`        | `FP Minimum (DP)`                        |
| `fmax.d`        | `FP Maximum (DP)`                        |
| `fcvt.s.d`      | `FP Convert DP to SP`                    |
| `fcvt.d.s`      | `FP Convert SP to DP`                    |
| `fsqrt.d`       | `Floating Square Root (DP)`              |
| `fle.d`         | `FP Less Than Equal (DP)`                |
| `flt.d`         | `FP Less Than (DP)`                      |
| `feq.d`         | `FP Equal (DP)`                          |
| `fcvt.w.d`      | `FP Convert Float to Word (DP)`          |
| `fcvt.wu.d`     | `FP Convert Float to Word Unsigned (DP)` |
| `fcvt.d.w`      | `FP Convert Word to Float (DP)`          |
| `fcvt.d.wu`     | `FP Convert Word Unsigned to Float (DP)` |
| `fclass.d`      | `FP Classify (DP)`                       |

:RV32D - "RV32D Standard Extension for Double-Precision Floating-Point"

| **Instruction** | **Instruction Full-Name**                       |
|:----------------|:------------------------------------------------|
| `fcvt.l.d`      | `FP Convert Float to Double Word (DP)`          |
| `fcvt.lu.d`     | `FP Convert Float to Double Word Unsigned (DP)` |
| `fmv.x.d`       | `FP Move to Integer Register (DP)`              |
| `fcvt.d.l`      | `FP Convert Double Word to Float (DP)`          |
| `fcvt.d.lu`     | `FP Convert Double Word Unsigned Float (DP)`    |
| `fmv.d.x`       | `FP Move from Integer Register (DP)`            |

:RV64D - "RV64D Standard Extension for Double-Precision Floating-Point (+ RV32D)"

| **Instruction** | **Instruction Full-Name**                  |
|:----------------|:-------------------------------------------|
| `frcsr`         | `Read FP Control and Status Register`      |
| `frrm`          | `Read FP Rounding Mode`                    |
| `frflags`       | `Read FP Accrued Exception Flags`          |
| `fscsr`         | `Set FP Control and Status Register`       |
| `fsrm`          | `Set FP Rounding Mode`                     |
| `fsflags`       | `Set FP Accrued Exception Flags`           |
| `fsrmi`         | `Set FP Rounding Mode Immediate`           |
| `fsflagsi`      | `Set FP Accrued Exception Flags Immediate` |

:RV32FD - "RV32F and RV32D Common Floating-Point Instructions"
