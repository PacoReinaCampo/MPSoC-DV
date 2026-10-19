# EXECUTE

| **Component**          |
|:-----------------------|
| `pu_or1k_execute_alu`  |
| `pu_or1k_wb_mux`       |
| `pu_or1k_rf`           |
| `pu_or1k_execute_ctrl` |

:Implementation - Execute

## PU OR1K EXECUTE-ALU
## PU OR1K WB-MUX
## PU OR1K RF
## PU OR1K EXECUTE-CTRL

| **Name**            | **Value** |
|:--------------------|:----------|
| `OR1K_FPUOP_WIDTH`  | `8`       |
| `OR1K_FPUOP_SELECT` | `7:0`     |

:MSbit indicates FPU operation valid

| **Name**                        | **Value** |
|:--------------------------------|:----------|
| `OR1K_FPUOP_GENERIC_CMP_WIDTH`  | `3`       |
| `OR1K_FPUOP_GENERIC_CMP_SELECT` | `2:0`     |

:Select bits for Ordered/Unordered comparison

| **Name**                       | **Value** |
|:-------------------------------|:----------|
| `OR1K_FPUOP_UNORDERED_CMP_BIT` | `5`       |

:Unordered comparison bit

FP instruction is double precision if bit 4 is set. We're a 32-bit

| **Name**                | **Value** |
|:------------------------|:----------|
| `OR1K_FPUOP_DOUBLE_BIT` | `4`       |

:implementation thus do not support double precision FP

| **Name**              | **Value**      |
|:----------------------|:---------------|
| `OR1K_FPUOP_ADD`      | `8'b0000_0000` |
| `OR1K_FPUOP_SUB`      | `8'b0000_0001` |
| `OR1K_FPUOP_MUL`      | `8'b0000_0010` |
| `OR1K_FPUOP_DIV`      | `8'b0000_0011` |
| `OR1K_FPUOP_ITOF`     | `8'b0000_0100` |
| `OR1K_FPUOP_FTOI`     | `8'b0000_0101` |
| `OR1K_FPUOP_REM`      | `8'b0000_0110` |
| `OR1K_FPUOP_RESERVED` | `8'b0000_0111` |

:FP Arithmetic OPCs

| **Name**          | **Value**      |
|:------------------|:---------------|
| `OR1K_FPCOP_SFEQ` | `8'b0000_1000` |
| `OR1K_FPCOP_SFNE` | `8'b0000_1001` |
| `OR1K_FPCOP_SFGT` | `8'b0000_1010` |
| `OR1K_FPCOP_SFGE` | `8'b0000_1011` |
| `OR1K_FPCOP_SFLT` | `8'b0000_1100` |
| `OR1K_FPCOP_SFLE` | `8'b0000_1101` |

:FP Ordered Comparison OPCs

| **Name**           | **Value**      |
|:-------------------|:---------------|
| `OR1K_FPCOP_SFUEQ` | `8'b0010_1000` |
| `OR1K_FPCOP_SFUNE` | `8'b0010_1001` |
| `OR1K_FPCOP_SFUGT` | `8'b0010_1010` |
| `OR1K_FPCOP_SFUGE` | `8'b0010_1011` |
| `OR1K_FPCOP_SFULT` | `8'b0010_1100` |
| `OR1K_FPCOP_SFULE` | `8'b0010_1101` |
| `OR1K_FPCOP_SFUN`  | `8'b0010_1110` |

:FP Unordered Comparison OPCs

| **Name**          | **Value** |
|:------------------|:----------|
| `OR1K_INSN_WIDTH` | `32`      |

| **Name**         | **Value** |
|:-----------------|:----------|
| `OR1K_RD_SELECT` | `25:21`   |
| `OR1K_RA_SELECT` | `20:16`   |
| `OR1K_RB_SELECT` | `15:11`   |

| **Name**          | **Value** |
|:------------------|:----------|
| `OR1K_IMM_WIDTH`  | `16`      |
| `OR1K_IMM_SELECT` | `15:0`    |

| **Name**              | **Value** |
|:----------------------|:----------|
| `OR1K_ALU_OPC_WIDTH`  | `4`       |
| `OR1K_ALU_OPC_SELECT` | `3:0`     |

| **Name**             | **Value**               |
|:---------------------|:------------------------|
| `OR1K_ALU_OPC_ADD`   | `OR1K_ALU_OPC_WIDTH'h0` |
| `OR1K_ALU_OPC_ADDC`  | `OR1K_ALU_OPC_WIDTH'h1` |
| `OR1K_ALU_OPC_SUB`   | `OR1K_ALU_OPC_WIDTH'h2` |
| `OR1K_ALU_OPC_AND`   | `OR1K_ALU_OPC_WIDTH'h3` |
| `OR1K_ALU_OPC_OR`    | `OR1K_ALU_OPC_WIDTH'h4` |
| `OR1K_ALU_OPC_XOR`   | `OR1K_ALU_OPC_WIDTH'h5` |
| `OR1K_ALU_OPC_MUL`   | `OR1K_ALU_OPC_WIDTH'h6` |
| `OR1K_ALU_OPC_RESV`  | `OR1K_ALU_OPC_WIDTH'h7` |
| `OR1K_ALU_OPC_SHRT`  | `OR1K_ALU_OPC_WIDTH'h8` |
| `OR1K_ALU_OPC_DIV`   | `OR1K_ALU_OPC_WIDTH'h9` |
| `OR1K_ALU_OPC_DIVU`  | `OR1K_ALU_OPC_WIDTH'ha` |
| `OR1K_ALU_OPC_MULU`  | `OR1K_ALU_OPC_WIDTH'hb` |
| `OR1K_ALU_OPC_EXTBH` | `OR1K_ALU_OPC_WIDTH'hc` |
| `OR1K_ALU_OPC_EXTW`  | `OR1K_ALU_OPC_WIDTH'hd` |
| `OR1K_ALU_OPC_CMOV`  | `OR1K_ALU_OPC_WIDTH'he` |
| `OR1K_ALU_OPC_FFL1`  | `OR1K_ALU_OPC_WIDTH'hf` |

| **Name**                        | **Value** |
|:--------------------------------|:----------|
| `OR1K_ALU_OPC_SECONDARY_WIDTH`  | `3`       |
| `OR1K_ALU_OPC_SECONDARY_SELECT` | `8:6`     |

| **Name**                          | **Value**                         |
|:----------------------------------|:----------------------------------|
| `OR1K_ALU_OPC_SECONDARY_SHRT_SLL` | `OR1K_ALU_OPC_SECONDARY_WIDTH'h0` |
| `OR1K_ALU_OPC_SECONDARY_SHRT_SRL` | `OR1K_ALU_OPC_SECONDARY_WIDTH'h1` |
| `OR1K_ALU_OPC_SECONDARY_SHRT_SRA` | `OR1K_ALU_OPC_SECONDARY_WIDTH'h2` |
| `OR1K_ALU_OPC_SECONDARY_SHRT_ROR` | `OR1K_ALU_OPC_SECONDARY_WIDTH'h3` |

| **Name**                             | **Value**                         |
|:-------------------------------------|:----------------------------------|
| `OR1K_ALU_OPC_SECONDARY_EXTBH_EXTHS` | `OR1K_ALU_OPC_SECONDARY_WIDTH'h0` |
| `OR1K_ALU_OPC_SECONDARY_EXTW_EXTWS`  | `OR1K_ALU_OPC_SECONDARY_WIDTH'h0` |
| `OR1K_ALU_OPC_SECONDARY_EXTBH_EXTBS` | `OR1K_ALU_OPC_SECONDARY_WIDTH'h1` |
| `OR1K_ALU_OPC_SECONDARY_EXTW_EXTWZ`  | `OR1K_ALU_OPC_SECONDARY_WIDTH'h1` |
| `OR1K_ALU_OPC_SECONDARY_EXTBH_EXTHZ` | `OR1K_ALU_OPC_SECONDARY_WIDTH'h2` |
| `OR1K_ALU_OPC_SECONDARY_EXTBH_EXTBZ` | `OR1K_ALU_OPC_SECONDARY_WIDTH'h3` |

| **Name**               | **Value**                |
|:-----------------------|:-------------------------|
| `OR1K_COMP_OPC_WIDTH`  | `4`                      |
| `OR1K_COMP_OPC_SELECT` | `24:21`                  |
| `OR1K_COMP_OPC_EQ`     | `OR1K_COMP_OPC_WIDTH'h0` |
| `OR1K_COMP_OPC_NE`     | `OR1K_COMP_OPC_WIDTH'h1` |
| `OR1K_COMP_OPC_GTU`    | `OR1K_COMP_OPC_WIDTH'h2` |
| `OR1K_COMP_OPC_GEU`    | `OR1K_COMP_OPC_WIDTH'h3` |
| `OR1K_COMP_OPC_LTU`    | `OR1K_COMP_OPC_WIDTH'h4` |
| `OR1K_COMP_OPC_LEU`    | `OR1K_COMP_OPC_WIDTH'h5` |
| `OR1K_COMP_OPC_GTS`    | `OR1K_COMP_OPC_WIDTH'ha` |
| `OR1K_COMP_OPC_GES`    | `OR1K_COMP_OPC_WIDTH'hb` |
| `OR1K_COMP_OPC_LTS`    | `OR1K_COMP_OPC_WIDTH'hc` |
| `OR1K_COMP_OPC_LES`    | `OR1K_COMP_OPC_WIDTH'hd` |

| **Name**                           | **Value** |
|:-----------------------------------|:----------|
| `OR1K_JUMPBRANCH_IMMEDIATE_SELECT` | `25:0`    |

| **Name**                       | **Value**                       |
|:-------------------------------|:--------------------------------|
| `OR1K_SYSTRAPSYNC_OPC_WIDTH`   | `3`                             |
| `OR1K_SYSTRAPSYNC_OPC_SELECT`  | `25:23`                         |
| `OR1K_SYSTRAPSYNC_OPC_SYSCALL` | `OR1K_SYSTRAPSYNC_OPC_WIDTH'h0` |
| `OR1K_SYSTRAPSYNC_OPC_TRAP`    | `OR1K_SYSTRAPSYNC_OPC_WIDTH'h2` |
| `OR1K_SYSTRAPSYNC_OPC_MSYNC`   | `OR1K_SYSTRAPSYNC_OPC_WIDTH'h4` |
| `OR1K_SYSTRAPSYNC_OPC_PSYNC`   | `OR1K_SYSTRAPSYNC_OPC_WIDTH'h5` |
| `OR1K_SYSTRAPSYNC_OPC_CSYNC`   | `OR1K_SYSTRAPSYNC_OPC_WIDTH'h6` |

| **Name**             | **Value** |
|:---------------------|:----------|
| `OR1K_OPCODE_WIDTH`  | `6`       |
| `OR1K_OPCODE_SELECT` | `31:26`   |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_J`     | `{2'b00, 4'h0}` |
| `OR1K_OPCODE_JAL`   | `{2'b00, 4'h1}` |
| `OR1K_OPCODE_BNF`   | `{2'b00, 4'h3}` |
| `OR1K_OPCODE_BF`    | `{2'b00, 4'h4}` |
| `OR1K_OPCODE_NOP`   | `{2'b00, 4'h5}` |
| `OR1K_OPCODE_MOVHI` | `{2'b00, 4'h6}` |
| `OR1K_OPCODE_MACRC` | `{2'b00, 4'h6}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_SYS`   | `{2'b00, 4'h8}` |
| `OR1K_OPCODE_TRAP`  | `{2'b00, 4'h8}` |
| `OR1K_OPCODE_MSYNC` | `{2'b00, 4'h8}` |
| `OR1K_OPCODE_PSYNC` | `{2'b00, 4'h8}` |
| `OR1K_OPCODE_CSYNC` | `{2'b00, 4'h8}` |

| **Name**                  | **Value**       |
|:--------------------------|:----------------|
| `OR1K_OPCODE_SYSTRAPSYNC` | `{2'b00, 4'h8}` |
| `OR1K_OPCODE_RFE`         | `{2'b00, 4'h9}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_JR`    | `{2'b01, 4'h1}` |
| `OR1K_OPCODE_JALR`  | `{2'b01, 4'h2}` |
| `OR1K_OPCODE_MACI`  | `{2'b01, 4'h3}` |
| `OR1K_OPCODE_LWA`   | `{2'b01, 4'hB}` |
| `OR1K_OPCODE_CUST1` | `{2'b01, 4'hC}` |
| `OR1K_OPCODE_CUST2` | `{2'b01, 4'hD}` |
| `OR1K_OPCODE_CUST3` | `{2'b01, 4'hE}` |
| `OR1K_OPCODE_CUST4` | `{2'b01, 4'hF}` |

| **Name**          | **Value**       |
|:------------------|:----------------|
| `OR1K_OPCODE_LD`  | `{2'b10, 4'h0}` |
| `OR1K_OPCODE_LWZ` | `{2'b10, 4'h1}` |
| `OR1K_OPCODE_LWS` | `{2'b10, 4'h2}` |
| `OR1K_OPCODE_LBZ` | `{2'b10, 4'h3}` |
| `OR1K_OPCODE_LBS` | `{2'b10, 4'h4}` |
| `OR1K_OPCODE_LHZ` | `{2'b10, 4'h5}` |
| `OR1K_OPCODE_LHS` | `{2'b10, 4'h6}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_ADDI`  | `{2'b10, 4'h7}` |
| `OR1K_OPCODE_ADDIC` | `{2'b10, 4'h8}` |
| `OR1K_OPCODE_ANDI`  | `{2'b10, 4'h9}` |
| `OR1K_OPCODE_ORI`   | `{2'b10, 4'hA}` |
| `OR1K_OPCODE_XORI`  | `{2'b10, 4'hB}` |
| `OR1K_OPCODE_MULI`  | `{2'b10, 4'hC}` |
| `OR1K_OPCODE_MFSPR` | `{2'b10, 4'hD}` |

| **Name**           | **Value**       |
|:-------------------|:----------------|
| `OR1K_OPCODE_SLLI` | `{2'b10, 4'hE}` |
| `OR1K_OPCODE_SRLI` | `{2'b10, 4'hE}` |
| `OR1K_OPCODE_SRAI` | `{2'b10, 4'hE}` |
| `OR1K_OPCODE_RORI` | `{2'b10, 4'hE}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_SHRTI` | `{2'b10, 4'hE}` |

| **Name**             | **Value**       |
|:---------------------|:----------------|
| `OR1K_OPCODE_SFEQI`  | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFNEI`  | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFGTUI` | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFGEUI` | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFLTUI` | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFLEUI` | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFGTSI` | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFGESI` | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFLTSI` | `{2'b10, 4'hF}` |
| `OR1K_OPCODE_SFLESI` | `{2'b10, 4'hF}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_SFIMM` | `{2'b10, 4'hF}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_MTSPR` | `{2'b11, 4'h0}` |
| `OR1K_OPCODE_MAC`   | `{2'b11, 4'h1}` |
| `OR1K_OPCODE_MSB`   | `{2'b11, 4'h1}` |

| **Name**          | **Value**       |
|:------------------|:----------------|
| `OR1K_OPCODE_SWA` | `{2'b11, 4'h3}` |
| `OR1K_OPCODE_SD`  | `{2'b11, 4'h4}` |
| `OR1K_OPCODE_SW`  | `{2'b11, 4'h5}` |
| `OR1K_OPCODE_SB`  | `{2'b11, 4'h6}` |
| `OR1K_OPCODE_SH`  | `{2'b11, 4'h7}` |

| **Name**           | **Value**       |
|:-------------------|:----------------|
| `OR1K_OPCODE_ADD`  | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_ADDC` | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_SUB`  | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_AND`  | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_OR`   | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_XOR`  | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_MUL`  | `{2'b11, 4'h8}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_SLL`   | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_SRL`   | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_SRA`   | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_ROR`   | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_DIV`   | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_DIVU`  | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_MULU`  | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_EXTBS` | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_EXTHS` | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_EXTWS` | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_EXTBZ` | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_EXTHZ` | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_EXTWZ` | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_CMOV`  | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_FF1`   | `{2'b11, 4'h8}` |
| `OR1K_OPCODE_FL1`   | `{2'b11, 4'h8}` |

| **Name**          | **Value**       |
|:------------------|:----------------|
| `OR1K_OPCODE_ALU` | `{2'b11, 4'h8}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_SFEQ`  | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFNE`  | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFGTU` | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFGEU` | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFLTU` | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFLEU` | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFGTS` | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFGES` | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFLTS` | `{2'b11, 4'h9}` |
| `OR1K_OPCODE_SFLES` | `{2'b11, 4'h9}` |

| **Name**         | **Value**       |
|:-----------------|:----------------|
| `OR1K_OPCODE_SF` | `{2'b11, 4'h9}` |

| **Name**            | **Value**       |
|:--------------------|:----------------|
| `OR1K_OPCODE_CUST5` | `{2'b11, 4'hC}` |
| `OR1K_OPCODE_CUST6` | `{2'b11, 4'hD}` |
| `OR1K_OPCODE_CUST7` | `{2'b11, 4'hE}` |
| `OR1K_OPCODE_CUST8` | `{2'b11, 4'hF}` |

| **Name**          | **Value**       |
|:------------------|:----------------|
| `OR1K_OPCODE_FPU` | `{2'b11, 4'h2}` |

| **Name**        | **Value**     |
|:----------------|:--------------|
| `SPR_BASE(x)`   | `(x/(2**11))` |
| `SPR_OFFSET(x)` | `(x%(2**11))` |

| **Name**                 | **Value**         |
|:-------------------------|:------------------|
| `OR1K_SPR_SYS_BASE`      | `{4'd0}`          |
| `OR1K_SPR_VR_ADDR`       | `{5'd0,11'd0}`    |
| `OR1K_SPR_UPR_ADDR`      | `{5'd0,11'd1}`    |
| `OR1K_SPR_CPUCFGR_ADDR`  | `{5'd0,11'd2}`    |
| `OR1K_SPR_DMMUCFGR_ADDR` | `{5'd0,11'd3}`    |
| `OR1K_SPR_IMMUCFGR_ADDR` | `{5'd0,11'd4}`    |
| `OR1K_SPR_DCCFGR_ADDR`   | `{5'd0,11'd5}`    |
| `OR1K_SPR_ICCFGR_ADDR`   | `{5'd0,11'd6}`    |
| `OR1K_SPR_DCFGR_ADDR`    | `{5'd0,11'd7}`    |
| `OR1K_SPR_PCCFGR_ADDR`   | `{5'd0,11'd8}`    |
| `OR1K_SPR_VR2_ADDR`      | `{5'd0,11'd9}`    |
| `OR1K_SPR_AVR_ADDR`      | `{5'd0,11'd10}`   |
| `OR1K_SPR_EVBAR_ADDR`    | `{5'd0,11'd11}`   |
| `OR1K_SPR_AECR_ADDR`     | `{5'd0,11'd12}`   |
| `OR1K_SPR_AESR_ADDR`     | `{5'd0,11'd13}`   |
| `OR1K_SPR_NPC_ADDR`      | `{5'd0,11'd16}`   |
| `OR1K_SPR_SR_ADDR`       | `{5'd0,11'd17}`   |
| `OR1K_SPR_PPC_ADDR`      | `{5'd0,11'd18}`   |
| `OR1K_SPR_FPCSR_ADDR`    | `{5'd0,11'd20}`   |
| `OR1K_SPR_ISR0_ADDR`     | `{5'd0,11'd21}`   |
| `OR1K_SPR_EPCR0_ADDR`    | `{5'd0,11'd32}`   |
| `OR1K_SPR_EEAR0_ADDR`    | `{5'd0,11'd48}`   |
| `OR1K_SPR_ESR0_ADDR`     | `{5'd0,11'd64}`   |
| `OR1K_SPR_COREID_ADDR`   | `{5'd0,11'd128}`  |
| `OR1K_SPR_NUMCORES_ADDR` | `{5'd0,11'd129}`  |
| `OR1K_SPR_GPR0_ADDR`     | `{5'd0,11'd1024}` |

:Addresses

| **Name**                  | **Value**         |
|:--------------------------|:------------------|
| `OR1K_SPR_DMMU_BASE`      | `{4'd1}`          |
| `OR1K_SPR_DMMUCR_ADDR`    | `{5'd1,11'd0}`    |
| `OR1K_SPR_DMMUPR_ADDR`    | `{5'd1,11'd1}`    |
| `OR1K_SPR_DTLBEIR_ADDR`   | `{5'd1,11'd2}`    |
| `OR1K_SPR_DATBMR0_ADDR`   | `{5'd1,11'd4}`    |
| `OR1K_SPR_DATBTR0_ADDR`   | `{5'd1,11'd8}`    |
| `OR1K_SPR_DTLBW0MR0_ADDR` | `{5'd1,11'd512}`  |
| `OR1K_SPR_DTLBW0TR0_ADDR` | `{5'd1,11'd640}`  |
| `OR1K_SPR_DTLBW1MR0_ADDR` | `{5'd1,11'd768}`  |
| `OR1K_SPR_DTLBW1TR0_ADDR` | `{5'd1,11'd896}`  |
| `OR1K_SPR_DTLBW2MR0_ADDR` | `{5'd1,11'd1024}` |
| `OR1K_SPR_DTLBW2TR0_ADDR` | `{5'd1,11'd1152}` |
| `OR1K_SPR_DTLBW3MR0_ADDR` | `{5'd1,11'd1280}` |
| `OR1K_SPR_DTLBW3TR0_ADDR` | `{5'd1,11'd1408}` |

| **Name**                  | **Value**         |
|:--------------------------|:------------------|
| `OR1K_SPR_IMMU_BASE`      | `{4'd2}`          |
| `OR1K_SPR_IMMUCR_ADDR`    | `{5'd2,11'd0}`    |
| `OR1K_SPR_IMMUPR_ADDR`    | `{5'd2,11'd1}`    |
| `OR1K_SPR_ITLBEIR_ADDR`   | `{5'd2,11'd2}`    |
| `OR1K_SPR_IATBMR0_ADDR`   | `{5'd2,11'd4}`    |
| `OR1K_SPR_IATBTR0_ADDR`   | `{5'd2,11'd8}`    |
| `OR1K_SPR_ITLBW0MR0_ADDR` | `{5'd2,11'd512}`  |
| `OR1K_SPR_ITLBW0TR0_ADDR` | `{5'd2,11'd640}`  |
| `OR1K_SPR_ITLBW1MR0_ADDR` | `{5'd2,11'd768}`  |
| `OR1K_SPR_ITLBW1TR0_ADDR` | `{5'd2,11'd896}`  |
| `OR1K_SPR_ITLBW2MR0_ADDR` | `{5'd2,11'd1024}` |
| `OR1K_SPR_ITLBW2TR0_ADDR` | `{5'd2,11'd1152}` |
| `OR1K_SPR_ITLBW3MR0_ADDR` | `{5'd2,11'd1280}` |
| `OR1K_SPR_ITLBW3TR0_ADDR` | `{5'd2,11'd1408}` |

| **Name**              | **Value**      |
|:----------------------|:---------------|
| `OR1K_SPR_DC_BASE`    | `{4'd3}`       |
| `OR1K_SPR_DCCR_ADDR`  | `{5'd3,11'd0}` |
| `OR1K_SPR_DCBPR_ADDR` | `{5'd3,11'd1}` |
| `OR1K_SPR_DCBFR_ADDR` | `{5'd3,11'd2}` |
| `OR1K_SPR_DCBIR_ADDR` | `{5'd3,11'd3}` |
| `OR1K_SPR_DCBWR_ADDR` | `{5'd3,11'd4}` |
| `OR1K_SPR_DCBLR_ADDR` | `{5'd3,11'd5}` |

| **Name**              | **Value**      |
|:----------------------|:---------------|
| `OR1K_SPR_IC_BASE`    | `{4'd4}`       |
| `OR1K_SPR_ICCR_ADDR`  | `{5'd4,11'd0}` |
| `OR1K_SPR_ICBPR_ADDR` | `{5'd4,11'd1}` |
| `OR1K_SPR_ICBIR_ADDR` | `{5'd4,11'd2}` |
| `OR1K_SPR_ICBLR_ADDR` | `{5'd4,11'd3}` |

| **Name**              | **Value**      |
|:----------------------|:---------------|
| `OR1K_SPR_MAC_BASE`   | `{4'd5}`       |
| `OR1K_SPR_MACLO_ADDR` | `{5'd5,11'd1}` |
| `OR1K_SPR_MACHI_ADDR` | `{5'd5,11'd2}` |

| **Name**              | **Value**       |
|:----------------------|:----------------|
| `OR1K_SPR_DU_BASE`    | `{4'd6}`        |
| `OR1K_SPR_DVR0_ADDR`  | `{5'd6,11'd0}`  |
| `OR1K_SPR_DCR0_ADDR`  | `{5'd6,11'd8}`  |
| `OR1K_SPR_DMR1_ADDR`  | `{5'd6,11'd16}` |
| `OR1K_SPR_DMR2_ADDR`  | `{5'd6,11'd17}` |
| `OR1K_SPR_DCWR0_ADDR` | `{5'd6,11'd18}` |
| `OR1K_SPR_DSR_ADDR`   | `{5'd6,11'd20}` |
| `OR1K_SPR_DRR_ADDR`   | `{5'd6,11'd21}` |

| **Name**              | **Value**       |
|:----------------------|:----------------|
| `OR1K_SPR_PC_BASE`    | `{4'd7}`        |
| `OR1K_SPR_PCCR0_ADDR` | `{5'd7,11'd0}`  |
| `OR1K_SPR_PCCR1_ADDR` | `{5'd7,11'd1}`  |
| `OR1K_SPR_PCCR2_ADDR` | `{5'd7,11'd2}`  |
| `OR1K_SPR_PCCR3_ADDR` | `{5'd7,11'd3}`  |
| `OR1K_SPR_PCCR4_ADDR` | `{5'd7,11'd4}`  |
| `OR1K_SPR_PCCR5_ADDR` | `{5'd7,11'd5}`  |
| `OR1K_SPR_PCCR6_ADDR` | `{5'd7,11'd6}`  |
| `OR1K_SPR_PCCR7_ADDR` | `{5'd7,11'd7}`  |
| `OR1K_SPR_PCMR0_ADDR` | `{5'd7,11'd8}`  |
| `OR1K_SPR_PCMR1_ADDR` | `{5'd7,11'd9}`  |
| `OR1K_SPR_PCMR2_ADDR` | `{5'd7,11'd10}` |
| `OR1K_SPR_PCMR3_ADDR` | `{5'd7,11'd11}` |
| `OR1K_SPR_PCMR4_ADDR` | `{5'd7,11'd12}` |
| `OR1K_SPR_PCMR5_ADDR` | `{5'd7,11'd13}` |
| `OR1K_SPR_PCMR6_ADDR` | `{5'd7,11'd14}` |
| `OR1K_SPR_PCMR7_ADDR` | `{5'd7,11'd15}` |

| **Name**            | **Value**      |
|:--------------------|:---------------|
| `OR1K_SPR_PM_BASE`  | `{4'd8}`       |
| `OR1K_SPR_PMR_ADDR` | `{5'd8,11'd0}` |

| **Name**              | **Value**      |
|:----------------------|:---------------|
| `OR1K_SPR_PIC_BASE`   | `{4'd9}`       |
| `OR1K_SPR_PICMR_ADDR` | `{5'd9,11'd0}` |
| `OR1K_SPR_PICSR_ADDR` | `{5'd9,11'd2}` |

| **Name**             | **Value**       |
|:---------------------|:----------------|
| `OR1K_SPR_TT_BASE`   | `{4'd10}`       |
| `OR1K_SPR_TTMR_ADDR` | `{5'd10,11'd0}` |
| `OR1K_SPR_TTCR_ADDR` | `{5'd10,11'd1}` |

| **Name**            | **Value** |
|:--------------------|:----------|
| `OR1K_SPR_FPU_BASE` | `{4'd11}` |
