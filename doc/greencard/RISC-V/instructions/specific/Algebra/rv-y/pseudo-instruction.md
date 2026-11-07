## PSEUDO-INSTRUCTIONS

**Tensor Instructions Formats**

  | **Category** | **Operands**       | **Operation**   |
  |:-------------|:-------------------|:----------------|
  | `OPIVV`      | `tensor-tensor`    | `Integer`       |
  | `OPIVX`      | `tensor-scalar`    | `Integer`       |
  | `OPIVI`      | `tensor-immediate` | `Integer`       |
  | `OPFVV`      | `tensor-tensor`    | `Float`         |
  | `OPFVF`      | `tensor-scalar`    | `Float`         |
  | `OPMVV`      | `tensor-tensor`    | `Mask`          |
  | `OPMVX`      | `tensor-scalar`    | `Mask`          |
  | `OPCFG`      | `scalars-imms`     | `Configuration` |

  : Tensor Instructions Formats

**OPLS (Tensor Loads and Store)**

* **Tensor Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Format**               |
  |:----------|:-----------------------------------------------------------------|:-------------------------|
  | `ylm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  yd 6..0=0x07` | `ylm.v   yd, (rs1)`      |
  | `ysm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27` | `ysm.v   vs3, (rs1)`     |

  : Tensor Unit-Stride Instructions (including segment part)

* **Tensor Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Format**             |
  |:------------|:-----------------------------------------------------------------------|:-----------------------|
  | `yl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `yl1re8.v    v3, (a0)` |
  | `yl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `yl2re8.v    v2, (a0)` |
  | `yl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `yl4re8.v    v4, (a0)` |
  | `yl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `yl8re8.v    v8, (a0)` |

  : Tensor Load/Store Whole Registers

**Tensor Float-Point Instructions**

* **OPFVV**

  | **Name**       | **Opcode / Argument**                                   | **Format**                      |
  |:---------------|:--------------------------------------------------------|:--------------------------------|
  | `yfredusum.vs` | `31..26=0x01 vm vs2 vs1 14..12=0x1 yd 6..0=0x57`        | `yfredusum.vs yd, vs2, vs1, vm` |

  : OPFVV I

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `yfwredusum.vs` | `31..26=0x31 vm vs2 vs1 14..12=0x1 yd 6..0=0x57` | `yfwredusum.vs yd, vs2, vs1, vm` |

  : OPFVV VIII

**Tensor Integer Instructions**

* **OPI (Tensor Integer Extension Instructions)**

  | **Name**       | **Opcode / Argument**                              | **Format**                  |
  |:---------------|:---------------------------------------------------|:----------------------------|
  | `ymandn.mm`    | `31..26=0x18 25=1 vs2 vs1 14..12=0x2 yd 6..0=0x57` | `ymandn.mm yd, vs2, vs1`    |
  | `ymorn.mm`     | `31..26=0x1c 25=1 vs2 vs1 14..12=0x2 yd 6..0=0x57` | `ymorn.mm  yd, vs2, vs1`    |

  : Tensor Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Format**             |
  |:-----------|:--------------------------------------------------------------|:-----------------------|
  | `ycpop.m`  | `31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `ycpop.m rd, vs2, vm`  |

  : Tensor Integer Extension Instructions III
