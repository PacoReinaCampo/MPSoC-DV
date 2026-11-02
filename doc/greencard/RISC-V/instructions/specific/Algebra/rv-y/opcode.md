## OPCODE ENCODING INFORMATION

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

  | **Name**   | **Opcode / Argument**                              | **Format**                  |
  |:-----------|:---------------------------------------------------|:----------------------------|
  | `ysetiyli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `ysetyli rd, rs1, ytypei`   |
  | `ysetyli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `ysetiyli rd, uimm, ytypei` |
  | `ysetyl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `ysetyl  rd, rs1, rs2`      |

  : Configuration Setting

**OPLS (Tensor Loads and Store)**

* **Tensor Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Format**               |
  |:----------|:-----------------------------------------------------------------|:-------------------------|
  | `ylm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  yd 6..0=0x07` | `ylm.v   yd, (rs1)`      |
  | `ysm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 ys3 6..0=0x27` | `ysm.v   ys3, (rs1)`     |
  | `yle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  yd 6..0=0x07`      | `yle8.v  yd, (rs1), vm`  |
  | `yle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  yd 6..0=0x07`      | `yle16.v yd, (rs1), vm`  |
  | `yle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  yd 6..0=0x07`      | `yle32.v yd, (rs1), vm`  |
  | `yle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  yd 6..0=0x07`      | `yle64.v yd, (rs1), vm`  |
  | `yse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 ys3 6..0=0x27`      | `yse8.v  ys3, (rs1), vm` |
  | `yse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 ys3 6..0=0x27`      | `yse16.v ys3, (rs1), vm` |
  | `yse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 ys3 6..0=0x27`      | `yse32.v ys3, (rs1), vm` |
  | `yse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 ys3 6..0=0x27`      | `yse64.v ys3, (rs1), vm` |

  : Tensor Unit-Stride Instructions (including segment part)

* **Tensor Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Format**                        |
  |:-------------|:-------------------------------------------------------|:----------------------------------|
  | `yluxei8.v`  | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x0  yd 6..0=0x07` | `yluxei8.v    yd, (rs1), ys2, vm` |
  | `yluxei16.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x5  yd 6..0=0x07` | `yluxei16.v   yd, (rs1), ys2, vm` |
  | `yluxei32.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x6  yd 6..0=0x07` | `yluxei32.v   yd, (rs1), ys2, vm` |
  | `yluxei64.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x7  yd 6..0=0x07` | `yluxei64.v   yd, (rs1), ys2, vm` |
  | `ysuxei8.v`  | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x0 ys3 6..0=0x27` | `ysuxei8.v   ys3, (rs1), ys2, vm` |
  | `ysuxei16.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x5 ys3 6..0=0x27` | `ysuxei16.v  ys3, (rs1), ys2, vm` |
  | `ysuxei32.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x6 ys3 6..0=0x27` | `ysuxei32.v  ys3, (rs1), ys2, vm` |
  | `ysuxei64.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x7 ys3 6..0=0x27` | `ysuxei64.v  ys3, (rs1), ys2, vm` |

  : Tensor Indexed-Unordered Instructions (including segment part)

* **Tensor Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Format**                       |
  |:-----------|:-------------------------------------------------------|:---------------------------------|
  | `ylse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  yd 6..0=0x07` | `ylse8.v    yd,  (rs1), rs2, vm` |
  | `ylse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  yd 6..0=0x07` | `ylse16.v   yd,  (rs1), rs2, vm` |
  | `ylse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  yd 6..0=0x07` | `ylse32.v   yd,  (rs1), rs2, vm` |
  | `ylse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  yd 6..0=0x07` | `ylse64.v   yd,  (rs1), rs2, vm` |
  | `ysse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 ys3 6..0=0x27` | `ysse8.v    ys3, (rs1), rs2, vm` |
  | `ysse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 ys3 6..0=0x27` | `ysse16.v   ys3, (rs1), rs2, vm` |
  | `ysse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 ys3 6..0=0x27` | `ysse32.v   ys3, (rs1), rs2, vm` |
  | `ysse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 ys3 6..0=0x27` | `ysse64.v   ys3, (rs1), rs2, vm` |

  : Tensor Strided Instructions (including segment part)

* **Tensor Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Format**                         |
  |:-------------|:-------------------------------------------------------|:-----------------------------------|
  | `yloxei8.v`  | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x0  yd 6..0=0x07` | `yloxei8.v    yd, (rs1), ys2, vm`  |
  | `yloxei16.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x5  yd 6..0=0x07` | `yloxei16.v   yd, (rs1), ys2, vm`  |
  | `yloxei32.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x6  yd 6..0=0x07` | `yloxei32.v   yd, (rs1), ys2, vm`  |
  | `yloxei64.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x7  yd 6..0=0x07` | `yloxei64.v   yd, (rs1), ys2, vm`  |
  | `ysoxei8.v`  | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x0 ys3 6..0=0x27` | `ysoxei8.v    ys3, (rs1), ys2, vm` |
  | `ysoxei16.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x5 ys3 6..0=0x27` | `ysoxei16.v   ys3, (rs1), ys2, vm` |
  | `ysoxei32.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x6 ys3 6..0=0x27` | `ysoxei32.v   ys3, (rs1), ys2, vm` |
  | `ysoxei64.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x7 ys3 6..0=0x27` | `ysoxei64.v   ys3, (rs1), ys2, vm` |

  : Tensor Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Format**                  |
  |:------------|:---------------------------------------------------------------|:----------------------------|
  | `yle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  yd 6..0=0x07` | `yle8ff.v    yd, (rs1), vm` |
  | `yle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  yd 6..0=0x07` | `yle16ff.v   yd, (rs1), vm` |
  | `yle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  yd 6..0=0x07` | `yle32ff.v   yd, (rs1), vm` |
  | `yle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  yd 6..0=0x07` | `yle64ff.v   yd, (rs1), vm` |

  : Unit-stride Fault-Only-First Loads

* **Tensor Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Format**             |
  |:------------|:-----------------------------------------------------------------------|:-----------------------|
  | `yl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `yl1re8.v    v3, (a0)` |
  | `yl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `yl1re16.v   v3, (a0)` |
  | `yl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `yl1re32.v   v3, (a0)` |
  | `yl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `yl1re64.v   v3, (a0)` |
  | `yl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `yl2re8.v    v2, (a0)` |
  | `yl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `yl2re16.v   v2, (a0)` |
  | `yl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `yl2re32.v   v2, (a0)` |
  | `yl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `yl2re64.v   v2, (a0)` |
  | `yl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `yl4re8.v    v4, (a0)` |
  | `yl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `yl4re16.v   v4, (a0)` |
  | `yl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `yl4re32.v   v4, (a0)` |
  | `yl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `yl4re64.v   v4, (a0)` |
  | `yl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `yl8re8.v    v8, (a0)` |
  | `yl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `yl8re16.v   v8, (a0)` |
  | `yl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `yl8re32.v   v8, (a0)` |
  | `yl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `yl8re64.v   v8, (a0)` |
  | `ys1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `ys1r.v v3, (a1)`      |
  | `ys2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `ys2r.v v2, (a1)`      |
  | `ys4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `ys4r.v v4, (a1)`      |
  | `ys8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `ys8r.v v8, (a1)`      |

  : Tensor Load/Store Whole Registers

**Tensor Float-Point Instructions**

* **OPFYF**

  | **Name**          | **Opcode / Argument**                                   | **Format**                         |
  |:------------------|:--------------------------------------------------------|:-----------------------------------|
  | `yfadd.vf`        | `31..26=0x00 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfadd.vf yd, ys2, rs1, vm`        |
  | `yfsub.vf`        | `31..26=0x02 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfsub.vf yd, ys2, rs1, vm`        |
  | `yfmin.vf`        | `31..26=0x04 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfmin.vf yd, ys2, rs1, vm`        |
  | `yfmax.vf`        | `31..26=0x06 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfmax.vf yd, ys2, rs1, vm`        |
  | `yfsgnj.vf`       | `31..26=0x08 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfsgnj.vf yd, ys2, rs1, vm`       |
  | `yfsgnjn.vf`      | `31..26=0x09 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfsgnjn.vf yd, ys2, rs1, vm`      |
  | `yfsgnjx.vf`      | `31..26=0x0a vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfsgnjx.vf yd, ys2, rs1, vm`      |
  | `yfslide1up.vf`   | `31..26=0x0e vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfslide1up.vf yd, ys2, rs1, vm`   |
  | `yfslide1down.vf` | `31..26=0x0f vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `yfslide1down.vf yd, ys2, rs1, vm` |
  | `yfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 yd 6..0=0x57` | `yfmv.s.f yd, rs1`                 |

  : OPFYF I

  | **Name**      | **Opcode / Argument**                                   | **Format**                     |
  |:--------------|:--------------------------------------------------------|:-------------------------------|
  | `yfmerge.vfm` | `31..26=0x17 25=0 ys2 rs1 14..12=0x5 yd 6..0=0x57`      | `yfmerge.vfm yd, ys2, rs1, v0` |
  | `yfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 yd 6..0=0x57` | `yfmv.v.f yd, rs1`             |
  | `ymfeq.vf`    | `31..26=0x18 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `ymfeq.vf yd, ys2, rs1, vm`    |
  | `ymfle.vf`    | `31..26=0x19 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `ymfle.vf yd, ys2, rs1, vm`    |
  | `ymflt.vf`    | `31..26=0x1b vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `ymflt.vf yd, ys2, rs1, vm`    |
  | `ymfne.vf`    | `31..26=0x1c vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `ymfne.vf yd, ys2, rs1, vm`    |
  | `ymfgt.vf`    | `31..26=0x1d vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `ymfgt.vf yd, ys2, rs1, vm`    |
  | `ymfge.vf`    | `31..26=0x1f vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `ymfge.vf yd, ys2, rs1, vm`    |

  : OPFYF II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `yfdiv.vf`   | `31..26=0x20 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfdiv.vf yd, ys2, rs1, vm`   |
  | `yfrdiv.vf`  | `31..26=0x21 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfrdiv.vf yd, ys2, rs1, vm`  |
  | `yfmul.vf`   | `31..26=0x24 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfmul.vf yd, ys2, rs1, vm`   |
  | `yfrsub.vf`  | `31..26=0x27 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfrsub.vf yd, ys2, rs1, vm`  |
  | `yfmadd.vf`  | `31..26=0x28 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfmadd.vf yd, rs1, ys2, vm`  |
  | `yfnmadd.vf` | `31..26=0x29 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfnmadd.vf yd, rs1, ys2, vm` |
  | `yfmsub.vf`  | `31..26=0x2a vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfmsub.vf yd, rs1, ys2, vm`  |
  | `yfnmsub.vf` | `31..26=0x2b vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfnmsub.vf yd, rs1, ys2, vm` |
  | `yfmacc.vf`  | `31..26=0x2c vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfmacc.vf yd, rs1, ys2, vm`  |
  | `yfnmacc.vf` | `31..26=0x2d vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfnmacc.vf yd, rs1, ys2, vm` |
  | `yfmsac.vf`  | `31..26=0x2e vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfmsac.vf yd, rs1, ys2, vm`  |
  | `yfnmsac.vf` | `31..26=0x2f vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfnmsac.vf yd, rs1, ys2, vm` |

  : OPFYF III

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `yfwadd.vf`   | `31..26=0x30 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwadd.vf yd, ys2, rs1, vm`   |
  | `yfwsub.vf`   | `31..26=0x32 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwsub.vf yd, ys2, rs1, vm`   |
  | `yfwadd.wf`   | `31..26=0x34 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwadd.wf yd, ys2, rs1, vm`   |
  | `yfwsub.wf`   | `31..26=0x36 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwsub.wf yd, ys2, rs1, vm`   |
  | `yfwmul.vf`   | `31..26=0x38 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwmul.vf yd, ys2, rs1, vm`   |
  | `yfwmacc.vf`  | `31..26=0x3c vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwmacc.vf yd, rs1, ys2, vm`  |
  | `yfwnmacc.vf` | `31..26=0x3d vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwnmacc.vf yd, rs1, ys2, vm` |
  | `yfwmsac.vf`  | `31..26=0x3e vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwmsac.vf yd, rs1, ys2, vm`  |
  | `yfwnmsac.vf` | `31..26=0x3f vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `yfwnmsac.vf yd, rs1, ys2, vm` |

  : OPFYF IV

* **OPFYY**

  | **Name**       | **Opcode / Argument**                                   | **Format**                      |
  |:---------------|:--------------------------------------------------------|:--------------------------------|
  | `yfadd.vv`     | `31..26=0x00 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfadd.vv yd, ys2, ys1, vm`     |
  | `yfredusum.ys` | `31..26=0x01 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfredusum.ys yd, ys2, ys1, vm` |
  | `yfsub.vv`     | `31..26=0x02 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfsub.vv yd, ys2, ys1, vm`     |
  | `yfredosum.ys` | `31..26=0x03 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfredosum.ys yd, ys2, ys1, vm` |
  | `yfmin.vv`     | `31..26=0x04 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfmin.vv yd, ys2, ys1, vm`     |
  | `yfredmin.ys`  | `31..26=0x05 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfredmin.ys  yd, ys2, ys1, vm` |
  | `yfmax.vv`     | `31..26=0x06 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfmax.vv yd, ys2, ys1, vm`     |
  | `yfredmax.ys`  | `31..26=0x07 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfredmax.ys  yd, ys2, ys1, vm` |
  | `yfsgnj.vv`    | `31..26=0x08 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfsgnj.vv yd, ys2, ys1, vm`    |
  | `yfsgnjn.vv`   | `31..26=0x09 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfsgnjn.vv yd, ys2, ys1, vm`   |
  | `yfsgnjx.vv`   | `31..26=0x0a vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `yfsgnjx.vv yd, ys2, ys1, vm`   |
  | `yfmv.f.s`     | `31..26=0x10 25=1 ys2 19..15=0 14..12=0x1 rd 6..0=0x57` | `yfmv.f.s rd, ys2`              |

  : OPFYY I

  | **Name**   | **Opcode / Argument**                            | **Format**                  |
  |:-----------|:-------------------------------------------------|:----------------------------|
  | `ymfeq.vv` | `31..26=0x18 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `ymfeq.vv yd, ys2, ys1, vm` |
  | `ymfle.vv` | `31..26=0x19 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `ymfle.vv yd, ys2, ys1, vm` |
  | `ymflt.vv` | `31..26=0x1b vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `ymflt.vv yd, ys2, ys1, vm` |
  | `ymfne.vv` | `31..26=0x1c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `ymfne.vv yd, ys2, ys1, vm` |

  : OPFYY II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `yfdiv.vv`   | `31..26=0x20 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfdiv.vv yd, ys2, ys1, vm`   |
  | `yfmul.vv`   | `31..26=0x24 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfmul.vv yd, ys2, ys1, vm`   |
  | `yfmadd.vv`  | `31..26=0x28 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfmadd.vv yd, ys1, ys2, vm`  |
  | `yfnmadd.vv` | `31..26=0x29 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfnmadd.vv yd, ys1, ys2, vm` |
  | `yfmsub.vv`  | `31..26=0x2a vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfmsub.vv yd, ys1, ys2, vm`  |
  | `yfnmsub.vv` | `31..26=0x2b vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfnmsub.vv yd, ys1, ys2, vm` |
  | `yfmacc.vv`  | `31..26=0x2c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfmacc.vv yd, ys1, ys2, vm`  |
  | `yfnmacc.vv` | `31..26=0x2d vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfnmacc.vv yd, ys1, ys2, vm` |
  | `yfmsac.vv`  | `31..26=0x2e vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfmsac.vv yd, ys1, ys2, vm`  |
  | `yfnmsac.vv` | `31..26=0x2f vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfnmsac.vv yd, ys1, ys2, vm` |

  : OPFYY III

  | **Name**           | **Opcode / Argument**                                    | **Format**                     |
  |:-------------------|:---------------------------------------------------------|:-------------------------------|
  | `yfcvt.xu.f.v`     | `31..26=0x12 vm ys2 19..15=0x00 14..12=0x1 yd 6..0=0x57` | `yfcvt.xu.f.v yd, ys2, vm`     |
  | `yfcvt.x.f.v`      | `31..26=0x12 vm ys2 19..15=0x01 14..12=0x1 yd 6..0=0x57` | `yfcvt.x.f.v  yd, ys2, vm`     |
  | `yfcvt.f.xu.v`     | `31..26=0x12 vm ys2 19..15=0x02 14..12=0x1 yd 6..0=0x57` | `yfcvt.f.xu.v yd, ys2, vm`     |
  | `yfcvt.f.x.v`      | `31..26=0x12 vm ys2 19..15=0x03 14..12=0x1 yd 6..0=0x57` | `yfcvt.f.x.v  yd, ys2, vm`     |
  | `yfcvt.rtz.xu.f.v` | `31..26=0x12 vm ys2 19..15=0x06 14..12=0x1 yd 6..0=0x57` | `yfcvt.rtz.xu.f.v yd, ys2, vm` |
  | `yfcvt.rtz.x.f.v`  | `31..26=0x12 vm ys2 19..15=0x07 14..12=0x1 yd 6..0=0x57` | `yfcvt.rtz.x.f.v  yd, ys2, vm` |

  : OPFYY IV

  | **Name**            | **Opcode / Argument**                                    | **Format**                      |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `yfwcvt.xu.f.v`     | `31..26=0x12 vm ys2 19..15=0x08 14..12=0x1 yd 6..0=0x57` | `yfwcvt.xu.f.v yd, ys2, vm`     |
  | `yfwcvt.x.f.v`      | `31..26=0x12 vm ys2 19..15=0x09 14..12=0x1 yd 6..0=0x57` | `yfwcvt.x.f.v  yd, ys2, vm`     |
  | `yfwcvt.f.xu.v`     | `31..26=0x12 vm ys2 19..15=0x0A 14..12=0x1 yd 6..0=0x57` | `yfwcvt.f.xu.v yd, ys2, vm`     |
  | `yfwcvt.f.x.v`      | `31..26=0x12 vm ys2 19..15=0x0B 14..12=0x1 yd 6..0=0x57` | `yfwcvt.f.x.v  yd, ys2, vm`     |
  | `yfwcvt.f.f.v`      | `31..26=0x12 vm ys2 19..15=0x0C 14..12=0x1 yd 6..0=0x57` | `yfwcvt.f.f.v yd, ys2, vm`      |
  | `yfwcvt.rtz.xu.f.v` | `31..26=0x12 vm ys2 19..15=0x0E 14..12=0x1 yd 6..0=0x57` | `yfwcvt.rtz.xu.f.v yd, ys2, vm` |
  | `yfwcvt.rtz.x.f.v`  | `31..26=0x12 vm ys2 19..15=0x0F 14..12=0x1 yd 6..0=0x57` | `yfwcvt.rtz.x.f.v  yd, ys2, vm` |

  : OPFYY V

  | **Name**            | **Opcode / Argument**                                    | **Format**                      |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `yfncvt.xu.f.w`     | `31..26=0x12 vm ys2 19..15=0x10 14..12=0x1 yd 6..0=0x57` | `yfncvt.xu.f.w yd, ys2, vm`     |
  | `yfncvt.x.f.w`      | `31..26=0x12 vm ys2 19..15=0x11 14..12=0x1 yd 6..0=0x57` | `yfncvt.x.f.w  yd, ys2, vm`     |
  | `yfncvt.f.xu.w`     | `31..26=0x12 vm ys2 19..15=0x12 14..12=0x1 yd 6..0=0x57` | `yfncvt.f.xu.w yd, ys2, vm`     |
  | `yfncvt.f.x.w`      | `31..26=0x12 vm ys2 19..15=0x13 14..12=0x1 yd 6..0=0x57` | `yfncvt.f.x.w  yd, ys2, vm`     |
  | `yfncvt.f.f.w`      | `31..26=0x12 vm ys2 19..15=0x14 14..12=0x1 yd 6..0=0x57` | `yfncvt.f.f.w yd, ys2, vm`      |
  | `yfncvt.rod.f.f.w`  | `31..26=0x12 vm ys2 19..15=0x15 14..12=0x1 yd 6..0=0x57` | `yfncvt.rod.f.f.w yd, ys2, vm`  |
  | `yfncvt.rtz.xu.f.w` | `31..26=0x12 vm ys2 19..15=0x16 14..12=0x1 yd 6..0=0x57` | `yfncvt.rtz.xu.f.w yd, ys2, vm` |
  | `yfncvt.rtz.x.f.w`  | `31..26=0x12 vm ys2 19..15=0x17 14..12=0x1 yd 6..0=0x57` | `yfncvt.rtz.x.f.w  yd, ys2, vm` |

  : OPFYY VI

  | **Name**     | **Opcode / Argument**                                    | **Format**               |
  |:-------------|:---------------------------------------------------------|:-------------------------|
  | `yfsqrt.v`   | `31..26=0x13 vm ys2 19..15=0x00 14..12=0x1 yd 6..0=0x57` | `yfsqrt.v   yd, ys2, vm` |
  | `yfrsqrt7.v` | `31..26=0x13 vm ys2 19..15=0x04 14..12=0x1 yd 6..0=0x57` | `yfrsqrt7.v yd, ys2, vm` |
  | `yfrec7.v`   | `31..26=0x13 vm ys2 19..15=0x05 14..12=0x1 yd 6..0=0x57` | `yfrec7.v   yd, ys2, vm` |
  | `yfclass.v`  | `31..26=0x13 vm ys2 19..15=0x10 14..12=0x1 yd 6..0=0x57` | `yfclass.v  yd, ys2, vm` |

  : OPFYY VII

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `yfwadd.vv`     | `31..26=0x30 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwadd.vv yd, ys2, ys1, vm`     |
  | `yfwredusum.ys` | `31..26=0x31 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwredusum.ys yd, ys2, ys1, vm` |
  | `yfwsub.vv`     | `31..26=0x32 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwsub.vv yd, ys2, ys1, vm`     |
  | `yfwredosum.ys` | `31..26=0x33 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwredosum.ys yd, ys2, ys1, vm` |
  | `yfwadd.wv`     | `31..26=0x34 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwadd.wv  yd, ys2, ys1, vm`    |
  | `yfwsub.wv`     | `31..26=0x36 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwsub.wv  yd, ys2, ys1, vm`    |
  | `yfwmul.vv`     | `31..26=0x38 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwmul.vv    yd, ys2, ys1, vm`  |
  | `yfwmacc.vv`    | `31..26=0x3c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwmacc.vv yd, ys1, ys2, vm`    |
  | `yfwnmacc.vv`   | `31..26=0x3d vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwnmacc.vv yd, ys1, ys2, vm`   |
  | `yfwmsac.vv`    | `31..26=0x3e vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwmsac.vv yd, ys1, ys2, vm`    |
  | `yfwnmsac.vv`   | `31..26=0x3f vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `yfwnmsac.vv yd, ys1, ys2, vm`   |

  : OPFYY VIII

**Tensor Integer Instructions**

* **OPIYX**

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `yadd.vx`       | `31..26=0x00 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yadd.vx yd, ys2, rs1, vm`       |
  | `ysub.vx`       | `31..26=0x02 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ysub.vx yd, ys2, rs1, vm`       |
  | `yrsub.vx`      | `31..26=0x03 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yrsub.vx yd, ys2, rs1, vm`      |
  | `yminu.vx`      | `31..26=0x04 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yminu.vx yd, ys2, rs1, vm`      |
  | `ymin.vx`       | `31..26=0x05 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ymin.vx yd, ys2, rs1, vm`       |
  | `ymaxu.vx`      | `31..26=0x06 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ymaxu.vx yd, ys2, rs1, vm`      |
  | `ymax.vx`       | `31..26=0x07 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ymax.vx yd, ys2, rs1, vm`       |
  | `yand.vx`       | `31..26=0x09 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yand.vx yd, ys2, rs1, vm`       |
  | `yor.vx`        | `31..26=0x0a vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yor.vx yd, ys2, rs1, vm`        |
  | `yxor.vx`       | `31..26=0x0b vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yxor.vx yd, ys2, rs1, vm`       |
  | `yrgather.vx`   | `31..26=0x0c vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yrgather.vx yd, ys2, rs1, vm`   |
  | `yslideup.vx`   | `31..26=0x0e vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yslideup.vx yd, ys2, rs1, vm`   |
  | `yslidedown.vx` | `31..26=0x0f vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yslidedown.vx yd, ys2, rs1, vm` |

  : OPIYX I

  | **Name**     | **Opcode / Argument**                                   | **Format**                    |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `yadc.vxm`   | `31..26=0x10 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `yadc.vxm yd, ys2, rs1, v0`   |
  | `ymadc.vxm`  | `31..26=0x11 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `ymadc.vxm yd, ys2, rs1, v0`  |
  | `ymadc.vx`   | `31..26=0x11 25=1 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `ymadc.vx yd, ys2, rs1`       |
  | `ysbc.vxm`   | `31..26=0x12 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `ysbc.vxm yd, ys2, rs1, v0`   |
  | `ymsbc.vxm`  | `31..26=0x13 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `ymsbc.vxm yd, ys2, rs1, v0`  |
  | `ymsbc.vx`   | `31..26=0x13 25=1 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `ymsbc.vx yd, ys2, rs1`       |
  | `ymerge.vxm` | `31..26=0x17 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `ymerge.vxm yd, ys2, rs1, v0` |
  | `ymv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 yd 6..0=0x57` | `ymv.v.x yd, rs1`             |
  | `ymseq.vx`   | `31..26=0x18 vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `ymseq.vx yd, ys2, rs1, vm`   |
  | `ymsne.vx`   | `31..26=0x19 vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `ymsne.vx yd, ys2, rs1, vm`   |
  | `ymsltu.vx`  | `31..26=0x1a vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `ymsltu.vx yd, ys2, rs1, vm`  |
  | `ymslt.vx`   | `31..26=0x1b vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `ymslt.vx yd, ys2, rs1, vm`   |
  | `ymsleu.vx`  | `31..26=0x1c vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `ymsleu.vx yd, ys2, rs1, vm`  |
  | `ymsle.vx`   | `31..26=0x1d vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `ymsle.vx yd, ys2, rs1, vm`   |
  | `ymsgtu.vx`  | `31..26=0x1e vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `ymsgtu.vx yd, ys2, rs1, vm`  |
  | `ymsgt.vx`   | `31..26=0x1f vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `ymsgt.vx yd, ys2, rs1, vm`   |

  : OPIYX II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `ysaddu.vx`  | `31..26=0x20 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ysaddu.vx yd, ys2, rs1, vm`  |
  | `ysadd.vx`   | `31..26=0x21 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ysadd.vx yd, ys2, rs1, vm`   |
  | `yssubu.vx`  | `31..26=0x22 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yssubu.vx yd, ys2, rs1, vm`  |
  | `yssub.vx`   | `31..26=0x23 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yssub.vx yd, ys2, rs1, vm`   |
  | `ysll.vx`    | `31..26=0x25 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ysll.vx yd, ys2, rs1, vm`    |
  | `ysmul.vx`   | `31..26=0x27 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ysmul.vx yd, ys2, rs1, vm`   |
  | `ysrl.vx`    | `31..26=0x28 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ysrl.vx yd, ys2, rs1, vm`    |
  | `ysra.vx`    | `31..26=0x29 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ysra.vx yd, ys2, rs1, vm`    |
  | `yssrl.vx`   | `31..26=0x2a vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yssrl.vx yd, ys2, rs1, vm`   |
  | `yssra.vx`   | `31..26=0x2b vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `yssra.vx yd, ys2, rs1, vm`   |
  | `ynsrl.wx`   | `31..26=0x2c vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ynsrl.wx yd, ys2, rs1, vm`   |
  | `ynsra.wx`   | `31..26=0x2d vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ynsra.wx yd, ys2, rs1, vm`   |
  | `ynclipu.wx` | `31..26=0x2e vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ynclipu.wx yd, ys2, rs1, vm` |
  | `ynclip.wx`  | `31..26=0x2f vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `ynclip.wx yd, ys2, rs1, vm`  |

  : OPIYX III

* **OPIYY**

  | **Name**          | **Opcode / Argument**                            | **Format**                         |
  |:------------------|:-------------------------------------------------|:-----------------------------------|
  | `yadd.vv`         | `31..26=0x00 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yadd.vv yd, ys2, ys1, vm`         |
  | `ysub.vv`         | `31..26=0x02 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ysub.vv yd, ys2, ys1, vm`         |
  | `yminu.vv`        | `31..26=0x04 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yminu.vv yd, ys2, ys1, vm`        |
  | `ymin.vv`         | `31..26=0x05 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ymin.vv yd, ys2, ys1, vm`         |
  | `ymaxu.vv`        | `31..26=0x06 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ymaxu.vv yd, ys2, ys1, vm`        |
  | `ymax.vv`         | `31..26=0x07 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ymax.vv yd, ys2, ys1, vm`         |
  | `yand.vv`         | `31..26=0x09 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yand.vv yd, ys2, ys1, vm`         |
  | `yor.vv`          | `31..26=0x0a vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yor.vv yd, ys2, ys1, vm`          |
  | `yxor.vv`         | `31..26=0x0b vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yxor.vv yd, ys2, ys1, vm`         |
  | `yrgather.vv`     | `31..26=0x0c vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yrgather.vv yd, ys2, ys1, vm`     |
  | `yrgatherei16.vv` | `31..26=0x0e vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yrgatherei16.vv yd, ys2, ys1, vm` |

  : OPIYY I

  | **Name**     | **Opcode / Argument**                                   | **Format**                    |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `yadc.vvm`   | `31..26=0x10 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `yadc.vvm yd, ys2, ys1, v0`   |
  | `ymadc.vvm`  | `31..26=0x11 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `ymadc.vvm yd, ys2, ys1, v0`  |
  | `ymadc.vv`   | `31..26=0x11 25=1 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `ymadc.vv yd, ys2, ys1`       |
  | `ysbc.vvm`   | `31..26=0x12 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `ysbc.vvm yd, ys2, ys1, v0`   |
  | `ymsbc.vvm`  | `31..26=0x13 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `ymsbc.vvm yd, ys2, ys1, v0`  |
  | `ymsbc.vv`   | `31..26=0x13 25=1 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `ymsbc.vv yd, ys2, ys1`       |
  | `ymerge.vvm` | `31..26=0x17 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `ymerge.vvm yd, ys2, ys1, v0` |
  | `ymv.v.v`    | `31..26=0x17 25=1 24..20=0 ys1 14..12=0x0 yd 6..0=0x57` | `ymv.v.v yd, ys1`             |
  | `ymseq.vv`   | `31..26=0x18 vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `ymseq.vv yd, ys2, ys1, vm`   |
  | `ymsne.vv`   | `31..26=0x19 vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `ymsne.vv yd, ys2, ys1, vm`   |
  | `ymsltu.vv`  | `31..26=0x1a vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `ymsltu.vv yd, ys2, ys1, vm`  |
  | `ymslt.vv`   | `31..26=0x1b vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `ymslt.vv yd, ys2, ys1, vm`   |
  | `ymsleu.vv`  | `31..26=0x1c vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `ymsleu.vv yd, ys2, ys1, vm`  |
  | `ymsle.vv`   | `31..26=0x1d vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `ymsle.vv yd, ys2, ys1, vm`   |

  : OPIYY II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `ysaddu.vv`  | `31..26=0x20 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ysaddu.vv yd, ys2, ys1, vm`  |
  | `ysadd.vv`   | `31..26=0x21 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ysadd.vv yd, ys2, ys1, vm`   |
  | `yssubu.vv`  | `31..26=0x22 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yssubu.vv yd, ys2, ys1, vm`  |
  | `yssub.vv`   | `31..26=0x23 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yssub.vv yd, ys2, ys1, vm`   |
  | `ysll.vv`    | `31..26=0x25 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ysll.vv yd, ys2, ys1, vm`    |
  | `ysmul.vv`   | `31..26=0x27 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ysmul.vv yd, ys2, ys1, vm`   |
  | `ysrl.vv`    | `31..26=0x28 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ysrl.vv yd, ys2, ys1, vm`    |
  | `ysra.vv`    | `31..26=0x29 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ysra.vv yd, ys2, ys1, vm`    |
  | `yssrl.vv`   | `31..26=0x2a vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yssrl.vv yd, ys2, ys1, vm`   |
  | `yssra.vv`   | `31..26=0x2b vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `yssra.vv yd, ys2, ys1, vm`   |
  | `ynsrl.wv`   | `31..26=0x2c vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ynsrl.wv yd, ys2, ys1, vm`   |
  | `ynsra.wv`   | `31..26=0x2d vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ynsra.wv yd, ys2, ys1, vm`   |
  | `ynclipu.wv` | `31..26=0x2e vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ynclipu.wv yd, ys2, ys1, vm` |
  | `ynclip.wv`  | `31..26=0x2f vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ynclip.wv yd, ys2, ys1, vm`  |

  : OPIYY III

  | **Name**       | **Opcode / Argument**                            | **Format**                      |
  |:---------------|:-------------------------------------------------|:--------------------------------|
  | `ywredsumu.ys` | `31..26=0x30 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ywredsumu.ys yd, ys2, ys1, vm` |
  | `ywredsum.ys`  | `31..26=0x31 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `ywredsum.ys  yd, ys2, ys1, vm` |

  : OPIYY IV

* **OPIYI**

  | **Name**        | **Opcode / Argument**                              | **Format**                        |
  |:----------------|:---------------------------------------------------|:----------------------------------|
  | `yadd.vi`       | `31..26=0x00 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `yadd.vi yd, ys2, imm, vm`        |
  | `yrsub.vi`      | `31..26=0x03 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `yrsub.vi yd, ys2, imm, vm`       |
  | `yand.vi`       | `31..26=0x09 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `yand.vi yd, ys2, imm, vm`        |
  | `yor.vi`        | `31..26=0x0a vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `yor.vi yd, ys2, imm, vm`         |
  | `yxor.vi`       | `31..26=0x0b vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `yxor.vi yd, ys2, imm, vm`        |
  | `yrgather.vi`   | `31..26=0x0c vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `yrgather.vi yd, ys2, uimm, vm`   |
  | `yslideup.vi`   | `31..26=0x0e vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `yslideup.vi yd, ys2, uimm, vm`   |
  | `yslidedown.vi` | `31..26=0x0f vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `yslidedown.vi yd, ys2, uimm, vm` |

  : OPIYI I

  | **Name**     | **Opcode / Argument**                                     | **Format**                    |
  |:-------------|:----------------------------------------------------------|:------------------------------|
  | `yadc.vim`   | `31..26=0x10 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `yadc.vim yd, ys2, imm, v0`   |
  | `ymadc.vim`  | `31..26=0x11 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ymadc.vim yd, ys2, imm, v0`  |
  | `ymadc.vi`   | `31..26=0x11 25=1 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ymadc.vi yd, ys2, imm`       |
  | `ymerge.vim` | `31..26=0x17 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ymerge.vim yd, ys2, imm, v0` |
  | `ymv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 yd 6..0=0x57` | `ymv.v.i yd, imm`             |
  | `ymseq.vi`   | `31..26=0x18 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `ymseq.vi yd, ys2, imm, vm`   |
  | `ymsne.vi`   | `31..26=0x19 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `ymsne.vi yd, ys2, imm, vm`   |
  | `ymsleu.vi`  | `31..26=0x1c vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `ymsleu.vi yd, ys2, imm, vm`  |
  | `ymsle.vi`   | `31..26=0x1d vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `ymsle.vi yd, ys2, imm, vm`   |
  | `ymsgtu.vi`  | `31..26=0x1e vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `ymsgtu.vi yd, ys2, imm, vm`  |
  | `ymsgt.vi`   | `31..26=0x1f vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `ymsgt.vi yd, ys2, imm, vm`   |

  : OPIYI II

  | **Name**     | **Opcode / Argument**                                   | **Format**                     |
  |:-------------|:--------------------------------------------------------|:-------------------------------|
  | `ysaddu.vi`  | `31..26=0x20 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ysaddu.vi yd, ys2, imm, vm`   |
  | `ysadd.vi`   | `31..26=0x21 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ysadd.vi yd, ys2, imm, vm`    |
  | `ysll.vi`    | `31..26=0x25 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ysll.vi yd, ys2, uimm, vm`    |
  | `ymv1r.v`    | `31..26=0x27 25=1 ys2 19..15=0 14..12=0x3 yd 6..0=0x57` | `ymv1r.v v1, v2`               |
  | `ymv2r.v`    | `31..26=0x27 25=1 ys2 19..15=1 14..12=0x3 yd 6..0=0x57` | `ymv2r.v v10, v12`             |
  | `ymv4r.v`    | `31..26=0x27 25=1 ys2 19..15=3 14..12=0x3 yd 6..0=0x57` | `ymv4r.v v4, v8`               |
  | `ymv8r.v`    | `31..26=0x27 25=1 ys2 19..15=7 14..12=0x3 yd 6..0=0x57` | `ymv8r.v v0, v8`               |
  | `ysrl.vi`    | `31..26=0x28 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ysrl.vi yd, ys2, uimm, vm`    |
  | `ysra.vi`    | `31..26=0x29 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ysra.vi yd, ys2, uimm, vm`    |
  | `yssrl.vi`   | `31..26=0x2a vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `yssrl.vi yd, ys2, uimm, vm`   |
  | `yssra.vi`   | `31..26=0x2b vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `yssra.vi yd, ys2, uimm, vm`   |
  | `ynsrl.wi`   | `31..26=0x2c vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ynsrl.wi yd, ys2, uimm, vm`   |
  | `ynsra.wi`   | `31..26=0x2d vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ynsra.wi yd, ys2, uimm, vm`   |
  | `ynclipu.wi` | `31..26=0x2e vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ynclipu.wi yd, ys2, uimm, vm` |
  | `ynclip.wi`  | `31..26=0x2f vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `ynclip.wi yd, ys2, uimm, vm`  |

  : OPIYI III

* **OPI (Tensor Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Format**              |
  |:------------|:------------------------------------------------------|:------------------------|
  | `yzext.vf8` | `31..26=0x12 vm ys2 19..15=2 14..12=0x2 yd 6..0=0x57` | `yzext.vf8 yd, ys2, vm` |
  | `ysext.vf8` | `31..26=0x12 vm ys2 19..15=3 14..12=0x2 yd 6..0=0x57` | `ysext.vf8 yd, ys2, vm` |
  | `yzext.vf4` | `31..26=0x12 vm ys2 19..15=4 14..12=0x2 yd 6..0=0x57` | `yzext.vf4 yd, ys2, vm` |
  | `ysext.vf4` | `31..26=0x12 vm ys2 19..15=5 14..12=0x2 yd 6..0=0x57` | `ysext.vf4 yd, ys2, vm` |
  | `yzext.vf2` | `31..26=0x12 vm ys2 19..15=6 14..12=0x2 yd 6..0=0x57` | `yzext.vf2 yd, ys2, vm` |
  | `ysext.vf2` | `31..26=0x12 vm ys2 19..15=7 14..12=0x2 yd 6..0=0x57` | `ysext.vf2 yd, ys2, vm` |

  : Tensor Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Format**                  |
  |:---------------|:---------------------------------------------------|:----------------------------|
  | `ycompress.vm` | `31..26=0x17 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ycompress.vm yd, ys2, ys1` |
  | `ymandn.mm`    | `31..26=0x18 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymandn.mm yd, ys2, ys1`    |
  | `ymand.mm`     | `31..26=0x19 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymand.mm yd, ys2, ys1`     |
  | `ymor.mm`      | `31..26=0x1a 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymxor.mm  yd, ys2, ys1`    |
  | `ymxor.mm`     | `31..26=0x1b 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymor.mm  yd, ys2, ys1`     |
  | `ymorn.mm`     | `31..26=0x1c 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymorn.mm  yd, ys2, ys1`    |
  | `ymnand.mm`    | `31..26=0x1d 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymnand.mm yd, ys2, ys1`    |
  | `ymnor.mm`     | `31..26=0x1e 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymnor.mm  yd, ys2, ys1`    |
  | `ymxnor.mm`    | `31..26=0x1f 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymxnor.mm yd, ys2, ys1`    |

  : Tensor Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Format**             |
  |:-----------|:--------------------------------------------------------------|:-----------------------|
  | `ymsbf.m`  | `31..26=0x14 vm ys2 19..15=0x01 14..12=0x2 yd 6..0=0x57`      | `ymsbf.m yd, ys2, vm`  |
  | `ymsof.m`  | `31..26=0x14 vm ys2 19..15=0x02 14..12=0x2 yd 6..0=0x57`      | `ymsof.m yd, ys2, vm`  |
  | `ymsif.m`  | `31..26=0x14 vm ys2 19..15=0x03 14..12=0x2 yd 6..0=0x57`      | `ymsif.m yd, ys2, vm`  |
  | `yiota.m`  | `31..26=0x14 vm ys2 19..15=0x10 14..12=0x2 yd 6..0=0x57`      | `yiota.m yd, ys2, vm`  |
  | `yid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 yd 6..0=0x57` | `yid.v yd, vm`         |
  | `ycpop.m`  | `31..26=0x10 vm ys2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `ycpop.m rd, ys2, vm`  |
  | `yfirst.m` | `31..26=0x10 vm ys2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `yfirst.m rd, ys2, vm` |

  : Tensor Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `ydivu.vv`   | `31..26=0x20 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ydivu.vv yd, ys2, ys1, vm`   |
  | `ydiv.vv`    | `31..26=0x21 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ydiv.vv yd, ys2, ys1, vm`    |
  | `yremu.vv`   | `31..26=0x22 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yremu.vv yd, ys2, ys1, vm`   |
  | `yrem.vv`    | `31..26=0x23 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yrem.vv yd, ys2, ys1, vm`    |
  | `ymulhu.vv`  | `31..26=0x24 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymulhu.vv yd, ys2, ys1, vm`  |
  | `ymul.vv`    | `31..26=0x25 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymul.vv yd, ys2, ys1, vm`    |
  | `ymulhsu.vv` | `31..26=0x26 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymulhsu.vv yd, ys2, ys1, vm` |
  | `ymulh.vv`   | `31..26=0x27 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymulh.vv yd, ys2, ys1, vm`   |
  | `ymadd.vv`   | `31..26=0x29 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymadd.vv yd, ys1, ys2, vm`   |
  | `ynmsub.vv`  | `31..26=0x2b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ynmsub.vv yd, ys1, ys2, vm`  |
  | `ymacc.vv`   | `31..26=0x2d vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ymacc.vv yd, ys1, ys2, vm`   |
  | `ynmsac.vv`  | `31..26=0x2f vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ynmsac.vv yd, ys1, ys2, vm`  |

  : Tensor Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `ywaddu.vv`   | `31..26=0x30 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywaddu.vv  yd, ys2, ys1, vm`  |
  | `ywadd.vv`    | `31..26=0x31 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywadd.vv  yd, ys2, ys1, vm`   |
  | `ywsubu.vv`   | `31..26=0x32 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywsubu.vv  yd, ys2, ys1, vm`  |
  | `ywsub.vv`    | `31..26=0x33 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywsub.vv  yd, ys2, ys1, vm`   |
  | `ywaddu.wv`   | `31..26=0x34 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywaddu.wv  yd, ys2, ys1, vm`  |
  | `ywadd.wv`    | `31..26=0x35 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywadd.wv  yd, ys2, ys1, vm`   |
  | `ywsubu.wv`   | `31..26=0x36 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywsubu.wv  yd, ys2, ys1, vm`  |
  | `ywsub.wv`    | `31..26=0x37 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywsub.wv  yd, ys2, ys1, vm`   |
  | `ywmulu.vv`   | `31..26=0x38 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywmulu.vv yd, ys2, ys1, vm`   |
  | `ywmulsu.vv`  | `31..26=0x3a vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywmulsu.vv yd, ys2, ys1, vm`  |
  | `ywmul.vv`    | `31..26=0x3b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywmul.vv  yd, ys2, ys1, vm`   |
  | `ywmaccu.vv`  | `31..26=0x3c vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywmaccu.vv yd, ys1, ys2, vm`  |
  | `ywmacc.vv`   | `31..26=0x3d vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywmacc.vv yd, ys1, ys2, vm`   |
  | `ywmaccsu.vv` | `31..26=0x3f vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `ywmaccsu.vv yd, ys1, ys2, vm` |

  : Tensor Integer Extension Instructions V

**Tensor Mask Instructions**

* **OPMYY**

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `yredsum.ys`  | `31..26=0x00 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yredsum.ys  yd, ys2, ys1, vm` |
  | `yredand.ys`  | `31..26=0x01 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yredand.ys  yd, ys2, ys1, vm` |
  | `yredor.ys`   | `31..26=0x02 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yredor.ys   yd, ys2, ys1, vm` |
  | `yredxor.ys`  | `31..26=0x03 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yredxor.ys  yd, ys2, ys1, vm` |
  | `yredminu.ys` | `31..26=0x04 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yredminu.ys yd, ys2, ys1, vm` |
  | `yredmin.ys`  | `31..26=0x05 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yredmin.ys  yd, ys2, ys1, vm` |
  | `yredmaxu.ys` | `31..26=0x06 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yredmaxu.ys yd, ys2, ys1, vm` |
  | `yredmax.ys`  | `31..26=0x07 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yredmax.ys  yd, ys2, ys1, vm` |
  | `yaaddu.vv`   | `31..26=0x08 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yaadd.vv    yd, ys2, ys1, vm` |
  | `yaadd.vv`    | `31..26=0x09 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yaadd.vv    yd, ys2, ys1, vm` |
  | `yasubu.vv`   | `31..26=0x0a vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yasubu.vv   yd, ys2, ys1, vm` |
  | `yasub.vv`    | `31..26=0x0b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `yasub.vv    yd, ys2, ys1, vm` |

  : OPMYY I

  | **Name**  | **Opcode / Argument**                                   | **Format**        |
  |:----------|:--------------------------------------------------------|:------------------|
  | `ymv.x.s` | `31..26=0x10 25=1 ys2 19..15=0 14..12=0x2 rd 6..0=0x57` | `ymv.x.s rd, ys2` |

  : OPMYY II

* **OPMYX**

  | **Name**    | **Opcode / Argument**                            | **Format**                   |
  |:------------|:-------------------------------------------------|:-----------------------------|
  | `yaaddu.vx` | `31..26=0x08 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `yaaddu.vx yd, ys2, rs1, vm` |
  | `yaadd.vx`  | `31..26=0x09 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `yaadd.vx yd, ys2, rs1, vm`  |
  | `yasubu.vx` | `31..26=0x0a vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `yasubu.vx yd, ys2, rs1, vm` |
  | `yasub.vx`  | `31..26=0x0b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `yasub.vx yd, ys2, rs1, vm`  |

  : OPMYX I

  | **Name**         | **Opcode / Argument**                                   | **Format**                         |
  |:-----------------|:--------------------------------------------------------|:-----------------------------------|
  | `ymv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 yd 6..0=0x57` | `ymv.s.x yd, rs1`                  |
  | `yslide1up.vx`   | `31..26=0x0e vm ys2 rs1 14..12=0x6 yd 6..0=0x57`        | `yslide1up.vx  yd, ys2, rs1, vm`   |
  | `yslide1down.vx` | `31..26=0x0f vm ys2 rs1 14..12=0x6 yd 6..0=0x57`        | `yslide1down.vx  yd, ys2, rs1, vm` |

  : OPMYX II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `ydivu.vx`   | `31..26=0x20 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ydivu.vx yd, ys2, rs1, vm`   |
  | `ydiv.vx`    | `31..26=0x21 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ydiv.vx yd, ys2, rs1, vm`    |
  | `yremu.vx`   | `31..26=0x22 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `yremu.vx yd, ys2, rs1, vm`   |
  | `yrem.vx`    | `31..26=0x23 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `yrem.vx yd, ys2, rs1, vm`    |
  | `ymulhu.vx`  | `31..26=0x24 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ymulhu.vx yd, ys2, rs1, vm`  |
  | `ymul.vx`    | `31..26=0x25 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ymul.vx yd, ys2, rs1, vm`    |
  | `ymulhsu.vx` | `31..26=0x26 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ymulh.vx yd, ys2, rs1, vm`   |
  | `ymulh.vx`   | `31..26=0x27 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ymulhsu.vx yd, ys2, rs1, vm` |
  | `ymadd.vx`   | `31..26=0x29 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ymadd.vx yd, rs1, ys2, vm`   |
  | `ynmsub.vx`  | `31..26=0x2b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ynmsub.vx yd, rs1, ys2, vm`  |
  | `ymacc.vx`   | `31..26=0x2d vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ymacc.vx yd, rs1, ys2, vm`   |
  | `ynmsac.vx`  | `31..26=0x2f vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ynmsac.vx yd, rs1, ys2, vm`  |

  : OPMYX III

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `ywaddu.vx`   | `31..26=0x30 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywaddu.vx yd, ys2, rs1, vm`   |
  | `ywadd.vx`    | `31..26=0x31 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywadd.vx yd, ys2, rs1, vm`    |
  | `ywsubu.vx`   | `31..26=0x32 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywsubu.vx yd, ys2, rs1, vm`   |
  | `ywsub.vx`    | `31..26=0x33 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywsub.vx yd, ys2, rs1, vm`    |
  | `ywaddu.wx`   | `31..26=0x34 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywaddu.wx yd, ys2, rs1, vm`   |
  | `ywadd.wx`    | `31..26=0x35 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywadd.wx yd, ys2, rs1, vm`    |
  | `ywsubu.wx`   | `31..26=0x36 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywsubu.wx yd, ys2, rs1, vm`   |
  | `ywsub.wx`    | `31..26=0x37 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywsub.wx yd, ys2, rs1, vm`    |
  | `ywmulu.vx`   | `31..26=0x38 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywmulu.vx yd, ys2, rs1, vm`   |
  | `ywmulsu.vx`  | `31..26=0x3a vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywmulsu.vx yd, ys2, rs1, vm`  |
  | `ywmul.vx`    | `31..26=0x3b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywmul.vx yd, ys2, rs1, vm`    |
  | `ywmaccu.vx`  | `31..26=0x3c vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywmaccu.vx yd, rs1, ys2, vm`  |
  | `ywmacc.vx`   | `31..26=0x3d vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywmacc.vx yd, rs1, ys2, vm`   |
  | `ywmaccus.vx` | `31..26=0x3e vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywmaccus.vx yd, rs1, ys2, vm` |
  | `ywmaccsu.vx` | `31..26=0x3f vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `ywmaccsu.vx yd, rs1, ys2, vm` |

  : OPMYX IV
