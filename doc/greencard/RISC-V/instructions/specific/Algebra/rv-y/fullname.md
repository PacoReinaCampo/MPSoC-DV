## INSTRUCTION FULL-NAMES

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

  | **Name**   | **Opcode / Argument**                              | **Full-Name**                                                    |
  |:-----------|:---------------------------------------------------|:-----------------------------------------------------------------|
  | `ysetiyli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `Set Tensor Length and Immediate Tensor Type with Immediate AVL` |
  | `ysetyli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `Set Tensor Length and Immediate Tensor Type`                    |
  | `ysetyl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `Set Tensor Length and Register Tensor Type`                     |

  : Configuration Setting

**OPLS (Tensor Loads and Store)**

* **Tensor Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Full-Name**                                   |
  |:----------|:-----------------------------------------------------------------|:------------------------------------------------|
  | `ylm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  yd 6..0=0x07` | `Tensor Mask Load`                              |
  | `ysm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 ys3 6..0=0x27` | `Tensor Mask Store`                             |
  | `yle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  yd 6..0=0x07`      | `Tensor Unit-Stride Load with 8-Bit Elements`   |
  | `yle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  yd 6..0=0x07`      | `Tensor Unit-Stride Load with 16-Bit Elements`  |
  | `yle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  yd 6..0=0x07`      | `Tensor Unit-Stride Load with 32-Bit Elements`  |
  | `yle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  yd 6..0=0x07`      | `Tensor Unit-Stride Load with 64-Bit Elements`  |
  | `yse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 ys3 6..0=0x27`      | `Tensor Unit-Stride Store with 8-Bit Elements`  |
  | `yse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 ys3 6..0=0x27`      | `Tensor Unit-Stride Store with 16-Bit Elements` |
  | `yse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 ys3 6..0=0x27`      | `Tensor Unit-Stride Store with 32-Bit Elements` |
  | `yse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 ys3 6..0=0x27`      | `Tensor Unit-Stride Store with 64-Bit Elements` |

  : Tensor Unit-Stride Instructions (including segment part)

* **Tensor Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Full-Name**                                        |
  |:-------------|:-------------------------------------------------------|:-----------------------------------------------------|
  | `yluxei8.v`  | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x0  yd 6..0=0x07` | `Tensor Indexed-Unordered Load with 8-Bit Indices`   |
  | `yluxei16.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x5  yd 6..0=0x07` | `Tensor Indexed-Unordered Load with 16-Bit Indices`  |
  | `yluxei32.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x6  yd 6..0=0x07` | `Tensor Indexed-Unordered Load with 32-Bit Indices`  |
  | `yluxei64.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x7  yd 6..0=0x07` | `Tensor Indexed-Unordered Load with 64-Bit Indices`  |
  | `ysuxei8.v`  | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x0 ys3 6..0=0x27` | `Tensor Indexed-Unordered Store with 8-Bit Indices`  |
  | `ysuxei16.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x5 ys3 6..0=0x27` | `Tensor Indexed-Unordered Store with 16-Bit Indices` |
  | `ysuxei32.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x6 ys3 6..0=0x27` | `Tensor Indexed-Unordered Store with 32-Bit Indices` |
  | `ysuxei64.v` | `nf 28=0 27..26=1 vm ys2 rs1 14..12=0x7 ys3 6..0=0x27` | `Tensor Indexed-Unordered Store with 64-Bit Indices` |

  : Tensor Indexed-Unordered Instructions (including segment part)

* **Tensor Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Full-Name**                               |
  |:-----------|:-------------------------------------------------------|:--------------------------------------------|
  | `ylse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  yd 6..0=0x07` | `Tensor Strided Load with 8-Bit Elements`   |
  | `ylse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  yd 6..0=0x07` | `Tensor Strided Load with 16-Bit Elements`  |
  | `ylse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  yd 6..0=0x07` | `Tensor Strided Load with 32-Bit Elements`  |
  | `ylse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  yd 6..0=0x07` | `Tensor Strided Load with 64-Bit Elements`  |
  | `ysse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 ys3 6..0=0x27` | `Tensor Strided Store with 8-Bit Elements`  |
  | `ysse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 ys3 6..0=0x27` | `Tensor Strided Store with 16-Bit Elements` |
  | `ysse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 ys3 6..0=0x27` | `Tensor Strided Store with 32-Bit Elements` |
  | `ysse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 ys3 6..0=0x27` | `Tensor Strided Store with 64-Bit Elements` |

  : Tensor Strided Instructions (including segment part)

* **Tensor Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Full-Name**                                      |
  |:-------------|:-------------------------------------------------------|:---------------------------------------------------|
  | `yloxei8.v`  | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x0  yd 6..0=0x07` | `Tensor Indexed-Ordered Load with 8-Bit Indices`   |
  | `yloxei16.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x5  yd 6..0=0x07` | `Tensor Indexed-Ordered Load with 16-Bit Indices`  |
  | `yloxei32.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x6  yd 6..0=0x07` | `Tensor Indexed-Ordered Load with 32-Bit Indices`  |
  | `yloxei64.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x7  yd 6..0=0x07` | `Tensor Indexed-Ordered Load with 64-Bit Indices`  |
  | `ysoxei8.v`  | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x0 ys3 6..0=0x27` | `Tensor Indexed-Ordered Store with 8-Bit Indices`  |
  | `ysoxei16.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x5 ys3 6..0=0x27` | `Tensor Indexed-Ordered Store with 16-Bit Indices` |
  | `ysoxei32.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x6 ys3 6..0=0x27` | `Tensor Indexed-Ordered Store with 32-Bit Indices` |
  | `ysoxei64.v` | `nf 28=0 27..26=3 vm ys2 rs1 14..12=0x7 ys3 6..0=0x27` | `Tensor Indexed-Ordered Store with 64-Bit Indices` |

  : Tensor Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Full-Name**                                                   |
  |:------------|:---------------------------------------------------------------|:----------------------------------------------------------------|
  | `yle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  yd 6..0=0x07` | `Tensor Unit-Stride Fault-Only-First Load with 8-Bit Elements`  |
  | `yle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  yd 6..0=0x07` | `Tensor Unit-Stride Fault-Only-First Load with 16-Bit Elements` |
  | `yle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  yd 6..0=0x07` | `Tensor Unit-Stride Fault-Only-First Load with 32-Bit Elements` |
  | `yle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  yd 6..0=0x07` | `Tensor Unit-Stride Fault-Only-First Load with 64-Bit Elements` |

  : Unit-stride Fault-Only-First Loads

* **Tensor Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Full-Name**                                                     |
  |:------------|:-----------------------------------------------------------------------|:------------------------------------------------------------------|
  | `yl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `Tensor Load 1 Whole Register with 8-Bit Encoded Element Width`   |
  | `yl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `Tensor Load 1 Whole Register with 16-Bit Encoded Element Width`  |
  | `yl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `Tensor Load 1 Whole Register with 32-Bit Encoded Element Width`  |
  | `yl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `Tensor Load 1 Whole Register with 64-Bit Encoded Element Width`  |
  | `yl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `Tensor Load 2 Whole Registers with 8-Bit Encoded Element Width`  |
  | `yl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `Tensor Load 2 Whole Registers with 16-Bit Encoded Element Width` |
  | `yl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `Tensor Load 2 Whole Registers with 32-Bit Encoded Element Width` |
  | `yl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `Tensor Load 2 Whole Registers with 64-Bit Encoded Element Width` |
  | `yl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `Tensor Load 4 Whole Registers with 8-Bit Encoded Element Width`  |
  | `yl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `Tensor Load 4 Whole Registers with 16-Bit Encoded Element Width` |
  | `yl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `Tensor Load 4 Whole Registers with 32-Bit Encoded Element Width` |
  | `yl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `Tensor Load 4 Whole Registers with 64-Bit Encoded Element Width` |
  | `yl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 yd  6..0=0x07` | `Tensor Load 8 Whole Registers with 8-Bit Encoded Element Width`  |
  | `yl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 yd  6..0=0x07` | `Tensor Load 8 Whole Registers with 16-Bit Encoded Element Width` |
  | `yl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 yd  6..0=0x07` | `Tensor Load 8 Whole Registers with 32-Bit Encoded Element Width` |
  | `yl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 yd  6..0=0x07` | `Tensor Load 8 Whole Registers with 64-Bit Encoded Element Width` |
  | `ys1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `Tensor Store 1 Whole Register`                                   |
  | `ys2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `Tensor Store 2 Whole Registers`                                  |
  | `ys4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `Tensor Store 4 Whole Registers`                                  |
  | `ys8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ys3 6..0=0x27` | `Tensor Store 8 Whole Registers`                                  |

  : Tensor Load/Store Whole Registers

**Tensor Float-Point Instructions**

* **OPFYF**

  | **Name**          | **Opcode / Argument**                                   | **Full-Name**                                                  |
  |:------------------|:--------------------------------------------------------|:---------------------------------------------------------------|
  | `yfadd.vf`        | `31..26=0x00 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Add (Tensor-Scalar)`                    |
  | `yfsub.vf`        | `31..26=0x02 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Subtract (Tensor-Scalar)`               |
  | `yfmin.vf`        | `31..26=0x04 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Minimum (Tensor-Scalar)`                |
  | `yfmax.vf`        | `31..26=0x06 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Maximum (Tensor-Scalar)`                |
  | `yfsgnj.vf`       | `31..26=0x08 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Sign Injection (Tensor-Scalar)`         |
  | `yfsgnjn.vf`      | `31..26=0x09 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Negated Sign Injection (Tensor-Scalar)` |
  | `yfsgnjx.vf`      | `31..26=0x0a vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point XOR Sign Injection (Tensor-Scalar)`     |
  | `yfslide1up.vf`   | `31..26=0x0e vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Slide One Up (Tensor-Scalar)`           |
  | `yfslide1down.vf` | `31..26=0x0f vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Slide One Down (Tensor-Scalar)`         |
  | `yfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Move Floating-Point Scalar to Tensor Element`          |

  : OPFYF I

  | **Name**      | **Opcode / Argument**                                   | **Full-Name**                                                         |
  |:--------------|:--------------------------------------------------------|:----------------------------------------------------------------------|
  | `yfmerge.vfm` | `31..26=0x17 25=0 ys2 rs1 14..12=0x5 yd 6..0=0x57`      | `Tensor Floating-Point Merge (Tensor-Scalar)`                         |
  | `yfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Broadcast Floating-Point Scalar`                              |
  | `ymfeq.vf`    | `31..26=0x18 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Compare Equal (Tensor-Scalar)`                 |
  | `ymfle.vf`    | `31..26=0x19 vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Compare Less Than or Equal (Tensor-Scalar)`    |
  | `ymflt.vf`    | `31..26=0x1b vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Compare Less Than (Tensor-Scalar)`             |
  | `ymfne.vf`    | `31..26=0x1c vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Compare Not Equal (Tensor-Scalar)`             |
  | `ymfgt.vf`    | `31..26=0x1d vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Compare Greater Than (Tensor-Scalar)`          |
  | `ymfge.vf`    | `31..26=0x1f vm ys2 rs1 14..12=0x5 yd 6..0=0x57`        | `Tensor Floating-Point Compare Greater Than or Equal (Tensor-Scalar)` |

  : OPFYF II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                                    |
  |:-------------|:-------------------------------------------------|:-------------------------------------------------------------------------------------------------|
  | `yfdiv.vf`   | `31..26=0x20 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Divide (Tensor-Scalar)`                                                   |
  | `yfrdiv.vf`  | `31..26=0x21 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Reverse Divide (Tensor-Scalar)`                                           |
  | `yfmul.vf`   | `31..26=0x24 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Multiply (Tensor-Scalar)`                                                 |
  | `yfrsub.vf`  | `31..26=0x27 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Reverse Subtract (Tensor-Scalar)`                                         |
  | `yfmadd.vf`  | `31..26=0x28 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Fused Multiply-Add, Overwrite Multiplicand (Tensor-Scalar)`               |
  | `yfnmadd.vf` | `31..26=0x29 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Fused Negative Multiply-Add, Overwrite Multiplicand (Tensor-Scalar)`      |
  | `yfmsub.vf`  | `31..26=0x2a vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Fused Multiply-Subtract, Overwrite Multiplicand (Tensor-Scalar)`          |
  | `yfnmsub.vf` | `31..26=0x2b vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Fused Negative Multiply-Subtract, Overwrite Multiplicand (Tensor-Scalar)` |
  | `yfmacc.vf`  | `31..26=0x2c vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Fused Multiply-Accumulate (Tensor-Scalar)`                                |
  | `yfnmacc.vf` | `31..26=0x2d vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Fused Negative Multiply-Accumulate (Tensor-Scalar)`                       |
  | `yfmsac.vf`  | `31..26=0x2e vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Fused Multiply-Subtract Accumulator (Tensor-Scalar)`                      |
  | `yfnmsac.vf` | `31..26=0x2f vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Floating-Point Fused Negative Multiply-Subtract Accumulator (Tensor-Scalar)`             |

  : OPFYF III

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                                 |
  |:--------------|:-------------------------------------------------|:----------------------------------------------------------------------------------------------|
  | `yfwadd.vf`   | `31..26=0x30 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Add (Tensor-Scalar)`                                          |
  | `yfwsub.vf`   | `31..26=0x32 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Subtract (Tensor-Scalar)`                                     |
  | `yfwadd.wf`   | `31..26=0x34 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Add (Wide Tensor-Scalar)`                                     |
  | `yfwsub.wf`   | `31..26=0x36 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Subtract (Wide Tensor-Scalar)`                                |
  | `yfwmul.vf`   | `31..26=0x38 vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Multiply (Tensor-Scalar)`                                     |
  | `yfwmacc.vf`  | `31..26=0x3c vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Fused Multiply-Accumulate (Tensor-Scalar)`                    |
  | `yfwnmacc.vf` | `31..26=0x3d vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Fused Negative Multiply-Accumulate (Tensor-Scalar)`           |
  | `yfwmsac.vf`  | `31..26=0x3e vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Fused Multiply-Subtract Accumulator (Tensor-Scalar)`          |
  | `yfwnmsac.vf` | `31..26=0x3f vm ys2 rs1 14..12=0x5 yd 6..0=0x57` | `Tensor Widening Floating-Point Fused Negative Multiply-Subtract Accumulator (Tensor-Scalar)` |

  : OPFYF IV

* **OPFYY**

  | **Name**       | **Opcode / Argument**                                   | **Full-Name**                                                  |
  |:---------------|:--------------------------------------------------------|:---------------------------------------------------------------|
  | `yfadd.vv`     | `31..26=0x00 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Add (Tensor-Tensor)`                    |
  | `yfredusum.ys` | `31..26=0x01 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Unordered Sum Reduction`                |
  | `yfsub.vv`     | `31..26=0x02 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Subtract (Tensor-Tensor)`               |
  | `yfredosum.ys` | `31..26=0x03 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Ordered Sum Reduction`                  |
  | `yfmin.vv`     | `31..26=0x04 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Minimum (Tensor-Tensor)`                |
  | `yfredmin.ys`  | `31..26=0x05 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Minimum Reduction`                      |
  | `yfmax.vv`     | `31..26=0x06 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Maximum (Tensor-Tensor)`                |
  | `yfredmax.ys`  | `31..26=0x07 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Maximum Reduction`                      |
  | `yfsgnj.vv`    | `31..26=0x08 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Sign Injection (Tensor-Tensor)`         |
  | `yfsgnjn.vv`   | `31..26=0x09 vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point Negated Sign Injection (Tensor-Tensor)` |
  | `yfsgnjx.vv`   | `31..26=0x0a vm ys2 ys1 14..12=0x1 yd 6..0=0x57`        | `Tensor Floating-Point XOR Sign Injection (Tensor-Tensor)`     |
  | `yfmv.f.s`     | `31..26=0x10 25=1 ys2 19..15=0 14..12=0x1 rd 6..0=0x57` | `Tensor Move Tensor Element to Floating-Point Scalar`          |

  : OPFYY I

  | **Name**   | **Opcode / Argument**                            | **Full-Name**                                                      |
  |:-----------|:-------------------------------------------------|:-------------------------------------------------------------------|
  | `ymfeq.vv` | `31..26=0x18 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Compare Equal (Tensor-Tensor)`              |
  | `ymfle.vv` | `31..26=0x19 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Compare Less Than or Equal (Tensor-Tensor)` |
  | `ymflt.vv` | `31..26=0x1b vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Compare Less Than (Tensor-Tensor)`          |
  | `ymfne.vv` | `31..26=0x1c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Compare Not Equal (Tensor-Tensor)`          |

  : OPFYY II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                                    |
  |:-------------|:-------------------------------------------------|:-------------------------------------------------------------------------------------------------|
  | `yfdiv.vv`   | `31..26=0x20 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Divide (Tensor-Tensor)`                                                   |
  | `yfmul.vv`   | `31..26=0x24 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Multiply (Tensor-Tensor)`                                                 |
  | `yfmadd.vv`  | `31..26=0x28 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Fused Multiply-Add, Overwrite Multiplicand (Tensor-Tensor)`               |
  | `yfnmadd.vv` | `31..26=0x29 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Fused Negative Multiply-Add, Overwrite Multiplicand (Tensor-Tensor)`      |
  | `yfmsub.vv`  | `31..26=0x2a vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Fused Multiply-Subtract, Overwrite Multiplicand (Tensor-Tensor)`          |
  | `yfnmsub.vv` | `31..26=0x2b vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Fused Negative Multiply-Subtract, Overwrite Multiplicand (Tensor-Tensor)` |
  | `yfmacc.vv`  | `31..26=0x2c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Fused Multiply-Accumulate (Tensor-Tensor)`                                |
  | `yfnmacc.vv` | `31..26=0x2d vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Fused Negative Multiply-Accumulate (Tensor-Tensor)`                       |
  | `yfmsac.vv`  | `31..26=0x2e vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Fused Multiply-Subtract Accumulator (Tensor-Tensor)`                      |
  | `yfnmsac.vv` | `31..26=0x2f vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Fused Negative Multiply-Subtract Accumulator (Tensor-Tensor)`             |

  : OPFYY III

  | **Name**           | **Opcode / Argument**                                    | **Full-Name**                                                              |
  |:-------------------|:---------------------------------------------------------|:---------------------------------------------------------------------------|
  | `yfcvt.xu.f.v`     | `31..26=0x12 vm ys2 19..15=0x00 14..12=0x1 yd 6..0=0x57` | `Tensor Convert Floating-Point to Unsigned Integer`                        |
  | `yfcvt.x.f.v`      | `31..26=0x12 vm ys2 19..15=0x01 14..12=0x1 yd 6..0=0x57` | `Tensor Convert Floating-Point to Signed Integer`                          |
  | `yfcvt.f.xu.v`     | `31..26=0x12 vm ys2 19..15=0x02 14..12=0x1 yd 6..0=0x57` | `Tensor Convert Unsigned Integer to Floating-Point`                        |
  | `yfcvt.f.x.v`      | `31..26=0x12 vm ys2 19..15=0x03 14..12=0x1 yd 6..0=0x57` | `Tensor Convert Signed Integer to Floating-Point`                          |
  | `yfcvt.rtz.xu.f.v` | `31..26=0x12 vm ys2 19..15=0x06 14..12=0x1 yd 6..0=0x57` | `Tensor Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `yfcvt.rtz.x.f.v`  | `31..26=0x12 vm ys2 19..15=0x07 14..12=0x1 yd 6..0=0x57` | `Tensor Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFYY IV

  | **Name**            | **Opcode / Argument**                                    | **Full-Name**                                                                       |
  |:--------------------|:---------------------------------------------------------|:------------------------------------------------------------------------------------|
  | `yfwcvt.xu.f.v`     | `31..26=0x12 vm ys2 19..15=0x08 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Convert Floating-Point to Unsigned Integer`                        |
  | `yfwcvt.x.f.v`      | `31..26=0x12 vm ys2 19..15=0x09 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Convert Floating-Point to Signed Integer`                          |
  | `yfwcvt.f.xu.v`     | `31..26=0x12 vm ys2 19..15=0x0A 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Convert Unsigned Integer to Floating-Point`                        |
  | `yfwcvt.f.x.v`      | `31..26=0x12 vm ys2 19..15=0x0B 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Convert Signed Integer to Floating-Point`                          |
  | `yfwcvt.f.f.v`      | `31..26=0x12 vm ys2 19..15=0x0C 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Convert Floating-Point to Floating-Point`                          |
  | `yfwcvt.rtz.xu.f.v` | `31..26=0x12 vm ys2 19..15=0x0E 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `yfwcvt.rtz.x.f.v`  | `31..26=0x12 vm ys2 19..15=0x0F 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFYY V

  | **Name**            | **Opcode / Argument**                                    | **Full-Name**                                                                        |
  |:--------------------|:---------------------------------------------------------|:-------------------------------------------------------------------------------------|
  | `yfncvt.xu.f.w`     | `31..26=0x12 vm ys2 19..15=0x10 14..12=0x1 yd 6..0=0x57` | `Tensor Narrowing Convert Floating-Point to Unsigned Integer`                        |
  | `yfncvt.x.f.w`      | `31..26=0x12 vm ys2 19..15=0x11 14..12=0x1 yd 6..0=0x57` | `Tensor Narrowing Convert Floating-Point to Signed Integer`                          |
  | `yfncvt.f.xu.w`     | `31..26=0x12 vm ys2 19..15=0x12 14..12=0x1 yd 6..0=0x57` | `Tensor Narrowing Convert Unsigned Integer to Floating-Point`                        |
  | `yfncvt.f.x.w`      | `31..26=0x12 vm ys2 19..15=0x13 14..12=0x1 yd 6..0=0x57` | `Tensor Narrowing Convert Signed Integer to Floating-Point`                          |
  | `yfncvt.f.f.w`      | `31..26=0x12 vm ys2 19..15=0x14 14..12=0x1 yd 6..0=0x57` | `Tensor Narrowing Convert Floating-Point to Floating-Point`                          |
  | `yfncvt.rod.f.f.w`  | `31..26=0x12 vm ys2 19..15=0x15 14..12=0x1 yd 6..0=0x57` | `Tensor Narrowing Convert Floating-Point to Floating-Point with Round to Odd`        |
  | `yfncvt.rtz.xu.f.w` | `31..26=0x12 vm ys2 19..15=0x16 14..12=0x1 yd 6..0=0x57` | `Tensor Narrowing Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `yfncvt.rtz.x.f.w`  | `31..26=0x12 vm ys2 19..15=0x17 14..12=0x1 yd 6..0=0x57` | `Tensor Narrowing Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFYY VI

  | **Name**     | **Opcode / Argument**                                    | **Full-Name**                                                     |
  |:-------------|:---------------------------------------------------------|:------------------------------------------------------------------|
  | `yfsqrt.v`   | `31..26=0x13 vm ys2 19..15=0x00 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Square Root`                               |
  | `yfrsqrt7.v` | `31..26=0x13 vm ys2 19..15=0x04 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Reciprocal Square-Root Estimate to 7 Bits` |
  | `yfrec7.v`   | `31..26=0x13 vm ys2 19..15=0x05 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Reciprocal Estimate to 7 Bits`             |
  | `yfclass.v`  | `31..26=0x13 vm ys2 19..15=0x10 14..12=0x1 yd 6..0=0x57` | `Tensor Floating-Point Classify`                                  |

  : OPFYY VII

  | **Name**        | **Opcode / Argument**                            | **Full-Name**                                                                                 |
  |:----------------|:-------------------------------------------------|:----------------------------------------------------------------------------------------------|
  | `yfwadd.vv`     | `31..26=0x30 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Add (Tensor-Tensor)`                                          |
  | `yfwredusum.ys` | `31..26=0x31 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Unordered Sum Reduction`                                      |
  | `yfwsub.vv`     | `31..26=0x32 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Subtract (Tensor-Tensor)`                                     |
  | `yfwredosum.ys` | `31..26=0x33 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Ordered Sum Reduction`                                        |
  | `yfwadd.wv`     | `31..26=0x34 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Add (Wide Tensor-Tensor)`                                     |
  | `yfwsub.wv`     | `31..26=0x36 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Subtract (Wide Tensor-Tensor)`                                |
  | `yfwmul.vv`     | `31..26=0x38 vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Multiply (Tensor-Tensor)`                                     |
  | `yfwmacc.vv`    | `31..26=0x3c vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Fused Multiply-Accumulate (Tensor-Tensor)`                    |
  | `yfwnmacc.vv`   | `31..26=0x3d vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Fused Negative Multiply-Accumulate (Tensor-Tensor)`           |
  | `yfwmsac.vv`    | `31..26=0x3e vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Fused Multiply-Subtract Accumulator (Tensor-Tensor)`          |
  | `yfwnmsac.vv`   | `31..26=0x3f vm ys2 ys1 14..12=0x1 yd 6..0=0x57` | `Tensor Widening Floating-Point Fused Negative Multiply-Subtract Accumulator (Tensor-Tensor)` |

  : OPFYY VIII

**Tensor Integer Instructions**

* **OPIYX**

  | **Name**        | **Opcode / Argument**                            | **Full-Name**                                     |
  |:----------------|:-------------------------------------------------|:--------------------------------------------------|
  | `yadd.vx`       | `31..26=0x00 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Add (Tensor-Scalar)`              |
  | `ysub.vx`       | `31..26=0x02 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Subtract (Tensor-Scalar)`         |
  | `yrsub.vx`      | `31..26=0x03 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Reverse Subtract (Tensor-Scalar)` |
  | `yminu.vx`      | `31..26=0x04 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Min Unsigned (Tensor-Scalar)`     |
  | `ymin.vx`       | `31..26=0x05 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Min Signed (Tensor-Scalar)`       |
  | `ymaxu.vx`      | `31..26=0x06 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Max Unsigned (Tensor-Scalar)`     |
  | `ymax.vx`       | `31..26=0x07 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Max Signed (Tensor-Scalar)`       |
  | `yand.vx`       | `31..26=0x09 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Bitwise AND (Tensor-Scalar)`              |
  | `yor.vx`        | `31..26=0x0a vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Bitwise OR (Tensor-Scalar)`               |
  | `yxor.vx`       | `31..26=0x0b vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Bitwise XOR (Tensor-Scalar)`              |
  | `yrgather.vx`   | `31..26=0x0c vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Register Gather (Tensor-Scalar)`          |
  | `yslideup.vx`   | `31..26=0x0e vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Slide Up (Tensor-Scalar)`                 |
  | `yslidedown.vx` | `31..26=0x0f vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Slide Down (Tensor-Scalar)`               |

  : OPIYX I

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                                |
  |:-------------|:--------------------------------------------------------|:-----------------------------------------------------------------------------|
  | `yadc.vxm`   | `31..26=0x10 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `Tensor Integer Add with Carry (Tensor-Scalar with Mask Carry Input)`        |
  | `ymadc.vxm`  | `31..26=0x11 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `Tensor Integer Add Carry-Out (Tensor-Scalar with Mask Carry Input)`         |
  | `ymadc.vx`   | `31..26=0x11 25=1 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `Tensor Integer Add Carry-Out (Tensor-Scalar)`                               |
  | `ysbc.vxm`   | `31..26=0x12 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `Tensor Integer Subtract with Borrow (Tensor-Scalar with Mask Borrow Input)` |
  | `ymsbc.vxm`  | `31..26=0x13 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `Tensor Integer Subtract Borrow-Out (Tensor-Scalar with Mask Borrow Input)`  |
  | `ymsbc.vx`   | `31..26=0x13 25=1 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `Tensor Integer Subtract Borrow-Out (Tensor-Scalar)`                         |
  | `ymerge.vxm` | `31..26=0x17 25=0 ys2 rs1 14..12=0x4 yd 6..0=0x57`      | `Tensor Integer Merge (Tensor-Scalar)`                                       |
  | `ymv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Broadcast Integer Scalar`                                            |
  | `ymseq.vx`   | `31..26=0x18 vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `Tensor Integer Compare Equal (Tensor-Scalar)`                               |
  | `ymsne.vx`   | `31..26=0x19 vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `Tensor Integer Compare Not Equal (Tensor-Scalar)`                           |
  | `ymsltu.vx`  | `31..26=0x1a vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `Tensor Integer Compare Less Than Unsigned (Tensor-Scalar)`                  |
  | `ymslt.vx`   | `31..26=0x1b vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `Tensor Integer Compare Less Than Signed (Tensor-Scalar)`                    |
  | `ymsleu.vx`  | `31..26=0x1c vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `Tensor Integer Compare Less Than or Equal Unsigned (Tensor-Scalar)`         |
  | `ymsle.vx`   | `31..26=0x1d vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `Tensor Integer Compare Less Than or Equal Signed (Tensor-Scalar)`           |
  | `ymsgtu.vx`  | `31..26=0x1e vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `Tensor Integer Compare Greater Than Unsigned (Tensor-Scalar)`               |
  | `ymsgt.vx`   | `31..26=0x1f vm ys2 rs1 14..12=0x4 yd 6..0=0x57`        | `Tensor Integer Compare Greater Than Signed (Tensor-Scalar)`                 |

  : OPIYX II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                    |
  |:-------------|:-------------------------------------------------|:---------------------------------------------------------------------------------|
  | `ysaddu.vx`  | `31..26=0x20 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Saturating Add Unsigned (Tensor-Scalar)`                         |
  | `ysadd.vx`   | `31..26=0x21 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Saturating Add Signed (Tensor-Scalar)`                           |
  | `yssubu.vx`  | `31..26=0x22 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Saturating Subtract Unsigned (Tensor-Scalar)`                    |
  | `yssub.vx`   | `31..26=0x23 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Integer Saturating Subtract Signed (Tensor-Scalar)`                      |
  | `ysll.vx`    | `31..26=0x25 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Shift Left Logical (Tensor-Scalar)`                                      |
  | `ysmul.vx`   | `31..26=0x27 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Signed Fractional Multiply with Rounding and Saturation (Tensor-Scalar)` |
  | `ysrl.vx`    | `31..26=0x28 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Shift Right Logical (Tensor-Scalar)`                                     |
  | `ysra.vx`    | `31..26=0x29 vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Shift Right Arithmetic (Tensor-Scalar)`                                  |
  | `yssrl.vx`   | `31..26=0x2a vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Scaling Shift Right Unsigned (Tensor-Scalar)`                            |
  | `yssra.vx`   | `31..26=0x2b vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Scaling Shift Right Signed (Tensor-Scalar)`                              |
  | `ynsrl.wx`   | `31..26=0x2c vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Narrowing Shift Right Logical (Wide Tensor-Scalar)`                      |
  | `ynsra.wx`   | `31..26=0x2d vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Narrowing Shift Right Arithmetic (Wide Tensor-Scalar)`                   |
  | `ynclipu.wx` | `31..26=0x2e vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Narrowing Clip Unsigned (Wide Tensor-Scalar)`                            |
  | `ynclip.wx`  | `31..26=0x2f vm ys2 rs1 14..12=0x4 yd 6..0=0x57` | `Tensor Narrowing Clip Signed (Wide Tensor-Scalar)`                              |

  : OPIYX III

* **OPIYY**

  | **Name**          | **Opcode / Argument**                            | **Full-Name**                                                        |
  |:------------------|:-------------------------------------------------|:---------------------------------------------------------------------|
  | `yadd.vv`         | `31..26=0x00 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Add (Tensor-Tensor)`                                 |
  | `ysub.vv`         | `31..26=0x02 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Subtract (Tensor-Tensor)`                            |
  | `yminu.vv`        | `31..26=0x04 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Min Unsigned (Tensor-Tensor)`                        |
  | `ymin.vv`         | `31..26=0x05 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Min Signed (Tensor-Tensor)`                          |
  | `ymaxu.vv`        | `31..26=0x06 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Max Unsigned (Tensor-Tensor)`                        |
  | `ymax.vv`         | `31..26=0x07 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Max Signed (Tensor-Tensor)`                          |
  | `yand.vv`         | `31..26=0x09 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Bitwise AND (Tensor-Tensor)`                                 |
  | `yor.vv`          | `31..26=0x0a vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Bitwise OR (Tensor-Tensor)`                                  |
  | `yxor.vv`         | `31..26=0x0b vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Bitwise XOR (Tensor-Tensor)`                                 |
  | `yrgather.vv`     | `31..26=0x0c vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Register Gather (Tensor-Tensor)`                             |
  | `yrgatherei16.vv` | `31..26=0x0e vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Register Gather with 16-Bit Element Indices (Tensor-Tensor)` |

  : OPIYY I

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                                |
  |:-------------|:--------------------------------------------------------|:-----------------------------------------------------------------------------|
  | `yadc.vvm`   | `31..26=0x10 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `Tensor Integer Add with Carry (Tensor-Tensor with Mask Carry Input)`        |
  | `ymadc.vvm`  | `31..26=0x11 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `Tensor Integer Add Carry-Out (Tensor-Tensor with Mask Carry Input)`         |
  | `ymadc.vv`   | `31..26=0x11 25=1 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `Tensor Integer Add Carry-Out (Tensor-Tensor)`                               |
  | `ysbc.vvm`   | `31..26=0x12 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `Tensor Integer Subtract with Borrow (Tensor-Tensor with Mask Borrow Input)` |
  | `ymsbc.vvm`  | `31..26=0x13 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `Tensor Integer Subtract Borrow-Out (Tensor-Tensor with Mask Borrow Input)`  |
  | `ymsbc.vv`   | `31..26=0x13 25=1 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `Tensor Integer Subtract Borrow-Out (Tensor-Tensor)`                         |
  | `ymerge.vvm` | `31..26=0x17 25=0 ys2 ys1 14..12=0x0 yd 6..0=0x57`      | `Tensor Integer Merge (Tensor-Tensor)`                                       |
  | `ymv.v.v`    | `31..26=0x17 25=1 24..20=0 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Move Tensor Elements`                                                |
  | `ymseq.vv`   | `31..26=0x18 vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `Tensor Integer Compare Equal (Tensor-Tensor)`                               |
  | `ymsne.vv`   | `31..26=0x19 vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `Tensor Integer Compare Not Equal (Tensor-Tensor)`                           |
  | `ymsltu.vv`  | `31..26=0x1a vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `Tensor Integer Compare Less Than Unsigned (Tensor-Tensor)`                  |
  | `ymslt.vv`   | `31..26=0x1b vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `Tensor Integer Compare Less Than Signed (Tensor-Tensor)`                    |
  | `ymsleu.vv`  | `31..26=0x1c vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `Tensor Integer Compare Less Than or Equal Unsigned (Tensor-Tensor)`         |
  | `ymsle.vv`   | `31..26=0x1d vm ys2 ys1 14..12=0x0 yd 6..0=0x57`        | `Tensor Integer Compare Less Than or Equal Signed (Tensor-Tensor)`           |

  : OPIYY II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                    |
  |:-------------|:-------------------------------------------------|:---------------------------------------------------------------------------------|
  | `ysaddu.vv`  | `31..26=0x20 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Saturating Add Unsigned (Tensor-Tensor)`                         |
  | `ysadd.vv`   | `31..26=0x21 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Saturating Add Signed (Tensor-Tensor)`                           |
  | `yssubu.vv`  | `31..26=0x22 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Saturating Subtract Unsigned (Tensor-Tensor)`                    |
  | `yssub.vv`   | `31..26=0x23 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Integer Saturating Subtract Signed (Tensor-Tensor)`                      |
  | `ysll.vv`    | `31..26=0x25 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Shift Left Logical (Tensor-Tensor)`                                      |
  | `ysmul.vv`   | `31..26=0x27 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Signed Fractional Multiply with Rounding and Saturation (Tensor-Tensor)` |
  | `ysrl.vv`    | `31..26=0x28 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Shift Right Logical (Tensor-Tensor)`                                     |
  | `ysra.vv`    | `31..26=0x29 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Shift Right Arithmetic (Tensor-Tensor)`                                  |
  | `yssrl.vv`   | `31..26=0x2a vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Scaling Shift Right Unsigned (Tensor-Tensor)`                            |
  | `yssra.vv`   | `31..26=0x2b vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Scaling Shift Right Signed (Tensor-Tensor)`                              |
  | `ynsrl.wv`   | `31..26=0x2c vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Narrowing Shift Right Logical (Wide Tensor-Tensor)`                      |
  | `ynsra.wv`   | `31..26=0x2d vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Narrowing Shift Right Arithmetic (Wide Tensor-Tensor)`                   |
  | `ynclipu.wv` | `31..26=0x2e vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Narrowing Clip Unsigned (Wide Tensor-Tensor)`                            |
  | `ynclip.wv`  | `31..26=0x2f vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Narrowing Clip Signed (Wide Tensor-Tensor)`                              |

  : OPIYY III

  | **Name**       | **Opcode / Argument**                            | **Full-Name**                                    |
  |:---------------|:-------------------------------------------------|:-------------------------------------------------|
  | `ywredsumu.ys` | `31..26=0x30 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Widening Integer Sum Unsigned Reduction` |
  | `ywredsum.ys`  | `31..26=0x31 vm ys2 ys1 14..12=0x0 yd 6..0=0x57` | `Tensor Widening Integer Sum Reduction`          |

  : OPIYY IV

* **OPIYI**

  | **Name**        | **Opcode / Argument**                              | **Full-Name**                                        |
  |:----------------|:---------------------------------------------------|:-----------------------------------------------------|
  | `yadd.vi`       | `31..26=0x00 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Integer Add (Tensor-Immediate)`              |
  | `yrsub.vi`      | `31..26=0x03 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Integer Reverse Subtract (Tensor-Immediate)` |
  | `yand.vi`       | `31..26=0x09 vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Bitwise AND (Tensor-Immediate)`              |
  | `yor.vi`        | `31..26=0x0a vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Bitwise OR (Tensor-Immediate)`               |
  | `yxor.vi`       | `31..26=0x0b vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Bitwise XOR (Tensor-Immediate)`              |
  | `yrgather.vi`   | `31..26=0x0c vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Register Gather (Tensor-Immediate)`          |
  | `yslideup.vi`   | `31..26=0x0e vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Slide Up (Tensor-Immediate)`                 |
  | `yslidedown.vi` | `31..26=0x0f vm ys2 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Slide Down (Tensor-Immediate)`               |

  : OPIYI I

  | **Name**     | **Opcode / Argument**                                     | **Full-Name**                                                            |
  |:-------------|:----------------------------------------------------------|:-------------------------------------------------------------------------|
  | `yadc.vim`   | `31..26=0x10 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Integer Add with Carry (Tensor-Immediate with Mask Carry Input)` |
  | `ymadc.vim`  | `31..26=0x11 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Integer Add Carry-Out (Tensor-Immediate with Mask Carry Input)`  |
  | `ymadc.vi`   | `31..26=0x11 25=1 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Integer Add Carry-Out (Tensor-Immediate)`                        |
  | `ymerge.vim` | `31..26=0x17 25=0 ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Integer Merge (Tensor-Immediate)`                                |
  | `ymv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 yd 6..0=0x57` | `Tensor Broadcast Signed Immediate`                                      |
  | `ymseq.vi`   | `31..26=0x18 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `Tensor Integer Compare Equal (Tensor-Immediate)`                        |
  | `ymsne.vi`   | `31..26=0x19 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `Tensor Integer Compare Not Equal (Tensor-Immediate)`                    |
  | `ymsleu.vi`  | `31..26=0x1c vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `Tensor Integer Compare Less Than or Equal Unsigned (Tensor-Immediate)`  |
  | `ymsle.vi`   | `31..26=0x1d vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `Tensor Integer Compare Less Than or Equal Signed (Tensor-Immediate)`    |
  | `ymsgtu.vi`  | `31..26=0x1e vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `Tensor Integer Compare Greater Than Unsigned (Tensor-Immediate)`        |
  | `ymsgt.vi`   | `31..26=0x1f vm ys2 simm5 14..12=0x3 yd 6..0=0x57`        | `Tensor Integer Compare Greater Than Signed (Tensor-Immediate)`          |

  : OPIYI II

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                     |
  |:-------------|:--------------------------------------------------------|:------------------------------------------------------------------|
  | `ysaddu.vi`  | `31..26=0x20 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Integer Saturating Add Unsigned (Tensor-Immediate)`       |
  | `ysadd.vi`   | `31..26=0x21 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Integer Saturating Add Signed (Tensor-Immediate)`         |
  | `ysll.vi`    | `31..26=0x25 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Shift Left Logical (Tensor-Immediate)`                    |
  | `ymv1r.v`    | `31..26=0x27 25=1 ys2 19..15=0 14..12=0x3 yd 6..0=0x57` | `Tensor Move 1 Whole Register`                                    |
  | `ymv2r.v`    | `31..26=0x27 25=1 ys2 19..15=1 14..12=0x3 yd 6..0=0x57` | `Tensor Move 2 Whole Registers`                                   |
  | `ymv4r.v`    | `31..26=0x27 25=1 ys2 19..15=3 14..12=0x3 yd 6..0=0x57` | `Tensor Move 4 Whole Registers`                                   |
  | `ymv8r.v`    | `31..26=0x27 25=1 ys2 19..15=7 14..12=0x3 yd 6..0=0x57` | `Tensor Move 8 Whole Registers`                                   |
  | `ysrl.vi`    | `31..26=0x28 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Shift Right Logical (Tensor-Immediate)`                   |
  | `ysra.vi`    | `31..26=0x29 vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Shift Right Arithmetic (Tensor-Immediate)`                |
  | `yssrl.vi`   | `31..26=0x2a vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Scaling Shift Right Unsigned (Tensor-Immediate)`          |
  | `yssra.vi`   | `31..26=0x2b vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Scaling Shift Right Signed (Tensor-Immediate)`            |
  | `ynsrl.wi`   | `31..26=0x2c vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Narrowing Shift Right Logical (Wide Tensor-Immediate)`    |
  | `ynsra.wi`   | `31..26=0x2d vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Narrowing Shift Right Arithmetic (Wide Tensor-Immediate)` |
  | `ynclipu.wi` | `31..26=0x2e vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Narrowing Clip Unsigned (Wide Tensor-Immediate)`          |
  | `ynclip.wi`  | `31..26=0x2f vm ys2 simm5 14..12=0x3 yd 6..0=0x57`      | `Tensor Narrowing Clip Signed (Wide Tensor-Immediate)`            |

  : OPIYI III

* **OPI (Tensor Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Full-Name**                    |
  |:------------|:------------------------------------------------------|:---------------------------------|
  | `yzext.vf8` | `31..26=0x12 vm ys2 19..15=2 14..12=0x2 yd 6..0=0x57` | `Tensor Zero-Extend by Factor 8` |
  | `ysext.vf8` | `31..26=0x12 vm ys2 19..15=3 14..12=0x2 yd 6..0=0x57` | `Tensor Sign-Extend by Factor 8` |
  | `yzext.vf4` | `31..26=0x12 vm ys2 19..15=4 14..12=0x2 yd 6..0=0x57` | `Tensor Zero-Extend by Factor 4` |
  | `ysext.vf4` | `31..26=0x12 vm ys2 19..15=5 14..12=0x2 yd 6..0=0x57` | `Tensor Sign-Extend by Factor 4` |
  | `yzext.vf2` | `31..26=0x12 vm ys2 19..15=6 14..12=0x2 yd 6..0=0x57` | `Tensor Zero-Extend by Factor 2` |
  | `ysext.vf2` | `31..26=0x12 vm ys2 19..15=7 14..12=0x2 yd 6..0=0x57` | `Tensor Sign-Extend by Factor 2` |

  : Tensor Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Full-Name**         |
  |:---------------|:---------------------------------------------------|:----------------------|
  | `ycompress.vm` | `31..26=0x17 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Compress`     |
  | `ymandn.mm`    | `31..26=0x18 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Mask AND-NOT` |
  | `ymand.mm`     | `31..26=0x19 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Mask AND`     |
  | `ymor.mm`      | `31..26=0x1a 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Mask OR`      |
  | `ymxor.mm`     | `31..26=0x1b 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Mask XOR`     |
  | `ymorn.mm`     | `31..26=0x1c 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Mask OR-NOT`  |
  | `ymnand.mm`    | `31..26=0x1d 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Mask NAND`    |
  | `ymnor.mm`     | `31..26=0x1e 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Mask NOR`     |
  | `ymxnor.mm`    | `31..26=0x1f 25=1 ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Mask XNOR`    |

  : Tensor Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Full-Name**                     |
  |:-----------|:--------------------------------------------------------------|:----------------------------------|
  | `ymsbf.m`  | `31..26=0x14 vm ys2 19..15=0x01 14..12=0x2 yd 6..0=0x57`      | `Tensor Mask Set Before First`    |
  | `ymsof.m`  | `31..26=0x14 vm ys2 19..15=0x02 14..12=0x2 yd 6..0=0x57`      | `Tensor Mask Set Only First`      |
  | `ymsif.m`  | `31..26=0x14 vm ys2 19..15=0x03 14..12=0x2 yd 6..0=0x57`      | `Tensor Mask Set Including First` |
  | `yiota.m`  | `31..26=0x14 vm ys2 19..15=0x10 14..12=0x2 yd 6..0=0x57`      | `Tensor Mask Iota`                |
  | `yid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 yd 6..0=0x57` | `Tensor Element Index`            |
  | `ycpop.m`  | `31..26=0x10 vm ys2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `Tensor Mask Population Count`    |
  | `yfirst.m` | `31..26=0x10 vm ys2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `Tensor Mask Find First Set`      |

  : Tensor Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                       |
  |:-------------|:-------------------------------------------------|:------------------------------------------------------------------------------------|
  | `ydivu.vv`   | `31..26=0x20 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Divide Unsigned (Tensor-Tensor)`                                    |
  | `ydiv.vv`    | `31..26=0x21 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Divide Signed (Tensor-Tensor)`                                      |
  | `yremu.vv`   | `31..26=0x22 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Remainder Unsigned (Tensor-Tensor)`                                 |
  | `yrem.vv`    | `31..26=0x23 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Remainder Signed (Tensor-Tensor)`                                   |
  | `ymulhu.vv`  | `31..26=0x24 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Multiply High Unsigned (Tensor-Tensor)`                             |
  | `ymul.vv`    | `31..26=0x25 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Multiply Signed (Tensor-Tensor)`                                    |
  | `ymulhsu.vv` | `31..26=0x26 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Multiply High Signed-Unsigned (Tensor-Tensor)`                      |
  | `ymulh.vv`   | `31..26=0x27 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Multiply High Signed (Tensor-Tensor)`                               |
  | `ymadd.vv`   | `31..26=0x29 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Multiply-Add, Overwrite Multiplicand (Tensor-Tensor)`               |
  | `ynmsub.vv`  | `31..26=0x2b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Negative Multiply-Subtract, Overwrite Multiplicand (Tensor-Tensor)` |
  | `ymacc.vv`   | `31..26=0x2d vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Multiply-Accumulate (Tensor-Tensor)`                                |
  | `ynmsac.vv`  | `31..26=0x2f vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Negative Multiply-Subtract from Accumulator (Tensor-Tensor)`        |

  : Tensor Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                 |
  |:--------------|:-------------------------------------------------|:------------------------------------------------------------------------------|
  | `ywaddu.vv`   | `31..26=0x30 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Add Unsigned (Tensor-Tensor)`                        |
  | `ywadd.vv`    | `31..26=0x31 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Add Signed (Tensor-Tensor)`                          |
  | `ywsubu.vv`   | `31..26=0x32 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Subtract Unsigned (Tensor-Tensor)`                   |
  | `ywsub.vv`    | `31..26=0x33 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Subtract Signed (Tensor-Tensor)`                     |
  | `ywaddu.wv`   | `31..26=0x34 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Add Unsigned (Wide Tensor-Tensor)`                   |
  | `ywadd.wv`    | `31..26=0x35 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Add Signed (Wide Tensor-Tensor)`                     |
  | `ywsubu.wv`   | `31..26=0x36 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Subtract Unsigned (Wide Tensor-Tensor)`              |
  | `ywsub.wv`    | `31..26=0x37 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Subtract Signed (Wide Tensor-Tensor)`                |
  | `ywmulu.vv`   | `31..26=0x38 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Multiply Unsigned (Tensor-Tensor)`                   |
  | `ywmulsu.vv`  | `31..26=0x3a vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Multiply Signed-Unsigned (Tensor-Tensor)`            |
  | `ywmul.vv`    | `31..26=0x3b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Integer Multiply Signed (Tensor-Tensor)`                     |
  | `ywmaccu.vv`  | `31..26=0x3c vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Unsigned Integer Multiply-Accumulate (Tensor-Tensor)`        |
  | `ywmacc.vv`   | `31..26=0x3d vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Signed Integer Multiply-Accumulate (Tensor-Tensor)`          |
  | `ywmaccsu.vv` | `31..26=0x3f vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Widening Signed-Unsigned Integer Multiply-Accumulate (Tensor-Tensor)` |

  : Tensor Integer Extension Instructions V

**Tensor Mask Instructions**

* **OPMYY**

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                        |
  |:--------------|:-------------------------------------------------|:-----------------------------------------------------|
  | `yredsum.ys`  | `31..26=0x00 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Sum Reduction`                       |
  | `yredand.ys`  | `31..26=0x01 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer AND Reduction`                       |
  | `yredor.ys`   | `31..26=0x02 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer OR Reduction`                        |
  | `yredxor.ys`  | `31..26=0x03 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer XOR Reduction`                       |
  | `yredminu.ys` | `31..26=0x04 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Minimum Unsigned Reduction`          |
  | `yredmin.ys`  | `31..26=0x05 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Minimum Signed Reduction`            |
  | `yredmaxu.ys` | `31..26=0x06 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Maximum Unsigned Reduction`          |
  | `yredmax.ys`  | `31..26=0x07 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Integer Maximum Signed Reduction`            |
  | `yaaddu.vv`   | `31..26=0x08 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Averaging Add Unsigned (Tensor-Tensor)`      |
  | `yaadd.vv`    | `31..26=0x09 vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Averaging Add Signed (Tensor-Tensor)`        |
  | `yasubu.vv`   | `31..26=0x0a vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Averaging Subtract Unsigned (Tensor-Tensor)` |
  | `yasub.vv`    | `31..26=0x0b vm ys2 ys1 14..12=0x2 yd 6..0=0x57` | `Tensor Averaging Subtract Signed (Tensor-Tensor)`   |

  : OPMYY I

  | **Name**  | **Opcode / Argument**                                   | **Full-Name**                                  |
  |:----------|:--------------------------------------------------------|:-----------------------------------------------|
  | `ymv.x.s` | `31..26=0x10 25=1 ys2 19..15=0 14..12=0x2 rd 6..0=0x57` | `Tensor Move Tensor Element to Integer Scalar` |

  : OPMYY II

* **OPMYX**

  | **Name**    | **Opcode / Argument**                            | **Full-Name**                                        |
  |:------------|:-------------------------------------------------|:-----------------------------------------------------|
  | `yaaddu.vx` | `31..26=0x08 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Averaging Add Unsigned (Tensor-Scalar)`      |
  | `yaadd.vx`  | `31..26=0x09 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Averaging Add Signed (Tensor-Scalar)`        |
  | `yasubu.vx` | `31..26=0x0a vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Averaging Subtract Unsigned (Tensor-Scalar)` |
  | `yasub.vx`  | `31..26=0x0b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Averaging Subtract Signed (Tensor-Scalar)`   |

  : OPMYX I

  | **Name**         | **Opcode / Argument**                                   | **Full-Name**                                  |
  |:-----------------|:--------------------------------------------------------|:-----------------------------------------------|
  | `ymv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Move Integer Scalar to Tensor Element` |
  | `yslide1up.vx`   | `31..26=0x0e vm ys2 rs1 14..12=0x6 yd 6..0=0x57`        | `Tensor Slide One Up (Tensor-Scalar)`          |
  | `yslide1down.vx` | `31..26=0x0f vm ys2 rs1 14..12=0x6 yd 6..0=0x57`        | `Tensor Slide One Down (Tensor-Scalar)`        |

  : OPMYX II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                       |
  |:-------------|:-------------------------------------------------|:------------------------------------------------------------------------------------|
  | `ydivu.vx`   | `31..26=0x20 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Divide Unsigned (Tensor-Scalar)`                                    |
  | `ydiv.vx`    | `31..26=0x21 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Divide Signed (Tensor-Scalar)`                                      |
  | `yremu.vx`   | `31..26=0x22 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Remainder Unsigned (Tensor-Scalar)`                                 |
  | `yrem.vx`    | `31..26=0x23 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Remainder Signed (Tensor-Scalar)`                                   |
  | `ymulhu.vx`  | `31..26=0x24 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Multiply High Unsigned (Tensor-Scalar)`                             |
  | `ymul.vx`    | `31..26=0x25 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Multiply Signed (Tensor-Scalar)`                                    |
  | `ymulhsu.vx` | `31..26=0x26 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Multiply High Signed-Unsigned (Tensor-Scalar)`                      |
  | `ymulh.vx`   | `31..26=0x27 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Multiply High Signed (Tensor-Scalar)`                               |
  | `ymadd.vx`   | `31..26=0x29 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Multiply-Add, Overwrite Multiplicand (Tensor-Scalar)`               |
  | `ynmsub.vx`  | `31..26=0x2b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Negative Multiply-Subtract, Overwrite Multiplicand (Tensor-Scalar)` |
  | `ymacc.vx`   | `31..26=0x2d vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Multiply-Accumulate (Tensor-Scalar)`                                |
  | `ynmsac.vx`  | `31..26=0x2f vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Integer Negative Multiply-Subtract from Accumulator (Tensor-Scalar)`        |

  : OPMYX III

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                 |
  |:--------------|:-------------------------------------------------|:------------------------------------------------------------------------------|
  | `ywaddu.vx`   | `31..26=0x30 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Add Unsigned (Tensor-Scalar)`                        |
  | `ywadd.vx`    | `31..26=0x31 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Add Signed (Tensor-Scalar)`                          |
  | `ywsubu.vx`   | `31..26=0x32 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Subtract Unsigned (Tensor-Scalar)`                   |
  | `ywsub.vx`    | `31..26=0x33 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Subtract Signed (Tensor-Scalar)`                     |
  | `ywaddu.wx`   | `31..26=0x34 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Add Unsigned (Wide Tensor-Scalar)`                   |
  | `ywadd.wx`    | `31..26=0x35 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Add Signed (Wide Tensor-Scalar)`                     |
  | `ywsubu.wx`   | `31..26=0x36 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Subtract Unsigned (Wide Tensor-Scalar)`              |
  | `ywsub.wx`    | `31..26=0x37 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Subtract Signed (Wide Tensor-Scalar)`                |
  | `ywmulu.vx`   | `31..26=0x38 vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Multiply Unsigned (Tensor-Scalar)`                   |
  | `ywmulsu.vx`  | `31..26=0x3a vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Multiply Signed-Unsigned (Tensor-Scalar)`            |
  | `ywmul.vx`    | `31..26=0x3b vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Integer Multiply Signed (Tensor-Scalar)`                     |
  | `ywmaccu.vx`  | `31..26=0x3c vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Unsigned Integer Multiply-Accumulate (Tensor-Scalar)`        |
  | `ywmacc.vx`   | `31..26=0x3d vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Signed Integer Multiply-Accumulate (Tensor-Scalar)`          |
  | `ywmaccus.vx` | `31..26=0x3e vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Unsigned-Signed Integer Multiply-Accumulate (Tensor-Scalar)` |
  | `ywmaccsu.vx` | `31..26=0x3f vm ys2 rs1 14..12=0x6 yd 6..0=0x57` | `Tensor Widening Signed-Unsigned Integer Multiply-Accumulate (Tensor-Scalar)` |

  : OPMYX IV
