## INSTRUCTION FULL-NAMES

**Matrix Instructions Formats**

  | **Category** | **Operands**       | **Operation**   |
  |:-------------|:-------------------|:----------------|
  | `OPIWW`      | `matrix-matrix`    | `Integer`       |
  | `OPIWX`      | `matrix-scalar`    | `Integer`       |
  | `OPIWI`      | `matrix-immediate` | `Integer`       |
  | `OPFWW`      | `matrix-matrix`    | `Float`         |
  | `OPFWF`      | `matrix-scalar`    | `Float`         |
  | `OPMWW`      | `matrix-matrix`    | `Mask`          |
  | `OPMWX`      | `matrix-scalar`    | `Mask`          |
  | `OPCFG`      | `scalars-imms`     | `Configuration` |

  : Matrix Instructions Formats

**OPCFG (Configuration Setting)**

  | **Name**   | **Opcode / Argument**                              | **Full-Name**                                                    |
  |:-----------|:---------------------------------------------------|:-----------------------------------------------------------------|
  | `wsetiwli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `Set Matrix Length and Immediate Matrix Type with Immediate AVL` |
  | `wsetwli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `Set Matrix Length and Immediate Matrix Type`                    |
  | `wsetwl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `Set Matrix Length and Register Matrix Type`                     |

  : Configuration Setting

**OPLS (Matrix Loads and Store)**

* **Matrix Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Full-Name**                                   |
  |:----------|:-----------------------------------------------------------------|:------------------------------------------------|
  | `wlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  wd 6..0=0x07` | `Matrix Mask Load`                              |
  | `wsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 ws3 6..0=0x27` | `Matrix Mask Store`                             |
  | `wle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  wd 6..0=0x07`      | `Matrix Unit-Stride Load with 8-Bit Elements`   |
  | `wle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  wd 6..0=0x07`      | `Matrix Unit-Stride Load with 16-Bit Elements`  |
  | `wle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  wd 6..0=0x07`      | `Matrix Unit-Stride Load with 32-Bit Elements`  |
  | `wle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  wd 6..0=0x07`      | `Matrix Unit-Stride Load with 64-Bit Elements`  |
  | `wse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 ws3 6..0=0x27`      | `Matrix Unit-Stride Store with 8-Bit Elements`  |
  | `wse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 ws3 6..0=0x27`      | `Matrix Unit-Stride Store with 16-Bit Elements` |
  | `wse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 ws3 6..0=0x27`      | `Matrix Unit-Stride Store with 32-Bit Elements` |
  | `wse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 ws3 6..0=0x27`      | `Matrix Unit-Stride Store with 64-Bit Elements` |

  : Matrix Unit-Stride Instructions (including segment part)

* **Matrix Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Full-Name**                                        |
  |:-------------|:-------------------------------------------------------|:-----------------------------------------------------|
  | `wluxei8.v`  | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x0  wd 6..0=0x07` | `Matrix Indexed-Unordered Load with 8-Bit Indices`   |
  | `wluxei16.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x5  wd 6..0=0x07` | `Matrix Indexed-Unordered Load with 16-Bit Indices`  |
  | `wluxei32.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x6  wd 6..0=0x07` | `Matrix Indexed-Unordered Load with 32-Bit Indices`  |
  | `wluxei64.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x7  wd 6..0=0x07` | `Matrix Indexed-Unordered Load with 64-Bit Indices`  |
  | `wsuxei8.v`  | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x0 ws3 6..0=0x27` | `Matrix Indexed-Unordered Store with 8-Bit Indices`  |
  | `wsuxei16.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x5 ws3 6..0=0x27` | `Matrix Indexed-Unordered Store with 16-Bit Indices` |
  | `wsuxei32.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x6 ws3 6..0=0x27` | `Matrix Indexed-Unordered Store with 32-Bit Indices` |
  | `wsuxei64.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x7 ws3 6..0=0x27` | `Matrix Indexed-Unordered Store with 64-Bit Indices` |

  : Matrix Indexed-Unordered Instructions (including segment part)

* **Matrix Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Full-Name**                               |
  |:-----------|:-------------------------------------------------------|:--------------------------------------------|
  | `wlse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  wd 6..0=0x07` | `Matrix Strided Load with 8-Bit Elements`   |
  | `wlse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  wd 6..0=0x07` | `Matrix Strided Load with 16-Bit Elements`  |
  | `wlse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  wd 6..0=0x07` | `Matrix Strided Load with 32-Bit Elements`  |
  | `wlse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  wd 6..0=0x07` | `Matrix Strided Load with 64-Bit Elements`  |
  | `wsse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 ws3 6..0=0x27` | `Matrix Strided Store with 8-Bit Elements`  |
  | `wsse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 ws3 6..0=0x27` | `Matrix Strided Store with 16-Bit Elements` |
  | `wsse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 ws3 6..0=0x27` | `Matrix Strided Store with 32-Bit Elements` |
  | `wsse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 ws3 6..0=0x27` | `Matrix Strided Store with 64-Bit Elements` |

  : Matrix Strided Instructions (including segment part)

* **Matrix Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Full-Name**                                      |
  |:-------------|:-------------------------------------------------------|:---------------------------------------------------|
  | `wloxei8.v`  | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x0  wd 6..0=0x07` | `Matrix Indexed-Ordered Load with 8-Bit Indices`   |
  | `wloxei16.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x5  wd 6..0=0x07` | `Matrix Indexed-Ordered Load with 16-Bit Indices`  |
  | `wloxei32.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x6  wd 6..0=0x07` | `Matrix Indexed-Ordered Load with 32-Bit Indices`  |
  | `wloxei64.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x7  wd 6..0=0x07` | `Matrix Indexed-Ordered Load with 64-Bit Indices`  |
  | `wsoxei8.v`  | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x0 ws3 6..0=0x27` | `Matrix Indexed-Ordered Store with 8-Bit Indices`  |
  | `wsoxei16.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x5 ws3 6..0=0x27` | `Matrix Indexed-Ordered Store with 16-Bit Indices` |
  | `wsoxei32.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x6 ws3 6..0=0x27` | `Matrix Indexed-Ordered Store with 32-Bit Indices` |
  | `wsoxei64.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x7 ws3 6..0=0x27` | `Matrix Indexed-Ordered Store with 64-Bit Indices` |

  : Matrix Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Full-Name**                                                   |
  |:------------|:---------------------------------------------------------------|:----------------------------------------------------------------|
  | `wle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  wd 6..0=0x07` | `Matrix Unit-Stride Fault-Only-First Load with 8-Bit Elements`  |
  | `wle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  wd 6..0=0x07` | `Matrix Unit-Stride Fault-Only-First Load with 16-Bit Elements` |
  | `wle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  wd 6..0=0x07` | `Matrix Unit-Stride Fault-Only-First Load with 32-Bit Elements` |
  | `wle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  wd 6..0=0x07` | `Matrix Unit-Stride Fault-Only-First Load with 64-Bit Elements` |

  : Unit-stride Fault-Only-First Loads

* **Matrix Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Full-Name**                                                     |
  |:------------|:-----------------------------------------------------------------------|:------------------------------------------------------------------|
  | `wl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `Matrix Load 1 Whole Register with 8-Bit Encoded Element Width`   |
  | `wl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `Matrix Load 1 Whole Register with 16-Bit Encoded Element Width`  |
  | `wl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `Matrix Load 1 Whole Register with 32-Bit Encoded Element Width`  |
  | `wl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `Matrix Load 1 Whole Register with 64-Bit Encoded Element Width`  |
  | `wl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `Matrix Load 2 Whole Registers with 8-Bit Encoded Element Width`  |
  | `wl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `Matrix Load 2 Whole Registers with 16-Bit Encoded Element Width` |
  | `wl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `Matrix Load 2 Whole Registers with 32-Bit Encoded Element Width` |
  | `wl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `Matrix Load 2 Whole Registers with 64-Bit Encoded Element Width` |
  | `wl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `Matrix Load 4 Whole Registers with 8-Bit Encoded Element Width`  |
  | `wl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `Matrix Load 4 Whole Registers with 16-Bit Encoded Element Width` |
  | `wl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `Matrix Load 4 Whole Registers with 32-Bit Encoded Element Width` |
  | `wl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `Matrix Load 4 Whole Registers with 64-Bit Encoded Element Width` |
  | `wl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `Matrix Load 8 Whole Registers with 8-Bit Encoded Element Width`  |
  | `wl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `Matrix Load 8 Whole Registers with 16-Bit Encoded Element Width` |
  | `wl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `Matrix Load 8 Whole Registers with 32-Bit Encoded Element Width` |
  | `wl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `Matrix Load 8 Whole Registers with 64-Bit Encoded Element Width` |
  | `ws1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `Matrix Store 1 Whole Register`                                   |
  | `ws2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `Matrix Store 2 Whole Registers`                                  |
  | `ws4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `Matrix Store 4 Whole Registers`                                  |
  | `ws8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `Matrix Store 8 Whole Registers`                                  |

  : Matrix Load/Store Whole Registers

**Matrix Float-Point Instructions**

* **OPFWF**

  | **Name**          | **Opcode / Argument**                                   | **Full-Name**                                                  |
  |:------------------|:--------------------------------------------------------|:---------------------------------------------------------------|
  | `wfadd.vf`        | `31..26=0x00 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Add (Matrix-Scalar)`                    |
  | `wfsub.vf`        | `31..26=0x02 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Subtract (Matrix-Scalar)`               |
  | `wfmin.vf`        | `31..26=0x04 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Minimum (Matrix-Scalar)`                |
  | `wfmax.vf`        | `31..26=0x06 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Maximum (Matrix-Scalar)`                |
  | `wfsgnj.vf`       | `31..26=0x08 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Sign Injection (Matrix-Scalar)`         |
  | `wfsgnjn.vf`      | `31..26=0x09 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Negated Sign Injection (Matrix-Scalar)` |
  | `wfsgnjx.vf`      | `31..26=0x0a vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point XOR Sign Injection (Matrix-Scalar)`     |
  | `wfslide1up.vf`   | `31..26=0x0e vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Slide One Up (Matrix-Scalar)`           |
  | `wfslide1down.vf` | `31..26=0x0f vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Slide One Down (Matrix-Scalar)`         |
  | `wfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Move Floating-Point Scalar to Matrix Element`          |

  : OPFWF I

  | **Name**      | **Opcode / Argument**                                   | **Full-Name**                                                         |
  |:--------------|:--------------------------------------------------------|:----------------------------------------------------------------------|
  | `wfmerge.vfm` | `31..26=0x17 25=0 ws2 rs1 14..12=0x5 wd 6..0=0x57`      | `Matrix Floating-Point Merge (Matrix-Scalar)`                         |
  | `wfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Broadcast Floating-Point Scalar`                              |
  | `wmfeq.vf`    | `31..26=0x18 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Compare Equal (Matrix-Scalar)`                 |
  | `wmfle.vf`    | `31..26=0x19 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Compare Less Than or Equal (Matrix-Scalar)`    |
  | `wmflt.vf`    | `31..26=0x1b vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Compare Less Than (Matrix-Scalar)`             |
  | `wmfne.vf`    | `31..26=0x1c vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Compare Not Equal (Matrix-Scalar)`             |
  | `wmfgt.vf`    | `31..26=0x1d vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Compare Greater Than (Matrix-Scalar)`          |
  | `wmfge.vf`    | `31..26=0x1f vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `Matrix Floating-Point Compare Greater Than or Equal (Matrix-Scalar)` |

  : OPFWF II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                                    |
  |:-------------|:-------------------------------------------------|:-------------------------------------------------------------------------------------------------|
  | `wfdiv.vf`   | `31..26=0x20 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Divide (Matrix-Scalar)`                                                   |
  | `wfrdiv.vf`  | `31..26=0x21 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Reverse Divide (Matrix-Scalar)`                                           |
  | `wfmul.vf`   | `31..26=0x24 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Multiply (Matrix-Scalar)`                                                 |
  | `wfrsub.vf`  | `31..26=0x27 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Reverse Subtract (Matrix-Scalar)`                                         |
  | `wfmadd.vf`  | `31..26=0x28 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Fused Multiply-Add, Overwrite Multiplicand (Matrix-Scalar)`               |
  | `wfnmadd.vf` | `31..26=0x29 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Fused Negative Multiply-Add, Overwrite Multiplicand (Matrix-Scalar)`      |
  | `wfmsub.vf`  | `31..26=0x2a vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Fused Multiply-Subtract, Overwrite Multiplicand (Matrix-Scalar)`          |
  | `wfnmsub.vf` | `31..26=0x2b vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Fused Negative Multiply-Subtract, Overwrite Multiplicand (Matrix-Scalar)` |
  | `wfmacc.vf`  | `31..26=0x2c vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Fused Multiply-Accumulate (Matrix-Scalar)`                                |
  | `wfnmacc.vf` | `31..26=0x2d vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Fused Negative Multiply-Accumulate (Matrix-Scalar)`                       |
  | `wfmsac.vf`  | `31..26=0x2e vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Fused Multiply-Subtract Accumulator (Matrix-Scalar)`                      |
  | `wfnmsac.vf` | `31..26=0x2f vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Floating-Point Fused Negative Multiply-Subtract Accumulator (Matrix-Scalar)`             |

  : OPFWF III

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                                 |
  |:--------------|:-------------------------------------------------|:----------------------------------------------------------------------------------------------|
  | `wfwadd.vf`   | `31..26=0x30 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Add (Matrix-Scalar)`                                          |
  | `wfwsub.vf`   | `31..26=0x32 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Subtract (Matrix-Scalar)`                                     |
  | `wfwadd.wf`   | `31..26=0x34 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Add (Wide Matrix-Scalar)`                                     |
  | `wfwsub.wf`   | `31..26=0x36 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Subtract (Wide Matrix-Scalar)`                                |
  | `wfwmul.vf`   | `31..26=0x38 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Multiply (Matrix-Scalar)`                                     |
  | `wfwmacc.vf`  | `31..26=0x3c vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Fused Multiply-Accumulate (Matrix-Scalar)`                    |
  | `wfwnmacc.vf` | `31..26=0x3d vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Fused Negative Multiply-Accumulate (Matrix-Scalar)`           |
  | `wfwmsac.vf`  | `31..26=0x3e vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Fused Multiply-Subtract Accumulator (Matrix-Scalar)`          |
  | `wfwnmsac.vf` | `31..26=0x3f vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `Matrix Widening Floating-Point Fused Negative Multiply-Subtract Accumulator (Matrix-Scalar)` |

  : OPFWF IV

* **OPFWW**

  | **Name**       | **Opcode / Argument**                                   | **Full-Name**                                                  |
  |:---------------|:--------------------------------------------------------|:---------------------------------------------------------------|
  | `wfadd.vv`     | `31..26=0x00 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Add (Matrix-Matrix)`                    |
  | `wfredusum.ws` | `31..26=0x01 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Unordered Sum Reduction`                |
  | `wfsub.vv`     | `31..26=0x02 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Subtract (Matrix-Matrix)`               |
  | `wfredosum.ws` | `31..26=0x03 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Ordered Sum Reduction`                  |
  | `wfmin.vv`     | `31..26=0x04 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Minimum (Matrix-Matrix)`                |
  | `wfredmin.ws`  | `31..26=0x05 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Minimum Reduction`                      |
  | `wfmax.vv`     | `31..26=0x06 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Maximum (Matrix-Matrix)`                |
  | `wfredmax.ws`  | `31..26=0x07 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Maximum Reduction`                      |
  | `wfsgnj.vv`    | `31..26=0x08 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Sign Injection (Matrix-Matrix)`         |
  | `wfsgnjn.vv`   | `31..26=0x09 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point Negated Sign Injection (Matrix-Matrix)` |
  | `wfsgnjx.vv`   | `31..26=0x0a vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `Matrix Floating-Point XOR Sign Injection (Matrix-Matrix)`     |
  | `wfmv.f.s`     | `31..26=0x10 25=1 ws2 19..15=0 14..12=0x1 rd 6..0=0x57` | `Matrix Move Matrix Element to Floating-Point Scalar`          |

  : OPFWW I

  | **Name**   | **Opcode / Argument**                            | **Full-Name**                                                      |
  |:-----------|:-------------------------------------------------|:-------------------------------------------------------------------|
  | `wmfeq.vv` | `31..26=0x18 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Compare Equal (Matrix-Matrix)`              |
  | `wmfle.vv` | `31..26=0x19 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Compare Less Than or Equal (Matrix-Matrix)` |
  | `wmflt.vv` | `31..26=0x1b vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Compare Less Than (Matrix-Matrix)`          |
  | `wmfne.vv` | `31..26=0x1c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Compare Not Equal (Matrix-Matrix)`          |

  : OPFWW II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                                    |
  |:-------------|:-------------------------------------------------|:-------------------------------------------------------------------------------------------------|
  | `wfdiv.vv`   | `31..26=0x20 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Divide (Matrix-Matrix)`                                                   |
  | `wfmul.vv`   | `31..26=0x24 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Multiply (Matrix-Matrix)`                                                 |
  | `wfmadd.vv`  | `31..26=0x28 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Fused Multiply-Add, Overwrite Multiplicand (Matrix-Matrix)`               |
  | `wfnmadd.vv` | `31..26=0x29 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Fused Negative Multiply-Add, Overwrite Multiplicand (Matrix-Matrix)`      |
  | `wfmsub.vv`  | `31..26=0x2a vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Fused Multiply-Subtract, Overwrite Multiplicand (Matrix-Matrix)`          |
  | `wfnmsub.vv` | `31..26=0x2b vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Fused Negative Multiply-Subtract, Overwrite Multiplicand (Matrix-Matrix)` |
  | `wfmacc.vv`  | `31..26=0x2c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Fused Multiply-Accumulate (Matrix-Matrix)`                                |
  | `wfnmacc.vv` | `31..26=0x2d vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Fused Negative Multiply-Accumulate (Matrix-Matrix)`                       |
  | `wfmsac.vv`  | `31..26=0x2e vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Fused Multiply-Subtract Accumulator (Matrix-Matrix)`                      |
  | `wfnmsac.vv` | `31..26=0x2f vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Fused Negative Multiply-Subtract Accumulator (Matrix-Matrix)`             |

  : OPFWW III

  | **Name**           | **Opcode / Argument**                                    | **Full-Name**                                                              |
  |:-------------------|:---------------------------------------------------------|:---------------------------------------------------------------------------|
  | `wfcvt.xu.f.v`     | `31..26=0x12 vm ws2 19..15=0x00 14..12=0x1 wd 6..0=0x57` | `Matrix Convert Floating-Point to Unsigned Integer`                        |
  | `wfcvt.x.f.v`      | `31..26=0x12 vm ws2 19..15=0x01 14..12=0x1 wd 6..0=0x57` | `Matrix Convert Floating-Point to Signed Integer`                          |
  | `wfcvt.f.xu.v`     | `31..26=0x12 vm ws2 19..15=0x02 14..12=0x1 wd 6..0=0x57` | `Matrix Convert Unsigned Integer to Floating-Point`                        |
  | `wfcvt.f.x.v`      | `31..26=0x12 vm ws2 19..15=0x03 14..12=0x1 wd 6..0=0x57` | `Matrix Convert Signed Integer to Floating-Point`                          |
  | `wfcvt.rtz.xu.f.v` | `31..26=0x12 vm ws2 19..15=0x06 14..12=0x1 wd 6..0=0x57` | `Matrix Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `wfcvt.rtz.x.f.v`  | `31..26=0x12 vm ws2 19..15=0x07 14..12=0x1 wd 6..0=0x57` | `Matrix Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFWW IV

  | **Name**            | **Opcode / Argument**                                    | **Full-Name**                                                                       |
  |:--------------------|:---------------------------------------------------------|:------------------------------------------------------------------------------------|
  | `wfwcvt.xu.f.v`     | `31..26=0x12 vm ws2 19..15=0x08 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Convert Floating-Point to Unsigned Integer`                        |
  | `wfwcvt.x.f.v`      | `31..26=0x12 vm ws2 19..15=0x09 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Convert Floating-Point to Signed Integer`                          |
  | `wfwcvt.f.xu.v`     | `31..26=0x12 vm ws2 19..15=0x0A 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Convert Unsigned Integer to Floating-Point`                        |
  | `wfwcvt.f.x.v`      | `31..26=0x12 vm ws2 19..15=0x0B 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Convert Signed Integer to Floating-Point`                          |
  | `wfwcvt.f.f.v`      | `31..26=0x12 vm ws2 19..15=0x0C 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Convert Floating-Point to Floating-Point`                          |
  | `wfwcvt.rtz.xu.f.v` | `31..26=0x12 vm ws2 19..15=0x0E 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `wfwcvt.rtz.x.f.v`  | `31..26=0x12 vm ws2 19..15=0x0F 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFWW V

  | **Name**            | **Opcode / Argument**                                    | **Full-Name**                                                                        |
  |:--------------------|:---------------------------------------------------------|:-------------------------------------------------------------------------------------|
  | `wfncvt.xu.f.w`     | `31..26=0x12 vm ws2 19..15=0x10 14..12=0x1 wd 6..0=0x57` | `Matrix Narrowing Convert Floating-Point to Unsigned Integer`                        |
  | `wfncvt.x.f.w`      | `31..26=0x12 vm ws2 19..15=0x11 14..12=0x1 wd 6..0=0x57` | `Matrix Narrowing Convert Floating-Point to Signed Integer`                          |
  | `wfncvt.f.xu.w`     | `31..26=0x12 vm ws2 19..15=0x12 14..12=0x1 wd 6..0=0x57` | `Matrix Narrowing Convert Unsigned Integer to Floating-Point`                        |
  | `wfncvt.f.x.w`      | `31..26=0x12 vm ws2 19..15=0x13 14..12=0x1 wd 6..0=0x57` | `Matrix Narrowing Convert Signed Integer to Floating-Point`                          |
  | `wfncvt.f.f.w`      | `31..26=0x12 vm ws2 19..15=0x14 14..12=0x1 wd 6..0=0x57` | `Matrix Narrowing Convert Floating-Point to Floating-Point`                          |
  | `wfncvt.rod.f.f.w`  | `31..26=0x12 vm ws2 19..15=0x15 14..12=0x1 wd 6..0=0x57` | `Matrix Narrowing Convert Floating-Point to Floating-Point with Round to Odd`        |
  | `wfncvt.rtz.xu.f.w` | `31..26=0x12 vm ws2 19..15=0x16 14..12=0x1 wd 6..0=0x57` | `Matrix Narrowing Convert Floating-Point to Unsigned Integer with Round Toward Zero` |
  | `wfncvt.rtz.x.f.w`  | `31..26=0x12 vm ws2 19..15=0x17 14..12=0x1 wd 6..0=0x57` | `Matrix Narrowing Convert Floating-Point to Signed Integer with Round Toward Zero`   |

  : OPFWW VI

  | **Name**     | **Opcode / Argument**                                    | **Full-Name**                                                     |
  |:-------------|:---------------------------------------------------------|:------------------------------------------------------------------|
  | `wfsqrt.v`   | `31..26=0x13 vm ws2 19..15=0x00 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Square Root`                               |
  | `wfrsqrt7.v` | `31..26=0x13 vm ws2 19..15=0x04 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Reciprocal Square-Root Estimate to 7 Bits` |
  | `wfrec7.v`   | `31..26=0x13 vm ws2 19..15=0x05 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Reciprocal Estimate to 7 Bits`             |
  | `wfclass.v`  | `31..26=0x13 vm ws2 19..15=0x10 14..12=0x1 wd 6..0=0x57` | `Matrix Floating-Point Classify`                                  |

  : OPFWW VII

  | **Name**        | **Opcode / Argument**                            | **Full-Name**                                                                                 |
  |:----------------|:-------------------------------------------------|:----------------------------------------------------------------------------------------------|
  | `wfwadd.vv`     | `31..26=0x30 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Add (Matrix-Matrix)`                                          |
  | `wfwredusum.ws` | `31..26=0x31 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Unordered Sum Reduction`                                      |
  | `wfwsub.vv`     | `31..26=0x32 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Subtract (Matrix-Matrix)`                                     |
  | `wfwredosum.ws` | `31..26=0x33 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Ordered Sum Reduction`                                        |
  | `wfwadd.wv`     | `31..26=0x34 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Add (Wide Matrix-Matrix)`                                     |
  | `wfwsub.wv`     | `31..26=0x36 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Subtract (Wide Matrix-Matrix)`                                |
  | `wfwmul.vv`     | `31..26=0x38 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Multiply (Matrix-Matrix)`                                     |
  | `wfwmacc.vv`    | `31..26=0x3c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Fused Multiply-Accumulate (Matrix-Matrix)`                    |
  | `wfwnmacc.vv`   | `31..26=0x3d vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Fused Negative Multiply-Accumulate (Matrix-Matrix)`           |
  | `wfwmsac.vv`    | `31..26=0x3e vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Fused Multiply-Subtract Accumulator (Matrix-Matrix)`          |
  | `wfwnmsac.vv`   | `31..26=0x3f vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `Matrix Widening Floating-Point Fused Negative Multiply-Subtract Accumulator (Matrix-Matrix)` |

  : OPFWW VIII

**Matrix Integer Instructions**

* **OPIWX**

  | **Name**        | **Opcode / Argument**                            | **Full-Name**                                     |
  |:----------------|:-------------------------------------------------|:--------------------------------------------------|
  | `wadd.vx`       | `31..26=0x00 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Add (Matrix-Scalar)`              |
  | `wsub.vx`       | `31..26=0x02 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Subtract (Matrix-Scalar)`         |
  | `wrsub.vx`      | `31..26=0x03 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Reverse Subtract (Matrix-Scalar)` |
  | `wminu.vx`      | `31..26=0x04 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Min Unsigned (Matrix-Scalar)`     |
  | `wmin.vx`       | `31..26=0x05 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Min Signed (Matrix-Scalar)`       |
  | `wmaxu.vx`      | `31..26=0x06 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Max Unsigned (Matrix-Scalar)`     |
  | `wmax.vx`       | `31..26=0x07 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Max Signed (Matrix-Scalar)`       |
  | `wand.vx`       | `31..26=0x09 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Bitwise AND (Matrix-Scalar)`              |
  | `wor.vx`        | `31..26=0x0a vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Bitwise OR (Matrix-Scalar)`               |
  | `wxor.vx`       | `31..26=0x0b vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Bitwise XOR (Matrix-Scalar)`              |
  | `wrgather.vx`   | `31..26=0x0c vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Register Gather (Matrix-Scalar)`          |
  | `wslideup.vx`   | `31..26=0x0e vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Slide Up (Matrix-Scalar)`                 |
  | `wslidedown.vx` | `31..26=0x0f vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Slide Down (Matrix-Scalar)`               |

  : OPIWX I

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                                |
  |:-------------|:--------------------------------------------------------|:-----------------------------------------------------------------------------|
  | `wadc.vxm`   | `31..26=0x10 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `Matrix Integer Add with Carry (Matrix-Scalar with Mask Carry Input)`        |
  | `wmadc.vxm`  | `31..26=0x11 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `Matrix Integer Add Carry-Out (Matrix-Scalar with Mask Carry Input)`         |
  | `wmadc.vx`   | `31..26=0x11 25=1 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `Matrix Integer Add Carry-Out (Matrix-Scalar)`                               |
  | `wsbc.vxm`   | `31..26=0x12 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `Matrix Integer Subtract with Borrow (Matrix-Scalar with Mask Borrow Input)` |
  | `wmsbc.vxm`  | `31..26=0x13 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `Matrix Integer Subtract Borrow-Out (Matrix-Scalar with Mask Borrow Input)`  |
  | `wmsbc.vx`   | `31..26=0x13 25=1 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `Matrix Integer Subtract Borrow-Out (Matrix-Scalar)`                         |
  | `wmerge.vxm` | `31..26=0x17 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `Matrix Integer Merge (Matrix-Scalar)`                                       |
  | `wmv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Broadcast Integer Scalar`                                            |
  | `wmseq.vx`   | `31..26=0x18 vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `Matrix Integer Compare Equal (Matrix-Scalar)`                               |
  | `wmsne.vx`   | `31..26=0x19 vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `Matrix Integer Compare Not Equal (Matrix-Scalar)`                           |
  | `wmsltu.vx`  | `31..26=0x1a vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `Matrix Integer Compare Less Than Unsigned (Matrix-Scalar)`                  |
  | `wmslt.vx`   | `31..26=0x1b vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `Matrix Integer Compare Less Than Signed (Matrix-Scalar)`                    |
  | `wmsleu.vx`  | `31..26=0x1c vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `Matrix Integer Compare Less Than or Equal Unsigned (Matrix-Scalar)`         |
  | `wmsle.vx`   | `31..26=0x1d vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `Matrix Integer Compare Less Than or Equal Signed (Matrix-Scalar)`           |
  | `wmsgtu.vx`  | `31..26=0x1e vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `Matrix Integer Compare Greater Than Unsigned (Matrix-Scalar)`               |
  | `wmsgt.vx`   | `31..26=0x1f vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `Matrix Integer Compare Greater Than Signed (Matrix-Scalar)`                 |

  : OPIWX II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                    |
  |:-------------|:-------------------------------------------------|:---------------------------------------------------------------------------------|
  | `wsaddu.vx`  | `31..26=0x20 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Saturating Add Unsigned (Matrix-Scalar)`                         |
  | `wsadd.vx`   | `31..26=0x21 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Saturating Add Signed (Matrix-Scalar)`                           |
  | `wssubu.vx`  | `31..26=0x22 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Saturating Subtract Unsigned (Matrix-Scalar)`                    |
  | `wssub.vx`   | `31..26=0x23 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Integer Saturating Subtract Signed (Matrix-Scalar)`                      |
  | `wsll.vx`    | `31..26=0x25 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Shift Left Logical (Matrix-Scalar)`                                      |
  | `wsmul.vx`   | `31..26=0x27 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Signed Fractional Multiply with Rounding and Saturation (Matrix-Scalar)` |
  | `wsrl.vx`    | `31..26=0x28 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Shift Right Logical (Matrix-Scalar)`                                     |
  | `wsra.vx`    | `31..26=0x29 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Shift Right Arithmetic (Matrix-Scalar)`                                  |
  | `wssrl.vx`   | `31..26=0x2a vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Scaling Shift Right Unsigned (Matrix-Scalar)`                            |
  | `wssra.vx`   | `31..26=0x2b vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Scaling Shift Right Signed (Matrix-Scalar)`                              |
  | `wnsrl.wx`   | `31..26=0x2c vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Narrowing Shift Right Logical (Wide Matrix-Scalar)`                      |
  | `wnsra.wx`   | `31..26=0x2d vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Narrowing Shift Right Arithmetic (Wide Matrix-Scalar)`                   |
  | `wnclipu.wx` | `31..26=0x2e vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Narrowing Clip Unsigned (Wide Matrix-Scalar)`                            |
  | `wnclip.wx`  | `31..26=0x2f vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `Matrix Narrowing Clip Signed (Wide Matrix-Scalar)`                              |

  : OPIWX III

* **OPIWW**

  | **Name**          | **Opcode / Argument**                            | **Full-Name**                                                        |
  |:------------------|:-------------------------------------------------|:---------------------------------------------------------------------|
  | `wadd.vv`         | `31..26=0x00 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Add (Matrix-Matrix)`                                 |
  | `wsub.vv`         | `31..26=0x02 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Subtract (Matrix-Matrix)`                            |
  | `wminu.vv`        | `31..26=0x04 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Min Unsigned (Matrix-Matrix)`                        |
  | `wmin.vv`         | `31..26=0x05 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Min Signed (Matrix-Matrix)`                          |
  | `wmaxu.vv`        | `31..26=0x06 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Max Unsigned (Matrix-Matrix)`                        |
  | `wmax.vv`         | `31..26=0x07 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Max Signed (Matrix-Matrix)`                          |
  | `wand.vv`         | `31..26=0x09 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Bitwise AND (Matrix-Matrix)`                                 |
  | `wor.vv`          | `31..26=0x0a vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Bitwise OR (Matrix-Matrix)`                                  |
  | `wxor.vv`         | `31..26=0x0b vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Bitwise XOR (Matrix-Matrix)`                                 |
  | `wrgather.vv`     | `31..26=0x0c vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Register Gather (Matrix-Matrix)`                             |
  | `wrgatherei16.vv` | `31..26=0x0e vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Register Gather with 16-Bit Element Indices (Matrix-Matrix)` |

  : OPIWW I

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                                |
  |:-------------|:--------------------------------------------------------|:-----------------------------------------------------------------------------|
  | `wadc.vvm`   | `31..26=0x10 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `Matrix Integer Add with Carry (Matrix-Matrix with Mask Carry Input)`        |
  | `wmadc.vvm`  | `31..26=0x11 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `Matrix Integer Add Carry-Out (Matrix-Matrix with Mask Carry Input)`         |
  | `wmadc.vv`   | `31..26=0x11 25=1 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `Matrix Integer Add Carry-Out (Matrix-Matrix)`                               |
  | `wsbc.vvm`   | `31..26=0x12 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `Matrix Integer Subtract with Borrow (Matrix-Matrix with Mask Borrow Input)` |
  | `wmsbc.vvm`  | `31..26=0x13 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `Matrix Integer Subtract Borrow-Out (Matrix-Matrix with Mask Borrow Input)`  |
  | `wmsbc.vv`   | `31..26=0x13 25=1 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `Matrix Integer Subtract Borrow-Out (Matrix-Matrix)`                         |
  | `wmerge.vvm` | `31..26=0x17 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `Matrix Integer Merge (Matrix-Matrix)`                                       |
  | `wmv.v.v`    | `31..26=0x17 25=1 24..20=0 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Move Matrix Elements`                                                |
  | `wmseq.vv`   | `31..26=0x18 vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `Matrix Integer Compare Equal (Matrix-Matrix)`                               |
  | `wmsne.vv`   | `31..26=0x19 vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `Matrix Integer Compare Not Equal (Matrix-Matrix)`                           |
  | `wmsltu.vv`  | `31..26=0x1a vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `Matrix Integer Compare Less Than Unsigned (Matrix-Matrix)`                  |
  | `wmslt.vv`   | `31..26=0x1b vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `Matrix Integer Compare Less Than Signed (Matrix-Matrix)`                    |
  | `wmsleu.vv`  | `31..26=0x1c vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `Matrix Integer Compare Less Than or Equal Unsigned (Matrix-Matrix)`         |
  | `wmsle.vv`   | `31..26=0x1d vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `Matrix Integer Compare Less Than or Equal Signed (Matrix-Matrix)`           |

  : OPIWW II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                    |
  |:-------------|:-------------------------------------------------|:---------------------------------------------------------------------------------|
  | `wsaddu.vv`  | `31..26=0x20 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Saturating Add Unsigned (Matrix-Matrix)`                         |
  | `wsadd.vv`   | `31..26=0x21 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Saturating Add Signed (Matrix-Matrix)`                           |
  | `wssubu.vv`  | `31..26=0x22 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Saturating Subtract Unsigned (Matrix-Matrix)`                    |
  | `wssub.vv`   | `31..26=0x23 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Integer Saturating Subtract Signed (Matrix-Matrix)`                      |
  | `wsll.vv`    | `31..26=0x25 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Shift Left Logical (Matrix-Matrix)`                                      |
  | `wsmul.vv`   | `31..26=0x27 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Signed Fractional Multiply with Rounding and Saturation (Matrix-Matrix)` |
  | `wsrl.vv`    | `31..26=0x28 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Shift Right Logical (Matrix-Matrix)`                                     |
  | `wsra.vv`    | `31..26=0x29 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Shift Right Arithmetic (Matrix-Matrix)`                                  |
  | `wssrl.vv`   | `31..26=0x2a vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Scaling Shift Right Unsigned (Matrix-Matrix)`                            |
  | `wssra.vv`   | `31..26=0x2b vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Scaling Shift Right Signed (Matrix-Matrix)`                              |
  | `wnsrl.wv`   | `31..26=0x2c vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Narrowing Shift Right Logical (Wide Matrix-Matrix)`                      |
  | `wnsra.wv`   | `31..26=0x2d vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Narrowing Shift Right Arithmetic (Wide Matrix-Matrix)`                   |
  | `wnclipu.wv` | `31..26=0x2e vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Narrowing Clip Unsigned (Wide Matrix-Matrix)`                            |
  | `wnclip.wv`  | `31..26=0x2f vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Narrowing Clip Signed (Wide Matrix-Matrix)`                              |

  : OPIWW III

  | **Name**       | **Opcode / Argument**                            | **Full-Name**                                    |
  |:---------------|:-------------------------------------------------|:-------------------------------------------------|
  | `wwredsumu.ws` | `31..26=0x30 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Widening Integer Sum Unsigned Reduction` |
  | `wwredsum.ws`  | `31..26=0x31 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `Matrix Widening Integer Sum Reduction`          |

  : OPIWW IV

* **OPIWI**

  | **Name**        | **Opcode / Argument**                              | **Full-Name**                                        |
  |:----------------|:---------------------------------------------------|:-----------------------------------------------------|
  | `wadd.vi`       | `31..26=0x00 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Integer Add (Matrix-Immediate)`              |
  | `wrsub.vi`      | `31..26=0x03 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Integer Reverse Subtract (Matrix-Immediate)` |
  | `wand.vi`       | `31..26=0x09 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Bitwise AND (Matrix-Immediate)`              |
  | `wor.vi`        | `31..26=0x0a vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Bitwise OR (Matrix-Immediate)`               |
  | `wxor.vi`       | `31..26=0x0b vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Bitwise XOR (Matrix-Immediate)`              |
  | `wrgather.vi`   | `31..26=0x0c vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Register Gather (Matrix-Immediate)`          |
  | `wslideup.vi`   | `31..26=0x0e vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Slide Up (Matrix-Immediate)`                 |
  | `wslidedown.vi` | `31..26=0x0f vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Slide Down (Matrix-Immediate)`               |

  : OPIWI I

  | **Name**     | **Opcode / Argument**                                     | **Full-Name**                                                            |
  |:-------------|:----------------------------------------------------------|:-------------------------------------------------------------------------|
  | `wadc.vim`   | `31..26=0x10 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Integer Add with Carry (Matrix-Immediate with Mask Carry Input)` |
  | `wmadc.vim`  | `31..26=0x11 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Integer Add Carry-Out (Matrix-Immediate with Mask Carry Input)`  |
  | `wmadc.vi`   | `31..26=0x11 25=1 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Integer Add Carry-Out (Matrix-Immediate)`                        |
  | `wmerge.vim` | `31..26=0x17 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Integer Merge (Matrix-Immediate)`                                |
  | `wmv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 wd 6..0=0x57` | `Matrix Broadcast Signed Immediate`                                      |
  | `wmseq.vi`   | `31..26=0x18 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `Matrix Integer Compare Equal (Matrix-Immediate)`                        |
  | `wmsne.vi`   | `31..26=0x19 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `Matrix Integer Compare Not Equal (Matrix-Immediate)`                    |
  | `wmsleu.vi`  | `31..26=0x1c vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `Matrix Integer Compare Less Than or Equal Unsigned (Matrix-Immediate)`  |
  | `wmsle.vi`   | `31..26=0x1d vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `Matrix Integer Compare Less Than or Equal Signed (Matrix-Immediate)`    |
  | `wmsgtu.vi`  | `31..26=0x1e vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `Matrix Integer Compare Greater Than Unsigned (Matrix-Immediate)`        |
  | `wmsgt.vi`   | `31..26=0x1f vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `Matrix Integer Compare Greater Than Signed (Matrix-Immediate)`          |

  : OPIWI II

  | **Name**     | **Opcode / Argument**                                   | **Full-Name**                                                     |
  |:-------------|:--------------------------------------------------------|:------------------------------------------------------------------|
  | `wsaddu.vi`  | `31..26=0x20 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Integer Saturating Add Unsigned (Matrix-Immediate)`       |
  | `wsadd.vi`   | `31..26=0x21 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Integer Saturating Add Signed (Matrix-Immediate)`         |
  | `wsll.vi`    | `31..26=0x25 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Shift Left Logical (Matrix-Immediate)`                    |
  | `wmv1r.v`    | `31..26=0x27 25=1 ws2 19..15=0 14..12=0x3 wd 6..0=0x57` | `Matrix Move 1 Whole Register`                                    |
  | `wmv2r.v`    | `31..26=0x27 25=1 ws2 19..15=1 14..12=0x3 wd 6..0=0x57` | `Matrix Move 2 Whole Registers`                                   |
  | `wmv4r.v`    | `31..26=0x27 25=1 ws2 19..15=3 14..12=0x3 wd 6..0=0x57` | `Matrix Move 4 Whole Registers`                                   |
  | `wmv8r.v`    | `31..26=0x27 25=1 ws2 19..15=7 14..12=0x3 wd 6..0=0x57` | `Matrix Move 8 Whole Registers`                                   |
  | `wsrl.vi`    | `31..26=0x28 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Shift Right Logical (Matrix-Immediate)`                   |
  | `wsra.vi`    | `31..26=0x29 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Shift Right Arithmetic (Matrix-Immediate)`                |
  | `wssrl.vi`   | `31..26=0x2a vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Scaling Shift Right Unsigned (Matrix-Immediate)`          |
  | `wssra.vi`   | `31..26=0x2b vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Scaling Shift Right Signed (Matrix-Immediate)`            |
  | `wnsrl.wi`   | `31..26=0x2c vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Narrowing Shift Right Logical (Wide Matrix-Immediate)`    |
  | `wnsra.wi`   | `31..26=0x2d vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Narrowing Shift Right Arithmetic (Wide Matrix-Immediate)` |
  | `wnclipu.wi` | `31..26=0x2e vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Narrowing Clip Unsigned (Wide Matrix-Immediate)`          |
  | `wnclip.wi`  | `31..26=0x2f vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `Matrix Narrowing Clip Signed (Wide Matrix-Immediate)`            |

  : OPIWI III

* **OPI (Matrix Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Full-Name**                    |
  |:------------|:------------------------------------------------------|:---------------------------------|
  | `wzext.vf8` | `31..26=0x12 vm ws2 19..15=2 14..12=0x2 wd 6..0=0x57` | `Matrix Zero-Extend by Factor 8` |
  | `wsext.vf8` | `31..26=0x12 vm ws2 19..15=3 14..12=0x2 wd 6..0=0x57` | `Matrix Sign-Extend by Factor 8` |
  | `wzext.vf4` | `31..26=0x12 vm ws2 19..15=4 14..12=0x2 wd 6..0=0x57` | `Matrix Zero-Extend by Factor 4` |
  | `wsext.vf4` | `31..26=0x12 vm ws2 19..15=5 14..12=0x2 wd 6..0=0x57` | `Matrix Sign-Extend by Factor 4` |
  | `wzext.vf2` | `31..26=0x12 vm ws2 19..15=6 14..12=0x2 wd 6..0=0x57` | `Matrix Zero-Extend by Factor 2` |
  | `wsext.vf2` | `31..26=0x12 vm ws2 19..15=7 14..12=0x2 wd 6..0=0x57` | `Matrix Sign-Extend by Factor 2` |

  : Matrix Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Full-Name**         |
  |:---------------|:---------------------------------------------------|:----------------------|
  | `wcompress.vm` | `31..26=0x17 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Compress`     |
  | `wmandn.mm`    | `31..26=0x18 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Mask AND-NOT` |
  | `wmand.mm`     | `31..26=0x19 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Mask AND`     |
  | `wmor.mm`      | `31..26=0x1a 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Mask OR`      |
  | `wmxor.mm`     | `31..26=0x1b 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Mask XOR`     |
  | `wmorn.mm`     | `31..26=0x1c 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Mask OR-NOT`  |
  | `wmnand.mm`    | `31..26=0x1d 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Mask NAND`    |
  | `wmnor.mm`     | `31..26=0x1e 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Mask NOR`     |
  | `wmxnor.mm`    | `31..26=0x1f 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Mask XNOR`    |

  : Matrix Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Full-Name**                     |
  |:-----------|:--------------------------------------------------------------|:----------------------------------|
  | `wmsbf.m`  | `31..26=0x14 vm ws2 19..15=0x01 14..12=0x2 wd 6..0=0x57`      | `Matrix Mask Set Before First`    |
  | `wmsof.m`  | `31..26=0x14 vm ws2 19..15=0x02 14..12=0x2 wd 6..0=0x57`      | `Matrix Mask Set Only First`      |
  | `wmsif.m`  | `31..26=0x14 vm ws2 19..15=0x03 14..12=0x2 wd 6..0=0x57`      | `Matrix Mask Set Including First` |
  | `wiota.m`  | `31..26=0x14 vm ws2 19..15=0x10 14..12=0x2 wd 6..0=0x57`      | `Matrix Mask Iota`                |
  | `wid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 wd 6..0=0x57` | `Matrix Element Index`            |
  | `wcpop.m`  | `31..26=0x10 vm ws2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `Matrix Mask Population Count`    |
  | `wfirst.m` | `31..26=0x10 vm ws2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `Matrix Mask Find First Set`      |

  : Matrix Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                       |
  |:-------------|:-------------------------------------------------|:------------------------------------------------------------------------------------|
  | `wdivu.vv`   | `31..26=0x20 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Divide Unsigned (Matrix-Matrix)`                                    |
  | `wdiv.vv`    | `31..26=0x21 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Divide Signed (Matrix-Matrix)`                                      |
  | `wremu.vv`   | `31..26=0x22 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Remainder Unsigned (Matrix-Matrix)`                                 |
  | `wrem.vv`    | `31..26=0x23 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Remainder Signed (Matrix-Matrix)`                                   |
  | `wmulhu.vv`  | `31..26=0x24 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Multiply High Unsigned (Matrix-Matrix)`                             |
  | `wmul.vv`    | `31..26=0x25 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Multiply Signed (Matrix-Matrix)`                                    |
  | `wmulhsu.vv` | `31..26=0x26 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Multiply High Signed-Unsigned (Matrix-Matrix)`                      |
  | `wmulh.vv`   | `31..26=0x27 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Multiply High Signed (Matrix-Matrix)`                               |
  | `wmadd.vv`   | `31..26=0x29 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Multiply-Add, Overwrite Multiplicand (Matrix-Matrix)`               |
  | `wnmsub.vv`  | `31..26=0x2b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Negative Multiply-Subtract, Overwrite Multiplicand (Matrix-Matrix)` |
  | `wmacc.vv`   | `31..26=0x2d vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Multiply-Accumulate (Matrix-Matrix)`                                |
  | `wnmsac.vv`  | `31..26=0x2f vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Negative Multiply-Subtract from Accumulator (Matrix-Matrix)`        |

  : Matrix Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                 |
  |:--------------|:-------------------------------------------------|:------------------------------------------------------------------------------|
  | `wwaddu.vv`   | `31..26=0x30 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Add Unsigned (Matrix-Matrix)`                        |
  | `wwadd.vv`    | `31..26=0x31 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Add Signed (Matrix-Matrix)`                          |
  | `wwsubu.vv`   | `31..26=0x32 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Subtract Unsigned (Matrix-Matrix)`                   |
  | `wwsub.vv`    | `31..26=0x33 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Subtract Signed (Matrix-Matrix)`                     |
  | `wwaddu.wv`   | `31..26=0x34 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Add Unsigned (Wide Matrix-Matrix)`                   |
  | `wwadd.wv`    | `31..26=0x35 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Add Signed (Wide Matrix-Matrix)`                     |
  | `wwsubu.wv`   | `31..26=0x36 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Subtract Unsigned (Wide Matrix-Matrix)`              |
  | `wwsub.wv`    | `31..26=0x37 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Subtract Signed (Wide Matrix-Matrix)`                |
  | `wwmulu.vv`   | `31..26=0x38 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Multiply Unsigned (Matrix-Matrix)`                   |
  | `wwmulsu.vv`  | `31..26=0x3a vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Multiply Signed-Unsigned (Matrix-Matrix)`            |
  | `wwmul.vv`    | `31..26=0x3b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Integer Multiply Signed (Matrix-Matrix)`                     |
  | `wwmaccu.vv`  | `31..26=0x3c vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Unsigned Integer Multiply-Accumulate (Matrix-Matrix)`        |
  | `wwmacc.vv`   | `31..26=0x3d vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Signed Integer Multiply-Accumulate (Matrix-Matrix)`          |
  | `wwmaccsu.vv` | `31..26=0x3f vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Widening Signed-Unsigned Integer Multiply-Accumulate (Matrix-Matrix)` |

  : Matrix Integer Extension Instructions V

**Matrix Mask Instructions**

* **OPMWW**

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                        |
  |:--------------|:-------------------------------------------------|:-----------------------------------------------------|
  | `wredsum.ws`  | `31..26=0x00 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Sum Reduction`                       |
  | `wredand.ws`  | `31..26=0x01 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer AND Reduction`                       |
  | `wredor.ws`   | `31..26=0x02 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer OR Reduction`                        |
  | `wredxor.ws`  | `31..26=0x03 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer XOR Reduction`                       |
  | `wredminu.ws` | `31..26=0x04 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Minimum Unsigned Reduction`          |
  | `wredmin.ws`  | `31..26=0x05 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Minimum Signed Reduction`            |
  | `wredmaxu.ws` | `31..26=0x06 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Maximum Unsigned Reduction`          |
  | `wredmax.ws`  | `31..26=0x07 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Integer Maximum Signed Reduction`            |
  | `waaddu.vv`   | `31..26=0x08 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Averaging Add Unsigned (Matrix-Matrix)`      |
  | `waadd.vv`    | `31..26=0x09 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Averaging Add Signed (Matrix-Matrix)`        |
  | `wasubu.vv`   | `31..26=0x0a vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Averaging Subtract Unsigned (Matrix-Matrix)` |
  | `wasub.vv`    | `31..26=0x0b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `Matrix Averaging Subtract Signed (Matrix-Matrix)`   |

  : OPMWW I

  | **Name**  | **Opcode / Argument**                                   | **Full-Name**                                  |
  |:----------|:--------------------------------------------------------|:-----------------------------------------------|
  | `wmv.x.s` | `31..26=0x10 25=1 ws2 19..15=0 14..12=0x2 rd 6..0=0x57` | `Matrix Move Matrix Element to Integer Scalar` |

  : OPMWW II

* **OPMWX**

  | **Name**    | **Opcode / Argument**                            | **Full-Name**                                        |
  |:------------|:-------------------------------------------------|:-----------------------------------------------------|
  | `waaddu.vx` | `31..26=0x08 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Averaging Add Unsigned (Matrix-Scalar)`      |
  | `waadd.vx`  | `31..26=0x09 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Averaging Add Signed (Matrix-Scalar)`        |
  | `wasubu.vx` | `31..26=0x0a vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Averaging Subtract Unsigned (Matrix-Scalar)` |
  | `wasub.vx`  | `31..26=0x0b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Averaging Subtract Signed (Matrix-Scalar)`   |

  : OPMWX I

  | **Name**         | **Opcode / Argument**                                   | **Full-Name**                                  |
  |:-----------------|:--------------------------------------------------------|:-----------------------------------------------|
  | `wmv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Move Integer Scalar to Matrix Element` |
  | `wslide1up.vx`   | `31..26=0x0e vm ws2 rs1 14..12=0x6 wd 6..0=0x57`        | `Matrix Slide One Up (Matrix-Scalar)`          |
  | `wslide1down.vx` | `31..26=0x0f vm ws2 rs1 14..12=0x6 wd 6..0=0x57`        | `Matrix Slide One Down (Matrix-Scalar)`        |

  : OPMWX II

  | **Name**     | **Opcode / Argument**                            | **Full-Name**                                                                       |
  |:-------------|:-------------------------------------------------|:------------------------------------------------------------------------------------|
  | `wdivu.vx`   | `31..26=0x20 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Divide Unsigned (Matrix-Scalar)`                                    |
  | `wdiv.vx`    | `31..26=0x21 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Divide Signed (Matrix-Scalar)`                                      |
  | `wremu.vx`   | `31..26=0x22 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Remainder Unsigned (Matrix-Scalar)`                                 |
  | `wrem.vx`    | `31..26=0x23 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Remainder Signed (Matrix-Scalar)`                                   |
  | `wmulhu.vx`  | `31..26=0x24 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Multiply High Unsigned (Matrix-Scalar)`                             |
  | `wmul.vx`    | `31..26=0x25 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Multiply Signed (Matrix-Scalar)`                                    |
  | `wmulhsu.vx` | `31..26=0x26 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Multiply High Signed-Unsigned (Matrix-Scalar)`                      |
  | `wmulh.vx`   | `31..26=0x27 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Multiply High Signed (Matrix-Scalar)`                               |
  | `wmadd.vx`   | `31..26=0x29 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Multiply-Add, Overwrite Multiplicand (Matrix-Scalar)`               |
  | `wnmsub.vx`  | `31..26=0x2b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Negative Multiply-Subtract, Overwrite Multiplicand (Matrix-Scalar)` |
  | `wmacc.vx`   | `31..26=0x2d vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Multiply-Accumulate (Matrix-Scalar)`                                |
  | `wnmsac.vx`  | `31..26=0x2f vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Integer Negative Multiply-Subtract from Accumulator (Matrix-Scalar)`        |

  : OPMWX III

  | **Name**      | **Opcode / Argument**                            | **Full-Name**                                                                 |
  |:--------------|:-------------------------------------------------|:------------------------------------------------------------------------------|
  | `wwaddu.vx`   | `31..26=0x30 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Add Unsigned (Matrix-Scalar)`                        |
  | `wwadd.vx`    | `31..26=0x31 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Add Signed (Matrix-Scalar)`                          |
  | `wwsubu.vx`   | `31..26=0x32 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Subtract Unsigned (Matrix-Scalar)`                   |
  | `wwsub.vx`    | `31..26=0x33 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Subtract Signed (Matrix-Scalar)`                     |
  | `wwaddu.wx`   | `31..26=0x34 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Add Unsigned (Wide Matrix-Scalar)`                   |
  | `wwadd.wx`    | `31..26=0x35 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Add Signed (Wide Matrix-Scalar)`                     |
  | `wwsubu.wx`   | `31..26=0x36 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Subtract Unsigned (Wide Matrix-Scalar)`              |
  | `wwsub.wx`    | `31..26=0x37 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Subtract Signed (Wide Matrix-Scalar)`                |
  | `wwmulu.vx`   | `31..26=0x38 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Multiply Unsigned (Matrix-Scalar)`                   |
  | `wwmulsu.vx`  | `31..26=0x3a vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Multiply Signed-Unsigned (Matrix-Scalar)`            |
  | `wwmul.vx`    | `31..26=0x3b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Integer Multiply Signed (Matrix-Scalar)`                     |
  | `wwmaccu.vx`  | `31..26=0x3c vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Unsigned Integer Multiply-Accumulate (Matrix-Scalar)`        |
  | `wwmacc.vx`   | `31..26=0x3d vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Signed Integer Multiply-Accumulate (Matrix-Scalar)`          |
  | `wwmaccus.vx` | `31..26=0x3e vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Unsigned-Signed Integer Multiply-Accumulate (Matrix-Scalar)` |
  | `wwmaccsu.vx` | `31..26=0x3f vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `Matrix Widening Signed-Unsigned Integer Multiply-Accumulate (Matrix-Scalar)` |

  : OPMWX IV
