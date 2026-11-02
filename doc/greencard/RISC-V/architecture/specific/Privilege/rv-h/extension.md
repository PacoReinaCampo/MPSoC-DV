## INSTRUCTION SET EXTENSIONS

| **Prefix** | **Isa Width** | **Alpha Code** | **Instruction Width** | **Extension Description**                                                    |
|:-----------|:--------------|:---------------|:----------------------|:-----------------------------------------------------------------------------|
| `rv`       | `32`          | `i`            | `32`                  | `RV32I Base Integer Instruction Set`                                         |
| `rv`       | `64`          | `i`            | `32`                  | `RV64I Base Integer Instruction Set (+ RV32I)`                               |
| `rv`       | `128`         | `i`            | `32`                  | `RV128I Base Integer Instruction Set (+ RV64I)`                              |
| `rv`       | `32`          | `i`            | `32`                  | `RV32E Base Embedded Instruction Set`                                        |
| `rv`       | `64`          | `i`            | `32`                  | `RV64E Base Embedded Instruction Set (+ RV32E)`                              |
| `rv`       | `128`         | `i`            | `32`                  | `RV128E Base Embedded Instruction Set (+ RV64E)`                             |
| `rv`       | `32`          | `m`            | `32`                  | `RV32M Standard Extension for Integer Multiply and Divide`                   |
| `rv`       | `64`          | `m`            | `32`                  | `RV64M Standard Extension for Integer Multiply and Divide (+ RV32M)`         |
| `rv`       | `128`         | `m`            | `32`                  | `RV128M Standard Extension for Integer Multiply and Divide (+ RV64M)`        |
| `rv`       | `32`          | `a`            | `32`                  | `RV32A Standard Extension for Atomic Instructions`                           |
| `rv`       | `64`          | `a`            | `32`                  | `RV64A Standard Extension for Atomic Instructions (+ RV32A)`                 |
| `rv`       | `128`         | `a`            | `32`                  | `RV128A Standard Extension for Atomic Instructions (+ RV64A)`                |
| `rv`       | `32`          | `c`            | `16`                  | `RV32C Standard Extension for Compressed Instructions`                       |
| `rv`       | `64`          | `c`            | `16`                  | `RV64C Standard Extension for Compressed Instructions (+ RV32C)`             |
| `rv`       | `128`         | `c`            | `16`                  | `RV128C Standard Extension for Compressed Instructions (+ RV64C)`            |
| `rv`       | `32`          | `f`            | `32`                  | `RV32F Specific Extension for Single-Precision Floating-Point`               |
| `rv`       | `64`          | `f`            | `32`                  | `RV64F Specific Extension for Single-Precision Floating-Point (+ RV32F)`     |
| `rv`       | `128`         | `f`            | `32`                  | `RV128F Specific Extension for Single-Precision Floating-Point (+ RV64F)`    |
| `rv`       | `32`          | `d`            | `32`                  | `RV32D Specific Extension for Double-Precision Floating-Point`               |
| `rv`       | `64`          | `d`            | `32`                  | `RV64D Specific Extension for Double-Precision Floating-Point (+ RV32D)`     |
| `rv`       | `128`         | `d`            | `32`                  | `RV128D Specific Extension for Double-Precision Floating-Point (+ RV64D)`    |
| `rv`       | `32`          | `q`            | `32`                  | `RV32Q Specific Extension for Quadruple-Precision Floating-Point`            |
| `rv`       | `64`          | `q`            | `32`                  | `RV64Q Specific Extension for Quadruple-Precision Floating-Point (+ RV32Q)`  |
| `rv`       | `128`         | `q`            | `32`                  | `RV128Q Specific Extension for Quadruple-Precision Floating-Point (+ RV64Q)` |
| `rv`       | `32`          | `s`            | `32`                  | `RV32S Specific Extension for Supervisor-level Instructions`                 |
| `rv`       | `64`          | `s`            | `32`                  | `RV64S Specific Extension for Supervisor-level Instructions (+ RV32S)`       |
| `rv`       | `128`         | `s`            | `32`                  | `RV128S Specific Extension for Supervisor-level Instructions (+ RV64S)`      |
| `rv`       | `32`          | `h`            | `32`                  | `RV32H Specific Extension for Hypervisor-level Instructions`                 |
| `rv`       | `64`          | `h`            | `32`                  | `RV64H Specific Extension for Hypervisor-level Instructions (+ RV32H)`       |
| `rv`       | `128`         | `h`            | `32`                  | `RV128H Specific Extension for Hypervisor-level Instructions (+ RV64H)`      |
| `rv`       | `32`          | `p`            | `32`                  | `RV32P Specific Extension for Packed SIMD Instructions`                      |
| `rv`       | `64`          | `p`            | `32`                  | `RV64P Specific Extension for Packed SIMD Instructions (+ RV32P)`            |
| `rv`       | `128`         | `p`            | `32`                  | `RV128P Specific Extension for Packed SIMD Instructions (+ RV64P)`           |
| `rv`       | `32`          | `t`            | `32`                  | `RV32T Specific Extension for Transactional Memory`                          |
| `rv`       | `64`          | `t`            | `32`                  | `RV64T Specific Extension for Transactional Memory (+ RV32T)`                |
| `rv`       | `128`         | `t`            | `32`                  | `RV128T Specific Extension for Transactional Memory (+ RV64T)`               |
| `rv`       | `32`          | `v`            | `32`                  | `RV32V Specific Extension for Vector Operations`                             |
| `rv`       | `64`          | `v`            | `32`                  | `RV64V Specific Extension for Vector Operations (+ RV32V)`                   |
| `rv`       | `128`         | `v`            | `32`                  | `RV128V Specific Extension for Vector Operations (+ RV64V)`                  |
| `rv`       | `32`          | `w`            | `32`                  | `RV32W Specific Extension for Matrix Operations`                             |
| `rv`       | `64`          | `w`            | `32`                  | `RV64W Specific Extension for Matrix Operations (+ RV32W)`                   |
| `rv`       | `128`         | `w`            | `32`                  | `RV128W Specific Extension for Matrix Operations (+ RV64W)`                  |
| `rv`       | `32`          | `y`            | `32`                  | `RV32Y Specific Extension for Tensor Operations`                             |
| `rv`       | `64`          | `y`            | `32`                  | `RV64Y Specific Extension for Tensor Operations (+ RV32Y)`                   |
| `rv`       | `128`         | `y`            | `32`                  | `RV128Y Specific Extension for Tensor Operations (+ RV64Y)`                  |

:Instruction Set Extensions