## INSTRUCTION FULL-NAMES

The RISC-V ISA defines a comprehensive set of instructions, each identified by an opcode that denotes its operation. Full-Names for instructions typically include a mnemonic followed by suffixes indicating specific variants or extensions. For instance, "ADD" denotes addition, while "ADDI" specifies addition with an immediate operand.

Format of a line in the table:

`<instruction name> "<instruction full-name>"`

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `lr.w`       | `Load Reserved Word`                                                |
| `sc.w`       | `Store Conditional Word`                                            |
| `amoswap.w`  | `Atomic Swap Word`                                                  |
| `amoadd.w`   | `Atomic Add Word`                                                   |
| `amoxor.w`   | `Atomic Xor Word`                                                   |
| `amoor.w`    | `Atomic Or Word`                                                    |
| `amoand.w`   | `Atomic And Word`                                                   |
| `amomin.w`   | `Atomic Minimum Word`                                               |
| `amomax.w`   | `Atomic Maximum Word`                                               |
| `amominu.w`  | `Atomic Minimum Unsigned Word`                                      |
| `amomaxu.w`  | `Atomic Maximum Unsigned Word`                                      |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

Detailed here are the atomic instruction set extensions for the 32-bit RISC-V architecture, providing concurrency control primitives essential for synchronization in multi-threaded environments.

| instruction  | instruction full-name                                               |
|--------------|:--------------------------------------------------------------------|
| `lr.d`       | `Load Reserved Double Word`                                         |
| `sc.d`       | `Store Conditional Double Word`                                     |
| `amoswap.d`  | `Atomic Swap Double Word`                                           |
| `amoadd.d`   | `Atomic Add Double Word`                                            |
| `amoxor.d`   | `Atomic Xor Double Word`                                            |
| `amoor.d`    | `Atomic Or Double Word`                                             |
| `amoand.d`   | `Atomic And Double Word`                                            |
| `amomin.d`   | `Atomic Minimum Double Word`                                        |
| `amomax.d`   | `Atomic Maximum Double Word`                                        |
| `amominu.d`  | `Atomic Minimum Unsigned Double Word`                               |
| `amomaxu.d`  | `Atomic Maximum Unsigned Double Word`                               |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

Extending atomic operations to 64-bit, RV64A builds upon RV32A by offering atomic instructions for manipulating memory in a thread-safe manner across larger data sets.
