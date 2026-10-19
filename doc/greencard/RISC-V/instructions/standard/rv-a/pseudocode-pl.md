## INSTRUCTION PSEUDO-CODE (PL)

Pseudo-Code in C-like syntax provides a high-level representation of RISC-V instructions, illustrating their behavior and operational flow without delving into specific machine-level details. This abstraction aids in software development, algorithm design, and understanding of instruction semantics across different implementations and extensions of the RISC-V ISA.

Format of a line in the table:

`<instruction name> "<instruction pseudo-code>"`

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `lr.w`       | `lr = rs1; s32 t; mmu.load<s32>(rs1, t); rd = t`                                                            |
| `sc.w`       | `ux res = 0; if (lr != rs1) res = 1; else mmu.store<s32>(rs1, s32(rs2)); rd = res`                          |
| `amoswap.w`  | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoswap, rs1, t1, t2); rd = t1`                                        |
| `amoadd.w`   | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoadd, rs1, t1, t2); rd = t1`                                         |
| `amoxor.w`   | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoxor, rs1, t1, t2); rd = t1`                                         |
| `amoor.w`    | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoor, rs1, t1, t2); rd = t1`                                          |
| `amoand.w`   | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amoand, rs1, t1, t2); rd = t1`                                         |
| `amomin.w`   | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amomin, rs1, t1, t2); rd = t1`                                         |
| `amomax.w`   | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amomax, rs1, t1, t2); rd = t1`                                         |
| `amominu.w`  | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amominu, rs1, t1, t2); rd = t1`                                        |
| `amomaxu.w`  | `s32 t1, t2 = s32(rs2); mmu.amo<s32>(amomaxu, rs1, t1, t2); rd = t1`                                        |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

Detailed here are the atomic instruction set extensions for the 32-bit RISC-V architecture, providing concurrency control primitives essential for synchronization in multi-threaded environments.

| instruction  | instruction pseudo-code                                                                                     |
|--------------|:------------------------------------------------------------------------------------------------------------|
| `lr.d`       | `lr = rs1; s64 t; mmu.load<s64>(rs1, t); rd = t`                                                            |
| `sc.d`       | `ux res = 0; if (lr != rs1) res = 1; else mmu.store<s64>(rs1, s64(rs2)); rd = res`                          |
| `amoswap.d`  | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoswap, rs1, t1, t2); rd = t1`                                        |
| `amoadd.d`   | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoadd, rs1, t1, t2); rd = t1`                                         |
| `amoxor.d`   | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoxor, rs1, t1, t2); rd = t1`                                         |
| `amoor.d`    | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoor, rs1, t1, t2); rd = t1`                                          |
| `amoand.d`   | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amoand, rs1, t1, t2); rd = t1`                                         |
| `amomin.d`   | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amomin, rs1, t1, t2); rd = t1`                                         |
| `amomax.d`   | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amomax, rs1, t1, t2); rd = t1`                                         |
| `amominu.d`  | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amominu, rs1, t1, t2); rd = t1`                                        |
| `amomaxu.d`  | `s64 t1, t2 = s64(rs2); mmu.amo<s64>(amomaxu, rs1, t1, t2); rd = t1`                                        |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

Extending atomic operations to 64-bit, RV64A builds upon RV32A by offering atomic instructions for manipulating memory in a thread-safe manner across larger data sets.
