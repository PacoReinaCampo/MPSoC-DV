## INSTRUCTION DESCRIPTIONS

Instructions in RISC-V are designed to perform specific operations ranging from basic arithmetic and logical computations to memory access and control flow. Each instruction description outlines its functionality, including operands (registers or immediates), effects on status flags, memory access patterns, and control flow implications. Descriptions provide a clear understanding of how instructions interact with processor state and contribute to program execution.

Format of a line in the table:

`<instruction name> "<instruction description>"`

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `lr.w`           | `Load word from address in rs1, place the sign-extended result in rd and register a reservation on the memory word`              |
| `sc.w`           | `Write word in rs1 to the address in rs2 if a valid reservation exists, write 0 on success or 1 on failure to rd`                |
| `amoswap.w`      | `Load word from address in rs1 into rd, swap rd and rs2, write the result to the address in rs1`                                 |
| `amoadd.w`       | `Load word from address in rs1 into rd, add rd and rs2, write the result to the address in rs1`                                  |
| `amoxor.w`       | `Load word from address in rs1 into rd, xor rd and rs2, write the result to the address in rs1`                                  |
| `amoor.w`        | `Load word from address in rs1 into rd, or rd and rs2, write the result to the address in rs1`                                   |
| `amoand.w`       | `Load word from address in rs1 into rd, and rd and rs2, write the result to the address in rs1`                                  |
| `amomin.w`       | `Load word from address in rs1 into rd, find minimum of rd and rs2, write the result to the address in rs1 (signed)`             |
| `amomax.w`       | `Load word from address in rs1 into rd, find maximum of rd and rs2, write the result to the address in rs1 (signed)`             |
| `amominu.w`      | `Load word from address in rs1 into rd, find minimum of rd and rs2, write the result to the address in rs1 (unsigned)`           |
| `amomaxu.w`      | `Load word from address in rs1 into rd, find maximum of rd and rs2, write the result to the address in rs1 (unsigned)`           |

:RV32A - "RV32A Standard Extension for Atomic Instructions"

Detailed here are the atomic instruction set extensions for the 32-bit RISC-V architecture, providing concurrency control primitives essential for synchronization in multi-threaded environments.

| instruction name | instruction description                                                                                                          |
|------------------|:---------------------------------------------------------------------------------------------------------------------------------|
| `lr.d`           | `Load double word from address in rs1, place the sign-extended result in rd and register a reservation on the memory word`       |
| `sc.d`           | `Write double word in rs1 to the address in rs2 if a valid reservation exists, write 0 on success or 1 on failure to rd`         |
| `amoswap.d`      | `Load double word from address in rs1 into rd, swap rd and rs2, write the result to the address in rs1`                          |
| `amoadd.d`       | `Load double word from address in rs1 into rd, add rd and rs2, write the result to the address in rs1`                           |
| `amoxor.d`       | `Load double word from address in rs1 into rd, xor rd and rs2, write the result to the address in rs1`                           |
| `amoor.d`        | `Load double word from address in rs1 into rd, or rd and rs2, write the result to the address in rs1`                            |
| `amoand.d`       | `Load double word from address in rs1 into rd, and rd and rs2, write the result to the address in rs1`                           |
| `amomin.d`       | `Load double word from address in rs1 into rd, find minimum of rd and rs2, write the result to the address in rs1 (signed)`      |
| `amomax.d`       | `Load double word from address in rs1 into rd, find maximum of rd and rs2, write the result to the address in rs1 (signed)`      |
| `amominu.d`      | `Load double word from address in rs1 into rd, find minimum of rd and rs2, write the result to the address in rs1 (unsigned)`    |
| `amomaxu.d`      | `Load double word from address in rs1 into rd, find maximum of rd and rs2, write the result to the address in rs1 (unsigned)`    |

:RV64A - "RV64A Standard Extension for Atomic Instructions (+ RV32A)"

Extending atomic operations to 64-bit, RV64A builds upon RV32A by offering atomic instructions for manipulating memory in a thread-safe manner across larger data sets.
