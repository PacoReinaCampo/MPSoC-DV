## OPCODE ENCODING INFORMATION

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

  | **Name**   | **Opcode / Argument**                              | **Format**                  |
  |:-----------|:---------------------------------------------------|:----------------------------|
  | `wsetiwli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `wsetwli rd, rs1, wtypei`   |
  | `wsetwli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `wsetiwli rd, uimm, wtypei` |
  | `wsetwl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `wsetwl  rd, rs1, rs2`      |

  : Configuration Setting

**OPLS (Matrix Loads and Store)**

* **Matrix Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Format**               |
  |:----------|:-----------------------------------------------------------------|:-------------------------|
  | `wlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  wd 6..0=0x07` | `wlm.v   wd, (rs1)`      |
  | `wsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 ws3 6..0=0x27` | `wsm.v   ws3, (rs1)`     |
  | `wle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  wd 6..0=0x07`      | `wle8.v  wd, (rs1), vm`  |
  | `wle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  wd 6..0=0x07`      | `wle16.v wd, (rs1), vm`  |
  | `wle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  wd 6..0=0x07`      | `wle32.v wd, (rs1), vm`  |
  | `wle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  wd 6..0=0x07`      | `wle64.v wd, (rs1), vm`  |
  | `wse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 ws3 6..0=0x27`      | `wse8.v  ws3, (rs1), vm` |
  | `wse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 ws3 6..0=0x27`      | `wse16.v ws3, (rs1), vm` |
  | `wse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 ws3 6..0=0x27`      | `wse32.v ws3, (rs1), vm` |
  | `wse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 ws3 6..0=0x27`      | `wse64.v ws3, (rs1), vm` |

  : Matrix Unit-Stride Instructions (including segment part)

* **Matrix Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Format**                        |
  |:-------------|:-------------------------------------------------------|:----------------------------------|
  | `wluxei8.v`  | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x0  wd 6..0=0x07` | `wluxei8.v    wd, (rs1), ws2, vm` |
  | `wluxei16.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x5  wd 6..0=0x07` | `wluxei16.v   wd, (rs1), ws2, vm` |
  | `wluxei32.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x6  wd 6..0=0x07` | `wluxei32.v   wd, (rs1), ws2, vm` |
  | `wluxei64.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x7  wd 6..0=0x07` | `wluxei64.v   wd, (rs1), ws2, vm` |
  | `wsuxei8.v`  | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x0 ws3 6..0=0x27` | `wsuxei8.v   ws3, (rs1), ws2, vm` |
  | `wsuxei16.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x5 ws3 6..0=0x27` | `wsuxei16.v  ws3, (rs1), ws2, vm` |
  | `wsuxei32.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x6 ws3 6..0=0x27` | `wsuxei32.v  ws3, (rs1), ws2, vm` |
  | `wsuxei64.v` | `nf 28=0 27..26=1 vm ws2 rs1 14..12=0x7 ws3 6..0=0x27` | `wsuxei64.v  ws3, (rs1), ws2, vm` |

  : Matrix Indexed-Unordered Instructions (including segment part)

* **Matrix Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Format**                       |
  |:-----------|:-------------------------------------------------------|:---------------------------------|
  | `wlse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  wd 6..0=0x07` | `wlse8.v    wd,  (rs1), rs2, vm` |
  | `wlse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  wd 6..0=0x07` | `wlse16.v   wd,  (rs1), rs2, vm` |
  | `wlse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  wd 6..0=0x07` | `wlse32.v   wd,  (rs1), rs2, vm` |
  | `wlse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  wd 6..0=0x07` | `wlse64.v   wd,  (rs1), rs2, vm` |
  | `wsse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 ws3 6..0=0x27` | `wsse8.v    ws3, (rs1), rs2, vm` |
  | `wsse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 ws3 6..0=0x27` | `wsse16.v   ws3, (rs1), rs2, vm` |
  | `wsse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 ws3 6..0=0x27` | `wsse32.v   ws3, (rs1), rs2, vm` |
  | `wsse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 ws3 6..0=0x27` | `wsse64.v   ws3, (rs1), rs2, vm` |

  : Matrix Strided Instructions (including segment part)

* **Matrix Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Format**                         |
  |:-------------|:-------------------------------------------------------|:-----------------------------------|
  | `wloxei8.v`  | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x0  wd 6..0=0x07` | `wloxei8.v    wd, (rs1), ws2, vm`  |
  | `wloxei16.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x5  wd 6..0=0x07` | `wloxei16.v   wd, (rs1), ws2, vm`  |
  | `wloxei32.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x6  wd 6..0=0x07` | `wloxei32.v   wd, (rs1), ws2, vm`  |
  | `wloxei64.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x7  wd 6..0=0x07` | `wloxei64.v   wd, (rs1), ws2, vm`  |
  | `wsoxei8.v`  | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x0 ws3 6..0=0x27` | `wsoxei8.v    ws3, (rs1), ws2, vm` |
  | `wsoxei16.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x5 ws3 6..0=0x27` | `wsoxei16.v   ws3, (rs1), ws2, vm` |
  | `wsoxei32.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x6 ws3 6..0=0x27` | `wsoxei32.v   ws3, (rs1), ws2, vm` |
  | `wsoxei64.v` | `nf 28=0 27..26=3 vm ws2 rs1 14..12=0x7 ws3 6..0=0x27` | `wsoxei64.v   ws3, (rs1), ws2, vm` |

  : Matrix Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Format**                  |
  |:------------|:---------------------------------------------------------------|:----------------------------|
  | `wle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  wd 6..0=0x07` | `wle8ff.v    wd, (rs1), vm` |
  | `wle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  wd 6..0=0x07` | `wle16ff.v   wd, (rs1), vm` |
  | `wle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  wd 6..0=0x07` | `wle32ff.v   wd, (rs1), vm` |
  | `wle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  wd 6..0=0x07` | `wle64ff.v   wd, (rs1), vm` |

  : Unit-stride Fault-Only-First Loads

* **Matrix Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Format**             |
  |:------------|:-----------------------------------------------------------------------|:-----------------------|
  | `wl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `wl1re8.v    v3, (a0)` |
  | `wl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `wl1re16.v   v3, (a0)` |
  | `wl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `wl1re32.v   v3, (a0)` |
  | `wl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `wl1re64.v   v3, (a0)` |
  | `wl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `wl2re8.v    v2, (a0)` |
  | `wl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `wl2re16.v   v2, (a0)` |
  | `wl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `wl2re32.v   v2, (a0)` |
  | `wl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `wl2re64.v   v2, (a0)` |
  | `wl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `wl4re8.v    v4, (a0)` |
  | `wl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `wl4re16.v   v4, (a0)` |
  | `wl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `wl4re32.v   v4, (a0)` |
  | `wl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `wl4re64.v   v4, (a0)` |
  | `wl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07` | `wl8re8.v    v8, (a0)` |
  | `wl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 wd  6..0=0x07` | `wl8re16.v   v8, (a0)` |
  | `wl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 wd  6..0=0x07` | `wl8re32.v   v8, (a0)` |
  | `wl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 wd  6..0=0x07` | `wl8re64.v   v8, (a0)` |
  | `ws1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `ws1r.v v3, (a1)`      |
  | `ws2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `ws2r.v v2, (a1)`      |
  | `ws4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `ws4r.v v4, (a1)`      |
  | `ws8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 ws3 6..0=0x27` | `ws8r.v v8, (a1)`      |

  : Matrix Load/Store Whole Registers

**Matrix Float-Point Instructions**

* **OPFWF**

  | **Name**          | **Opcode / Argument**                                   | **Format**                         |
  |:------------------|:--------------------------------------------------------|:-----------------------------------|
  | `wfadd.vf`        | `31..26=0x00 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfadd.vf wd, ws2, rs1, vm`        |
  | `wfsub.vf`        | `31..26=0x02 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfsub.vf wd, ws2, rs1, vm`        |
  | `wfmin.vf`        | `31..26=0x04 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfmin.vf wd, ws2, rs1, vm`        |
  | `wfmax.vf`        | `31..26=0x06 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfmax.vf wd, ws2, rs1, vm`        |
  | `wfsgnj.vf`       | `31..26=0x08 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfsgnj.vf wd, ws2, rs1, vm`       |
  | `wfsgnjn.vf`      | `31..26=0x09 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfsgnjn.vf wd, ws2, rs1, vm`      |
  | `wfsgnjx.vf`      | `31..26=0x0a vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfsgnjx.vf wd, ws2, rs1, vm`      |
  | `wfslide1up.vf`   | `31..26=0x0e vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfslide1up.vf wd, ws2, rs1, vm`   |
  | `wfslide1down.vf` | `31..26=0x0f vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wfslide1down.vf wd, ws2, rs1, vm` |
  | `wfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 wd 6..0=0x57` | `wfmv.s.f wd, rs1`                 |

  : OPFWF I

  | **Name**      | **Opcode / Argument**                                   | **Format**                     |
  |:--------------|:--------------------------------------------------------|:-------------------------------|
  | `wfmerge.vfm` | `31..26=0x17 25=0 ws2 rs1 14..12=0x5 wd 6..0=0x57`      | `wfmerge.vfm wd, ws2, rs1, v0` |
  | `wfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 wd 6..0=0x57` | `wfmv.v.f wd, rs1`             |
  | `wmfeq.vf`    | `31..26=0x18 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wmfeq.vf wd, ws2, rs1, vm`    |
  | `wmfle.vf`    | `31..26=0x19 vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wmfle.vf wd, ws2, rs1, vm`    |
  | `wmflt.vf`    | `31..26=0x1b vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wmflt.vf wd, ws2, rs1, vm`    |
  | `wmfne.vf`    | `31..26=0x1c vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wmfne.vf wd, ws2, rs1, vm`    |
  | `wmfgt.vf`    | `31..26=0x1d vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wmfgt.vf wd, ws2, rs1, vm`    |
  | `wmfge.vf`    | `31..26=0x1f vm ws2 rs1 14..12=0x5 wd 6..0=0x57`        | `wmfge.vf wd, ws2, rs1, vm`    |

  : OPFWF II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `wfdiv.vf`   | `31..26=0x20 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfdiv.vf wd, ws2, rs1, vm`   |
  | `wfrdiv.vf`  | `31..26=0x21 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfrdiv.vf wd, ws2, rs1, vm`  |
  | `wfmul.vf`   | `31..26=0x24 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfmul.vf wd, ws2, rs1, vm`   |
  | `wfrsub.vf`  | `31..26=0x27 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfrsub.vf wd, ws2, rs1, vm`  |
  | `wfmadd.vf`  | `31..26=0x28 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfmadd.vf wd, rs1, ws2, vm`  |
  | `wfnmadd.vf` | `31..26=0x29 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfnmadd.vf wd, rs1, ws2, vm` |
  | `wfmsub.vf`  | `31..26=0x2a vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfmsub.vf wd, rs1, ws2, vm`  |
  | `wfnmsub.vf` | `31..26=0x2b vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfnmsub.vf wd, rs1, ws2, vm` |
  | `wfmacc.vf`  | `31..26=0x2c vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfmacc.vf wd, rs1, ws2, vm`  |
  | `wfnmacc.vf` | `31..26=0x2d vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfnmacc.vf wd, rs1, ws2, vm` |
  | `wfmsac.vf`  | `31..26=0x2e vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfmsac.vf wd, rs1, ws2, vm`  |
  | `wfnmsac.vf` | `31..26=0x2f vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfnmsac.vf wd, rs1, ws2, vm` |

  : OPFWF III

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `wfwadd.vf`   | `31..26=0x30 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwadd.vf wd, ws2, rs1, vm`   |
  | `wfwsub.vf`   | `31..26=0x32 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwsub.vf wd, ws2, rs1, vm`   |
  | `wfwadd.wf`   | `31..26=0x34 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwadd.wf wd, ws2, rs1, vm`   |
  | `wfwsub.wf`   | `31..26=0x36 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwsub.wf wd, ws2, rs1, vm`   |
  | `wfwmul.vf`   | `31..26=0x38 vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwmul.vf wd, ws2, rs1, vm`   |
  | `wfwmacc.vf`  | `31..26=0x3c vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwmacc.vf wd, rs1, ws2, vm`  |
  | `wfwnmacc.vf` | `31..26=0x3d vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwnmacc.vf wd, rs1, ws2, vm` |
  | `wfwmsac.vf`  | `31..26=0x3e vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwmsac.vf wd, rs1, ws2, vm`  |
  | `wfwnmsac.vf` | `31..26=0x3f vm ws2 rs1 14..12=0x5 wd 6..0=0x57` | `wfwnmsac.vf wd, rs1, ws2, vm` |

  : OPFWF IV

* **OPFWW**

  | **Name**       | **Opcode / Argument**                                   | **Format**                      |
  |:---------------|:--------------------------------------------------------|:--------------------------------|
  | `wfadd.vv`     | `31..26=0x00 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfadd.vv wd, ws2, ws1, vm`     |
  | `wfredusum.ws` | `31..26=0x01 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfredusum.ws wd, ws2, ws1, vm` |
  | `wfsub.vv`     | `31..26=0x02 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfsub.vv wd, ws2, ws1, vm`     |
  | `wfredosum.ws` | `31..26=0x03 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfredosum.ws wd, ws2, ws1, vm` |
  | `wfmin.vv`     | `31..26=0x04 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfmin.vv wd, ws2, ws1, vm`     |
  | `wfredmin.ws`  | `31..26=0x05 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfredmin.ws  wd, ws2, ws1, vm` |
  | `wfmax.vv`     | `31..26=0x06 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfmax.vv wd, ws2, ws1, vm`     |
  | `wfredmax.ws`  | `31..26=0x07 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfredmax.ws  wd, ws2, ws1, vm` |
  | `wfsgnj.vv`    | `31..26=0x08 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfsgnj.vv wd, ws2, ws1, vm`    |
  | `wfsgnjn.vv`   | `31..26=0x09 vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfsgnjn.vv wd, ws2, ws1, vm`   |
  | `wfsgnjx.vv`   | `31..26=0x0a vm ws2 ws1 14..12=0x1 wd 6..0=0x57`        | `wfsgnjx.vv wd, ws2, ws1, vm`   |
  | `wfmv.f.s`     | `31..26=0x10 25=1 ws2 19..15=0 14..12=0x1 rd 6..0=0x57` | `wfmv.f.s rd, ws2`              |

  : OPFWW I

  | **Name**   | **Opcode / Argument**                            | **Format**                  |
  |:-----------|:-------------------------------------------------|:----------------------------|
  | `wmfeq.vv` | `31..26=0x18 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wmfeq.vv wd, ws2, ws1, vm` |
  | `wmfle.vv` | `31..26=0x19 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wmfle.vv wd, ws2, ws1, vm` |
  | `wmflt.vv` | `31..26=0x1b vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wmflt.vv wd, ws2, ws1, vm` |
  | `wmfne.vv` | `31..26=0x1c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wmfne.vv wd, ws2, ws1, vm` |

  : OPFWW II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `wfdiv.vv`   | `31..26=0x20 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfdiv.vv wd, ws2, ws1, vm`   |
  | `wfmul.vv`   | `31..26=0x24 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfmul.vv wd, ws2, ws1, vm`   |
  | `wfmadd.vv`  | `31..26=0x28 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfmadd.vv wd, ws1, ws2, vm`  |
  | `wfnmadd.vv` | `31..26=0x29 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfnmadd.vv wd, ws1, ws2, vm` |
  | `wfmsub.vv`  | `31..26=0x2a vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfmsub.vv wd, ws1, ws2, vm`  |
  | `wfnmsub.vv` | `31..26=0x2b vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfnmsub.vv wd, ws1, ws2, vm` |
  | `wfmacc.vv`  | `31..26=0x2c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfmacc.vv wd, ws1, ws2, vm`  |
  | `wfnmacc.vv` | `31..26=0x2d vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfnmacc.vv wd, ws1, ws2, vm` |
  | `wfmsac.vv`  | `31..26=0x2e vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfmsac.vv wd, ws1, ws2, vm`  |
  | `wfnmsac.vv` | `31..26=0x2f vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfnmsac.vv wd, ws1, ws2, vm` |

  : OPFWW III

  | **Name**           | **Opcode / Argument**                                    | **Format**                     |
  |:-------------------|:---------------------------------------------------------|:-------------------------------|
  | `wfcvt.xu.f.v`     | `31..26=0x12 vm ws2 19..15=0x00 14..12=0x1 wd 6..0=0x57` | `wfcvt.xu.f.v wd, ws2, vm`     |
  | `wfcvt.x.f.v`      | `31..26=0x12 vm ws2 19..15=0x01 14..12=0x1 wd 6..0=0x57` | `wfcvt.x.f.v  wd, ws2, vm`     |
  | `wfcvt.f.xu.v`     | `31..26=0x12 vm ws2 19..15=0x02 14..12=0x1 wd 6..0=0x57` | `wfcvt.f.xu.v wd, ws2, vm`     |
  | `wfcvt.f.x.v`      | `31..26=0x12 vm ws2 19..15=0x03 14..12=0x1 wd 6..0=0x57` | `wfcvt.f.x.v  wd, ws2, vm`     |
  | `wfcvt.rtz.xu.f.v` | `31..26=0x12 vm ws2 19..15=0x06 14..12=0x1 wd 6..0=0x57` | `wfcvt.rtz.xu.f.v wd, ws2, vm` |
  | `wfcvt.rtz.x.f.v`  | `31..26=0x12 vm ws2 19..15=0x07 14..12=0x1 wd 6..0=0x57` | `wfcvt.rtz.x.f.v  wd, ws2, vm` |

  : OPFWW IV

  | **Name**            | **Opcode / Argument**                                    | **Format**                      |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `wfwcvt.xu.f.v`     | `31..26=0x12 vm ws2 19..15=0x08 14..12=0x1 wd 6..0=0x57` | `wfwcvt.xu.f.v wd, ws2, vm`     |
  | `wfwcvt.x.f.v`      | `31..26=0x12 vm ws2 19..15=0x09 14..12=0x1 wd 6..0=0x57` | `wfwcvt.x.f.v  wd, ws2, vm`     |
  | `wfwcvt.f.xu.v`     | `31..26=0x12 vm ws2 19..15=0x0A 14..12=0x1 wd 6..0=0x57` | `wfwcvt.f.xu.v wd, ws2, vm`     |
  | `wfwcvt.f.x.v`      | `31..26=0x12 vm ws2 19..15=0x0B 14..12=0x1 wd 6..0=0x57` | `wfwcvt.f.x.v  wd, ws2, vm`     |
  | `wfwcvt.f.f.v`      | `31..26=0x12 vm ws2 19..15=0x0C 14..12=0x1 wd 6..0=0x57` | `wfwcvt.f.f.v wd, ws2, vm`      |
  | `wfwcvt.rtz.xu.f.v` | `31..26=0x12 vm ws2 19..15=0x0E 14..12=0x1 wd 6..0=0x57` | `wfwcvt.rtz.xu.f.v wd, ws2, vm` |
  | `wfwcvt.rtz.x.f.v`  | `31..26=0x12 vm ws2 19..15=0x0F 14..12=0x1 wd 6..0=0x57` | `wfwcvt.rtz.x.f.v  wd, ws2, vm` |

  : OPFWW V

  | **Name**            | **Opcode / Argument**                                    | **Format**                      |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `wfncvt.xu.f.w`     | `31..26=0x12 vm ws2 19..15=0x10 14..12=0x1 wd 6..0=0x57` | `wfncvt.xu.f.w wd, ws2, vm`     |
  | `wfncvt.x.f.w`      | `31..26=0x12 vm ws2 19..15=0x11 14..12=0x1 wd 6..0=0x57` | `wfncvt.x.f.w  wd, ws2, vm`     |
  | `wfncvt.f.xu.w`     | `31..26=0x12 vm ws2 19..15=0x12 14..12=0x1 wd 6..0=0x57` | `wfncvt.f.xu.w wd, ws2, vm`     |
  | `wfncvt.f.x.w`      | `31..26=0x12 vm ws2 19..15=0x13 14..12=0x1 wd 6..0=0x57` | `wfncvt.f.x.w  wd, ws2, vm`     |
  | `wfncvt.f.f.w`      | `31..26=0x12 vm ws2 19..15=0x14 14..12=0x1 wd 6..0=0x57` | `wfncvt.f.f.w wd, ws2, vm`      |
  | `wfncvt.rod.f.f.w`  | `31..26=0x12 vm ws2 19..15=0x15 14..12=0x1 wd 6..0=0x57` | `wfncvt.rod.f.f.w wd, ws2, vm`  |
  | `wfncvt.rtz.xu.f.w` | `31..26=0x12 vm ws2 19..15=0x16 14..12=0x1 wd 6..0=0x57` | `wfncvt.rtz.xu.f.w wd, ws2, vm` |
  | `wfncvt.rtz.x.f.w`  | `31..26=0x12 vm ws2 19..15=0x17 14..12=0x1 wd 6..0=0x57` | `wfncvt.rtz.x.f.w  wd, ws2, vm` |

  : OPFWW VI

  | **Name**     | **Opcode / Argument**                                    | **Format**               |
  |:-------------|:---------------------------------------------------------|:-------------------------|
  | `wfsqrt.v`   | `31..26=0x13 vm ws2 19..15=0x00 14..12=0x1 wd 6..0=0x57` | `wfsqrt.v   wd, ws2, vm` |
  | `wfrsqrt7.v` | `31..26=0x13 vm ws2 19..15=0x04 14..12=0x1 wd 6..0=0x57` | `wfrsqrt7.v wd, ws2, vm` |
  | `wfrec7.v`   | `31..26=0x13 vm ws2 19..15=0x05 14..12=0x1 wd 6..0=0x57` | `wfrec7.v   wd, ws2, vm` |
  | `wfclass.v`  | `31..26=0x13 vm ws2 19..15=0x10 14..12=0x1 wd 6..0=0x57` | `wfclass.v  wd, ws2, vm` |

  : OPFWW VII

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `wfwadd.vv`     | `31..26=0x30 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwadd.vv wd, ws2, ws1, vm`     |
  | `wfwredusum.ws` | `31..26=0x31 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwredusum.ws wd, ws2, ws1, vm` |
  | `wfwsub.vv`     | `31..26=0x32 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwsub.vv wd, ws2, ws1, vm`     |
  | `wfwredosum.ws` | `31..26=0x33 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwredosum.ws wd, ws2, ws1, vm` |
  | `wfwadd.wv`     | `31..26=0x34 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwadd.wv  wd, ws2, ws1, vm`    |
  | `wfwsub.wv`     | `31..26=0x36 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwsub.wv  wd, ws2, ws1, vm`    |
  | `wfwmul.vv`     | `31..26=0x38 vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwmul.vv    wd, ws2, ws1, vm`  |
  | `wfwmacc.vv`    | `31..26=0x3c vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwmacc.vv wd, ws1, ws2, vm`    |
  | `wfwnmacc.vv`   | `31..26=0x3d vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwnmacc.vv wd, ws1, ws2, vm`   |
  | `wfwmsac.vv`    | `31..26=0x3e vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwmsac.vv wd, ws1, ws2, vm`    |
  | `wfwnmsac.vv`   | `31..26=0x3f vm ws2 ws1 14..12=0x1 wd 6..0=0x57` | `wfwnmsac.vv wd, ws1, ws2, vm`   |

  : OPFWW VIII

**Matrix Integer Instructions**

* **OPIWX**

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `wadd.vx`       | `31..26=0x00 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wadd.vx wd, ws2, rs1, vm`       |
  | `wsub.vx`       | `31..26=0x02 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wsub.vx wd, ws2, rs1, vm`       |
  | `wrsub.vx`      | `31..26=0x03 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wrsub.vx wd, ws2, rs1, vm`      |
  | `wminu.vx`      | `31..26=0x04 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wminu.vx wd, ws2, rs1, vm`      |
  | `wmin.vx`       | `31..26=0x05 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wmin.vx wd, ws2, rs1, vm`       |
  | `wmaxu.vx`      | `31..26=0x06 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wmaxu.vx wd, ws2, rs1, vm`      |
  | `wmax.vx`       | `31..26=0x07 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wmax.vx wd, ws2, rs1, vm`       |
  | `wand.vx`       | `31..26=0x09 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wand.vx wd, ws2, rs1, vm`       |
  | `wor.vx`        | `31..26=0x0a vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wor.vx wd, ws2, rs1, vm`        |
  | `wxor.vx`       | `31..26=0x0b vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wxor.vx wd, ws2, rs1, vm`       |
  | `wrgather.vx`   | `31..26=0x0c vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wrgather.vx wd, ws2, rs1, vm`   |
  | `wslideup.vx`   | `31..26=0x0e vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wslideup.vx wd, ws2, rs1, vm`   |
  | `wslidedown.vx` | `31..26=0x0f vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wslidedown.vx wd, ws2, rs1, vm` |

  : OPIWX I

  | **Name**     | **Opcode / Argument**                                   | **Format**                    |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `wadc.vxm`   | `31..26=0x10 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `wadc.vxm wd, ws2, rs1, v0`   |
  | `wmadc.vxm`  | `31..26=0x11 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `wmadc.vxm wd, ws2, rs1, v0`  |
  | `wmadc.vx`   | `31..26=0x11 25=1 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `wmadc.vx wd, ws2, rs1`       |
  | `wsbc.vxm`   | `31..26=0x12 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `wsbc.vxm wd, ws2, rs1, v0`   |
  | `wmsbc.vxm`  | `31..26=0x13 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `wmsbc.vxm wd, ws2, rs1, v0`  |
  | `wmsbc.vx`   | `31..26=0x13 25=1 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `wmsbc.vx wd, ws2, rs1`       |
  | `wmerge.vxm` | `31..26=0x17 25=0 ws2 rs1 14..12=0x4 wd 6..0=0x57`      | `wmerge.vxm wd, ws2, rs1, v0` |
  | `wmv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 wd 6..0=0x57` | `wmv.v.x wd, rs1`             |
  | `wmseq.vx`   | `31..26=0x18 vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `wmseq.vx wd, ws2, rs1, vm`   |
  | `wmsne.vx`   | `31..26=0x19 vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `wmsne.vx wd, ws2, rs1, vm`   |
  | `wmsltu.vx`  | `31..26=0x1a vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `wmsltu.vx wd, ws2, rs1, vm`  |
  | `wmslt.vx`   | `31..26=0x1b vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `wmslt.vx wd, ws2, rs1, vm`   |
  | `wmsleu.vx`  | `31..26=0x1c vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `wmsleu.vx wd, ws2, rs1, vm`  |
  | `wmsle.vx`   | `31..26=0x1d vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `wmsle.vx wd, ws2, rs1, vm`   |
  | `wmsgtu.vx`  | `31..26=0x1e vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `wmsgtu.vx wd, ws2, rs1, vm`  |
  | `wmsgt.vx`   | `31..26=0x1f vm ws2 rs1 14..12=0x4 wd 6..0=0x57`        | `wmsgt.vx wd, ws2, rs1, vm`   |

  : OPIWX II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `wsaddu.vx`  | `31..26=0x20 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wsaddu.vx wd, ws2, rs1, vm`  |
  | `wsadd.vx`   | `31..26=0x21 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wsadd.vx wd, ws2, rs1, vm`   |
  | `wssubu.vx`  | `31..26=0x22 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wssubu.vx wd, ws2, rs1, vm`  |
  | `wssub.vx`   | `31..26=0x23 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wssub.vx wd, ws2, rs1, vm`   |
  | `wsll.vx`    | `31..26=0x25 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wsll.vx wd, ws2, rs1, vm`    |
  | `wsmul.vx`   | `31..26=0x27 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wsmul.vx wd, ws2, rs1, vm`   |
  | `wsrl.vx`    | `31..26=0x28 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wsrl.vx wd, ws2, rs1, vm`    |
  | `wsra.vx`    | `31..26=0x29 vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wsra.vx wd, ws2, rs1, vm`    |
  | `wssrl.vx`   | `31..26=0x2a vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wssrl.vx wd, ws2, rs1, vm`   |
  | `wssra.vx`   | `31..26=0x2b vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wssra.vx wd, ws2, rs1, vm`   |
  | `wnsrl.wx`   | `31..26=0x2c vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wnsrl.wx wd, ws2, rs1, vm`   |
  | `wnsra.wx`   | `31..26=0x2d vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wnsra.wx wd, ws2, rs1, vm`   |
  | `wnclipu.wx` | `31..26=0x2e vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wnclipu.wx wd, ws2, rs1, vm` |
  | `wnclip.wx`  | `31..26=0x2f vm ws2 rs1 14..12=0x4 wd 6..0=0x57` | `wnclip.wx wd, ws2, rs1, vm`  |

  : OPIWX III

* **OPIWW**

  | **Name**          | **Opcode / Argument**                            | **Format**                         |
  |:------------------|:-------------------------------------------------|:-----------------------------------|
  | `wadd.vv`         | `31..26=0x00 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wadd.vv wd, ws2, ws1, vm`         |
  | `wsub.vv`         | `31..26=0x02 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wsub.vv wd, ws2, ws1, vm`         |
  | `wminu.vv`        | `31..26=0x04 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wminu.vv wd, ws2, ws1, vm`        |
  | `wmin.vv`         | `31..26=0x05 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wmin.vv wd, ws2, ws1, vm`         |
  | `wmaxu.vv`        | `31..26=0x06 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wmaxu.vv wd, ws2, ws1, vm`        |
  | `wmax.vv`         | `31..26=0x07 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wmax.vv wd, ws2, ws1, vm`         |
  | `wand.vv`         | `31..26=0x09 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wand.vv wd, ws2, ws1, vm`         |
  | `wor.vv`          | `31..26=0x0a vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wor.vv wd, ws2, ws1, vm`          |
  | `wxor.vv`         | `31..26=0x0b vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wxor.vv wd, ws2, ws1, vm`         |
  | `wrgather.vv`     | `31..26=0x0c vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wrgather.vv wd, ws2, ws1, vm`     |
  | `wrgatherei16.vv` | `31..26=0x0e vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wrgatherei16.vv wd, ws2, ws1, vm` |

  : OPIWW I

  | **Name**     | **Opcode / Argument**                                   | **Format**                    |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `wadc.vvm`   | `31..26=0x10 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `wadc.vvm wd, ws2, ws1, v0`   |
  | `wmadc.vvm`  | `31..26=0x11 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `wmadc.vvm wd, ws2, ws1, v0`  |
  | `wmadc.vv`   | `31..26=0x11 25=1 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `wmadc.vv wd, ws2, ws1`       |
  | `wsbc.vvm`   | `31..26=0x12 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `wsbc.vvm wd, ws2, ws1, v0`   |
  | `wmsbc.vvm`  | `31..26=0x13 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `wmsbc.vvm wd, ws2, ws1, v0`  |
  | `wmsbc.vv`   | `31..26=0x13 25=1 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `wmsbc.vv wd, ws2, ws1`       |
  | `wmerge.vvm` | `31..26=0x17 25=0 ws2 ws1 14..12=0x0 wd 6..0=0x57`      | `wmerge.vvm wd, ws2, ws1, v0` |
  | `wmv.v.v`    | `31..26=0x17 25=1 24..20=0 ws1 14..12=0x0 wd 6..0=0x57` | `wmv.v.v wd, ws1`             |
  | `wmseq.vv`   | `31..26=0x18 vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `wmseq.vv wd, ws2, ws1, vm`   |
  | `wmsne.vv`   | `31..26=0x19 vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `wmsne.vv wd, ws2, ws1, vm`   |
  | `wmsltu.vv`  | `31..26=0x1a vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `wmsltu.vv wd, ws2, ws1, vm`  |
  | `wmslt.vv`   | `31..26=0x1b vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `wmslt.vv wd, ws2, ws1, vm`   |
  | `wmsleu.vv`  | `31..26=0x1c vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `wmsleu.vv wd, ws2, ws1, vm`  |
  | `wmsle.vv`   | `31..26=0x1d vm ws2 ws1 14..12=0x0 wd 6..0=0x57`        | `wmsle.vv wd, ws2, ws1, vm`   |

  : OPIWW II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `wsaddu.vv`  | `31..26=0x20 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wsaddu.vv wd, ws2, ws1, vm`  |
  | `wsadd.vv`   | `31..26=0x21 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wsadd.vv wd, ws2, ws1, vm`   |
  | `wssubu.vv`  | `31..26=0x22 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wssubu.vv wd, ws2, ws1, vm`  |
  | `wssub.vv`   | `31..26=0x23 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wssub.vv wd, ws2, ws1, vm`   |
  | `wsll.vv`    | `31..26=0x25 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wsll.vv wd, ws2, ws1, vm`    |
  | `wsmul.vv`   | `31..26=0x27 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wsmul.vv wd, ws2, ws1, vm`   |
  | `wsrl.vv`    | `31..26=0x28 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wsrl.vv wd, ws2, ws1, vm`    |
  | `wsra.vv`    | `31..26=0x29 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wsra.vv wd, ws2, ws1, vm`    |
  | `wssrl.vv`   | `31..26=0x2a vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wssrl.vv wd, ws2, ws1, vm`   |
  | `wssra.vv`   | `31..26=0x2b vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wssra.vv wd, ws2, ws1, vm`   |
  | `wnsrl.wv`   | `31..26=0x2c vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wnsrl.wv wd, ws2, ws1, vm`   |
  | `wnsra.wv`   | `31..26=0x2d vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wnsra.wv wd, ws2, ws1, vm`   |
  | `wnclipu.wv` | `31..26=0x2e vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wnclipu.wv wd, ws2, ws1, vm` |
  | `wnclip.wv`  | `31..26=0x2f vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wnclip.wv wd, ws2, ws1, vm`  |

  : OPIWW III

  | **Name**       | **Opcode / Argument**                            | **Format**                      |
  |:---------------|:-------------------------------------------------|:--------------------------------|
  | `wwredsumu.ws` | `31..26=0x30 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wwredsumu.ws wd, ws2, ws1, vm` |
  | `wwredsum.ws`  | `31..26=0x31 vm ws2 ws1 14..12=0x0 wd 6..0=0x57` | `wwredsum.ws  wd, ws2, ws1, vm` |

  : OPIWW IV

* **OPIWI**

  | **Name**        | **Opcode / Argument**                              | **Format**                        |
  |:----------------|:---------------------------------------------------|:----------------------------------|
  | `wadd.vi`       | `31..26=0x00 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `wadd.vi wd, ws2, imm, vm`        |
  | `wrsub.vi`      | `31..26=0x03 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `wrsub.vi wd, ws2, imm, vm`       |
  | `wand.vi`       | `31..26=0x09 vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `wand.vi wd, ws2, imm, vm`        |
  | `wor.vi`        | `31..26=0x0a vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `wor.vi wd, ws2, imm, vm`         |
  | `wxor.vi`       | `31..26=0x0b vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `wxor.vi wd, ws2, imm, vm`        |
  | `wrgather.vi`   | `31..26=0x0c vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `wrgather.vi wd, ws2, uimm, vm`   |
  | `wslideup.vi`   | `31..26=0x0e vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `wslideup.vi wd, ws2, uimm, vm`   |
  | `wslidedown.vi` | `31..26=0x0f vm ws2 simm5 14..12=0x3 wd 6..0=0x57` | `wslidedown.vi wd, ws2, uimm, vm` |

  : OPIWI I

  | **Name**     | **Opcode / Argument**                                     | **Format**                    |
  |:-------------|:----------------------------------------------------------|:------------------------------|
  | `wadc.vim`   | `31..26=0x10 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wadc.vim wd, ws2, imm, v0`   |
  | `wmadc.vim`  | `31..26=0x11 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wmadc.vim wd, ws2, imm, v0`  |
  | `wmadc.vi`   | `31..26=0x11 25=1 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wmadc.vi wd, ws2, imm`       |
  | `wmerge.vim` | `31..26=0x17 25=0 ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wmerge.vim wd, ws2, imm, v0` |
  | `wmv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 wd 6..0=0x57` | `wmv.v.i wd, imm`             |
  | `wmseq.vi`   | `31..26=0x18 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `wmseq.vi wd, ws2, imm, vm`   |
  | `wmsne.vi`   | `31..26=0x19 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `wmsne.vi wd, ws2, imm, vm`   |
  | `wmsleu.vi`  | `31..26=0x1c vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `wmsleu.vi wd, ws2, imm, vm`  |
  | `wmsle.vi`   | `31..26=0x1d vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `wmsle.vi wd, ws2, imm, vm`   |
  | `wmsgtu.vi`  | `31..26=0x1e vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `wmsgtu.vi wd, ws2, imm, vm`  |
  | `wmsgt.vi`   | `31..26=0x1f vm ws2 simm5 14..12=0x3 wd 6..0=0x57`        | `wmsgt.vi wd, ws2, imm, vm`   |

  : OPIWI II

  | **Name**     | **Opcode / Argument**                                   | **Format**                     |
  |:-------------|:--------------------------------------------------------|:-------------------------------|
  | `wsaddu.vi`  | `31..26=0x20 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wsaddu.vi wd, ws2, imm, vm`   |
  | `wsadd.vi`   | `31..26=0x21 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wsadd.vi wd, ws2, imm, vm`    |
  | `wsll.vi`    | `31..26=0x25 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wsll.vi wd, ws2, uimm, vm`    |
  | `wmv1r.v`    | `31..26=0x27 25=1 ws2 19..15=0 14..12=0x3 wd 6..0=0x57` | `wmv1r.v v1, v2`               |
  | `wmv2r.v`    | `31..26=0x27 25=1 ws2 19..15=1 14..12=0x3 wd 6..0=0x57` | `wmv2r.v v10, v12`             |
  | `wmv4r.v`    | `31..26=0x27 25=1 ws2 19..15=3 14..12=0x3 wd 6..0=0x57` | `wmv4r.v v4, v8`               |
  | `wmv8r.v`    | `31..26=0x27 25=1 ws2 19..15=7 14..12=0x3 wd 6..0=0x57` | `wmv8r.v v0, v8`               |
  | `wsrl.vi`    | `31..26=0x28 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wsrl.vi wd, ws2, uimm, vm`    |
  | `wsra.vi`    | `31..26=0x29 vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wsra.vi wd, ws2, uimm, vm`    |
  | `wssrl.vi`   | `31..26=0x2a vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wssrl.vi wd, ws2, uimm, vm`   |
  | `wssra.vi`   | `31..26=0x2b vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wssra.vi wd, ws2, uimm, vm`   |
  | `wnsrl.wi`   | `31..26=0x2c vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wnsrl.wi wd, ws2, uimm, vm`   |
  | `wnsra.wi`   | `31..26=0x2d vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wnsra.wi wd, ws2, uimm, vm`   |
  | `wnclipu.wi` | `31..26=0x2e vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wnclipu.wi wd, ws2, uimm, vm` |
  | `wnclip.wi`  | `31..26=0x2f vm ws2 simm5 14..12=0x3 wd 6..0=0x57`      | `wnclip.wi wd, ws2, uimm, vm`  |

  : OPIWI III

* **OPI (Matrix Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Format**              |
  |:------------|:------------------------------------------------------|:------------------------|
  | `wzext.vf8` | `31..26=0x12 vm ws2 19..15=2 14..12=0x2 wd 6..0=0x57` | `wzext.vf8 wd, ws2, vm` |
  | `wsext.vf8` | `31..26=0x12 vm ws2 19..15=3 14..12=0x2 wd 6..0=0x57` | `wsext.vf8 wd, ws2, vm` |
  | `wzext.vf4` | `31..26=0x12 vm ws2 19..15=4 14..12=0x2 wd 6..0=0x57` | `wzext.vf4 wd, ws2, vm` |
  | `wsext.vf4` | `31..26=0x12 vm ws2 19..15=5 14..12=0x2 wd 6..0=0x57` | `wsext.vf4 wd, ws2, vm` |
  | `wzext.vf2` | `31..26=0x12 vm ws2 19..15=6 14..12=0x2 wd 6..0=0x57` | `wzext.vf2 wd, ws2, vm` |
  | `wsext.vf2` | `31..26=0x12 vm ws2 19..15=7 14..12=0x2 wd 6..0=0x57` | `wsext.vf2 wd, ws2, vm` |

  : Matrix Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Format**                  |
  |:---------------|:---------------------------------------------------|:----------------------------|
  | `wcompress.vm` | `31..26=0x17 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wcompress.vm wd, ws2, ws1` |
  | `wmandn.mm`    | `31..26=0x18 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmandn.mm wd, ws2, ws1`    |
  | `wmand.mm`     | `31..26=0x19 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmand.mm wd, ws2, ws1`     |
  | `wmor.mm`      | `31..26=0x1a 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmxor.mm  wd, ws2, ws1`    |
  | `wmxor.mm`     | `31..26=0x1b 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmor.mm  wd, ws2, ws1`     |
  | `wmorn.mm`     | `31..26=0x1c 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmorn.mm  wd, ws2, ws1`    |
  | `wmnand.mm`    | `31..26=0x1d 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmnand.mm wd, ws2, ws1`    |
  | `wmnor.mm`     | `31..26=0x1e 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmnor.mm  wd, ws2, ws1`    |
  | `wmxnor.mm`    | `31..26=0x1f 25=1 ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmxnor.mm wd, ws2, ws1`    |

  : Matrix Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Format**             |
  |:-----------|:--------------------------------------------------------------|:-----------------------|
  | `wmsbf.m`  | `31..26=0x14 vm ws2 19..15=0x01 14..12=0x2 wd 6..0=0x57`      | `wmsbf.m wd, ws2, vm`  |
  | `wmsof.m`  | `31..26=0x14 vm ws2 19..15=0x02 14..12=0x2 wd 6..0=0x57`      | `wmsof.m wd, ws2, vm`  |
  | `wmsif.m`  | `31..26=0x14 vm ws2 19..15=0x03 14..12=0x2 wd 6..0=0x57`      | `wmsif.m wd, ws2, vm`  |
  | `wiota.m`  | `31..26=0x14 vm ws2 19..15=0x10 14..12=0x2 wd 6..0=0x57`      | `wiota.m wd, ws2, vm`  |
  | `wid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 wd 6..0=0x57` | `wid.v wd, vm`         |
  | `wcpop.m`  | `31..26=0x10 vm ws2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `wcpop.m rd, ws2, vm`  |
  | `wfirst.m` | `31..26=0x10 vm ws2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `wfirst.m rd, ws2, vm` |

  : Matrix Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `wdivu.vv`   | `31..26=0x20 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wdivu.vv wd, ws2, ws1, vm`   |
  | `wdiv.vv`    | `31..26=0x21 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wdiv.vv wd, ws2, ws1, vm`    |
  | `wremu.vv`   | `31..26=0x22 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wremu.vv wd, ws2, ws1, vm`   |
  | `wrem.vv`    | `31..26=0x23 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wrem.vv wd, ws2, ws1, vm`    |
  | `wmulhu.vv`  | `31..26=0x24 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmulhu.vv wd, ws2, ws1, vm`  |
  | `wmul.vv`    | `31..26=0x25 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmul.vv wd, ws2, ws1, vm`    |
  | `wmulhsu.vv` | `31..26=0x26 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmulhsu.vv wd, ws2, ws1, vm` |
  | `wmulh.vv`   | `31..26=0x27 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmulh.vv wd, ws2, ws1, vm`   |
  | `wmadd.vv`   | `31..26=0x29 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmadd.vv wd, ws1, ws2, vm`   |
  | `wnmsub.vv`  | `31..26=0x2b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wnmsub.vv wd, ws1, ws2, vm`  |
  | `wmacc.vv`   | `31..26=0x2d vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wmacc.vv wd, ws1, ws2, vm`   |
  | `wnmsac.vv`  | `31..26=0x2f vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wnmsac.vv wd, ws1, ws2, vm`  |

  : Matrix Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `wwaddu.vv`   | `31..26=0x30 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwaddu.vv  wd, ws2, ws1, vm`  |
  | `wwadd.vv`    | `31..26=0x31 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwadd.vv  wd, ws2, ws1, vm`   |
  | `wwsubu.vv`   | `31..26=0x32 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwsubu.vv  wd, ws2, ws1, vm`  |
  | `wwsub.vv`    | `31..26=0x33 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwsub.vv  wd, ws2, ws1, vm`   |
  | `wwaddu.wv`   | `31..26=0x34 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwaddu.wv  wd, ws2, ws1, vm`  |
  | `wwadd.wv`    | `31..26=0x35 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwadd.wv  wd, ws2, ws1, vm`   |
  | `wwsubu.wv`   | `31..26=0x36 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwsubu.wv  wd, ws2, ws1, vm`  |
  | `wwsub.wv`    | `31..26=0x37 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwsub.wv  wd, ws2, ws1, vm`   |
  | `wwmulu.vv`   | `31..26=0x38 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwmulu.vv wd, ws2, ws1, vm`   |
  | `wwmulsu.vv`  | `31..26=0x3a vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwmulsu.vv wd, ws2, ws1, vm`  |
  | `wwmul.vv`    | `31..26=0x3b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwmul.vv  wd, ws2, ws1, vm`   |
  | `wwmaccu.vv`  | `31..26=0x3c vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwmaccu.vv wd, ws1, ws2, vm`  |
  | `wwmacc.vv`   | `31..26=0x3d vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwmacc.vv wd, ws1, ws2, vm`   |
  | `wwmaccsu.vv` | `31..26=0x3f vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wwmaccsu.vv wd, ws1, ws2, vm` |

  : Matrix Integer Extension Instructions V

**Matrix Mask Instructions**

* **OPMWW**

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `wredsum.ws`  | `31..26=0x00 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wredsum.ws  wd, ws2, ws1, vm` |
  | `wredand.ws`  | `31..26=0x01 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wredand.ws  wd, ws2, ws1, vm` |
  | `wredor.ws`   | `31..26=0x02 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wredor.ws   wd, ws2, ws1, vm` |
  | `wredxor.ws`  | `31..26=0x03 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wredxor.ws  wd, ws2, ws1, vm` |
  | `wredminu.ws` | `31..26=0x04 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wredminu.ws wd, ws2, ws1, vm` |
  | `wredmin.ws`  | `31..26=0x05 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wredmin.ws  wd, ws2, ws1, vm` |
  | `wredmaxu.ws` | `31..26=0x06 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wredmaxu.ws wd, ws2, ws1, vm` |
  | `wredmax.ws`  | `31..26=0x07 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wredmax.ws  wd, ws2, ws1, vm` |
  | `waaddu.vv`   | `31..26=0x08 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `waadd.vv    wd, ws2, ws1, vm` |
  | `waadd.vv`    | `31..26=0x09 vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `waadd.vv    wd, ws2, ws1, vm` |
  | `wasubu.vv`   | `31..26=0x0a vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wasubu.vv   wd, ws2, ws1, vm` |
  | `wasub.vv`    | `31..26=0x0b vm ws2 ws1 14..12=0x2 wd 6..0=0x57` | `wasub.vv    wd, ws2, ws1, vm` |

  : OPMWW I

  | **Name**  | **Opcode / Argument**                                   | **Format**        |
  |:----------|:--------------------------------------------------------|:------------------|
  | `wmv.x.s` | `31..26=0x10 25=1 ws2 19..15=0 14..12=0x2 rd 6..0=0x57` | `wmv.x.s rd, ws2` |

  : OPMWW II

* **OPMWX**

  | **Name**    | **Opcode / Argument**                            | **Format**                   |
  |:------------|:-------------------------------------------------|:-----------------------------|
  | `waaddu.vx` | `31..26=0x08 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `waaddu.vx wd, ws2, rs1, vm` |
  | `waadd.vx`  | `31..26=0x09 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `waadd.vx wd, ws2, rs1, vm`  |
  | `wasubu.vx` | `31..26=0x0a vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wasubu.vx wd, ws2, rs1, vm` |
  | `wasub.vx`  | `31..26=0x0b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wasub.vx wd, ws2, rs1, vm`  |

  : OPMWX I

  | **Name**         | **Opcode / Argument**                                   | **Format**                         |
  |:-----------------|:--------------------------------------------------------|:-----------------------------------|
  | `wmv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 wd 6..0=0x57` | `wmv.s.x wd, rs1`                  |
  | `wslide1up.vx`   | `31..26=0x0e vm ws2 rs1 14..12=0x6 wd 6..0=0x57`        | `wslide1up.vx  wd, ws2, rs1, vm`   |
  | `wslide1down.vx` | `31..26=0x0f vm ws2 rs1 14..12=0x6 wd 6..0=0x57`        | `wslide1down.vx  wd, ws2, rs1, vm` |

  : OPMWX II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `wdivu.vx`   | `31..26=0x20 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wdivu.vx wd, ws2, rs1, vm`   |
  | `wdiv.vx`    | `31..26=0x21 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wdiv.vx wd, ws2, rs1, vm`    |
  | `wremu.vx`   | `31..26=0x22 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wremu.vx wd, ws2, rs1, vm`   |
  | `wrem.vx`    | `31..26=0x23 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wrem.vx wd, ws2, rs1, vm`    |
  | `wmulhu.vx`  | `31..26=0x24 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wmulhu.vx wd, ws2, rs1, vm`  |
  | `wmul.vx`    | `31..26=0x25 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wmul.vx wd, ws2, rs1, vm`    |
  | `wmulhsu.vx` | `31..26=0x26 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wmulh.vx wd, ws2, rs1, vm`   |
  | `wmulh.vx`   | `31..26=0x27 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wmulhsu.vx wd, ws2, rs1, vm` |
  | `wmadd.vx`   | `31..26=0x29 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wmadd.vx wd, rs1, ws2, vm`   |
  | `wnmsub.vx`  | `31..26=0x2b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wnmsub.vx wd, rs1, ws2, vm`  |
  | `wmacc.vx`   | `31..26=0x2d vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wmacc.vx wd, rs1, ws2, vm`   |
  | `wnmsac.vx`  | `31..26=0x2f vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wnmsac.vx wd, rs1, ws2, vm`  |

  : OPMWX III

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `wwaddu.vx`   | `31..26=0x30 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwaddu.vx wd, ws2, rs1, vm`   |
  | `wwadd.vx`    | `31..26=0x31 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwadd.vx wd, ws2, rs1, vm`    |
  | `wwsubu.vx`   | `31..26=0x32 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwsubu.vx wd, ws2, rs1, vm`   |
  | `wwsub.vx`    | `31..26=0x33 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwsub.vx wd, ws2, rs1, vm`    |
  | `wwaddu.wx`   | `31..26=0x34 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwaddu.wx wd, ws2, rs1, vm`   |
  | `wwadd.wx`    | `31..26=0x35 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwadd.wx wd, ws2, rs1, vm`    |
  | `wwsubu.wx`   | `31..26=0x36 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwsubu.wx wd, ws2, rs1, vm`   |
  | `wwsub.wx`    | `31..26=0x37 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwsub.wx wd, ws2, rs1, vm`    |
  | `wwmulu.vx`   | `31..26=0x38 vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwmulu.vx wd, ws2, rs1, vm`   |
  | `wwmulsu.vx`  | `31..26=0x3a vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwmulsu.vx wd, ws2, rs1, vm`  |
  | `wwmul.vx`    | `31..26=0x3b vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwmul.vx wd, ws2, rs1, vm`    |
  | `wwmaccu.vx`  | `31..26=0x3c vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwmaccu.vx wd, rs1, ws2, vm`  |
  | `wwmacc.vx`   | `31..26=0x3d vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwmacc.vx wd, rs1, ws2, vm`   |
  | `wwmaccus.vx` | `31..26=0x3e vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwmaccus.vx wd, rs1, ws2, vm` |
  | `wwmaccsu.vx` | `31..26=0x3f vm ws2 rs1 14..12=0x6 wd 6..0=0x57` | `wwmaccsu.vx wd, rs1, ws2, vm` |

  : OPMWX IV
