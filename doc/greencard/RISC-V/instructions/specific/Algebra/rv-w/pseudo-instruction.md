## PSEUDO-INSTRUCTIONS

**Matrix Instructions Formats**

  | **Category** | **Operands**       | **Operation**   |
  |:-------------|:-------------------|:----------------|
  | `OPIVV`      | `matrix-matrix`    | `Integer`       |
  | `OPIVX`      | `matrix-scalar`    | `Integer`       |
  | `OPIVI`      | `matrix-immediate` | `Integer`       |
  | `OPFVV`      | `matrix-matrix`    | `Float`         |
  | `OPFVF`      | `matrix-scalar`    | `Float`         |
  | `OPMVV`      | `matrix-matrix`    | `Mask`          |
  | `OPMVX`      | `matrix-scalar`    | `Mask`          |
  | `OPCFG`      | `scalars-imms`     | `Configuration` |

  : Matrix Instructions Formats

**OPLS (Matrix Loads and Store)**

* **Matrix Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Format**               |
  |:----------|:-----------------------------------------------------------------|:-------------------------|
  | `wlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  wd 6..0=0x07` | `wlm.v   wd, (rs1)`      |
  | `wsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27` | `wsm.v   vs3, (rs1)`     |

  : Matrix Unit-Stride Instructions (including segment part)

* **Matrix Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Format**             |
  |:------------|:-----------------------------------------------------------------------|:-----------------------|
  | `wl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `wl1re8.v    v3, (a0)` |
  | `wl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `wl2re8.v    v2, (a0)` |
  | `wl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `wl4re8.v    v4, (a0)` |
  | `wl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `wl8re8.v    v8, (a0)` |

  : Matrix Load/Store Whole Registers

**Matrix Float-Point Instructions**

* **OPFVV**

  | **Name**       | **Opcode / Argument**                                   | **Format**                      |
  |:---------------|:--------------------------------------------------------|:--------------------------------|
  | `wfredusum.vs` | `31..26=0x01 vm vs2 vs1 14..12=0x1 wd 6..0=0x57`        | `wfredusum.vs wd, vs2, vs1, vm` |

  : OPFVV I

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `wfwredusum.vs` | `31..26=0x31 vm vs2 vs1 14..12=0x1 wd 6..0=0x57` | `wfwredusum.vs wd, vs2, vs1, vm` |

  : OPFVV VIII

**Matrix Integer Instructions**

* **OPI (Matrix Integer Extension Instructions)**

  | **Name**       | **Opcode / Argument**                              | **Format**                  |
  |:---------------|:---------------------------------------------------|:----------------------------|
  | `wmandn.mm`    | `31..26=0x18 25=1 vs2 vs1 14..12=0x2 wd 6..0=0x57` | `wmandn.mm wd, vs2, vs1`    |
  | `wmorn.mm`     | `31..26=0x1c 25=1 vs2 vs1 14..12=0x2 wd 6..0=0x57` | `wmorn.mm  wd, vs2, vs1`    |

  : Matrix Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Format**             |
  |:-----------|:--------------------------------------------------------------|:-----------------------|
  | `wcpop.m`  | `31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `wcpop.m rd, vs2, vm`  |

  : Matrix Integer Extension Instructions III
