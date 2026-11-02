## INSTRUCTION CLASSES

**Tensor Instructions Formats**

  | **Category** | **Operands**       | **Operation**   |
  |:-------------|:-------------------|:----------------|
  | `OPIYY`      | `tensor-tensor`    | `Integer`       |
  | `OPIYX`      | `tensor-scalar`    | `Integer`       |
  | `OPIYI`      | `tensor-immediate` | `Integer`       |
  | `OPFYY`      | `tensor-tensor`    | `Float`         |
  | `OPFYF`      | `tensor-scalar`    | `Float`         |
  | `OPMYY`      | `tensor-tensor`    | `Mask`          |
  | `OPMYX`      | `tensor-scalar`    | `Mask`          |
  | `OPCFG`      | `scalars-imms`     | `Configuration` |

  : Tensor Instructions Formats

**OPCFG (Configuration Setting)**

  | **Name**   | **Opcode / Argument**                              | **Class**              |
  |:-----------|:---------------------------------------------------|:-----------------------|
  | `ysetiyli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `tensor,configuration` |
  | `ysetyli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `tensor,configuration` |
  | `ysetyl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `tensor,configuration` |

  : Configuration Setting

**OPLS (Tensor Loads and Store)**

* **Tensor Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Class**           |
  |:----------|:-----------------------------------------------------------------|:--------------------|
  | `ylm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  yd 6..0=0x07` | `tensor,load,mask`  |
  | `ysm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 ys3 6..0=0x27` | `tensor,store,mask` |
  | `yle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  yd 6..0=0x07`      | `tensor,load`       |
  | `yle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  yd 6..0=0x07`      | `tensor,load`       |
  | `yle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  yd 6..0=0x07`      | `tensor,load`       |
  | `yle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  yd 6..0=0x07`      | `tensor,load`       |
  | `yse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 ys3 6..0=0x27`      | `tensor,store`      |
  | `yse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 ys3 6..0=0x27`      | `tensor,store`      |
  | `yse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 ys3 6..0=0x27`      | `tensor,store`      |
  | `yse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 ys3 6..0=0x27`      | `tensor,store`      |

  : Tensor Unit-Stride Instructions (including segment part)

* **Tensor Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Class**      |
  |:-------------|:-------------------------------------------------------|:---------------|
  | `yluxei8.v`  | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x0  yd 6..0=0x07` | `tensor,load`  |
  | `yluxei16.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x5  yd 6..0=0x07` | `tensor,load`  |
  | `yluxei32.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x6  yd 6..0=0x07` | `tensor,load`  |
  | `yluxei64.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x7  yd 6..0=0x07` | `tensor,load`  |
  | `ysuxei8.v`  | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x0 ys3 6..0=0x27` | `tensor,store` |
  | `ysuxei16.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x5 ys3 6..0=0x27` | `tensor,store` |
  | `ysuxei32.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x6 ys3 6..0=0x27` | `tensor,store` |
  | `ysuxei64.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x7 ys3 6..0=0x27` | `tensor,store` |

  : Tensor Indexed-Unordered Instructions (including segment part)

* **Tensor Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Class**      |
  |:-----------|:-------------------------------------------------------|:---------------|
  | `ylse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  yd 6..0=0x07` | `tensor,load`  |
  | `ylse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  yd 6..0=0x07` | `tensor,load`  |
  | `ylse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  yd 6..0=0x07` | `tensor,load`  |
  | `ylse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  yd 6..0=0x07` | `tensor,load`  |
  | `ysse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 ys3 6..0=0x27` | `tensor,store` |
  | `ysse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 ys3 6..0=0x27` | `tensor,store` |
  | `ysse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 ys3 6..0=0x27` | `tensor,store` |
  | `ysse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 ys3 6..0=0x27` | `tensor,store` |

  : Tensor Strided Instructions (including segment part)

* **Tensor Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Class**      |
  |:-------------|:-------------------------------------------------------|:---------------|
  | `yloxei8.v`  | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x0  yd 6..0=0x07` | `tensor,load`  |
  | `yloxei16.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x5  yd 6..0=0x07` | `tensor,load`  |
  | `yloxei32.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x6  yd 6..0=0x07` | `tensor,load`  |
  | `yloxei64.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x7  yd 6..0=0x07` | `tensor,load`  |
  | `ysoxei8.v`  | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x0 ys3 6..0=0x27` | `tensor,store` |
  | `ysoxei16.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x5 ys3 6..0=0x27` | `tensor,store` |
  | `ysoxei32.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x6 ys3 6..0=0x27` | `tensor,store` |
  | `ysoxei64.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x7 ys3 6..0=0x27` | `tensor,store` |

  : Tensor Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Class**                      |
  |:------------|:---------------------------------------------------------------|:-------------------------------|
  | `yle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  yd 6..0=0x07` | `tensor,load,fault-only-first` |
  | `yle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  yd 6..0=0x07` | `tensor,load,fault-only-first` |
  | `yle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  yd 6..0=0x07` | `tensor,load,fault-only-first` |
  | `yle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  yd 6..0=0x07` | `tensor,load,fault-only-first` |

  : Unit-stride Fault-Only-First Loads

* **Tensor Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Class**                     |
  |:------------|:-----------------------------------------------------------------------|:------------------------------|
  | `yl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `yl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `tensor,load,whole-register`  |
  | `ys1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `tensor,store,whole-register` |
  | `ys2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `tensor,store,whole-register` |
  | `ys4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `tensor,store,whole-register` |
  | `ys8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `tensor,store,whole-register` |

  : Tensor Load/Store Whole Registers

**Tensor Float-Point Instructions**

* **OPFYF**

  | **Name**          | **Opcode / Argument**                                   | **Class**                       |
  |:------------------|:--------------------------------------------------------|:--------------------------------|
  | `yfadd.vf`        | `31..26=0x00 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,alu,floating-point`     |
  | `yfsub.vf`        | `31..26=0x02 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,alu,floating-point`     |
  | `yfmin.vf`        | `31..26=0x04 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,alu,floating-point`     |
  | `yfmax.vf`        | `31..26=0x06 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,alu,floating-point`     |
  | `yfsgnj.vf`       | `31..26=0x08 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,logical,floating-point` |
  | `yfsgnjn.vf`      | `31..26=0x09 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,logical,floating-point` |
  | `yfsgnjx.vf`      | `31..26=0x0a vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,logical,floating-point` |
  | `yfslide1up.vf`   | `31..26=0x0e vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,permute,floating-point` |
  | `yfslide1down.vf` | `31..26=0x0f vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,permute,floating-point` |
  | `yfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,move,floating-point`    |

  : OPFYF I

  | **Name**      | **Opcode / Argument**                                   | **Class**                            |
  |:--------------|:--------------------------------------------------------|:-------------------------------------|
  | `yfmerge.vfm` | `31..26=0x17 25=0 ys2 rs1 14..12=0x5 yd 6..0=0x57`      | `tensor,merge,floating-point`        |
  | `yfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,move,floating-point`         |
  | `ymfeq.vf`    | `31..26=0x18 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,compare,floating-point,mask` |
  | `ymfle.vf`    | `31..26=0x19 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,compare,floating-point,mask` |
  | `ymflt.vf`    | `31..26=0x1b vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,compare,floating-point,mask` |
  | `ymfne.vf`    | `31..26=0x1c vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,compare,floating-point,mask` |
  | `ymfgt.vf`    | `31..26=0x1d vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,compare,floating-point,mask` |
  | `ymfge.vf`    | `31..26=0x1f vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `tensor,compare,floating-point,mask` |

  : OPFYF II

  | **Name**     | **Opcode / Argument**                            | **Class**                        |
  |:-------------|:-------------------------------------------------|:---------------------------------|
  | `yfdiv.vf`   | `31..26=0x20 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfrdiv.vf`  | `31..26=0x21 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfmul.vf`   | `31..26=0x24 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfrsub.vf`  | `31..26=0x27 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfmadd.vf`  | `31..26=0x28 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfnmadd.vf` | `31..26=0x29 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfmsub.vf`  | `31..26=0x2a vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfnmsub.vf` | `31..26=0x2b vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfmacc.vf`  | `31..26=0x2c vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfnmacc.vf` | `31..26=0x2d vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfmsac.vf`  | `31..26=0x2e vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfnmsac.vf` | `31..26=0x2f vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |

  : OPFYF III

  | **Name**      | **Opcode / Argument**                            | **Class**                        |
  |:--------------|:-------------------------------------------------|:---------------------------------|
  | `yfwadd.vf`   | `31..26=0x30 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfwsub.vf`   | `31..26=0x32 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfwadd.wf`   | `31..26=0x34 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfwsub.wf`   | `31..26=0x36 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfwmul.vf`   | `31..26=0x38 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfwmacc.vf`  | `31..26=0x3c vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfwnmacc.vf` | `31..26=0x3d vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfwmsac.vf`  | `31..26=0x3e vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfwnmsac.vf` | `31..26=0x3f vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `tensor,multiply,floating-point` |

  : OPFYF IV

* **OPFYY**

  | **Name**       | **Opcode / Argument**                                   | **Class**                         |
  |:---------------|:--------------------------------------------------------|:----------------------------------|
  | `yfadd.vv`     | `31..26=0x00 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,alu,floating-point`       |
  | `yfredusum.ys` | `31..26=0x01 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,reduction,floating-point` |
  | `yfsub.vv`     | `31..26=0x02 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,alu,floating-point`       |
  | `yfredosum.ys` | `31..26=0x03 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,reduction,floating-point` |
  | `yfmin.vv`     | `31..26=0x04 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,alu,floating-point`       |
  | `yfredmin.ys`  | `31..26=0x05 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,reduction,floating-point` |
  | `yfmax.vv`     | `31..26=0x06 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,alu,floating-point`       |
  | `yfredmax.ys`  | `31..26=0x07 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,reduction,floating-point` |
  | `yfsgnj.vv`    | `31..26=0x08 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,logical,floating-point`   |
  | `yfsgnjn.vv`   | `31..26=0x09 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,logical,floating-point`   |
  | `yfsgnjx.vv`   | `31..26=0x0a vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `tensor,logical,floating-point`   |
  | `yfmv.f.s`     | `31..26=0x10 25=1 ys2 19..15=0 14..12=0x1 rd 6..0=0x57` | `tensor,move,floating-point`      |

  : OPFYY I

  | **Name**   | **Opcode / Argument**                            | **Class**                            |
  |:-----------|:-------------------------------------------------|:-------------------------------------|
  | `ymfeq.vv` | `31..26=0x18 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,compare,floating-point,mask` |
  | `ymfle.vv` | `31..26=0x19 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,compare,floating-point,mask` |
  | `ymflt.vv` | `31..26=0x1b vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,compare,floating-point,mask` |
  | `ymfne.vv` | `31..26=0x1c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,compare,floating-point,mask` |

  : OPFYY II

  | **Name**     | **Opcode / Argument**                            | **Class**                        |
  |:-------------|:-------------------------------------------------|:---------------------------------|
  | `yfdiv.vv`   | `31..26=0x20 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfmul.vv`   | `31..26=0x24 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfmadd.vv`  | `31..26=0x28 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfnmadd.vv` | `31..26=0x29 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfmsub.vv`  | `31..26=0x2a vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfnmsub.vv` | `31..26=0x2b vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfmacc.vv`  | `31..26=0x2c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfnmacc.vv` | `31..26=0x2d vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfmsac.vv`  | `31..26=0x2e vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point` |
  | `yfnmsac.vv` | `31..26=0x2f vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point` |

  : OPFYY III

  | **Name**           | **Opcode / Argument**                                    | **Class**                       |
  |:-------------------|:---------------------------------------------------------|:--------------------------------|
  | `yfcvt.xu.f.v`     | `31..26=0x12 vm ys2 19..15=0x00 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfcvt.x.f.v`      | `31..26=0x12 vm ys2 19..15=0x01 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfcvt.f.xu.v`     | `31..26=0x12 vm ys2 19..15=0x02 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfcvt.f.x.v`      | `31..26=0x12 vm ys2 19..15=0x03 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfcvt.rtz.xu.f.v` | `31..26=0x12 vm ys2 19..15=0x06 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfcvt.rtz.x.f.v`  | `31..26=0x12 vm ys2 19..15=0x07 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |

  : OPFYY IV

  | **Name**            | **Opcode / Argument**                                    | **Class**                       |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `yfwcvt.xu.f.v`     | `31..26=0x12 vm ys2 19..15=0x08 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfwcvt.x.f.v`      | `31..26=0x12 vm ys2 19..15=0x09 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfwcvt.f.xu.v`     | `31..26=0x12 vm ys2 19..15=0x0A 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfwcvt.f.x.v`      | `31..26=0x12 vm ys2 19..15=0x0B 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfwcvt.f.f.v`      | `31..26=0x12 vm ys2 19..15=0x0C 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfwcvt.rtz.xu.f.v` | `31..26=0x12 vm ys2 19..15=0x0E 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfwcvt.rtz.x.f.v`  | `31..26=0x12 vm ys2 19..15=0x0F 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |

  : OPFYY V

  | **Name**            | **Opcode / Argument**                                    | **Class**                       |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `yfncvt.xu.f.w`     | `31..26=0x12 vm ys2 19..15=0x10 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfncvt.x.f.w`      | `31..26=0x12 vm ys2 19..15=0x11 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfncvt.f.xu.w`     | `31..26=0x12 vm ys2 19..15=0x12 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfncvt.f.x.w`      | `31..26=0x12 vm ys2 19..15=0x13 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfncvt.f.f.w`      | `31..26=0x12 vm ys2 19..15=0x14 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfncvt.rod.f.f.w`  | `31..26=0x12 vm ys2 19..15=0x15 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfncvt.rtz.xu.f.w` | `31..26=0x12 vm ys2 19..15=0x16 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |
  | `yfncvt.rtz.x.f.w`  | `31..26=0x12 vm ys2 19..15=0x17 14..12=0x1 yd 6..0=0x57` | `tensor,convert,floating-point` |

  : OPFYY VI

  | **Name**     | **Opcode / Argument**                                    | **Class**                        |
  |:-------------|:---------------------------------------------------------|:---------------------------------|
  | `yfsqrt.v`   | `31..26=0x13 vm ys2 19..15=0x00 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfrsqrt7.v` | `31..26=0x13 vm ys2 19..15=0x04 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfrec7.v`   | `31..26=0x13 vm ys2 19..15=0x05 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`      |
  | `yfclass.v`  | `31..26=0x13 vm ys2 19..15=0x10 14..12=0x1 yd 6..0=0x57` | `tensor,classify,floating-point` |

  : OPFYY VII

  | **Name**        | **Opcode / Argument**                            | **Class**                         |
  |:----------------|:-------------------------------------------------|:----------------------------------|
  | `yfwadd.vv`     | `31..26=0x30 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`       |
  | `yfwredusum.ys` | `31..26=0x31 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,reduction,floating-point` |
  | `yfwsub.vv`     | `31..26=0x32 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`       |
  | `yfwredosum.ys` | `31..26=0x33 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,reduction,floating-point` |
  | `yfwadd.wv`     | `31..26=0x34 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`       |
  | `yfwsub.wv`     | `31..26=0x36 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`       |
  | `yfwmul.vv`     | `31..26=0x38 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,alu,floating-point`       |
  | `yfwmacc.vv`    | `31..26=0x3c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point`  |
  | `yfwnmacc.vv`   | `31..26=0x3d vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point`  |
  | `yfwmsac.vv`    | `31..26=0x3e vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point`  |
  | `yfwnmsac.vv`   | `31..26=0x3f vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `tensor,multiply,floating-point`  |

  : OPFYY VIII

**Tensor Integer Instructions**

* **OPIYX**

  | **Name**        | **Opcode / Argument**                            | **Class**            |
  |:----------------|:-------------------------------------------------|:---------------------|
  | `yadd.vx`       | `31..26=0x00 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ysub.vx`       | `31..26=0x02 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yrsub.vx`      | `31..26=0x03 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yminu.vx`      | `31..26=0x04 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ymin.vx`       | `31..26=0x05 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ymaxu.vx`      | `31..26=0x06 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ymax.vx`       | `31..26=0x07 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yand.vx`       | `31..26=0x09 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yor.vx`        | `31..26=0x0a vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yxor.vx`       | `31..26=0x0b vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yrgather.vx`   | `31..26=0x0c vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,permute`     |
  | `yslideup.vx`   | `31..26=0x0e vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,permute`     |
  | `yslidedown.vx` | `31..26=0x0f vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,permute`     |

  : OPIYX I

  | **Name**     | **Opcode / Argument**                                   | **Class**                     |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `yadc.vxm`   | `31..26=0x10 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `tensor,alu,integer`          |
  | `ymadc.vxm`  | `31..26=0x11 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ymadc.vx`   | `31..26=0x11 25=1 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ysbc.vxm`   | `31..26=0x12 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `tensor,alu,integer`          |
  | `ymsbc.vxm`  | `31..26=0x13 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ymsbc.vx`   | `31..26=0x13 25=1 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ymerge.vxm` | `31..26=0x17 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `tensor,merge,integer`        |
  | `ymv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,move,integer`         |
  | `ymseq.vx`   | `31..26=0x18 vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsne.vx`   | `31..26=0x19 vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsltu.vx`  | `31..26=0x1a vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymslt.vx`   | `31..26=0x1b vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsleu.vx`  | `31..26=0x1c vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsle.vx`   | `31..26=0x1d vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsgtu.vx`  | `31..26=0x1e vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsgt.vx`   | `31..26=0x1f vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `tensor,compare,integer,mask` |

  : OPIYX II

  | **Name**     | **Opcode / Argument**                            | **Class**                |
  |:-------------|:-------------------------------------------------|:-------------------------|
  | `ysaddu.vx`  | `31..26=0x20 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ysadd.vx`   | `31..26=0x21 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yssubu.vx`  | `31..26=0x22 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yssub.vx`   | `31..26=0x23 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ysll.vx`    | `31..26=0x25 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `ysmul.vx`   | `31..26=0x27 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ysrl.vx`    | `31..26=0x28 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `ysra.vx`    | `31..26=0x29 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `yssrl.vx`   | `31..26=0x2a vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yssra.vx`   | `31..26=0x2b vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ynsrl.wx`   | `31..26=0x2c vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `ynsra.wx`   | `31..26=0x2d vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `ynclipu.wx` | `31..26=0x2e vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ynclip.wx`  | `31..26=0x2f vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `tensor,alu,fixed-point` |

  : OPIYX III

* **OPIYY**

  | **Name**          | **Opcode / Argument**                            | **Class**            |
  |:------------------|:-------------------------------------------------|:---------------------|
  | `yadd.vv`         | `31..26=0x00 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ysub.vv`         | `31..26=0x02 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yminu.vv`        | `31..26=0x04 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ymin.vv`         | `31..26=0x05 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ymaxu.vv`        | `31..26=0x06 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ymax.vv`         | `31..26=0x07 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yand.vv`         | `31..26=0x09 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yor.vv`          | `31..26=0x0a vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yxor.vv`         | `31..26=0x0b vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yrgather.vv`     | `31..26=0x0c vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,permute`     |
  | `yrgatherei16.vv` | `31..26=0x0e vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,permute`     |

  : OPIYY I

  | **Name**     | **Opcode / Argument**                                   | **Class**                     |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `yadc.vvm`   | `31..26=0x10 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `tensor,alu,integer`          |
  | `ymadc.vvm`  | `31..26=0x11 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ymadc.vv`   | `31..26=0x11 25=1 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ysbc.vvm`   | `31..26=0x12 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `tensor,alu,integer`          |
  | `ymsbc.vvm`  | `31..26=0x13 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ymsbc.vv`   | `31..26=0x13 25=1 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ymerge.vvm` | `31..26=0x17 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `tensor,merge,integer`        |
  | `ymv.v.v`    | `31..26=0x17 25=1 24..20=0 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,move,integer`         |
  | `ymseq.vv`   | `31..26=0x18 vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsne.vv`   | `31..26=0x19 vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsltu.vv`  | `31..26=0x1a vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymslt.vv`   | `31..26=0x1b vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsleu.vv`  | `31..26=0x1c vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsle.vv`   | `31..26=0x1d vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `tensor,compare,integer,mask` |

  : OPIYY II

  | **Name**     | **Opcode / Argument**                            | **Class**                |
  |:-------------|:-------------------------------------------------|:-------------------------|
  | `ysaddu.vv`  | `31..26=0x20 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ysadd.vv`   | `31..26=0x21 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yssubu.vv`  | `31..26=0x22 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yssub.vv`   | `31..26=0x23 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ysll.vv`    | `31..26=0x25 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `ysmul.vv`   | `31..26=0x27 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ysrl.vv`    | `31..26=0x28 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `ysra.vv`    | `31..26=0x29 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `yssrl.vv`   | `31..26=0x2a vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yssra.vv`   | `31..26=0x2b vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ynsrl.wv`   | `31..26=0x2c vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `ynsra.wv`   | `31..26=0x2d vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,integer`     |
  | `ynclipu.wv` | `31..26=0x2e vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `ynclip.wv`  | `31..26=0x2f vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,alu,fixed-point` |

  : OPIYY III

  | **Name**       | **Opcode / Argument**                            | **Class**                  |
  |:---------------|:-------------------------------------------------|:---------------------------|
  | `ywredsumu.ys` | `31..26=0x30 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `ywredsum.ys`  | `31..26=0x31 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `tensor,reduction,integer` |

  : OPIYY IV

* **OPIYI**

  | **Name**        | **Opcode / Argument**                              | **Class**            |
  |:----------------|:---------------------------------------------------|:---------------------|
  | `yadd.vi`       | `31..26=0x00 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yrsub.vi`      | `31..26=0x03 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yand.vi`       | `31..26=0x09 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yor.vi`        | `31..26=0x0a vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yxor.vi`       | `31..26=0x0b vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yrgather.vi`   | `31..26=0x0c vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,permute`     |
  | `yslideup.vi`   | `31..26=0x0e vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,permute`     |
  | `yslidedown.vi` | `31..26=0x0f vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,permute`     |

  : OPIYI I

  | **Name**     | **Opcode / Argument**                                     | **Class**                     |
  |:-------------|:----------------------------------------------------------|:------------------------------|
  | `yadc.vim`   | `31..26=0x10 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,integer`          |
  | `ymadc.vim`  | `31..26=0x11 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ymadc.vi`   | `31..26=0x11 25=1 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,integer,mask`     |
  | `ymerge.vim` | `31..26=0x17 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,merge,integer`        |
  | `ymv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 yd 6..0=0x57` | `tensor,move,integer`         |
  | `ymseq.vi`   | `31..26=0x18 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsne.vi`   | `31..26=0x19 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsleu.vi`  | `31..26=0x1c vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsle.vi`   | `31..26=0x1d vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsgtu.vi`  | `31..26=0x1e vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `tensor,compare,integer,mask` |
  | `ymsgt.vi`   | `31..26=0x1f vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `tensor,compare,integer,mask` |

  : OPIYI II

  | **Name**     | **Opcode / Argument**                                   | **Class**                    |
  |:-------------|:--------------------------------------------------------|:-----------------------------|
  | `ysaddu.vi`  | `31..26=0x20 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,fixed-point`     |
  | `ysadd.vi`   | `31..26=0x21 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,fixed-point`     |
  | `ysll.vi`    | `31..26=0x25 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,integer`         |
  | `ymv1r.v`    | `31..26=0x27 25=1 ys2 19..15=0 14..12=0x3 yd 6..0=0x57` | `tensor,move,whole-register` |
  | `ymv2r.v`    | `31..26=0x27 25=1 ys2 19..15=1 14..12=0x3 yd 6..0=0x57` | `tensor,move,whole-register` |
  | `ymv4r.v`    | `31..26=0x27 25=1 ys2 19..15=3 14..12=0x3 yd 6..0=0x57` | `tensor,move,whole-register` |
  | `ymv8r.v`    | `31..26=0x27 25=1 ys2 19..15=7 14..12=0x3 yd 6..0=0x57` | `tensor,move,whole-register` |
  | `ysrl.vi`    | `31..26=0x28 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,integer`         |
  | `ysra.vi`    | `31..26=0x29 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,integer`         |
  | `yssrl.vi`   | `31..26=0x2a vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,fixed-point`     |
  | `yssra.vi`   | `31..26=0x2b vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,fixed-point`     |
  | `ynsrl.wi`   | `31..26=0x2c vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,integer`         |
  | `ynsra.wi`   | `31..26=0x2d vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,integer`         |
  | `ynclipu.wi` | `31..26=0x2e vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,fixed-point`     |
  | `ynclip.wi`  | `31..26=0x2f vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `tensor,alu,fixed-point`     |

  : OPIYI III

* **OPI (Tensor Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Class**            |
  |:------------|:------------------------------------------------------|:---------------------|
  | `yzext.vf8` | `31..26=0x12 vm ys2 19..15=2 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ysext.vf8` | `31..26=0x12 vm ys2 19..15=3 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yzext.vf4` | `31..26=0x12 vm ys2 19..15=4 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ysext.vf4` | `31..26=0x12 vm ys2 19..15=5 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer` |
  | `yzext.vf2` | `31..26=0x12 vm ys2 19..15=6 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer` |
  | `ysext.vf2` | `31..26=0x12 vm ys2 19..15=7 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer` |

  : Tensor Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Class**                 |
  |:---------------|:---------------------------------------------------|:--------------------------|
  | `ycompress.vm` | `31..26=0x17 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,permute,compress` |
  | `ymandn.mm`    | `31..26=0x18 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,logical,mask`     |
  | `ymand.mm`     | `31..26=0x19 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,logical,mask`     |
  | `ymor.mm`      | `31..26=0x1a 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,logical,mask`     |
  | `ymxor.mm`     | `31..26=0x1b 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,logical,mask`     |
  | `ymorn.mm`     | `31..26=0x1c 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,logical,mask`     |
  | `ymnand.mm`    | `31..26=0x1d 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,logical,mask`     |
  | `ymnor.mm`     | `31..26=0x1e 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,logical,mask`     |
  | `ymxnor.mm`    | `31..26=0x1f 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,logical,mask`     |

  : Tensor Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Class**            |
  |:-----------|:--------------------------------------------------------------|:---------------------|
  | `ymsbf.m`  | `31..26=0x14 vm ys2 19..15=0x01 14..12=0x2 yd 6..0=0x57`      | `tensor,mask,prefix` |
  | `ymsof.m`  | `31..26=0x14 vm ys2 19..15=0x02 14..12=0x2 yd 6..0=0x57`      | `tensor,mask,prefix` |
  | `ymsif.m`  | `31..26=0x14 vm ys2 19..15=0x03 14..12=0x2 yd 6..0=0x57`      | `tensor,mask,prefix` |
  | `yiota.m`  | `31..26=0x14 vm ys2 19..15=0x10 14..12=0x2 yd 6..0=0x57`      | `tensor,mask,prefix` |
  | `yid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 yd 6..0=0x57` | `tensor,index`       |
  | `ycpop.m`  | `31..26=0x10 vm ys2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `tensor,mask,count`  |
  | `yfirst.m` | `31..26=0x10 vm ys2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `tensor,mask,search` |

  : Tensor Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Class**                 |
  |:-------------|:-------------------------------------------------|:--------------------------|
  | `ydivu.vv`   | `31..26=0x20 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,divide,integer`   |
  | `ydiv.vv`    | `31..26=0x21 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,divide,integer`   |
  | `yremu.vv`   | `31..26=0x22 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,divide,integer`   |
  | `yrem.vv`    | `31..26=0x23 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,divide,integer`   |
  | `ymulhu.vv`  | `31..26=0x24 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymul.vv`    | `31..26=0x25 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymulhsu.vv` | `31..26=0x26 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymulh.vv`   | `31..26=0x27 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymadd.vv`   | `31..26=0x29 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ynmsub.vv`  | `31..26=0x2b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymacc.vv`   | `31..26=0x2d vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ynmsac.vv`  | `31..26=0x2f vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |

  : Tensor Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Class**                 |
  |:--------------|:-------------------------------------------------|:--------------------------|
  | `ywaddu.vv`   | `31..26=0x30 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywadd.vv`    | `31..26=0x31 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywsubu.vv`   | `31..26=0x32 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywsub.vv`    | `31..26=0x33 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywaddu.wv`   | `31..26=0x34 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywadd.wv`    | `31..26=0x35 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywsubu.wv`   | `31..26=0x36 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywsub.wv`    | `31..26=0x37 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywmulu.vv`   | `31..26=0x38 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmulsu.vv`  | `31..26=0x3a vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmul.vv`    | `31..26=0x3b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmaccu.vv`  | `31..26=0x3c vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmacc.vv`   | `31..26=0x3d vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmaccsu.vv` | `31..26=0x3f vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,multiply,integer` |

  : Tensor Integer Extension Instructions V

**Tensor Mask Instructions**

* **OPMYY**

  | **Name**      | **Opcode / Argument**                            | **Class**                  |
  |:--------------|:-------------------------------------------------|:---------------------------|
  | `yredsum.ys`  | `31..26=0x00 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `yredand.ys`  | `31..26=0x01 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `yredor.ys`   | `31..26=0x02 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `yredxor.ys`  | `31..26=0x03 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `yredminu.ys` | `31..26=0x04 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `yredmin.ys`  | `31..26=0x05 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `yredmaxu.ys` | `31..26=0x06 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `yredmax.ys`  | `31..26=0x07 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,reduction,integer` |
  | `yaaddu.vv`   | `31..26=0x08 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,fixed-point`   |
  | `yaadd.vv`    | `31..26=0x09 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,fixed-point`   |
  | `yasubu.vv`   | `31..26=0x0a vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,fixed-point`   |
  | `yasub.vv`    | `31..26=0x0b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `tensor,alu,fixed-point`   |

  : OPMYY I

  | **Name**  | **Opcode / Argument**                                   | **Class**             |
  |:----------|:--------------------------------------------------------|:----------------------|
  | `ymv.x.s` | `31..26=0x10 25=1 ys2 19..15=0 14..12=0x2 rd 6..0=0x57` | `tensor,move,integer` |

  : OPMYY II

* **OPMYX**

  | **Name**    | **Opcode / Argument**                            | **Class**                |
  |:------------|:-------------------------------------------------|:-------------------------|
  | `yaaddu.vx` | `31..26=0x08 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yaadd.vx`  | `31..26=0x09 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yasubu.vx` | `31..26=0x0a vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,fixed-point` |
  | `yasub.vx`  | `31..26=0x0b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,fixed-point` |

  : OPMYX I

  | **Name**         | **Opcode / Argument**                                   | **Class**             |
  |:-----------------|:--------------------------------------------------------|:----------------------|
  | `ymv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,move,integer` |
  | `yslide1up.vx`   | `31..26=0x0e vm ys2 rs1 14..12=0x6 yd 6..0=0x57`        | `tensor,permute`      |
  | `yslide1down.vx` | `31..26=0x0f vm ys2 rs1 14..12=0x6 yd 6..0=0x57`        | `tensor,permute`      |

  : OPMYX II

  | **Name**     | **Opcode / Argument**                            | **Class**                 |
  |:-------------|:-------------------------------------------------|:--------------------------|
  | `ydivu.vx`   | `31..26=0x20 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,divide,integer`   |
  | `ydiv.vx`    | `31..26=0x21 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,divide,integer`   |
  | `yremu.vx`   | `31..26=0x22 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,divide,integer`   |
  | `yrem.vx`    | `31..26=0x23 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,divide,integer`   |
  | `ymulhu.vx`  | `31..26=0x24 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymul.vx`    | `31..26=0x25 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymulhsu.vx` | `31..26=0x26 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymulh.vx`   | `31..26=0x27 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymadd.vx`   | `31..26=0x29 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ynmsub.vx`  | `31..26=0x2b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ymacc.vx`   | `31..26=0x2d vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ynmsac.vx`  | `31..26=0x2f vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |

  : OPMYX III

  | **Name**      | **Opcode / Argument**                            | **Class**                 |
  |:--------------|:-------------------------------------------------|:--------------------------|
  | `ywaddu.vx`   | `31..26=0x30 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywadd.vx`    | `31..26=0x31 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywsubu.vx`   | `31..26=0x32 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywsub.vx`    | `31..26=0x33 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywaddu.wx`   | `31..26=0x34 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywadd.wx`    | `31..26=0x35 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywsubu.wx`   | `31..26=0x36 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywsub.wx`    | `31..26=0x37 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,alu,integer`      |
  | `ywmulu.vx`   | `31..26=0x38 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmulsu.vx`  | `31..26=0x3a vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmul.vx`    | `31..26=0x3b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmaccu.vx`  | `31..26=0x3c vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmacc.vx`   | `31..26=0x3d vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmaccus.vx` | `31..26=0x3e vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |
  | `ywmaccsu.vx` | `31..26=0x3f vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `tensor,multiply,integer` |

  : OPMYX IV
