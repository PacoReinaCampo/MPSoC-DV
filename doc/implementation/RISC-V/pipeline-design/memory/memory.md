# MEMORY

| **Component**     |
|:------------------|
| `pu_riscv_memory` |

:Implementation - Memory

## PU RISCV MEMORY

| **Name**         | **Value** |
|:-----------------|:----------|
| `MEM_TYPE_EMPTY` | `2'h0`    |
| `MEM_TYPE_MAIN`  | `2'h1`    |
| `MEM_TYPE_IO`    | `2'h2`    |
| `MEM_TYPE_TCM`   | `2'h3`    |

| **Name**              | **Value** |
|:----------------------|:----------|
| `AMO_TYPE_NONE`       | `2'h0`    |
| `AMO_TYPE_SWAP`       | `2'h1`    |
| `AMO_TYPE_LOGICAL`    | `2'h2`    |
| `AMO_TYPE_ARITHMETIC` | `2'h3`    |

| **Name** | **Value** |
|:---------|:----------|
| `OFF`    | `2'd0`    |
| `TOR`    | `2'd1`    |
| `NA4`    | `2'd2`    |
| `NAPOT`  | `2'd3`    |

:PMP-CFG Register

```sv
typedef enum logic [4:0] {zero,   // x0
                          ra,     // x1
                          sp,     // x2
                          gp,     // x3
                          tp,     // x4
                          t0,     // x5
                          t1,     // x6
                          t2,     // x7
                          s0fp,   // x8
                          s1,     // x9
                          a0,     // x10
                          a1,     // x11
                          a2,     // x12
                          a3,     // x13
                          a4,     // x14
                          a5,     // x15
                          a6,     // x16
                          a7,     // x17
                          s2,     // x18
                          s3,     // x19
                          s4,     // x20
                          s5,     // x21
                          s6,     // x22
                          s7,     // x23
                          s8,     // x24
                          s9,     // x25
                          s10,    // x26
                          s11,    // x27
                          t3,     // x28
                          t4,     // x29
                          t5,     // x30
                          t6      // x31
                          } rsd_t;
```

```vhdl
type rsd_t is (zero, // x0
               ra,   // x1
               sp,   // x2
               gp,   // x3
               tp,   // x4
               t0,   // x5
               t1,   // x6
               t2,   // x7
               s0fp, // x8
               s1,   // x9
               a0,   // x10
               a1,   // x11
               a2,   // x12
               a3,   // x13
               a4,   // x14
               a5,   // x15
               a6,   // x16
               a7,   // x17
               s2,   // x18
               s3,   // x19
               s4,   // x20
               s5,   // x21
               s6,   // x22
               s7,   // x23
               s8,   // x24
               s9,   // x25
               s10,  // x26
               s11,  // x27
               t3,   // x28
               t4,   // x29
               t5,   // x30
               t6    // x31
               );

signal rsd : rsd_t;
```
