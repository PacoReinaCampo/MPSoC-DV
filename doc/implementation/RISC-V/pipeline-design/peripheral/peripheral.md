# PERIPHERAL

| **Component**          |
|:-----------------------|
| `pu_riscv_dcache_core` |
| `pu_riscv_dmem_ctrl`   |
| `pu_riscv_icache_core` |
| `pu_riscv_imem_ctrl`   |

:Implementation - Cache

```sv
// Debug/Trace
localparam [11:0] TSELECT       = 'h7A0;
localparam [11:0] TDATA1        = 'h7A1;
localparam [11:0] TDATA2        = 'h7A2;
localparam [11:0] TDATA3        = 'h7A3;
localparam [11:0] MCONTEXT      = 'h7AB;

// Debug Mode Register
localparam [11:0] DCSR          = 'h7B0;
localparam [11:0] DPC           = 'h7B1;
localparam [11:0] DSCRATCH0     = 'h7B2;
localparam [11:0] DSCRATCH1     = 'h7B3;
```

## PU RISCV DCACHE-CORE

| **Name**             | **Value** | **Description**           |
|:---------------------|:----------|:--------------------------|
| `ICACHE_SIZE`        | `64`      | `in KBytes`               |
| `ICACHE_BLOCK_SIZE`  | `64`      | `in Bytes`                |
| `ICACHE_WAYS`        | `2`       | `'n'-way set associative` |
| `ICACHE_REPLACE_ALG` | `0`       |                           |
| `ITCM_SIZE`          | `0`       |                           |

## PU RISCV DMEM-CTRL

| **Name**             | **Value** | **Description**           |
|:---------------------|:----------|:--------------------------|
| `DCACHE_SIZE`        | `64`      | `in KBytes`               |
| `DCACHE_BLOCK_SIZE`  | `64`      | `in Bytes`                |
| `DCACHE_WAYS`        | `2`       | `'n'-way set associative` |
| `DCACHE_REPLACE_ALG` | `0`       | `-`                       |
| `DTCM_SIZE`          | `0`       | `-`                       |
| `WRITEBUFFER_SIZE`   | `8`       | `-`                       |

## PU RISCV ICACHE-CORE
## PU RISCV IMEM-CTRL
