## PSEUDO-INSTRUCTIONS

**Vector Instructions Formats**

  | **Category** | **Operands**       | **Operation**   |
  |:-------------|:-------------------|:----------------|
  | `OPIVV`      | `vector-vector`    | `Integer`       |
  | `OPIVX`      | `vector-scalar`    | `Integer`       |
  | `OPIVI`      | `vector-immediate` | `Integer`       |
  | `OPFVV`      | `vector-vector`    | `Float`         |
  | `OPFVF`      | `vector-scalar`    | `Float`         |
  | `OPMVV`      | `vector-vector`    | `Mask`          |
  | `OPMVX`      | `vector-scalar`    | `Mask`          |
  | `OPCFG`      | `scalars-imms`     | `Configuration` |

  : Vector Instructions Formats

**OPLS (Vector Loads and Store)**

* **Vector Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Format**               |
  |:----------|:-----------------------------------------------------------------|:-------------------------|
  | `vlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  vd 6..0=0x07` | `vlm.v   vd, (rs1)`      |
  | `vsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27` | `vsm.v   vs3, (rs1)`     |

  : Vector Unit-Stride Instructions (including segment part)

* **Vector Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Format**             |
  |:------------|:-----------------------------------------------------------------------|:-----------------------|
  | `vl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vl1re8.v    v3, (a0)` |
  | `vl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vl2re8.v    v2, (a0)` |
  | `vl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vl4re8.v    v4, (a0)` |
  | `vl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vl8re8.v    v8, (a0)` |

  : Vector Load/Store Whole Registers

**Vector Float-Point Instructions**

* **OPFVV**

  | **Name**       | **Opcode / Argument**                                   | **Format**                      |
  |:---------------|:--------------------------------------------------------|:--------------------------------|
  | `vfredusum.vs` | `31..26=0x01 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfredusum.vs vd, vs2, vs1, vm` |

  : OPFVV I

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `vfwredusum.vs` | `31..26=0x31 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwredusum.vs vd, vs2, vs1, vm` |

  : OPFVV VIII

**Vector Integer Instructions**

* **OPI (Vector Integer Extension Instructions)**

  | **Name**       | **Opcode / Argument**                              | **Format**                  |
  |:---------------|:---------------------------------------------------|:----------------------------|
  | `vmandn.mm`    | `31..26=0x18 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmandn.mm vd, vs2, vs1`    |
  | `vmorn.mm`     | `31..26=0x1c 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmorn.mm  vd, vs2, vs1`    |

  : Vector Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Format**             |
  |:-----------|:--------------------------------------------------------------|:-----------------------|
  | `vcpop.m`  | `31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `vcpop.m rd, vs2, vm`  |

  : Vector Integer Extension Instructions III
