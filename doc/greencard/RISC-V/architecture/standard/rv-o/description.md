## DESCRIPTIONS

| **Symbol** | **Description**                                          |
|:-----------|:---------------------------------------------------------|
| `s8,b`     | `Signed 8-bit Byte`                                      |
| `u8,bu`    | `Unsigned 8-bit Byte`                                    |
| `s16,h`    | `Signed 16-bit Word`                                     |
| `u16,hu`   | `Unsigned 16-bit Half Word`                              |
| `s32,w`    | `Signed 32-bit Word`                                     |
| `u32,wu`   | `Unsigned 32-bit Word`                                   |
| `s64,l,d`  | `Signed 64-bit Word`                                     |
| `u64,lu`   | `Unsigned 64-bit Word`                                   |
| `s128,c,q` | ``Signed 128-bit Word` `c,cu are placeholders for fcvt`` |
| `u128,cu`  | `Unsigned 128-bit Word`                                  |
| `sx`       | `Signed Full Width Word (32, 64 or 128-bit)`             |
| `ux`       | `Unsigned Full width Word (32, 64 or 128-bit)`           |

:Word Type

| **Symbol** | **Description**                      |
|:-----------|:-------------------------------------|
| `f32,s`    | `Single Precision Floating-Point`    |
| `f64,d`    | `Double Precision Floating-Point`    |
| `f128,q`   | `Quadruple Precision Floating-Point` |

:Precision Floating-Point

| **Symbol** | **Description**                                         |
|:-----------|:--------------------------------------------------------|
| `XLEN`     | `Integer Register Width in Bits (32, 64 or 128)`        |
| `FLEN`     | `Floating-Point Register Width in Bits (32, 64 or 128)` |
| `VLEN`     | `Vector Register Width in Bits (32, 64 or 128)`         |
| `WLEN`     | `Matrix Register Width in Bits (32, 64 or 128)`         |
| `YLEN`     | `Tensor Register Width in Bits (32, 64 or 128)`         |

:Register Width in Bits

| **Symbol** | **Description**                |
|:-----------|:-------------------------------|
| `rd`       | `Integer Register Destination` |
| `rs[n]`    | `Integer Register Source [n]`  |

:Integer Register

| **Symbol** | **Description**                       |
|:-----------|:--------------------------------------|
| `frd`      | `Floating-Point Register Destination` |
| `frs[n]`   | `Floating-Point Register Source [n]`  |

:Floating-Point Register

| **Symbol** | **Description**                                |
|:-----------|:-----------------------------------------------|
| `hart`     | `hardware thread`                              |
| `pc`       | `Program Counter`                              |
| `imm`      | `Immediate Value encoded in an instruction`    |
| `offset`   | `Immediate Value decoded as a relative offset` |
| `shamt`    | `Immediate Value decoded as a shift amount`    |

:Values

| **Symbol** | **Description**       |
|:-----------|:----------------------|
| `SP`       | `Single Precision`    |
| `DP`       | `Double Precision`    |
| `QP`       | `Quadruple Precision` |

:Precision

| **Symbol** | **Description** |
|:-----------|:----------------|
| `M`        | `Machine`       |
| `U`        | `User`          |
| `S`        | `Supervisor`    |
| `H`        | `Hypervisor`    |

:Privilege Modes I

| **Symbol** | **Description**                     |
|:-----------|:------------------------------------|
| `ABI`      | `Application Binary Interface`      |
| `AEE`      | `Application Execution Environment` |
| `SBI`      | `Supervisor Binary Interface`       |
| `SEE`      | `Supervisor Execution Environment`  |
| `HBI`      | `Hypervisor Binary Interface`       |
| `HEE`      | `Hypervisor Execution Environment`  |

:Privilege Modes II

| **Symbol** | **Description**               |
|:-----------|:------------------------------|
| `CSR`      | `Control and Status Register` |

:Control and Status Register

| **Symbol** | **Description**        |
|:-----------|:-----------------------|
| `PA`       | `Physical Address`     |
| `VA`       | `Virtual Address`      |
| `PPN`      | `Physical Page Number` |

:Address & Page Number

| **Symbol** | **Description**                |
|:-----------|:-------------------------------|
| `ASID`     | `Address Space Identifier`     |
| `PDID`     | `Protection Domain Identifier` |
| `PMA`      | `Physical Memory Attribute`    |
| `PMP`      | `Physical Memory Protection`   |
| `PPN`      | `Physical Page Number`         |
| `VPN`      | `Virtual Page Number`          |
| `VCLN`     | `Virtual Cache Line Number`    |

:Physical & Virtual