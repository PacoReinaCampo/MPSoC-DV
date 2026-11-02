## INSTRUCTION FULL-NAMES

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

**OPCFG (Configuration Setting)**

  | **Name**   | **Opcode / Argument**                              | **Full-Name**                                                    |
  |:-----------|:---------------------------------------------------|:-----------------------------------------------------------------|
  | `vsetivli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `Set Vector Length and Immediate Vector Type with Immediate AVL` |
  | `vsetvli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `Set Vector Length and Immediate Vector Type`                    |
  | `vsetvl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `Set Vector Length and Register Vector Type`                     |

  : Configuration Setting

**OPLS (Vector Loads and Store)**

* **Vector Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Full-Name**                                   |
  |:----------|:-----------------------------------------------------------------|:------------------------------------------------|
  | `vlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  vd 6..0=0x07` | `Vector Mask Load`                              |
  | `vsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27` | `Vector Mask Store`                             |
  | `vle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  vd 6..0=0x07`      | `Vector Unit-Stride Load with 8-Bit Elements`   |
  | `vle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  vd 6..0=0x07`      | `Vector Unit-Stride Load with 16-Bit Elements`  |
  | `vle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  vd 6..0=0x07`      | `Vector Unit-Stride Load with 32-Bit Elements`  |
  | `vle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  vd 6..0=0x07`      | `Vector Unit-Stride Load with 64-Bit Elements`  |
  | `vse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 vs3 6..0=0x27`      | `Vector Unit-Stride Store with 8-Bit Elements`  |
  | `vse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 vs3 6..0=0x27`      | `Vector Unit-Stride Store with 16-Bit Elements` |
  | `vse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 vs3 6..0=0x27`      | `Vector Unit-Stride Store with 32-Bit Elements` |
  | `vse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 vs3 6..0=0x27`      | `Vector Unit-Stride Store with 64-Bit Elements` |

  : Vector Unit-Stride Instructions (including segment part)

* **Vector Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Full-Name**                                        |
  |:-------------|:-------------------------------------------------------|:-----------------------------------------------------|
  | `vluxei8.v`  | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0  vd 6..0=0x07` | `Vector Indexed-Unordered Load with 8-Bit Indices`   |
  | `vluxei16.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5  vd 6..0=0x07` | `Vector Indexed-Unordered Load with 16-Bit Indices`  |
  | `vluxei32.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6  vd 6..0=0x07` | `Vector Indexed-Unordered Load with 32-Bit Indices`  |
  | `vluxei64.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7  vd 6..0=0x07` | `Vector Indexed-Unordered Load with 64-Bit Indices`  |
  | `vsuxei8.v`  | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27` | `Vector Indexed-Unordered Store with 8-Bit Indices`  |
  | `vsuxei16.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27` | `Vector Indexed-Unordered Store with 16-Bit Indices` |
  | `vsuxei32.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27` | `Vector Indexed-Unordered Store with 32-Bit Indices` |
  | `vsuxei64.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27` | `Vector Indexed-Unordered Store with 64-Bit Indices` |

  : Vector Indexed-Unordered Instructions (including segment part)

* **Vector Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Full-Name**                               |
  |:-----------|:-------------------------------------------------------|:--------------------------------------------|
  | `vlse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  vd 6..0=0x07` | `Vector Strided Load with 8-Bit Elements`   |
  | `vlse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  vd 6..0=0x07` | `Vector Strided Load with 16-Bit Elements`  |
  | `vlse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  vd 6..0=0x07` | `Vector Strided Load with 32-Bit Elements`  |
  | `vlse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  vd 6..0=0x07` | `Vector Strided Load with 64-Bit Elements`  |
  | `vsse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 vs3 6..0=0x27` | `Vector Strided Store with 8-Bit Elements`  |
  | `vsse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 vs3 6..0=0x27` | `Vector Strided Store with 16-Bit Elements` |
  | `vsse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 vs3 6..0=0x27` | `Vector Strided Store with 32-Bit Elements` |
  | `vsse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 vs3 6..0=0x27` | `Vector Strided Store with 64-Bit Elements` |

  : Vector Strided Instructions (including segment part)

* **Vector Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Full-Name**                                      |
  |:-------------|:-------------------------------------------------------|:---------------------------------------------------|
  | `vloxei8.v`  | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0  vd 6..0=0x07` | `Vector Indexed-Ordered Load with 8-Bit Indices`   |
  | `vloxei16.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5  vd 6..0=0x07` | `Vector Indexed-Ordered Load with 16-Bit Indices`  |
  | `vloxei32.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6  vd 6..0=0x07` | `Vector Indexed-Ordered Load with 32-Bit Indices`  |
  | `vloxei64.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7  vd 6..0=0x07` | `Vector Indexed-Ordered Load with 64-Bit Indices`  |
  | `vsoxei8.v`  | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27` | `Vector Indexed-Ordered Store with 8-Bit Indices`  |
  | `vsoxei16.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27` | `Vector Indexed-Ordered Store with 16-Bit Indices` |
  | `vsoxei32.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27` | `Vector Indexed-Ordered Store with 32-Bit Indices` |
  | `vsoxei64.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27` | `Vector Indexed-Ordered Store with 64-Bit Indices` |

  : Vector Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Full-Name**                                                   |
  |:------------|:---------------------------------------------------------------|:----------------------------------------------------------------|
  | `vle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  vd 6..0=0x07` | `Vector Unit-Stride Fault-Only-First Load with 8-Bit Elements`  |
  | `vle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  vd 6..0=0x07` | `Vector Unit-Stride Fault-Only-First Load with 16-Bit Elements` |
  | `vle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  vd 6..0=0x07` | `Vector Unit-Stride Fault-Only-First Load with 32-Bit Elements` |
  | `vle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  vd 6..0=0x07` | `Vector Unit-Stride Fault-Only-First Load with 64-Bit Elements` |

  : Unit-stride Fault-Only-First Loads

* **Vector Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Full-Name**                                                     |
  |:------------|:-----------------------------------------------------------------------|:------------------------------------------------------------------|
  | `vl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `Vector Load 1 Whole Register with 8-Bit Encoded Element Width`   |
  | `vl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `Vector Load 1 Whole Register with 16-Bit Encoded Element Width`  |
  | `vl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `Vector Load 1 Whole Register with 32-Bit Encoded Element Width`  |
  | `vl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `Vector Load 1 Whole Register with 64-Bit Encoded Element Width`  |
  | `vl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `Vector Load 2 Whole Registers with 8-Bit Encoded Element Width`  |
  | `vl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `Vector Load 2 Whole Registers with 16-Bit Encoded Element Width` |
  | `vl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `Vector Load 2 Whole Registers with 32-Bit Encoded Element Width` |
  | `vl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `Vector Load 2 Whole Registers with 64-Bit Encoded Element Width` |
  | `vl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `Vector Load 4 Whole Registers with 8-Bit Encoded Element Width`  |
  | `vl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `Vector Load 4 Whole Registers with 16-Bit Encoded Element Width` |
  | `vl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `Vector Load 4 Whole Registers with 32-Bit Encoded Element Width` |
  | `vl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `Vector Load 4 Whole Registers with 64-Bit Encoded Element Width` |
  | `vl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `Vector Load 8 Whole Registers with 8-Bit Encoded Element Width`  |
  | `vl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `Vector Load 8 Whole Registers with 16-Bit Encoded Element Width` |
  | `vl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `Vector Load 8 Whole Registers with 32-Bit Encoded Element Width` |
  | `vl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `Vector Load 8 Whole Registers with 64-Bit Encoded Element Width` |
  | `vs1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `Vector Store 1 Whole Register`                                   |
  | `vs2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `Vector Store 2 Whole Registers`                                  |
  | `vs4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `Vector Store 4 Whole Registers`                                  |
  | `vs8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `Vector Store 8 Whole Registers`                                  |

  : Vector Load/Store Whole Registers

**Vector Float-Point Instructions**

* **OPFVF**

  | **Name**          | **Opcode / Argument**                                   | **Full-Name**                                                  |
  |:------------------|:--------------------------------------------------------|:---------------------------------------------------------------|
  | `vfadd.vf`        | `31..26=0x00 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Add (Vector-Scalar)`                    |
  | `vfsub.vf`        | `31..26=0x02 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Subtract (Vector-Scalar)`               |
  | `vfmin.vf`        | `31..26=0x04 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Minimum (Vector-Scalar)`                |
  | `vfmax.vf`        | `31..26=0x06 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Maximum (Vector-Scalar)`                |
  | `vfsgnj.vf`       | `31..26=0x08 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Sign Injection (Vector-Scalar)`         |
  | `vfsgnjn.vf`      | `31..26=0x09 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Negated Sign Injection (Vector-Scalar)` |
  | `vfsgnjx.vf`      | `31..26=0x0a vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point XOR Sign Injection (Vector-Scalar)`     |
  | `vfslide1up.vf`   | `31..26=0x0e vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Slide One Up (Vector-Scalar)`           |
  | `vfslide1down.vf` | `31..26=0x0f vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Slide One Down (Vector-Scalar)`         |
  | `vfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Move Floating-Point Scalar to Vector Element`          |

  : OPFVF I

  | **Name**      | **Opcode / Argument**                                   | **Full-Name**                                                         |
  |:--------------|:--------------------------------------------------------|:----------------------------------------------------------------------|
  | `vfmerge.vfm` | `31..26=0x17 25=0 vs2 rs1 14..12=0x5 vd 6..0=0x57`      | `Vector Floating-Point Merge (Vector-Scalar)`                         |
  | `vfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Broadcast Floating-Point Scalar`                              |
  | `vmfeq.vf`    | `31..26=0x18 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Compare Equal (Vector-Scalar)`                 |
  | `vmfle.vf`    | `31..26=0x19 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Compare Less Than or Equal (Vector-Scalar)`    |
  | `vmflt.vf`    | `31..26=0x1b vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Compare Less Than (Vector-Scalar)`             |
  | `vmfne.vf`    | `31..26=0x1c vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Compare Not Equal (Vector-Scalar)`             |
  | `vmfgt.vf`    | `31..26=0x1d vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Compare Greater Than (Vector-Scalar)`          |
  | `vmfge.vf`    | `31..26=0x1f vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Vector Floating-Point Compare Greater Than or Equal (Vector-Scalar)` |

  : OPFVF II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                                    |
  |:-------------|:-------------------------------------------------|:-------------------------------------------------------------------------------------------------|
  | `vfdiv.vf`   | `31..26=0x20 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Divide (Vector-Scalar)`                                                   |
  | `vfrdiv.vf`  | `31..26=0x21 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Reverse Divide (Vector-Scalar)`                                           |
  | `vfmul.vf`   | `31..26=0x24 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Multiply (Vector-Scalar)`                                                 |
  | `vfrsub.vf`  | `31..26=0x27 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Reverse Subtract (Vector-Scalar)`                                         |
  | `vfmadd.vf`  | `31..26=0x28 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Fused Multiply-Add, Overwrite Multiplicand (Vector-Scalar)`               |
  | `vfnmadd.vf` | `31..26=0x29 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Fused Negative Multiply-Add, Overwrite Multiplicand (Vector-Scalar)`      |
  | `vfmsub.vf`  | `31..26=0x2a vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Fused Multiply-Subtract, Overwrite Multiplicand (Vector-Scalar)`          |
  | `vfnmsub.vf` | `31..26=0x2b vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Fused Negative Multiply-Subtract, Overwrite Multiplicand (Vector-Scalar)` |
  | `vfmacc.vf`  | `31..26=0x2c vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Fused Multiply-Accumulate (Vector-Scalar)`                                |
  | `vfnmacc.vf` | `31..26=0x2d vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Fused Negative Multiply-Accumulate (Vector-Scalar)`                       |
  | `vfmsac.vf`  | `31..26=0x2e vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Fused Multiply-Subtract Accumulator (Vector-Scalar)`                      |
  | `vfnmsac.vf` | `31..26=0x2f vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Floating-Point Fused Negative Multiply-Subtract Accumulator (Vector-Scalar)`             |

  : OPFVF III

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                                 |
  |:--------------|:-------------------------------------------------|:----------------------------------------------------------------------------------------------|
  | `vfwadd.vf`   | `31..26=0x30 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Add (Vector-Scalar)`                                          |
  | `vfwsub.vf`   | `31..26=0x32 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Subtract (Vector-Scalar)`                                     |
  | `vfwadd.wf`   | `31..26=0x34 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Add (Wide Vector-Scalar)`                                     |
  | `vfwsub.wf`   | `31..26=0x36 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Subtract (Wide Vector-Scalar)`                                |
  | `vfwmul.vf`   | `31..26=0x38 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Multiply (Vector-Scalar)`                                     |
  | `vfwmacc.vf`  | `31..26=0x3c vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Fused Multiply-Accumulate (Vector-Scalar)`                    |
  | `vfwnmacc.vf` | `31..26=0x3d vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Fused Negative Multiply-Accumulate (Vector-Scalar)`           |
  | `vfwmsac.vf`  | `31..26=0x3e vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Fused Multiply-Subtract Accumulator (Vector-Scalar)`          |
  | `vfwnmsac.vf` | `31..26=0x3f vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Vector Widening Floating-Point Fused Negative Multiply-Subtract Accumulator (Vector-Scalar)` |

  : OPFVF IV

* **OPFVV**

  | **Name**       | **Opcode / Argument**                                   | **Full-Name**                                                  |
  |:---------------|:--------------------------------------------------------|:---------------------------------------------------------------|
  | `vfadd.vv`     | `31..26=0x00 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Add (Vector-Vector)`                    |
  | `vfredusum.vs` | `31..26=0x01 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Unordered Sum Reduction`                |
  | `vfsub.vv`     | `31..26=0x02 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Subtract (Vector-Vector)`               |
  | `vfredosum.vs` | `31..26=0x03 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Ordered Sum Reduction`                  |
  | `vfmin.vv`     | `31..26=0x04 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Minimum (Vector-Vector)`                |
  | `vfredmin.vs`  | `31..26=0x05 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Minimum Reduction`                      |
  | `vfmax.vv`     | `31..26=0x06 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Maximum (Vector-Vector)`                |
  | `vfredmax.vs`  | `31..26=0x07 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Maximum Reduction`                      |
  | `vfsgnj.vv`    | `31..26=0x08 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Sign Injection (Vector-Vector)`         |
  | `vfsgnjn.vv`   | `31..26=0x09 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point Negated Sign Injection (Vector-Vector)` |
  | `vfsgnjx.vv`   | `31..26=0x0a vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Vector Floating-Point XOR Sign Injection (Vector-Vector)`     |
  | `vfmv.f.s`     | `31..26=0x10 25=1 vs2 19..15=0 14..12=0x1 rd 6..0=0x57` | `Vector Move Vector Element to Floating-Point Scalar`          |

  : OPFVV I

  | **Name**   | **Opcode / Argument**                            | **Full-Name**                                                      |
  |:-----------|:-------------------------------------------------|:-------------------------------------------------------------------|
  | `vmfeq.vv` | `31..26=0x18 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Compare Equal (Vector-Vector)`              |
  | `vmfle.vv` | `31..26=0x19 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Compare Less Than or Equal (Vector-Vector)` |
  | `vmflt.vv` | `31..26=0x1b vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Compare Less Than (Vector-Vector)`          |
  | `vmfne.vv` | `31..26=0x1c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Compare Not Equal (Vector-Vector)`          |

  : OPFVV II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                                    |
  |:-------------|:-------------------------------------------------|:-------------------------------------------------------------------------------------------------|
  | `vfdiv.vv`   | `31..26=0x20 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Divide (Vector-Vector)`                                                   |
  | `vfmul.vv`   | `31..26=0x24 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Multiply (Vector-Vector)`                                                 |
  | `vfmadd.vv`  | `31..26=0x28 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Fused Multiply-Add, Overwrite Multiplicand (Vector-Vector)`               |
  | `vfnmadd.vv` | `31..26=0x29 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Fused Negative Multiply-Add, Overwrite Multiplicand (Vector-Vector)`      |
  | `vfmsub.vv`  | `31..26=0x2a vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Fused Multiply-Subtract, Overwrite Multiplicand (Vector-Vector)`          |
  | `vfnmsub.vv` | `31..26=0x2b vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Fused Negative Multiply-Subtract, Overwrite Multiplicand (Vector-Vector)` |
  | `vfmacc.vv`  | `31..26=0x2c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Fused Multiply-Accumulate (Vector-Vector)`                                |
  | `vfnmacc.vv` | `31..26=0x2d vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Fused Negative Multiply-Accumulate (Vector-Vector)`                       |
  | `vfmsac.vv`  | `31..26=0x2e vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Fused Multiply-Subtract Accumulator (Vector-Vector)`                      |
  | `vfnmsac.vv` | `31..26=0x2f vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Fused Negative Multiply-Subtract Accumulator (Vector-Vector)`             |

  : OPFVV III

  | **Name**           | **Opcode / Argument**                                    | **Full-Name**                                                              |
  |:-------------------|:---------------------------------------------------------|:---------------------------------------------------------------------------|
  | `vfcvt.xu.f.v`     | `31..26=0x12 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57` | `Vector Convert Floating-Point to Unsigned Integer`                        |
  | `vfcvt.x.f.v`      | `31..26=0x12 vm vs2 19..15=0x01 14..12=0x1 vd 6..0=0x57` | `Vector Convert Floating-Point to Signed Integer`                          |
  | `vfcvt.f.xu.v`     | `31..26=0x12 vm vs2 19..15=0x02 14..12=0x1 vd 6..0=0x57` | `Vector Convert Unsigned Integer to Floating-Point`                        |
  | `vfcvt.f.x.v`      | `31..26=0x12 vm vs2 19..15=0x03 14..12=0x1 vd 6..0=0x57` | `Vector Convert Signed Integer to Floating-Point`                          |
  | `vfcvt.rtz.xu.f.v` | `31..26=0x12 vm vs2 19..15=0x06 14..12=0x1 vd 6..0=0x57` | `Vector Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `vfcvt.rtz.x.f.v`  | `31..26=0x12 vm vs2 19..15=0x07 14..12=0x1 vd 6..0=0x57` | `Vector Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFVV IV

  | **Name**            | **Opcode / Argument**                                    | **Full-Name**                                                                       |
  |:--------------------|:---------------------------------------------------------|:------------------------------------------------------------------------------------|
  | `vfwcvt.xu.f.v`     | `31..26=0x12 vm vs2 19..15=0x08 14..12=0x1 vd 6..0=0x57` | `Vector Widening Convert Floating-Point to Unsigned Integer`                        |
  | `vfwcvt.x.f.v`      | `31..26=0x12 vm vs2 19..15=0x09 14..12=0x1 vd 6..0=0x57` | `Vector Widening Convert Floating-Point to Signed Integer`                          |
  | `vfwcvt.f.xu.v`     | `31..26=0x12 vm vs2 19..15=0x0A 14..12=0x1 vd 6..0=0x57` | `Vector Widening Convert Unsigned Integer to Floating-Point`                        |
  | `vfwcvt.f.x.v`      | `31..26=0x12 vm vs2 19..15=0x0B 14..12=0x1 vd 6..0=0x57` | `Vector Widening Convert Signed Integer to Floating-Point`                          |
  | `vfwcvt.f.f.v`      | `31..26=0x12 vm vs2 19..15=0x0C 14..12=0x1 vd 6..0=0x57` | `Vector Widening Convert Floating-Point to Floating-Point`                          |
  | `vfwcvt.rtz.xu.f.v` | `31..26=0x12 vm vs2 19..15=0x0E 14..12=0x1 vd 6..0=0x57` | `Vector Widening Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `vfwcvt.rtz.x.f.v`  | `31..26=0x12 vm vs2 19..15=0x0F 14..12=0x1 vd 6..0=0x57` | `Vector Widening Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFVV V

  | **Name**            | **Opcode / Argument**                                    | **Full-Name**                                                                        |
  |:--------------------|:---------------------------------------------------------|:-------------------------------------------------------------------------------------|
  | `vfncvt.xu.f.w`     | `31..26=0x12 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57` | `Vector Narrowing Convert Floating-Point to Unsigned Integer`                        |
  | `vfncvt.x.f.w`      | `31..26=0x12 vm vs2 19..15=0x11 14..12=0x1 vd 6..0=0x57` | `Vector Narrowing Convert Floating-Point to Signed Integer`                          |
  | `vfncvt.f.xu.w`     | `31..26=0x12 vm vs2 19..15=0x12 14..12=0x1 vd 6..0=0x57` | `Vector Narrowing Convert Unsigned Integer to Floating-Point`                        |
  | `vfncvt.f.x.w`      | `31..26=0x12 vm vs2 19..15=0x13 14..12=0x1 vd 6..0=0x57` | `Vector Narrowing Convert Signed Integer to Floating-Point`                          |
  | `vfncvt.f.f.w`      | `31..26=0x12 vm vs2 19..15=0x14 14..12=0x1 vd 6..0=0x57` | `Vector Narrowing Convert Floating-Point to Floating-Point`                          |
  | `vfncvt.rod.f.f.w`  | `31..26=0x12 vm vs2 19..15=0x15 14..12=0x1 vd 6..0=0x57` | `Vector Narrowing Convert Floating-Point to Floating-Point with Round to Odd`        |
  | `vfncvt.rtz.xu.f.w` | `31..26=0x12 vm vs2 19..15=0x16 14..12=0x1 vd 6..0=0x57` | `Vector Narrowing Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `vfncvt.rtz.x.f.w`  | `31..26=0x12 vm vs2 19..15=0x17 14..12=0x1 vd 6..0=0x57` | `Vector Narrowing Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFVV VI

  | **Name**     | **Opcode / Argument**                                    | **Full-Name**                                                     |
  |:-------------|:---------------------------------------------------------|:------------------------------------------------------------------|
  | `vfsqrt.v`   | `31..26=0x13 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Square Root`                               |
  | `vfrsqrt7.v` | `31..26=0x13 vm vs2 19..15=0x04 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Reciprocal Square-Root Estimate to 7 Bits` |
  | `vfrec7.v`   | `31..26=0x13 vm vs2 19..15=0x05 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Reciprocal Estimate to 7 Bits`             |
  | `vfclass.v`  | `31..26=0x13 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57` | `Vector Floating-Point Classify`                                  |

  : OPFVV VII

  | **Name**        | **Opcode / Argument**                            | **Full-Name**                                                                                 |
  |:----------------|:-------------------------------------------------|:----------------------------------------------------------------------------------------------|
  | `vfwadd.vv`     | `31..26=0x30 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Add (Vector-Vector)`                                          |
  | `vfwredusum.vs` | `31..26=0x31 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Unordered Sum Reduction`                                      |
  | `vfwsub.vv`     | `31..26=0x32 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Subtract (Vector-Vector)`                                     |
  | `vfwredosum.vs` | `31..26=0x33 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Ordered Sum Reduction`                                        |
  | `vfwadd.wv`     | `31..26=0x34 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Add (Wide Vector-Vector)`                                     |
  | `vfwsub.wv`     | `31..26=0x36 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Subtract (Wide Vector-Vector)`                                |
  | `vfwmul.vv`     | `31..26=0x38 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Multiply (Vector-Vector)`                                     |
  | `vfwmacc.vv`    | `31..26=0x3c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Fused Multiply-Accumulate (Vector-Vector)`                    |
  | `vfwnmacc.vv`   | `31..26=0x3d vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Fused Negative Multiply-Accumulate (Vector-Vector)`           |
  | `vfwmsac.vv`    | `31..26=0x3e vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Fused Multiply-Subtract Accumulator (Vector-Vector)`          |
  | `vfwnmsac.vv`   | `31..26=0x3f vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Vector Widening Floating-Point Fused Negative Multiply-Subtract Accumulator (Vector-Vector)` |

  : OPFVV VIII

**Vector Integer Instructions**

* **OPIVX**

  | **Name**        | **Opcode / Argument**                            | **Full-Name**                                     |
  |:----------------|:-------------------------------------------------|:--------------------------------------------------|
  | `vadd.vx`       | `31..26=0x00 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Add (Vector-Scalar)`              |
  | `vsub.vx`       | `31..26=0x02 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Subtract (Vector-Scalar)`         |
  | `vrsub.vx`      | `31..26=0x03 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Reverse Subtract (Vector-Scalar)` |
  | `vminu.vx`      | `31..26=0x04 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Min Unsigned (Vector-Scalar)`     |
  | `vmin.vx`       | `31..26=0x05 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Min Signed (Vector-Scalar)`       |
  | `vmaxu.vx`      | `31..26=0x06 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Max Unsigned (Vector-Scalar)`     |
  | `vmax.vx`       | `31..26=0x07 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Max Signed (Vector-Scalar)`       |
  | `vand.vx`       | `31..26=0x09 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Bitwise AND (Vector-Scalar)`              |
  | `vor.vx`        | `31..26=0x0a vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Bitwise OR (Vector-Scalar)`               |
  | `vxor.vx`       | `31..26=0x0b vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Bitwise XOR (Vector-Scalar)`              |
  | `vrgather.vx`   | `31..26=0x0c vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Register Gather (Vector-Scalar)`          |
  | `vslideup.vx`   | `31..26=0x0e vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Slide Up (Vector-Scalar)`                 |
  | `vslidedown.vx` | `31..26=0x0f vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Slide Down (Vector-Scalar)`               |

  : OPIVX I

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                                |
  |:-------------|:--------------------------------------------------------|:-----------------------------------------------------------------------------|
  | `vadc.vxm`   | `31..26=0x10 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Vector Integer Add with Carry (Vector-Scalar with Mask Carry Input)`        |
  | `vmadc.vxm`  | `31..26=0x11 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Vector Integer Add Carry-Out (Vector-Scalar with Mask Carry Input)`         |
  | `vmadc.vx`   | `31..26=0x11 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Vector Integer Add Carry-Out (Vector-Scalar)`                               |
  | `vsbc.vxm`   | `31..26=0x12 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Vector Integer Subtract with Borrow (Vector-Scalar with Mask Borrow Input)` |
  | `vmsbc.vxm`  | `31..26=0x13 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Vector Integer Subtract Borrow-Out (Vector-Scalar with Mask Borrow Input)`  |
  | `vmsbc.vx`   | `31..26=0x13 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Vector Integer Subtract Borrow-Out (Vector-Scalar)`                         |
  | `vmerge.vxm` | `31..26=0x17 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Vector Integer Merge (Vector-Scalar)`                                       |
  | `vmv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Broadcast Integer Scalar`                                            |
  | `vmseq.vx`   | `31..26=0x18 vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Vector Integer Compare Equal (Vector-Scalar)`                               |
  | `vmsne.vx`   | `31..26=0x19 vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Vector Integer Compare Not Equal (Vector-Scalar)`                           |
  | `vmsltu.vx`  | `31..26=0x1a vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Vector Integer Compare Less Than Unsigned (Vector-Scalar)`                  |
  | `vmslt.vx`   | `31..26=0x1b vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Vector Integer Compare Less Than Signed (Vector-Scalar)`                    |
  | `vmsleu.vx`  | `31..26=0x1c vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Vector Integer Compare Less Than or Equal Unsigned (Vector-Scalar)`         |
  | `vmsle.vx`   | `31..26=0x1d vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Vector Integer Compare Less Than or Equal Signed (Vector-Scalar)`           |
  | `vmsgtu.vx`  | `31..26=0x1e vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Vector Integer Compare Greater Than Unsigned (Vector-Scalar)`               |
  | `vmsgt.vx`   | `31..26=0x1f vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Vector Integer Compare Greater Than Signed (Vector-Scalar)`                 |

  : OPIVX II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                    |
  |:-------------|:-------------------------------------------------|:---------------------------------------------------------------------------------|
  | `vsaddu.vx`  | `31..26=0x20 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Saturating Add Unsigned (Vector-Scalar)`                         |
  | `vsadd.vx`   | `31..26=0x21 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Saturating Add Signed (Vector-Scalar)`                           |
  | `vssubu.vx`  | `31..26=0x22 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Saturating Subtract Unsigned (Vector-Scalar)`                    |
  | `vssub.vx`   | `31..26=0x23 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Integer Saturating Subtract Signed (Vector-Scalar)`                      |
  | `vsll.vx`    | `31..26=0x25 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Shift Left Logical (Vector-Scalar)`                                      |
  | `vsmul.vx`   | `31..26=0x27 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Signed Fractional Multiply with Rounding and Saturation (Vector-Scalar)` |
  | `vsrl.vx`    | `31..26=0x28 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Shift Right Logical (Vector-Scalar)`                                     |
  | `vsra.vx`    | `31..26=0x29 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Shift Right Arithmetic (Vector-Scalar)`                                  |
  | `vssrl.vx`   | `31..26=0x2a vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Scaling Shift Right Unsigned (Vector-Scalar)`                            |
  | `vssra.vx`   | `31..26=0x2b vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Scaling Shift Right Signed (Vector-Scalar)`                              |
  | `vnsrl.wx`   | `31..26=0x2c vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Narrowing Shift Right Logical (Wide Vector-Scalar)`                      |
  | `vnsra.wx`   | `31..26=0x2d vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Narrowing Shift Right Arithmetic (Wide Vector-Scalar)`                   |
  | `vnclipu.wx` | `31..26=0x2e vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Narrowing Clip Unsigned (Wide Vector-Scalar)`                            |
  | `vnclip.wx`  | `31..26=0x2f vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Vector Narrowing Clip Signed (Wide Vector-Scalar)`                              |

  : OPIVX III

* **OPIVV**

  | **Name**          | **Opcode / Argument**                            | **Full-Name**                                                        |
  |:------------------|:-------------------------------------------------|:---------------------------------------------------------------------|
  | `vadd.vv`         | `31..26=0x00 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Add (Vector-Vector)`                                 |
  | `vsub.vv`         | `31..26=0x02 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Subtract (Vector-Vector)`                            |
  | `vminu.vv`        | `31..26=0x04 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Min Unsigned (Vector-Vector)`                        |
  | `vmin.vv`         | `31..26=0x05 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Min Signed (Vector-Vector)`                          |
  | `vmaxu.vv`        | `31..26=0x06 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Max Unsigned (Vector-Vector)`                        |
  | `vmax.vv`         | `31..26=0x07 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Max Signed (Vector-Vector)`                          |
  | `vand.vv`         | `31..26=0x09 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Bitwise AND (Vector-Vector)`                                 |
  | `vor.vv`          | `31..26=0x0a vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Bitwise OR (Vector-Vector)`                                  |
  | `vxor.vv`         | `31..26=0x0b vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Bitwise XOR (Vector-Vector)`                                 |
  | `vrgather.vv`     | `31..26=0x0c vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Register Gather (Vector-Vector)`                             |
  | `vrgatherei16.vv` | `31..26=0x0e vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Register Gather with 16-Bit Element Indices (Vector-Vector)` |

  : OPIVV I

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                                |
  |:-------------|:--------------------------------------------------------|:-----------------------------------------------------------------------------|
  | `vadc.vvm`   | `31..26=0x10 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Vector Integer Add with Carry (Vector-Vector with Mask Carry Input)`        |
  | `vmadc.vvm`  | `31..26=0x11 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Vector Integer Add Carry-Out (Vector-Vector with Mask Carry Input)`         |
  | `vmadc.vv`   | `31..26=0x11 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Vector Integer Add Carry-Out (Vector-Vector)`                               |
  | `vsbc.vvm`   | `31..26=0x12 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Vector Integer Subtract with Borrow (Vector-Vector with Mask Borrow Input)` |
  | `vmsbc.vvm`  | `31..26=0x13 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Vector Integer Subtract Borrow-Out (Vector-Vector with Mask Borrow Input)`  |
  | `vmsbc.vv`   | `31..26=0x13 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Vector Integer Subtract Borrow-Out (Vector-Vector)`                         |
  | `vmerge.vvm` | `31..26=0x17 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Vector Integer Merge (Vector-Vector)`                                       |
  | `vmv.v.v`    | `31..26=0x17 25=1 24..20=0 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Move Vector Elements`                                                |
  | `vmseq.vv`   | `31..26=0x18 vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Vector Integer Compare Equal (Vector-Vector)`                               |
  | `vmsne.vv`   | `31..26=0x19 vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Vector Integer Compare Not Equal (Vector-Vector)`                           |
  | `vmsltu.vv`  | `31..26=0x1a vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Vector Integer Compare Less Than Unsigned (Vector-Vector)`                  |
  | `vmslt.vv`   | `31..26=0x1b vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Vector Integer Compare Less Than Signed (Vector-Vector)`                    |
  | `vmsleu.vv`  | `31..26=0x1c vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Vector Integer Compare Less Than or Equal Unsigned (Vector-Vector)`         |
  | `vmsle.vv`   | `31..26=0x1d vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Vector Integer Compare Less Than or Equal Signed (Vector-Vector)`           |

  : OPIVV II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                    |
  |:-------------|:-------------------------------------------------|:---------------------------------------------------------------------------------|
  | `vsaddu.vv`  | `31..26=0x20 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Saturating Add Unsigned (Vector-Vector)`                         |
  | `vsadd.vv`   | `31..26=0x21 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Saturating Add Signed (Vector-Vector)`                           |
  | `vssubu.vv`  | `31..26=0x22 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Saturating Subtract Unsigned (Vector-Vector)`                    |
  | `vssub.vv`   | `31..26=0x23 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Integer Saturating Subtract Signed (Vector-Vector)`                      |
  | `vsll.vv`    | `31..26=0x25 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Shift Left Logical (Vector-Vector)`                                      |
  | `vsmul.vv`   | `31..26=0x27 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Signed Fractional Multiply with Rounding and Saturation (Vector-Vector)` |
  | `vsrl.vv`    | `31..26=0x28 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Shift Right Logical (Vector-Vector)`                                     |
  | `vsra.vv`    | `31..26=0x29 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Shift Right Arithmetic (Vector-Vector)`                                  |
  | `vssrl.vv`   | `31..26=0x2a vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Scaling Shift Right Unsigned (Vector-Vector)`                            |
  | `vssra.vv`   | `31..26=0x2b vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Scaling Shift Right Signed (Vector-Vector)`                              |
  | `vnsrl.wv`   | `31..26=0x2c vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Narrowing Shift Right Logical (Wide Vector-Vector)`                      |
  | `vnsra.wv`   | `31..26=0x2d vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Narrowing Shift Right Arithmetic (Wide Vector-Vector)`                   |
  | `vnclipu.wv` | `31..26=0x2e vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Narrowing Clip Unsigned (Wide Vector-Vector)`                            |
  | `vnclip.wv`  | `31..26=0x2f vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Narrowing Clip Signed (Wide Vector-Vector)`                              |

  : OPIVV III

  | **Name**       | **Opcode / Argument**                            | **Full-Name**                                    |
  |:---------------|:-------------------------------------------------|:-------------------------------------------------|
  | `vwredsumu.vs` | `31..26=0x30 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Widening Integer Sum Unsigned Reduction` |
  | `vwredsum.vs`  | `31..26=0x31 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Vector Widening Integer Sum Reduction`          |

  : OPIVV IV

* **OPIVI**

  | **Name**        | **Opcode / Argument**                              | **Full-Name**                                        |
  |:----------------|:---------------------------------------------------|:-----------------------------------------------------|
  | `vadd.vi`       | `31..26=0x00 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Integer Add (Vector-Immediate)`              |
  | `vrsub.vi`      | `31..26=0x03 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Integer Reverse Subtract (Vector-Immediate)` |
  | `vand.vi`       | `31..26=0x09 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Bitwise AND (Vector-Immediate)`              |
  | `vor.vi`        | `31..26=0x0a vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Bitwise OR (Vector-Immediate)`               |
  | `vxor.vi`       | `31..26=0x0b vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Bitwise XOR (Vector-Immediate)`              |
  | `vrgather.vi`   | `31..26=0x0c vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Register Gather (Vector-Immediate)`          |
  | `vslideup.vi`   | `31..26=0x0e vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Slide Up (Vector-Immediate)`                 |
  | `vslidedown.vi` | `31..26=0x0f vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Slide Down (Vector-Immediate)`               |

  : OPIVI I

  | **Name**     | **Opcode / Argument**                                     | **Full-Name**                                                            |
  |:-------------|:----------------------------------------------------------|:-------------------------------------------------------------------------|
  | `vadc.vim`   | `31..26=0x10 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Integer Add with Carry (Vector-Immediate with Mask Carry Input)` |
  | `vmadc.vim`  | `31..26=0x11 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Integer Add Carry-Out (Vector-Immediate with Mask Carry Input)`  |
  | `vmadc.vi`   | `31..26=0x11 25=1 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Integer Add Carry-Out (Vector-Immediate)`                        |
  | `vmerge.vim` | `31..26=0x17 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Integer Merge (Vector-Immediate)`                                |
  | `vmv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 vd 6..0=0x57` | `Vector Broadcast Signed Immediate`                                      |
  | `vmseq.vi`   | `31..26=0x18 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Vector Integer Compare Equal (Vector-Immediate)`                        |
  | `vmsne.vi`   | `31..26=0x19 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Vector Integer Compare Not Equal (Vector-Immediate)`                    |
  | `vmsleu.vi`  | `31..26=0x1c vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Vector Integer Compare Less Than or Equal Unsigned (Vector-Immediate)`  |
  | `vmsle.vi`   | `31..26=0x1d vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Vector Integer Compare Less Than or Equal Signed (Vector-Immediate)`    |
  | `vmsgtu.vi`  | `31..26=0x1e vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Vector Integer Compare Greater Than Unsigned (Vector-Immediate)`        |
  | `vmsgt.vi`   | `31..26=0x1f vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Vector Integer Compare Greater Than Signed (Vector-Immediate)`          |

  : OPIVI II

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                     |
  |:-------------|:--------------------------------------------------------|:------------------------------------------------------------------|
  | `vsaddu.vi`  | `31..26=0x20 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Integer Saturating Add Unsigned (Vector-Immediate)`       |
  | `vsadd.vi`   | `31..26=0x21 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Integer Saturating Add Signed (Vector-Immediate)`         |
  | `vsll.vi`    | `31..26=0x25 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Shift Left Logical (Vector-Immediate)`                    |
  | `vmv1r.v`    | `31..26=0x27 25=1 vs2 19..15=0 14..12=0x3 vd 6..0=0x57` | `Vector Move 1 Whole Register`                                    |
  | `vmv2r.v`    | `31..26=0x27 25=1 vs2 19..15=1 14..12=0x3 vd 6..0=0x57` | `Vector Move 2 Whole Registers`                                   |
  | `vmv4r.v`    | `31..26=0x27 25=1 vs2 19..15=3 14..12=0x3 vd 6..0=0x57` | `Vector Move 4 Whole Registers`                                   |
  | `vmv8r.v`    | `31..26=0x27 25=1 vs2 19..15=7 14..12=0x3 vd 6..0=0x57` | `Vector Move 8 Whole Registers`                                   |
  | `vsrl.vi`    | `31..26=0x28 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Shift Right Logical (Vector-Immediate)`                   |
  | `vsra.vi`    | `31..26=0x29 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Shift Right Arithmetic (Vector-Immediate)`                |
  | `vssrl.vi`   | `31..26=0x2a vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Scaling Shift Right Unsigned (Vector-Immediate)`          |
  | `vssra.vi`   | `31..26=0x2b vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Scaling Shift Right Signed (Vector-Immediate)`            |
  | `vnsrl.wi`   | `31..26=0x2c vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Narrowing Shift Right Logical (Wide Vector-Immediate)`    |
  | `vnsra.wi`   | `31..26=0x2d vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Narrowing Shift Right Arithmetic (Wide Vector-Immediate)` |
  | `vnclipu.wi` | `31..26=0x2e vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Narrowing Clip Unsigned (Wide Vector-Immediate)`          |
  | `vnclip.wi`  | `31..26=0x2f vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Vector Narrowing Clip Signed (Wide Vector-Immediate)`            |

  : OPIVI III

* **OPI (Vector Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Full-Name**                    |
  |:------------|:------------------------------------------------------|:---------------------------------|
  | `vzext.vf8` | `31..26=0x12 vm vs2 19..15=2 14..12=0x2 vd 6..0=0x57` | `Vector Zero-Extend by Factor 8` |
  | `vsext.vf8` | `31..26=0x12 vm vs2 19..15=3 14..12=0x2 vd 6..0=0x57` | `Vector Sign-Extend by Factor 8` |
  | `vzext.vf4` | `31..26=0x12 vm vs2 19..15=4 14..12=0x2 vd 6..0=0x57` | `Vector Zero-Extend by Factor 4` |
  | `vsext.vf4` | `31..26=0x12 vm vs2 19..15=5 14..12=0x2 vd 6..0=0x57` | `Vector Sign-Extend by Factor 4` |
  | `vzext.vf2` | `31..26=0x12 vm vs2 19..15=6 14..12=0x2 vd 6..0=0x57` | `Vector Zero-Extend by Factor 2` |
  | `vsext.vf2` | `31..26=0x12 vm vs2 19..15=7 14..12=0x2 vd 6..0=0x57` | `Vector Sign-Extend by Factor 2` |

  : Vector Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Full-Name**         |
  |:---------------|:---------------------------------------------------|:----------------------|
  | `vcompress.vm` | `31..26=0x17 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Compress`     |
  | `vmandn.mm`    | `31..26=0x18 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Mask AND-NOT` |
  | `vmand.mm`     | `31..26=0x19 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Mask AND`     |
  | `vmor.mm`      | `31..26=0x1a 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Mask OR`      |
  | `vmxor.mm`     | `31..26=0x1b 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Mask XOR`     |
  | `vmorn.mm`     | `31..26=0x1c 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Mask OR-NOT`  |
  | `vmnand.mm`    | `31..26=0x1d 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Mask NAND`    |
  | `vmnor.mm`     | `31..26=0x1e 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Mask NOR`     |
  | `vmxnor.mm`    | `31..26=0x1f 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Mask XNOR`    |

  : Vector Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Full-Name**                     |
  |:-----------|:--------------------------------------------------------------|:----------------------------------|
  | `vmsbf.m`  | `31..26=0x14 vm vs2 19..15=0x01 14..12=0x2 vd 6..0=0x57`      | `Vector Mask Set Before First`    |
  | `vmsof.m`  | `31..26=0x14 vm vs2 19..15=0x02 14..12=0x2 vd 6..0=0x57`      | `Vector Mask Set Only First`      |
  | `vmsif.m`  | `31..26=0x14 vm vs2 19..15=0x03 14..12=0x2 vd 6..0=0x57`      | `Vector Mask Set Including First` |
  | `viota.m`  | `31..26=0x14 vm vs2 19..15=0x10 14..12=0x2 vd 6..0=0x57`      | `Vector Mask Iota`                |
  | `vid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 vd 6..0=0x57` | `Vector Element Index`            |
  | `vcpop.m`  | `31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `Vector Mask Population Count`    |
  | `vfirst.m` | `31..26=0x10 vm vs2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `Vector Mask Find First Set`      |

  : Vector Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                       |
  |:-------------|:-------------------------------------------------|:------------------------------------------------------------------------------------|
  | `vdivu.vv`   | `31..26=0x20 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Divide Unsigned (Vector-Vector)`                                    |
  | `vdiv.vv`    | `31..26=0x21 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Divide Signed (Vector-Vector)`                                      |
  | `vremu.vv`   | `31..26=0x22 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Remainder Unsigned (Vector-Vector)`                                 |
  | `vrem.vv`    | `31..26=0x23 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Remainder Signed (Vector-Vector)`                                   |
  | `vmulhu.vv`  | `31..26=0x24 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Multiply High Unsigned (Vector-Vector)`                             |
  | `vmul.vv`    | `31..26=0x25 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Multiply Signed (Vector-Vector)`                                    |
  | `vmulhsu.vv` | `31..26=0x26 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Multiply High Signed-Unsigned (Vector-Vector)`                      |
  | `vmulh.vv`   | `31..26=0x27 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Multiply High Signed (Vector-Vector)`                               |
  | `vmadd.vv`   | `31..26=0x29 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Multiply-Add, Overwrite Multiplicand (Vector-Vector)`               |
  | `vnmsub.vv`  | `31..26=0x2b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Negative Multiply-Subtract, Overwrite Multiplicand (Vector-Vector)` |
  | `vmacc.vv`   | `31..26=0x2d vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Multiply-Accumulate (Vector-Vector)`                                |
  | `vnmsac.vv`  | `31..26=0x2f vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Negative Multiply-Subtract from Accumulator (Vector-Vector)`        |

  : Vector Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                 |
  |:--------------|:-------------------------------------------------|:------------------------------------------------------------------------------|
  | `vwaddu.vv`   | `31..26=0x30 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Add Unsigned (Vector-Vector)`                        |
  | `vwadd.vv`    | `31..26=0x31 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Add Signed (Vector-Vector)`                          |
  | `vwsubu.vv`   | `31..26=0x32 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Subtract Unsigned (Vector-Vector)`                   |
  | `vwsub.vv`    | `31..26=0x33 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Subtract Signed (Vector-Vector)`                     |
  | `vwaddu.wv`   | `31..26=0x34 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Add Unsigned (Wide Vector-Vector)`                   |
  | `vwadd.wv`    | `31..26=0x35 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Add Signed (Wide Vector-Vector)`                     |
  | `vwsubu.wv`   | `31..26=0x36 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Subtract Unsigned (Wide Vector-Vector)`              |
  | `vwsub.wv`    | `31..26=0x37 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Subtract Signed (Wide Vector-Vector)`                |
  | `vwmulu.vv`   | `31..26=0x38 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Multiply Unsigned (Vector-Vector)`                   |
  | `vwmulsu.vv`  | `31..26=0x3a vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Multiply Signed-Unsigned (Vector-Vector)`            |
  | `vwmul.vv`    | `31..26=0x3b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Integer Multiply Signed (Vector-Vector)`                     |
  | `vwmaccu.vv`  | `31..26=0x3c vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Unsigned Integer Multiply-Accumulate (Vector-Vector)`        |
  | `vwmacc.vv`   | `31..26=0x3d vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Signed Integer Multiply-Accumulate (Vector-Vector)`          |
  | `vwmaccsu.vv` | `31..26=0x3f vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Widening Signed-Unsigned Integer Multiply-Accumulate (Vector-Vector)` |

  : Vector Integer Extension Instructions V

**Vector Mask Instructions**

* **OPMVV**

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                        |
  |:--------------|:-------------------------------------------------|:-----------------------------------------------------|
  | `vredsum.vs`  | `31..26=0x00 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Sum Reduction`                       |
  | `vredand.vs`  | `31..26=0x01 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer AND Reduction`                       |
  | `vredor.vs`   | `31..26=0x02 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer OR Reduction`                        |
  | `vredxor.vs`  | `31..26=0x03 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer XOR Reduction`                       |
  | `vredminu.vs` | `31..26=0x04 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Minimum Unsigned Reduction`          |
  | `vredmin.vs`  | `31..26=0x05 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Minimum Signed Reduction`            |
  | `vredmaxu.vs` | `31..26=0x06 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Maximum Unsigned Reduction`          |
  | `vredmax.vs`  | `31..26=0x07 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Integer Maximum Signed Reduction`            |
  | `vaaddu.vv`   | `31..26=0x08 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Averaging Add Unsigned (Vector-Vector)`      |
  | `vaadd.vv`    | `31..26=0x09 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Averaging Add Signed (Vector-Vector)`        |
  | `vasubu.vv`   | `31..26=0x0a vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Averaging Subtract Unsigned (Vector-Vector)` |
  | `vasub.vv`    | `31..26=0x0b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Vector Averaging Subtract Signed (Vector-Vector)`   |

  : OPMVV I

  | **Name**  | **Opcode / Argument**                                   | **Full-Name**                                  |
  |:----------|:--------------------------------------------------------|:-----------------------------------------------|
  | `vmv.x.s` | `31..26=0x10 25=1 vs2 19..15=0 14..12=0x2 rd 6..0=0x57` | `Vector Move Vector Element to Integer Scalar` |

  : OPMVV II

* **OPMVX**

  | **Name**    | **Opcode / Argument**                            | **Full-Name**                                        |
  |:------------|:-------------------------------------------------|:-----------------------------------------------------|
  | `vaaddu.vx` | `31..26=0x08 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Averaging Add Unsigned (Vector-Scalar)`      |
  | `vaadd.vx`  | `31..26=0x09 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Averaging Add Signed (Vector-Scalar)`        |
  | `vasubu.vx` | `31..26=0x0a vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Averaging Subtract Unsigned (Vector-Scalar)` |
  | `vasub.vx`  | `31..26=0x0b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Averaging Subtract Signed (Vector-Scalar)`   |

  : OPMVX I

  | **Name**         | **Opcode / Argument**                                   | **Full-Name**                                  |
  |:-----------------|:--------------------------------------------------------|:-----------------------------------------------|
  | `vmv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Move Integer Scalar to Vector Element` |
  | `vslide1up.vx`   | `31..26=0x0e vm vs2 rs1 14..12=0x6 vd 6..0=0x57`        | `Vector Slide One Up (Vector-Scalar)`          |
  | `vslide1down.vx` | `31..26=0x0f vm vs2 rs1 14..12=0x6 vd 6..0=0x57`        | `Vector Slide One Down (Vector-Scalar)`        |

  : OPMVX II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                       |
  |:-------------|:-------------------------------------------------|:------------------------------------------------------------------------------------|
  | `vdivu.vx`   | `31..26=0x20 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Divide Unsigned (Vector-Scalar)`                                    |
  | `vdiv.vx`    | `31..26=0x21 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Divide Signed (Vector-Scalar)`                                      |
  | `vremu.vx`   | `31..26=0x22 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Remainder Unsigned (Vector-Scalar)`                                 |
  | `vrem.vx`    | `31..26=0x23 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Remainder Signed (Vector-Scalar)`                                   |
  | `vmulhu.vx`  | `31..26=0x24 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Multiply High Unsigned (Vector-Scalar)`                             |
  | `vmul.vx`    | `31..26=0x25 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Multiply Signed (Vector-Scalar)`                                    |
  | `vmulhsu.vx` | `31..26=0x26 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Multiply High Signed-Unsigned (Vector-Scalar)`                      |
  | `vmulh.vx`   | `31..26=0x27 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Multiply High Signed (Vector-Scalar)`                               |
  | `vmadd.vx`   | `31..26=0x29 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Multiply-Add, Overwrite Multiplicand (Vector-Scalar)`               |
  | `vnmsub.vx`  | `31..26=0x2b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Negative Multiply-Subtract, Overwrite Multiplicand (Vector-Scalar)` |
  | `vmacc.vx`   | `31..26=0x2d vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Multiply-Accumulate (Vector-Scalar)`                                |
  | `vnmsac.vx`  | `31..26=0x2f vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Integer Negative Multiply-Subtract from Accumulator (Vector-Scalar)`        |

  : OPMVX III

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                 |
  |:--------------|:-------------------------------------------------|:------------------------------------------------------------------------------|
  | `vwaddu.vx`   | `31..26=0x30 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Add Unsigned (Vector-Scalar)`                        |
  | `vwadd.vx`    | `31..26=0x31 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Add Signed (Vector-Scalar)`                          |
  | `vwsubu.vx`   | `31..26=0x32 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Subtract Unsigned (Vector-Scalar)`                   |
  | `vwsub.vx`    | `31..26=0x33 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Subtract Signed (Vector-Scalar)`                     |
  | `vwaddu.wx`   | `31..26=0x34 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Add Unsigned (Wide Vector-Scalar)`                   |
  | `vwadd.wx`    | `31..26=0x35 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Add Signed (Wide Vector-Scalar)`                     |
  | `vwsubu.wx`   | `31..26=0x36 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Subtract Unsigned (Wide Vector-Scalar)`              |
  | `vwsub.wx`    | `31..26=0x37 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Subtract Signed (Wide Vector-Scalar)`                |
  | `vwmulu.vx`   | `31..26=0x38 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Multiply Unsigned (Vector-Scalar)`                   |
  | `vwmulsu.vx`  | `31..26=0x3a vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Multiply Signed-Unsigned (Vector-Scalar)`            |
  | `vwmul.vx`    | `31..26=0x3b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Integer Multiply Signed (Vector-Scalar)`                     |
  | `vwmaccu.vx`  | `31..26=0x3c vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Unsigned Integer Multiply-Accumulate (Vector-Scalar)`        |
  | `vwmacc.vx`   | `31..26=0x3d vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Signed Integer Multiply-Accumulate (Vector-Scalar)`          |
  | `vwmaccus.vx` | `31..26=0x3e vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Unsigned-Signed Integer Multiply-Accumulate (Vector-Scalar)` |
  | `vwmaccsu.vx` | `31..26=0x3f vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Vector Widening Signed-Unsigned Integer Multiply-Accumulate (Vector-Scalar)` |

  : OPMVX IV
