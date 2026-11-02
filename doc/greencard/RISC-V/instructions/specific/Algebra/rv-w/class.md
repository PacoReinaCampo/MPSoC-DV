## INSTRUCTION CLASSES

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

  | **Name**   | **Opcode / Argument**                              | **Class**              |
  |:-----------|:---------------------------------------------------|:-----------------------|
  | `wsetiwli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `matrix,configuration` |
  | `wsetwli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `matrix,configuration` |
  | `wsetwl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `matrix,configuration` |

  : Configuration Setting

**OPLS (Matrix Loads and Store)**

* **Matrix Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Class**           |
  |:----------|:-----------------------------------------------------------------|:--------------------|
  | `wlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  wd 6..0=0x07` | `matrix,load,mask`  |
  | `wsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 ws3 6..0=0x27` | `matrix,store,mask` |
  | `wle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  wd 6..0=0x07`      | `matrix,load`       |
  | `wle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  wd 6..0=0x07`      | `matrix,load`       |
  | `wle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  wd 6..0=0x07`      | `matrix,load`       |
  | `wle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  wd 6..0=0x07`      | `matrix,load`       |
  | `wse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 ws3 6..0=0x27`      | `matrix,store`      |
  | `wse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 ws3 6..0=0x27`      | `matrix,store`      |
  | `wse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 ws3 6..0=0x27`      | `matrix,store`      |
  | `wse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 ws3 6..0=0x27`      | `matrix,store`      |

  : Matrix Unit-Stride Instructions (including segment part)

* **Matrix Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Class**      |
  |:-------------|:-------------------------------------------------------|:---------------|
  | `wluxei8.v`  | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x0  wd 6..0=0x07` | `matrix,load`  |
  | `wluxei16.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x5  wd 6..0=0x07` | `matrix,load`  |
  | `wluxei32.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x6  wd 6..0=0x07` | `matrix,load`  |
  | `wluxei64.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x7  wd 6..0=0x07` | `matrix,load`  |
  | `wsuxei8.v`  | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x0 ws3 6..0=0x27` | `matrix,store` |
  | `wsuxei16.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x5 ws3 6..0=0x27` | `matrix,store` |
  | `wsuxei32.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x6 ws3 6..0=0x27` | `matrix,store` |
  | `wsuxei64.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x7 ws3 6..0=0x27` | `matrix,store` |

  : Matrix Indexed-Unordered Instructions (including segment part)

* **Matrix Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Class**      |
  |:-----------|:-------------------------------------------------------|:---------------|
  | `wlse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  wd 6..0=0x07` | `matrix,load`  |
  | `wlse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  wd 6..0=0x07` | `matrix,load`  |
  | `wlse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  wd 6..0=0x07` | `matrix,load`  |
  | `wlse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  wd 6..0=0x07` | `matrix,load`  |
  | `wsse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 ws3 6..0=0x27` | `matrix,store` |
  | `wsse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 ws3 6..0=0x27` | `matrix,store` |
  | `wsse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 ws3 6..0=0x27` | `matrix,store` |
  | `wsse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 ws3 6..0=0x27` | `matrix,store` |

  : Matrix Strided Instructions (including segment part)

* **Matrix Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Class**      |
  |:-------------|:-------------------------------------------------------|:---------------|
  | `wloxei8.v`  | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x0  wd 6..0=0x07` | `matrix,load`  |
  | `wloxei16.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x5  wd 6..0=0x07` | `matrix,load`  |
  | `wloxei32.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x6  wd 6..0=0x07` | `matrix,load`  |
  | `wloxei64.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x7  wd 6..0=0x07` | `matrix,load`  |
  | `wsoxei8.v`  | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x0 ws3 6..0=0x27` | `matrix,store` |
  | `wsoxei16.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x5 ws3 6..0=0x27` | `matrix,store` |
  | `wsoxei32.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x6 ws3 6..0=0x27` | `matrix,store` |
  | `wsoxei64.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x7 ws3 6..0=0x27` | `matrix,store` |

  : Matrix Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Class**                      |
  |:------------|:---------------------------------------------------------------|:-------------------------------|
  | `wle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  wd 6..0=0x07` | `matrix,load,fault-only-first` |
  | `wle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  wd 6..0=0x07` | `matrix,load,fault-only-first` |
  | `wle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  wd 6..0=0x07` | `matrix,load,fault-only-first` |
  | `wle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  wd 6..0=0x07` | `matrix,load,fault-only-first` |

  : Unit-stride Fault-Only-First Loads

* **Matrix Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Class**                     |
  |:------------|:-----------------------------------------------------------------------|:------------------------------|
  | `wl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `wl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `matrix,load,whole-register`  |
  | `ws1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `matrix,store,whole-register` |
  | `ws2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `matrix,store,whole-register` |
  | `ws4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `matrix,store,whole-register` |
  | `ws8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `matrix,store,whole-register` |

  : Matrix Load/Store Whole Registers

**Matrix Float-Point Instructions**

* **OPFWF**

  | **Name**          | **Opcode / Argument**                                   | **Class**                       |
  |:------------------|:--------------------------------------------------------|:--------------------------------|
  | `wfadd.vf`        | `31..26=0x00 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,alu,floating-point`     |
  | `wfsub.vf`        | `31..26=0x02 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,alu,floating-point`     |
  | `wfmin.vf`        | `31..26=0x04 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,alu,floating-point`     |
  | `wfmax.vf`        | `31..26=0x06 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,alu,floating-point`     |
  | `wfsgnj.vf`       | `31..26=0x08 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,logical,floating-point` |
  | `wfsgnjn.vf`      | `31..26=0x09 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,logical,floating-point` |
  | `wfsgnjx.vf`      | `31..26=0x0a vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,logical,floating-point` |
  | `wfslide1up.vf`   | `31..26=0x0e vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,permute,floating-point` |
  | `wfslide1down.vf` | `31..26=0x0f vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,permute,floating-point` |
  | `wfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,move,floating-point`    |

  : OPFWF I

  | **Name**      | **Opcode / Argument**                                   | **Class**                            |
  |:--------------|:--------------------------------------------------------|:-------------------------------------|
  | `wfmerge.vfm` | `31..26=0x17 25=0 ws2 rs1 14..12=0x5 wd 6..0=0x57`      | `matrix,merge,floating-point`        |
  | `wfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,move,floating-point`         |
  | `wmfeq.vf`    | `31..26=0x18 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,compare,floating-point,mask` |
  | `wmfle.vf`    | `31..26=0x19 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,compare,floating-point,mask` |
  | `wmflt.vf`    | `31..26=0x1b vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,compare,floating-point,mask` |
  | `wmfne.vf`    | `31..26=0x1c vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,compare,floating-point,mask` |
  | `wmfgt.vf`    | `31..26=0x1d vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,compare,floating-point,mask` |
  | `wmfge.vf`    | `31..26=0x1f vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `matrix,compare,floating-point,mask` |

  : OPFWF II

  | **Name**     | **Opcode / Argument**                            | **Class**                        |
  |:-------------|:-------------------------------------------------|:---------------------------------|
  | `wfdiv.vf`   | `31..26=0x20 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfrdiv.vf`  | `31..26=0x21 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfmul.vf`   | `31..26=0x24 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfrsub.vf`  | `31..26=0x27 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfmadd.vf`  | `31..26=0x28 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfnmadd.vf` | `31..26=0x29 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfmsub.vf`  | `31..26=0x2a vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfnmsub.vf` | `31..26=0x2b vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfmacc.vf`  | `31..26=0x2c vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfnmacc.vf` | `31..26=0x2d vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfmsac.vf`  | `31..26=0x2e vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfnmsac.vf` | `31..26=0x2f vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |

  : OPFWF III

  | **Name**      | **Opcode / Argument**                            | **Class**                        |
  |:--------------|:-------------------------------------------------|:---------------------------------|
  | `wfwadd.vf`   | `31..26=0x30 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfwsub.vf`   | `31..26=0x32 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfwadd.wf`   | `31..26=0x34 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfwsub.wf`   | `31..26=0x36 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfwmul.vf`   | `31..26=0x38 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfwmacc.vf`  | `31..26=0x3c vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfwnmacc.vf` | `31..26=0x3d vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfwmsac.vf`  | `31..26=0x3e vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfwnmsac.vf` | `31..26=0x3f vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `matrix,multiply,floating-point` |

  : OPFWF IV

* **OPFWW**

  | **Name**       | **Opcode / Argument**                                   | **Class**                         |
  |:---------------|:--------------------------------------------------------|:----------------------------------|
  | `wfadd.vv`     | `31..26=0x00 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,alu,floating-point`       |
  | `wfredusum.ws` | `31..26=0x01 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,reduction,floating-point` |
  | `wfsub.vv`     | `31..26=0x02 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,alu,floating-point`       |
  | `wfredosum.ws` | `31..26=0x03 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,reduction,floating-point` |
  | `wfmin.vv`     | `31..26=0x04 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,alu,floating-point`       |
  | `wfredmin.ws`  | `31..26=0x05 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,reduction,floating-point` |
  | `wfmax.vv`     | `31..26=0x06 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,alu,floating-point`       |
  | `wfredmax.ws`  | `31..26=0x07 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,reduction,floating-point` |
  | `wfsgnj.vv`    | `31..26=0x08 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,logical,floating-point`   |
  | `wfsgnjn.vv`   | `31..26=0x09 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,logical,floating-point`   |
  | `wfsgnjx.vv`   | `31..26=0x0a vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `matrix,logical,floating-point`   |
  | `wfmv.f.s`     | `31..26=0x10 25=1 ws2 19..15=0 14..12=0x1 rd 6..0=0x57` | `matrix,move,floating-point`      |

  : OPFWW I

  | **Name**   | **Opcode / Argument**                            | **Class**                            |
  |:-----------|:-------------------------------------------------|:-------------------------------------|
  | `wmfeq.vv` | `31..26=0x18 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,compare,floating-point,mask` |
  | `wmfle.vv` | `31..26=0x19 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,compare,floating-point,mask` |
  | `wmflt.vv` | `31..26=0x1b vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,compare,floating-point,mask` |
  | `wmfne.vv` | `31..26=0x1c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,compare,floating-point,mask` |

  : OPFWW II

  | **Name**     | **Opcode / Argument**                            | **Class**                        |
  |:-------------|:-------------------------------------------------|:---------------------------------|
  | `wfdiv.vv`   | `31..26=0x20 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfmul.vv`   | `31..26=0x24 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfmadd.vv`  | `31..26=0x28 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfnmadd.vv` | `31..26=0x29 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfmsub.vv`  | `31..26=0x2a vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfnmsub.vv` | `31..26=0x2b vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfmacc.vv`  | `31..26=0x2c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfnmacc.vv` | `31..26=0x2d vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfmsac.vv`  | `31..26=0x2e vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point` |
  | `wfnmsac.vv` | `31..26=0x2f vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point` |

  : OPFWW III

  | **Name**           | **Opcode / Argument**                                    | **Class**                       |
  |:-------------------|:---------------------------------------------------------|:--------------------------------|
  | `wfcvt.xu.f.v`     | `31..26=0x12 vm ws2 19..15=0x00 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfcvt.x.f.v`      | `31..26=0x12 vm ws2 19..15=0x01 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfcvt.f.xu.v`     | `31..26=0x12 vm ws2 19..15=0x02 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfcvt.f.x.v`      | `31..26=0x12 vm ws2 19..15=0x03 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfcvt.rtz.xu.f.v` | `31..26=0x12 vm ws2 19..15=0x06 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfcvt.rtz.x.f.v`  | `31..26=0x12 vm ws2 19..15=0x07 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |

  : OPFWW IV

  | **Name**            | **Opcode / Argument**                                    | **Class**                       |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `wfwcvt.xu.f.v`     | `31..26=0x12 vm ws2 19..15=0x08 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfwcvt.x.f.v`      | `31..26=0x12 vm ws2 19..15=0x09 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfwcvt.f.xu.v`     | `31..26=0x12 vm ws2 19..15=0x0A 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfwcvt.f.x.v`      | `31..26=0x12 vm ws2 19..15=0x0B 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfwcvt.f.f.v`      | `31..26=0x12 vm ws2 19..15=0x0C 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfwcvt.rtz.xu.f.v` | `31..26=0x12 vm ws2 19..15=0x0E 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfwcvt.rtz.x.f.v`  | `31..26=0x12 vm ws2 19..15=0x0F 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |

  : OPFWW V

  | **Name**            | **Opcode / Argument**                                    | **Class**                       |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `wfncvt.xu.f.w`     | `31..26=0x12 vm ws2 19..15=0x10 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfncvt.x.f.w`      | `31..26=0x12 vm ws2 19..15=0x11 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfncvt.f.xu.w`     | `31..26=0x12 vm ws2 19..15=0x12 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfncvt.f.x.w`      | `31..26=0x12 vm ws2 19..15=0x13 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfncvt.f.f.w`      | `31..26=0x12 vm ws2 19..15=0x14 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfncvt.rod.f.f.w`  | `31..26=0x12 vm ws2 19..15=0x15 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfncvt.rtz.xu.f.w` | `31..26=0x12 vm ws2 19..15=0x16 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |
  | `wfncvt.rtz.x.f.w`  | `31..26=0x12 vm ws2 19..15=0x17 14..12=0x1 wd 6..0=0x57` | `matrix,convert,floating-point` |

  : OPFWW VI

  | **Name**     | **Opcode / Argument**                                    | **Class**                        |
  |:-------------|:---------------------------------------------------------|:---------------------------------|
  | `wfsqrt.v`   | `31..26=0x13 vm ws2 19..15=0x00 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfrsqrt7.v` | `31..26=0x13 vm ws2 19..15=0x04 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfrec7.v`   | `31..26=0x13 vm ws2 19..15=0x05 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`      |
  | `wfclass.v`  | `31..26=0x13 vm ws2 19..15=0x10 14..12=0x1 wd 6..0=0x57` | `matrix,classify,floating-point` |

  : OPFWW VII

  | **Name**        | **Opcode / Argument**                            | **Class**                         |
  |:----------------|:-------------------------------------------------|:----------------------------------|
  | `wfwadd.vv`     | `31..26=0x30 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`       |
  | `wfwredusum.ws` | `31..26=0x31 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,reduction,floating-point` |
  | `wfwsub.vv`     | `31..26=0x32 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`       |
  | `wfwredosum.ws` | `31..26=0x33 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,reduction,floating-point` |
  | `wfwadd.wv`     | `31..26=0x34 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`       |
  | `wfwsub.wv`     | `31..26=0x36 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`       |
  | `wfwmul.vv`     | `31..26=0x38 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,alu,floating-point`       |
  | `wfwmacc.vv`    | `31..26=0x3c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point`  |
  | `wfwnmacc.vv`   | `31..26=0x3d vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point`  |
  | `wfwmsac.vv`    | `31..26=0x3e vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point`  |
  | `wfwnmsac.vv`   | `31..26=0x3f vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `matrix,multiply,floating-point`  |

  : OPFWW VIII

**Matrix Integer Instructions**

* **OPIWX**

  | **Name**        | **Opcode / Argument**                            | **Class**            |
  |:----------------|:-------------------------------------------------|:---------------------|
  | `wadd.vx`       | `31..26=0x00 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wsub.vx`       | `31..26=0x02 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wrsub.vx`      | `31..26=0x03 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wminu.vx`      | `31..26=0x04 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wmin.vx`       | `31..26=0x05 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wmaxu.vx`      | `31..26=0x06 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wmax.vx`       | `31..26=0x07 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wand.vx`       | `31..26=0x09 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wor.vx`        | `31..26=0x0a vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wxor.vx`       | `31..26=0x0b vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wrgather.vx`   | `31..26=0x0c vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,permute`     |
  | `wslideup.vx`   | `31..26=0x0e vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,permute`     |
  | `wslidedown.vx` | `31..26=0x0f vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,permute`     |

  : OPIWX I

  | **Name**     | **Opcode / Argument**                                   | **Class**                     |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `wadc.vxm`   | `31..26=0x10 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `matrix,alu,integer`          |
  | `wmadc.vxm`  | `31..26=0x11 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wmadc.vx`   | `31..26=0x11 25=1 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wsbc.vxm`   | `31..26=0x12 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `matrix,alu,integer`          |
  | `wmsbc.vxm`  | `31..26=0x13 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wmsbc.vx`   | `31..26=0x13 25=1 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wmerge.vxm` | `31..26=0x17 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `matrix,merge,integer`        |
  | `wmv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,move,integer`         |
  | `wmseq.vx`   | `31..26=0x18 vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsne.vx`   | `31..26=0x19 vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsltu.vx`  | `31..26=0x1a vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmslt.vx`   | `31..26=0x1b vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsleu.vx`  | `31..26=0x1c vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsle.vx`   | `31..26=0x1d vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsgtu.vx`  | `31..26=0x1e vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsgt.vx`   | `31..26=0x1f vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `matrix,compare,integer,mask` |

  : OPIWX II

  | **Name**     | **Opcode / Argument**                            | **Class**                |
  |:-------------|:-------------------------------------------------|:-------------------------|
  | `wsaddu.vx`  | `31..26=0x20 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wsadd.vx`   | `31..26=0x21 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wssubu.vx`  | `31..26=0x22 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wssub.vx`   | `31..26=0x23 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wsll.vx`    | `31..26=0x25 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wsmul.vx`   | `31..26=0x27 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wsrl.vx`    | `31..26=0x28 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wsra.vx`    | `31..26=0x29 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wssrl.vx`   | `31..26=0x2a vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wssra.vx`   | `31..26=0x2b vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wnsrl.wx`   | `31..26=0x2c vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wnsra.wx`   | `31..26=0x2d vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wnclipu.wx` | `31..26=0x2e vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wnclip.wx`  | `31..26=0x2f vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `matrix,alu,fixed-point` |

  : OPIWX III

* **OPIWW**

  | **Name**          | **Opcode / Argument**                            | **Class**            |
  |:------------------|:-------------------------------------------------|:---------------------|
  | `wadd.vv`         | `31..26=0x00 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wsub.vv`         | `31..26=0x02 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wminu.vv`        | `31..26=0x04 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wmin.vv`         | `31..26=0x05 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wmaxu.vv`        | `31..26=0x06 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wmax.vv`         | `31..26=0x07 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wand.vv`         | `31..26=0x09 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wor.vv`          | `31..26=0x0a vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wxor.vv`         | `31..26=0x0b vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wrgather.vv`     | `31..26=0x0c vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,permute`     |
  | `wrgatherei16.vv` | `31..26=0x0e vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,permute`     |

  : OPIWW I

  | **Name**     | **Opcode / Argument**                                   | **Class**                     |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `wadc.vvm`   | `31..26=0x10 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `matrix,alu,integer`          |
  | `wmadc.vvm`  | `31..26=0x11 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wmadc.vv`   | `31..26=0x11 25=1 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wsbc.vvm`   | `31..26=0x12 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `matrix,alu,integer`          |
  | `wmsbc.vvm`  | `31..26=0x13 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wmsbc.vv`   | `31..26=0x13 25=1 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wmerge.vvm` | `31..26=0x17 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `matrix,merge,integer`        |
  | `wmv.v.v`    | `31..26=0x17 25=1 24..20=0 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,move,integer`         |
  | `wmseq.vv`   | `31..26=0x18 vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsne.vv`   | `31..26=0x19 vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsltu.vv`  | `31..26=0x1a vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmslt.vv`   | `31..26=0x1b vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsleu.vv`  | `31..26=0x1c vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsle.vv`   | `31..26=0x1d vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `matrix,compare,integer,mask` |

  : OPIWW II

  | **Name**     | **Opcode / Argument**                            | **Class**                |
  |:-------------|:-------------------------------------------------|:-------------------------|
  | `wsaddu.vv`  | `31..26=0x20 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wsadd.vv`   | `31..26=0x21 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wssubu.vv`  | `31..26=0x22 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wssub.vv`   | `31..26=0x23 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wsll.vv`    | `31..26=0x25 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wsmul.vv`   | `31..26=0x27 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wsrl.vv`    | `31..26=0x28 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wsra.vv`    | `31..26=0x29 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wssrl.vv`   | `31..26=0x2a vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wssra.vv`   | `31..26=0x2b vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wnsrl.wv`   | `31..26=0x2c vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wnsra.wv`   | `31..26=0x2d vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,integer`     |
  | `wnclipu.wv` | `31..26=0x2e vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wnclip.wv`  | `31..26=0x2f vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,alu,fixed-point` |

  : OPIWW III

  | **Name**       | **Opcode / Argument**                            | **Class**                  |
  |:---------------|:-------------------------------------------------|:---------------------------|
  | `wwredsumu.ws` | `31..26=0x30 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `wwredsum.ws`  | `31..26=0x31 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `matrix,reduction,integer` |

  : OPIWW IV

* **OPIWI**

  | **Name**        | **Opcode / Argument**                              | **Class**            |
  |:----------------|:---------------------------------------------------|:---------------------|
  | `wadd.vi`       | `31..26=0x00 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wrsub.vi`      | `31..26=0x03 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wand.vi`       | `31..26=0x09 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wor.vi`        | `31..26=0x0a vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wxor.vi`       | `31..26=0x0b vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wrgather.vi`   | `31..26=0x0c vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,permute`     |
  | `wslideup.vi`   | `31..26=0x0e vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,permute`     |
  | `wslidedown.vi` | `31..26=0x0f vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,permute`     |

  : OPIWI I

  | **Name**     | **Opcode / Argument**                                     | **Class**                     |
  |:-------------|:----------------------------------------------------------|:------------------------------|
  | `wadc.vim`   | `31..26=0x10 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,integer`          |
  | `wmadc.vim`  | `31..26=0x11 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wmadc.vi`   | `31..26=0x11 25=1 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,integer,mask`     |
  | `wmerge.vim` | `31..26=0x17 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,merge,integer`        |
  | `wmv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 wd 6..0=0x57` | `matrix,move,integer`         |
  | `wmseq.vi`   | `31..26=0x18 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsne.vi`   | `31..26=0x19 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsleu.vi`  | `31..26=0x1c vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsle.vi`   | `31..26=0x1d vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsgtu.vi`  | `31..26=0x1e vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `matrix,compare,integer,mask` |
  | `wmsgt.vi`   | `31..26=0x1f vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `matrix,compare,integer,mask` |

  : OPIWI II

  | **Name**     | **Opcode / Argument**                                   | **Class**                    |
  |:-------------|:--------------------------------------------------------|:-----------------------------|
  | `wsaddu.vi`  | `31..26=0x20 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,fixed-point`     |
  | `wsadd.vi`   | `31..26=0x21 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,fixed-point`     |
  | `wsll.vi`    | `31..26=0x25 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,integer`         |
  | `wmv1r.v`    | `31..26=0x27 25=1 ws2 19..15=0 14..12=0x3 wd 6..0=0x57` | `matrix,move,whole-register` |
  | `wmv2r.v`    | `31..26=0x27 25=1 ws2 19..15=1 14..12=0x3 wd 6..0=0x57` | `matrix,move,whole-register` |
  | `wmv4r.v`    | `31..26=0x27 25=1 ws2 19..15=3 14..12=0x3 wd 6..0=0x57` | `matrix,move,whole-register` |
  | `wmv8r.v`    | `31..26=0x27 25=1 ws2 19..15=7 14..12=0x3 wd 6..0=0x57` | `matrix,move,whole-register` |
  | `wsrl.vi`    | `31..26=0x28 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,integer`         |
  | `wsra.vi`    | `31..26=0x29 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,integer`         |
  | `wssrl.vi`   | `31..26=0x2a vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,fixed-point`     |
  | `wssra.vi`   | `31..26=0x2b vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,fixed-point`     |
  | `wnsrl.wi`   | `31..26=0x2c vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,integer`         |
  | `wnsra.wi`   | `31..26=0x2d vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,integer`         |
  | `wnclipu.wi` | `31..26=0x2e vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,fixed-point`     |
  | `wnclip.wi`  | `31..26=0x2f vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `matrix,alu,fixed-point`     |

  : OPIWI III

* **OPI (Matrix Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Class**            |
  |:------------|:------------------------------------------------------|:---------------------|
  | `wzext.vf8` | `31..26=0x12 vm ws2 19..15=2 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wsext.vf8` | `31..26=0x12 vm ws2 19..15=3 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wzext.vf4` | `31..26=0x12 vm ws2 19..15=4 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wsext.vf4` | `31..26=0x12 vm ws2 19..15=5 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wzext.vf2` | `31..26=0x12 vm ws2 19..15=6 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer` |
  | `wsext.vf2` | `31..26=0x12 vm ws2 19..15=7 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer` |

  : Matrix Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Class**                 |
  |:---------------|:---------------------------------------------------|:--------------------------|
  | `wcompress.vm` | `31..26=0x17 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,permute,compress` |
  | `wmandn.mm`    | `31..26=0x18 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,logical,mask`     |
  | `wmand.mm`     | `31..26=0x19 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,logical,mask`     |
  | `wmor.mm`      | `31..26=0x1a 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,logical,mask`     |
  | `wmxor.mm`     | `31..26=0x1b 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,logical,mask`     |
  | `wmorn.mm`     | `31..26=0x1c 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,logical,mask`     |
  | `wmnand.mm`    | `31..26=0x1d 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,logical,mask`     |
  | `wmnor.mm`     | `31..26=0x1e 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,logical,mask`     |
  | `wmxnor.mm`    | `31..26=0x1f 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,logical,mask`     |

  : Matrix Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Class**            |
  |:-----------|:--------------------------------------------------------------|:---------------------|
  | `wmsbf.m`  | `31..26=0x14 vm ws2 19..15=0x01 14..12=0x2 wd 6..0=0x57`      | `matrix,mask,prefix` |
  | `wmsof.m`  | `31..26=0x14 vm ws2 19..15=0x02 14..12=0x2 wd 6..0=0x57`      | `matrix,mask,prefix` |
  | `wmsif.m`  | `31..26=0x14 vm ws2 19..15=0x03 14..12=0x2 wd 6..0=0x57`      | `matrix,mask,prefix` |
  | `wiota.m`  | `31..26=0x14 vm ws2 19..15=0x10 14..12=0x2 wd 6..0=0x57`      | `matrix,mask,prefix` |
  | `wid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 wd 6..0=0x57` | `matrix,index`       |
  | `wcpop.m`  | `31..26=0x10 vm ws2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `matrix,mask,count`  |
  | `wfirst.m` | `31..26=0x10 vm ws2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `matrix,mask,search` |

  : Matrix Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Class**                 |
  |:-------------|:-------------------------------------------------|:--------------------------|
  | `wdivu.vv`   | `31..26=0x20 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,divide,integer`   |
  | `wdiv.vv`    | `31..26=0x21 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,divide,integer`   |
  | `wremu.vv`   | `31..26=0x22 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,divide,integer`   |
  | `wrem.vv`    | `31..26=0x23 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,divide,integer`   |
  | `wmulhu.vv`  | `31..26=0x24 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmul.vv`    | `31..26=0x25 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmulhsu.vv` | `31..26=0x26 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmulh.vv`   | `31..26=0x27 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmadd.vv`   | `31..26=0x29 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wnmsub.vv`  | `31..26=0x2b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmacc.vv`   | `31..26=0x2d vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wnmsac.vv`  | `31..26=0x2f vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |

  : Matrix Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Class**                 |
  |:--------------|:-------------------------------------------------|:--------------------------|
  | `wwaddu.vv`   | `31..26=0x30 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwadd.vv`    | `31..26=0x31 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwsubu.vv`   | `31..26=0x32 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwsub.vv`    | `31..26=0x33 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwaddu.wv`   | `31..26=0x34 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwadd.wv`    | `31..26=0x35 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwsubu.wv`   | `31..26=0x36 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwsub.wv`    | `31..26=0x37 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwmulu.vv`   | `31..26=0x38 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmulsu.vv`  | `31..26=0x3a vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmul.vv`    | `31..26=0x3b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmaccu.vv`  | `31..26=0x3c vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmacc.vv`   | `31..26=0x3d vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmaccsu.vv` | `31..26=0x3f vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,multiply,integer` |

  : Matrix Integer Extension Instructions V

**Matrix Mask Instructions**

* **OPMWW**

  | **Name**      | **Opcode / Argument**                            | **Class**                  |
  |:--------------|:-------------------------------------------------|:---------------------------|
  | `wredsum.ws`  | `31..26=0x00 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `wredand.ws`  | `31..26=0x01 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `wredor.ws`   | `31..26=0x02 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `wredxor.ws`  | `31..26=0x03 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `wredminu.ws` | `31..26=0x04 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `wredmin.ws`  | `31..26=0x05 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `wredmaxu.ws` | `31..26=0x06 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `wredmax.ws`  | `31..26=0x07 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,reduction,integer` |
  | `waaddu.vv`   | `31..26=0x08 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,fixed-point`   |
  | `waadd.vv`    | `31..26=0x09 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,fixed-point`   |
  | `wasubu.vv`   | `31..26=0x0a vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,fixed-point`   |
  | `wasub.vv`    | `31..26=0x0b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `matrix,alu,fixed-point`   |

  : OPMWW I

  | **Name**  | **Opcode / Argument**                                   | **Class**             |
  |:----------|:--------------------------------------------------------|:----------------------|
  | `wmv.x.s` | `31..26=0x10 25=1 ws2 19..15=0 14..12=0x2 rd 6..0=0x57` | `matrix,move,integer` |

  : OPMWW II

* **OPMWX**

  | **Name**    | **Opcode / Argument**                            | **Class**                |
  |:------------|:-------------------------------------------------|:-------------------------|
  | `waaddu.vx` | `31..26=0x08 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `waadd.vx`  | `31..26=0x09 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wasubu.vx` | `31..26=0x0a vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,fixed-point` |
  | `wasub.vx`  | `31..26=0x0b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,fixed-point` |

  : OPMWX I

  | **Name**         | **Opcode / Argument**                                   | **Class**             |
  |:-----------------|:--------------------------------------------------------|:----------------------|
  | `wmv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,move,integer` |
  | `wslide1up.vx`   | `31..26=0x0e vm ws2 rs1 14..12=0x6 wd 6..0=0x57`        | `matrix,permute`      |
  | `wslide1down.vx` | `31..26=0x0f vm ws2 rs1 14..12=0x6 wd 6..0=0x57`        | `matrix,permute`      |

  : OPMWX II

  | **Name**     | **Opcode / Argument**                            | **Class**                 |
  |:-------------|:-------------------------------------------------|:--------------------------|
  | `wdivu.vx`   | `31..26=0x20 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,divide,integer`   |
  | `wdiv.vx`    | `31..26=0x21 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,divide,integer`   |
  | `wremu.vx`   | `31..26=0x22 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,divide,integer`   |
  | `wrem.vx`    | `31..26=0x23 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,divide,integer`   |
  | `wmulhu.vx`  | `31..26=0x24 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmul.vx`    | `31..26=0x25 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmulhsu.vx` | `31..26=0x26 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmulh.vx`   | `31..26=0x27 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmadd.vx`   | `31..26=0x29 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wnmsub.vx`  | `31..26=0x2b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wmacc.vx`   | `31..26=0x2d vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wnmsac.vx`  | `31..26=0x2f vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |

  : OPMWX III

  | **Name**      | **Opcode / Argument**                            | **Class**                 |
  |:--------------|:-------------------------------------------------|:--------------------------|
  | `wwaddu.vx`   | `31..26=0x30 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwadd.vx`    | `31..26=0x31 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwsubu.vx`   | `31..26=0x32 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwsub.vx`    | `31..26=0x33 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwaddu.wx`   | `31..26=0x34 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwadd.wx`    | `31..26=0x35 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwsubu.wx`   | `31..26=0x36 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwsub.wx`    | `31..26=0x37 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,alu,integer`      |
  | `wwmulu.vx`   | `31..26=0x38 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmulsu.vx`  | `31..26=0x3a vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmul.vx`    | `31..26=0x3b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmaccu.vx`  | `31..26=0x3c vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmacc.vx`   | `31..26=0x3d vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmaccus.vx` | `31..26=0x3e vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |
  | `wwmaccsu.vx` | `31..26=0x3f vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `matrix,multiply,integer` |

  : OPMWX IV
