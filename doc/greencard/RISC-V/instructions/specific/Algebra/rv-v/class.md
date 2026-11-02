## INSTRUCTION CLASSES

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

**OPCFG (Configuration Setting)**

  | **Name**   | **Opcode / Argument**                              | **Class**              |
  |:-----------|:---------------------------------------------------|:-----------------------|
  | `vsetivli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `vector,configuration` |
  | `vsetvli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `vector,configuration` |
  | `vsetvl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `vector,configuration` |

  : Configuration Setting

**OPLS (Vector Loads and Store)**

* **Vector Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Class**           |
  |:----------|:-----------------------------------------------------------------|:--------------------|
  | `vlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  vd 6..0=0x07` | `vector,load,mask`  |
  | `vsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27` | `vector,store,mask` |
  | `vle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  vd 6..0=0x07`      | `vector,load`       |
  | `vle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  vd 6..0=0x07`      | `vector,load`       |
  | `vle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  vd 6..0=0x07`      | `vector,load`       |
  | `vle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  vd 6..0=0x07`      | `vector,load`       |
  | `vse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 vs3 6..0=0x27`      | `vector,store`      |
  | `vse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 vs3 6..0=0x27`      | `vector,store`      |
  | `vse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 vs3 6..0=0x27`      | `vector,store`      |
  | `vse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 vs3 6..0=0x27`      | `vector,store`      |

  : Vector Unit-Stride Instructions (including segment part)

* **Vector Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Class**      |
  |:-------------|:-------------------------------------------------------|:---------------|
  | `vluxei8.v`  | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0  vd 6..0=0x07` | `vector,load`  |
  | `vluxei16.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5  vd 6..0=0x07` | `vector,load`  |
  | `vluxei32.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6  vd 6..0=0x07` | `vector,load`  |
  | `vluxei64.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7  vd 6..0=0x07` | `vector,load`  |
  | `vsuxei8.v`  | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27` | `vector,store` |
  | `vsuxei16.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27` | `vector,store` |
  | `vsuxei32.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27` | `vector,store` |
  | `vsuxei64.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27` | `vector,store` |

  : Vector Indexed-Unordered Instructions (including segment part)

* **Vector Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Class**      |
  |:-----------|:-------------------------------------------------------|:---------------|
  | `vlse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  vd 6..0=0x07` | `vector,load`  |
  | `vlse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  vd 6..0=0x07` | `vector,load`  |
  | `vlse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  vd 6..0=0x07` | `vector,load`  |
  | `vlse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  vd 6..0=0x07` | `vector,load`  |
  | `vsse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 vs3 6..0=0x27` | `vector,store` |
  | `vsse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 vs3 6..0=0x27` | `vector,store` |
  | `vsse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 vs3 6..0=0x27` | `vector,store` |
  | `vsse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 vs3 6..0=0x27` | `vector,store` |

  : Vector Strided Instructions (including segment part)

* **Vector Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Class**      |
  |:-------------|:-------------------------------------------------------|:---------------|
  | `vloxei8.v`  | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0  vd 6..0=0x07` | `vector,load`  |
  | `vloxei16.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5  vd 6..0=0x07` | `vector,load`  |
  | `vloxei32.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6  vd 6..0=0x07` | `vector,load`  |
  | `vloxei64.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7  vd 6..0=0x07` | `vector,load`  |
  | `vsoxei8.v`  | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27` | `vector,store` |
  | `vsoxei16.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27` | `vector,store` |
  | `vsoxei32.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27` | `vector,store` |
  | `vsoxei64.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27` | `vector,store` |

  : Vector Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Class**                      |
  |:------------|:---------------------------------------------------------------|:-------------------------------|
  | `vle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  vd 6..0=0x07` | `vector,load,fault-only-first` |
  | `vle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  vd 6..0=0x07` | `vector,load,fault-only-first` |
  | `vle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  vd 6..0=0x07` | `vector,load,fault-only-first` |
  | `vle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  vd 6..0=0x07` | `vector,load,fault-only-first` |

  : Unit-stride Fault-Only-First Loads

* **Vector Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Class**                     |
  |:------------|:-----------------------------------------------------------------------|:------------------------------|
  | `vl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `vector,load,whole-register`  |
  | `vs1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `vector,store,whole-register` |
  | `vs2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `vector,store,whole-register` |
  | `vs4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `vector,store,whole-register` |
  | `vs8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `vector,store,whole-register` |

  : Vector Load/Store Whole Registers

**Vector Float-Point Instructions**

* **OPFVF**

  | **Name**          | **Opcode / Argument**                                   | **Class**                       |
  |:------------------|:--------------------------------------------------------|:--------------------------------|
  | `vfadd.vf`        | `31..26=0x00 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,alu,floating-point`     |
  | `vfsub.vf`        | `31..26=0x02 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,alu,floating-point`     |
  | `vfmin.vf`        | `31..26=0x04 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,alu,floating-point`     |
  | `vfmax.vf`        | `31..26=0x06 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,alu,floating-point`     |
  | `vfsgnj.vf`       | `31..26=0x08 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,logical,floating-point` |
  | `vfsgnjn.vf`      | `31..26=0x09 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,logical,floating-point` |
  | `vfsgnjx.vf`      | `31..26=0x0a vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,logical,floating-point` |
  | `vfslide1up.vf`   | `31..26=0x0e vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,permute,floating-point` |
  | `vfslide1down.vf` | `31..26=0x0f vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,permute,floating-point` |
  | `vfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57` | `vector,move,floating-point`    |

  : OPFVF I

  | **Name**      | **Opcode / Argument**                                   | **Class**                            |
  |:--------------|:--------------------------------------------------------|:-------------------------------------|
  | `vfmerge.vfm` | `31..26=0x17 25=0 vs2 rs1 14..12=0x5 vd 6..0=0x57`      | `vector,merge,floating-point`        |
  | `vfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57` | `vector,move,floating-point`         |
  | `vmfeq.vf`    | `31..26=0x18 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,compare,floating-point,mask` |
  | `vmfle.vf`    | `31..26=0x19 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,compare,floating-point,mask` |
  | `vmflt.vf`    | `31..26=0x1b vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,compare,floating-point,mask` |
  | `vmfne.vf`    | `31..26=0x1c vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,compare,floating-point,mask` |
  | `vmfgt.vf`    | `31..26=0x1d vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,compare,floating-point,mask` |
  | `vmfge.vf`    | `31..26=0x1f vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vector,compare,floating-point,mask` |

  : OPFVF II

  | **Name**     | **Opcode / Argument**                            | **Class**                        |
  |:-------------|:-------------------------------------------------|:---------------------------------|
  | `vfdiv.vf`   | `31..26=0x20 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfrdiv.vf`  | `31..26=0x21 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfmul.vf`   | `31..26=0x24 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfrsub.vf`  | `31..26=0x27 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfmadd.vf`  | `31..26=0x28 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfnmadd.vf` | `31..26=0x29 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfmsub.vf`  | `31..26=0x2a vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfnmsub.vf` | `31..26=0x2b vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfmacc.vf`  | `31..26=0x2c vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfnmacc.vf` | `31..26=0x2d vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfmsac.vf`  | `31..26=0x2e vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfnmsac.vf` | `31..26=0x2f vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |

  : OPFVF III

  | **Name**      | **Opcode / Argument**                            | **Class**                        |
  |:--------------|:-------------------------------------------------|:---------------------------------|
  | `vfwadd.vf`   | `31..26=0x30 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfwsub.vf`   | `31..26=0x32 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfwadd.wf`   | `31..26=0x34 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfwsub.wf`   | `31..26=0x36 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfwmul.vf`   | `31..26=0x38 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfwmacc.vf`  | `31..26=0x3c vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfwnmacc.vf` | `31..26=0x3d vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfwmsac.vf`  | `31..26=0x3e vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfwnmsac.vf` | `31..26=0x3f vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vector,multiply,floating-point` |

  : OPFVF IV

* **OPFVV**

  | **Name**       | **Opcode / Argument**                                   | **Class**                         |
  |:---------------|:--------------------------------------------------------|:----------------------------------|
  | `vfadd.vv`     | `31..26=0x00 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,alu,floating-point`       |
  | `vfredusum.vs` | `31..26=0x01 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,reduction,floating-point` |
  | `vfsub.vv`     | `31..26=0x02 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,alu,floating-point`       |
  | `vfredosum.vs` | `31..26=0x03 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,reduction,floating-point` |
  | `vfmin.vv`     | `31..26=0x04 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,alu,floating-point`       |
  | `vfredmin.vs`  | `31..26=0x05 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,reduction,floating-point` |
  | `vfmax.vv`     | `31..26=0x06 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,alu,floating-point`       |
  | `vfredmax.vs`  | `31..26=0x07 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,reduction,floating-point` |
  | `vfsgnj.vv`    | `31..26=0x08 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,logical,floating-point`   |
  | `vfsgnjn.vv`   | `31..26=0x09 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,logical,floating-point`   |
  | `vfsgnjx.vv`   | `31..26=0x0a vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vector,logical,floating-point`   |
  | `vfmv.f.s`     | `31..26=0x10 25=1 vs2 19..15=0 14..12=0x1 rd 6..0=0x57` | `vector,move,floating-point`      |

  : OPFVV I

  | **Name**   | **Opcode / Argument**                            | **Class**                            |
  |:-----------|:-------------------------------------------------|:-------------------------------------|
  | `vmfeq.vv` | `31..26=0x18 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,compare,floating-point,mask` |
  | `vmfle.vv` | `31..26=0x19 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,compare,floating-point,mask` |
  | `vmflt.vv` | `31..26=0x1b vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,compare,floating-point,mask` |
  | `vmfne.vv` | `31..26=0x1c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,compare,floating-point,mask` |

  : OPFVV II

  | **Name**     | **Opcode / Argument**                            | **Class**                        |
  |:-------------|:-------------------------------------------------|:---------------------------------|
  | `vfdiv.vv`   | `31..26=0x20 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfmul.vv`   | `31..26=0x24 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfmadd.vv`  | `31..26=0x28 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfnmadd.vv` | `31..26=0x29 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfmsub.vv`  | `31..26=0x2a vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfnmsub.vv` | `31..26=0x2b vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfmacc.vv`  | `31..26=0x2c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfnmacc.vv` | `31..26=0x2d vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfmsac.vv`  | `31..26=0x2e vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point` |
  | `vfnmsac.vv` | `31..26=0x2f vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point` |

  : OPFVV III

  | **Name**           | **Opcode / Argument**                                    | **Class**                       |
  |:-------------------|:---------------------------------------------------------|:--------------------------------|
  | `vfcvt.xu.f.v`     | `31..26=0x12 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfcvt.x.f.v`      | `31..26=0x12 vm vs2 19..15=0x01 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfcvt.f.xu.v`     | `31..26=0x12 vm vs2 19..15=0x02 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfcvt.f.x.v`      | `31..26=0x12 vm vs2 19..15=0x03 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfcvt.rtz.xu.f.v` | `31..26=0x12 vm vs2 19..15=0x06 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfcvt.rtz.x.f.v`  | `31..26=0x12 vm vs2 19..15=0x07 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |

  : OPFVV IV

  | **Name**            | **Opcode / Argument**                                    | **Class**                       |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `vfwcvt.xu.f.v`     | `31..26=0x12 vm vs2 19..15=0x08 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfwcvt.x.f.v`      | `31..26=0x12 vm vs2 19..15=0x09 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfwcvt.f.xu.v`     | `31..26=0x12 vm vs2 19..15=0x0A 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfwcvt.f.x.v`      | `31..26=0x12 vm vs2 19..15=0x0B 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfwcvt.f.f.v`      | `31..26=0x12 vm vs2 19..15=0x0C 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfwcvt.rtz.xu.f.v` | `31..26=0x12 vm vs2 19..15=0x0E 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfwcvt.rtz.x.f.v`  | `31..26=0x12 vm vs2 19..15=0x0F 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |

  : OPFVV V

  | **Name**            | **Opcode / Argument**                                    | **Class**                       |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `vfncvt.xu.f.w`     | `31..26=0x12 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfncvt.x.f.w`      | `31..26=0x12 vm vs2 19..15=0x11 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfncvt.f.xu.w`     | `31..26=0x12 vm vs2 19..15=0x12 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfncvt.f.x.w`      | `31..26=0x12 vm vs2 19..15=0x13 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfncvt.f.f.w`      | `31..26=0x12 vm vs2 19..15=0x14 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfncvt.rod.f.f.w`  | `31..26=0x12 vm vs2 19..15=0x15 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfncvt.rtz.xu.f.w` | `31..26=0x12 vm vs2 19..15=0x16 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |
  | `vfncvt.rtz.x.f.w`  | `31..26=0x12 vm vs2 19..15=0x17 14..12=0x1 vd 6..0=0x57` | `vector,convert,floating-point` |

  : OPFVV VI

  | **Name**     | **Opcode / Argument**                                    | **Class**                        |
  |:-------------|:---------------------------------------------------------|:---------------------------------|
  | `vfsqrt.v`   | `31..26=0x13 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfrsqrt7.v` | `31..26=0x13 vm vs2 19..15=0x04 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfrec7.v`   | `31..26=0x13 vm vs2 19..15=0x05 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`      |
  | `vfclass.v`  | `31..26=0x13 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57` | `vector,classify,floating-point` |

  : OPFVV VII

  | **Name**        | **Opcode / Argument**                            | **Class**                         |
  |:----------------|:-------------------------------------------------|:----------------------------------|
  | `vfwadd.vv`     | `31..26=0x30 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`       |
  | `vfwredusum.vs` | `31..26=0x31 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,reduction,floating-point` |
  | `vfwsub.vv`     | `31..26=0x32 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`       |
  | `vfwredosum.vs` | `31..26=0x33 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,reduction,floating-point` |
  | `vfwadd.wv`     | `31..26=0x34 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`       |
  | `vfwsub.wv`     | `31..26=0x36 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`       |
  | `vfwmul.vv`     | `31..26=0x38 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,alu,floating-point`       |
  | `vfwmacc.vv`    | `31..26=0x3c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point`  |
  | `vfwnmacc.vv`   | `31..26=0x3d vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point`  |
  | `vfwmsac.vv`    | `31..26=0x3e vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point`  |
  | `vfwnmsac.vv`   | `31..26=0x3f vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vector,multiply,floating-point`  |

  : OPFVV VIII

**Vector Integer Instructions**

* **OPIVX**

  | **Name**        | **Opcode / Argument**                            | **Class**            |
  |:----------------|:-------------------------------------------------|:---------------------|
  | `vadd.vx`       | `31..26=0x00 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vsub.vx`       | `31..26=0x02 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vrsub.vx`      | `31..26=0x03 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vminu.vx`      | `31..26=0x04 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vmin.vx`       | `31..26=0x05 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vmaxu.vx`      | `31..26=0x06 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vmax.vx`       | `31..26=0x07 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vand.vx`       | `31..26=0x09 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vor.vx`        | `31..26=0x0a vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vxor.vx`       | `31..26=0x0b vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer` |
  | `vrgather.vx`   | `31..26=0x0c vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,permute`     |
  | `vslideup.vx`   | `31..26=0x0e vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,permute`     |
  | `vslidedown.vx` | `31..26=0x0f vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,permute`     |

  : OPIVX I

  | **Name**     | **Opcode / Argument**                                   | **Class**                     |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `vadc.vxm`   | `31..26=0x10 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vector,alu,integer`          |
  | `vmadc.vxm`  | `31..26=0x11 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vmadc.vx`   | `31..26=0x11 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vsbc.vxm`   | `31..26=0x12 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vector,alu,integer`          |
  | `vmsbc.vxm`  | `31..26=0x13 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vmsbc.vx`   | `31..26=0x13 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vmerge.vxm` | `31..26=0x17 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vector,merge,integer`        |
  | `vmv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 vd 6..0=0x57` | `vector,move,integer`         |
  | `vmseq.vx`   | `31..26=0x18 vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsne.vx`   | `31..26=0x19 vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsltu.vx`  | `31..26=0x1a vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmslt.vx`   | `31..26=0x1b vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsleu.vx`  | `31..26=0x1c vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsle.vx`   | `31..26=0x1d vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsgtu.vx`  | `31..26=0x1e vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsgt.vx`   | `31..26=0x1f vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vector,compare,integer,mask` |

  : OPIVX II

  | **Name**     | **Opcode / Argument**                            | **Class**                |
  |:-------------|:-------------------------------------------------|:-------------------------|
  | `vsaddu.vx`  | `31..26=0x20 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vsadd.vx`   | `31..26=0x21 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vssubu.vx`  | `31..26=0x22 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vssub.vx`   | `31..26=0x23 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vsll.vx`    | `31..26=0x25 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vsmul.vx`   | `31..26=0x27 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vsrl.vx`    | `31..26=0x28 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vsra.vx`    | `31..26=0x29 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vssrl.vx`   | `31..26=0x2a vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vssra.vx`   | `31..26=0x2b vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vnsrl.wx`   | `31..26=0x2c vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vnsra.wx`   | `31..26=0x2d vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vnclipu.wx` | `31..26=0x2e vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vnclip.wx`  | `31..26=0x2f vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vector,alu,fixed-point` |

  : OPIVX III

* **OPIVV**

  | **Name**          | **Opcode / Argument**                            | **Class**            |
  |:------------------|:-------------------------------------------------|:---------------------|
  | `vadd.vv`         | `31..26=0x00 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vsub.vv`         | `31..26=0x02 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vminu.vv`        | `31..26=0x04 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vmin.vv`         | `31..26=0x05 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vmaxu.vv`        | `31..26=0x06 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vmax.vv`         | `31..26=0x07 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vand.vv`         | `31..26=0x09 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vor.vv`          | `31..26=0x0a vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vxor.vv`         | `31..26=0x0b vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer` |
  | `vrgather.vv`     | `31..26=0x0c vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,permute`     |
  | `vrgatherei16.vv` | `31..26=0x0e vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,permute`     |

  : OPIVV I

  | **Name**     | **Opcode / Argument**                                   | **Class**                     |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `vadc.vvm`   | `31..26=0x10 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vector,alu,integer`          |
  | `vmadc.vvm`  | `31..26=0x11 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vmadc.vv`   | `31..26=0x11 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vsbc.vvm`   | `31..26=0x12 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vector,alu,integer`          |
  | `vmsbc.vvm`  | `31..26=0x13 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vmsbc.vv`   | `31..26=0x13 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vmerge.vvm` | `31..26=0x17 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vector,merge,integer`        |
  | `vmv.v.v`    | `31..26=0x17 25=1 24..20=0 vs1 14..12=0x0 vd 6..0=0x57` | `vector,move,integer`         |
  | `vmseq.vv`   | `31..26=0x18 vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsne.vv`   | `31..26=0x19 vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsltu.vv`  | `31..26=0x1a vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmslt.vv`   | `31..26=0x1b vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsleu.vv`  | `31..26=0x1c vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsle.vv`   | `31..26=0x1d vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vector,compare,integer,mask` |

  : OPIVV II

  | **Name**     | **Opcode / Argument**                            | **Class**                |
  |:-------------|:-------------------------------------------------|:-------------------------|
  | `vsaddu.vv`  | `31..26=0x20 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vsadd.vv`   | `31..26=0x21 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vssubu.vv`  | `31..26=0x22 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vssub.vv`   | `31..26=0x23 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vsll.vv`    | `31..26=0x25 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vsmul.vv`   | `31..26=0x27 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vsrl.vv`    | `31..26=0x28 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vsra.vv`    | `31..26=0x29 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vssrl.vv`   | `31..26=0x2a vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vssra.vv`   | `31..26=0x2b vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vnsrl.wv`   | `31..26=0x2c vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vnsra.wv`   | `31..26=0x2d vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,integer`     |
  | `vnclipu.wv` | `31..26=0x2e vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vnclip.wv`  | `31..26=0x2f vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,alu,fixed-point` |

  : OPIVV III

  | **Name**       | **Opcode / Argument**                            | **Class**                  |
  |:---------------|:-------------------------------------------------|:---------------------------|
  | `vwredsumu.vs` | `31..26=0x30 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vwredsum.vs`  | `31..26=0x31 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vector,reduction,integer` |

  : OPIVV IV

* **OPIVI**

  | **Name**        | **Opcode / Argument**                              | **Class**            |
  |:----------------|:---------------------------------------------------|:---------------------|
  | `vadd.vi`       | `31..26=0x00 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vector,alu,integer` |
  | `vrsub.vi`      | `31..26=0x03 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vector,alu,integer` |
  | `vand.vi`       | `31..26=0x09 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vector,alu,integer` |
  | `vor.vi`        | `31..26=0x0a vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vector,alu,integer` |
  | `vxor.vi`       | `31..26=0x0b vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vector,alu,integer` |
  | `vrgather.vi`   | `31..26=0x0c vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vector,permute`     |
  | `vslideup.vi`   | `31..26=0x0e vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vector,permute`     |
  | `vslidedown.vi` | `31..26=0x0f vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vector,permute`     |

  : OPIVI I

  | **Name**     | **Opcode / Argument**                                     | **Class**                     |
  |:-------------|:----------------------------------------------------------|:------------------------------|
  | `vadc.vim`   | `31..26=0x10 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,integer`          |
  | `vmadc.vim`  | `31..26=0x11 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vmadc.vi`   | `31..26=0x11 25=1 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,integer,mask`     |
  | `vmerge.vim` | `31..26=0x17 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,merge,integer`        |
  | `vmv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 vd 6..0=0x57` | `vector,move,integer`         |
  | `vmseq.vi`   | `31..26=0x18 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsne.vi`   | `31..26=0x19 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsleu.vi`  | `31..26=0x1c vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsle.vi`   | `31..26=0x1d vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsgtu.vi`  | `31..26=0x1e vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vector,compare,integer,mask` |
  | `vmsgt.vi`   | `31..26=0x1f vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vector,compare,integer,mask` |

  : OPIVI II

  | **Name**     | **Opcode / Argument**                                   | **Class**                    |
  |:-------------|:--------------------------------------------------------|:-----------------------------|
  | `vsaddu.vi`  | `31..26=0x20 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,fixed-point`     |
  | `vsadd.vi`   | `31..26=0x21 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,fixed-point`     |
  | `vsll.vi`    | `31..26=0x25 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,integer`         |
  | `vmv1r.v`    | `31..26=0x27 25=1 vs2 19..15=0 14..12=0x3 vd 6..0=0x57` | `vector,move,whole-register` |
  | `vmv2r.v`    | `31..26=0x27 25=1 vs2 19..15=1 14..12=0x3 vd 6..0=0x57` | `vector,move,whole-register` |
  | `vmv4r.v`    | `31..26=0x27 25=1 vs2 19..15=3 14..12=0x3 vd 6..0=0x57` | `vector,move,whole-register` |
  | `vmv8r.v`    | `31..26=0x27 25=1 vs2 19..15=7 14..12=0x3 vd 6..0=0x57` | `vector,move,whole-register` |
  | `vsrl.vi`    | `31..26=0x28 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,integer`         |
  | `vsra.vi`    | `31..26=0x29 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,integer`         |
  | `vssrl.vi`   | `31..26=0x2a vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,fixed-point`     |
  | `vssra.vi`   | `31..26=0x2b vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,fixed-point`     |
  | `vnsrl.wi`   | `31..26=0x2c vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,integer`         |
  | `vnsra.wi`   | `31..26=0x2d vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,integer`         |
  | `vnclipu.wi` | `31..26=0x2e vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,fixed-point`     |
  | `vnclip.wi`  | `31..26=0x2f vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vector,alu,fixed-point`     |

  : OPIVI III

* **OPI (Vector Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Class**            |
  |:------------|:------------------------------------------------------|:---------------------|
  | `vzext.vf8` | `31..26=0x12 vm vs2 19..15=2 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer` |
  | `vsext.vf8` | `31..26=0x12 vm vs2 19..15=3 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer` |
  | `vzext.vf4` | `31..26=0x12 vm vs2 19..15=4 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer` |
  | `vsext.vf4` | `31..26=0x12 vm vs2 19..15=5 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer` |
  | `vzext.vf2` | `31..26=0x12 vm vs2 19..15=6 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer` |
  | `vsext.vf2` | `31..26=0x12 vm vs2 19..15=7 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer` |

  : Vector Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Class**                 |
  |:---------------|:---------------------------------------------------|:--------------------------|
  | `vcompress.vm` | `31..26=0x17 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,permute,compress` |
  | `vmandn.mm`    | `31..26=0x18 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,logical,mask`     |
  | `vmand.mm`     | `31..26=0x19 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,logical,mask`     |
  | `vmor.mm`      | `31..26=0x1a 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,logical,mask`     |
  | `vmxor.mm`     | `31..26=0x1b 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,logical,mask`     |
  | `vmorn.mm`     | `31..26=0x1c 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,logical,mask`     |
  | `vmnand.mm`    | `31..26=0x1d 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,logical,mask`     |
  | `vmnor.mm`     | `31..26=0x1e 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,logical,mask`     |
  | `vmxnor.mm`    | `31..26=0x1f 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,logical,mask`     |

  : Vector Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Class**            |
  |:-----------|:--------------------------------------------------------------|:---------------------|
  | `vmsbf.m`  | `31..26=0x14 vm vs2 19..15=0x01 14..12=0x2 vd 6..0=0x57`      | `vector,mask,prefix` |
  | `vmsof.m`  | `31..26=0x14 vm vs2 19..15=0x02 14..12=0x2 vd 6..0=0x57`      | `vector,mask,prefix` |
  | `vmsif.m`  | `31..26=0x14 vm vs2 19..15=0x03 14..12=0x2 vd 6..0=0x57`      | `vector,mask,prefix` |
  | `viota.m`  | `31..26=0x14 vm vs2 19..15=0x10 14..12=0x2 vd 6..0=0x57`      | `vector,mask,prefix` |
  | `vid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 vd 6..0=0x57` | `vector,index`       |
  | `vcpop.m`  | `31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `vector,mask,count`  |
  | `vfirst.m` | `31..26=0x10 vm vs2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `vector,mask,search` |

  : Vector Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Class**                 |
  |:-------------|:-------------------------------------------------|:--------------------------|
  | `vdivu.vv`   | `31..26=0x20 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,divide,integer`   |
  | `vdiv.vv`    | `31..26=0x21 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,divide,integer`   |
  | `vremu.vv`   | `31..26=0x22 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,divide,integer`   |
  | `vrem.vv`    | `31..26=0x23 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,divide,integer`   |
  | `vmulhu.vv`  | `31..26=0x24 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmul.vv`    | `31..26=0x25 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmulhsu.vv` | `31..26=0x26 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmulh.vv`   | `31..26=0x27 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmadd.vv`   | `31..26=0x29 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vnmsub.vv`  | `31..26=0x2b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmacc.vv`   | `31..26=0x2d vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vnmsac.vv`  | `31..26=0x2f vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |

  : Vector Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Class**                 |
  |:--------------|:-------------------------------------------------|:--------------------------|
  | `vwaddu.vv`   | `31..26=0x30 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwadd.vv`    | `31..26=0x31 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwsubu.vv`   | `31..26=0x32 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwsub.vv`    | `31..26=0x33 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwaddu.wv`   | `31..26=0x34 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwadd.wv`    | `31..26=0x35 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwsubu.wv`   | `31..26=0x36 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwsub.wv`    | `31..26=0x37 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwmulu.vv`   | `31..26=0x38 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmulsu.vv`  | `31..26=0x3a vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmul.vv`    | `31..26=0x3b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmaccu.vv`  | `31..26=0x3c vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmacc.vv`   | `31..26=0x3d vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmaccsu.vv` | `31..26=0x3f vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,multiply,integer` |

  : Vector Integer Extension Instructions V

**Vector Mask Instructions**

* **OPMVV**

  | **Name**      | **Opcode / Argument**                            | **Class**                  |
  |:--------------|:-------------------------------------------------|:---------------------------|
  | `vredsum.vs`  | `31..26=0x00 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vredand.vs`  | `31..26=0x01 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vredor.vs`   | `31..26=0x02 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vredxor.vs`  | `31..26=0x03 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vredminu.vs` | `31..26=0x04 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vredmin.vs`  | `31..26=0x05 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vredmaxu.vs` | `31..26=0x06 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vredmax.vs`  | `31..26=0x07 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,reduction,integer` |
  | `vaaddu.vv`   | `31..26=0x08 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,fixed-point`   |
  | `vaadd.vv`    | `31..26=0x09 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,fixed-point`   |
  | `vasubu.vv`   | `31..26=0x0a vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,fixed-point`   |
  | `vasub.vv`    | `31..26=0x0b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vector,alu,fixed-point`   |

  : OPMVV I

  | **Name**  | **Opcode / Argument**                                   | **Class**             |
  |:----------|:--------------------------------------------------------|:----------------------|
  | `vmv.x.s` | `31..26=0x10 25=1 vs2 19..15=0 14..12=0x2 rd 6..0=0x57` | `vector,move,integer` |

  : OPMVV II

* **OPMVX**

  | **Name**    | **Opcode / Argument**                            | **Class**                |
  |:------------|:-------------------------------------------------|:-------------------------|
  | `vaaddu.vx` | `31..26=0x08 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vaadd.vx`  | `31..26=0x09 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vasubu.vx` | `31..26=0x0a vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,fixed-point` |
  | `vasub.vx`  | `31..26=0x0b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,fixed-point` |

  : OPMVX I

  | **Name**         | **Opcode / Argument**                                   | **Class**             |
  |:-----------------|:--------------------------------------------------------|:----------------------|
  | `vmv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 vd 6..0=0x57` | `vector,move,integer` |
  | `vslide1up.vx`   | `31..26=0x0e vm vs2 rs1 14..12=0x6 vd 6..0=0x57`        | `vector,permute`      |
  | `vslide1down.vx` | `31..26=0x0f vm vs2 rs1 14..12=0x6 vd 6..0=0x57`        | `vector,permute`      |

  : OPMVX II

  | **Name**     | **Opcode / Argument**                            | **Class**                 |
  |:-------------|:-------------------------------------------------|:--------------------------|
  | `vdivu.vx`   | `31..26=0x20 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,divide,integer`   |
  | `vdiv.vx`    | `31..26=0x21 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,divide,integer`   |
  | `vremu.vx`   | `31..26=0x22 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,divide,integer`   |
  | `vrem.vx`    | `31..26=0x23 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,divide,integer`   |
  | `vmulhu.vx`  | `31..26=0x24 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmul.vx`    | `31..26=0x25 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmulhsu.vx` | `31..26=0x26 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmulh.vx`   | `31..26=0x27 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmadd.vx`   | `31..26=0x29 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vnmsub.vx`  | `31..26=0x2b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vmacc.vx`   | `31..26=0x2d vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vnmsac.vx`  | `31..26=0x2f vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |

  : OPMVX III

  | **Name**      | **Opcode / Argument**                            | **Class**                 |
  |:--------------|:-------------------------------------------------|:--------------------------|
  | `vwaddu.vx`   | `31..26=0x30 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwadd.vx`    | `31..26=0x31 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwsubu.vx`   | `31..26=0x32 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwsub.vx`    | `31..26=0x33 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwaddu.wx`   | `31..26=0x34 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwadd.wx`    | `31..26=0x35 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwsubu.wx`   | `31..26=0x36 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwsub.wx`    | `31..26=0x37 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,alu,integer`      |
  | `vwmulu.vx`   | `31..26=0x38 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmulsu.vx`  | `31..26=0x3a vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmul.vx`    | `31..26=0x3b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmaccu.vx`  | `31..26=0x3c vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmacc.vx`   | `31..26=0x3d vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmaccus.vx` | `31..26=0x3e vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |
  | `vwmaccsu.vx` | `31..26=0x3f vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vector,multiply,integer` |

  : OPMVX IV
