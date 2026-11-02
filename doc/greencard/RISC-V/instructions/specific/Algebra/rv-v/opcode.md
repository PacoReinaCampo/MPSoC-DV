## OPCODE ENCODING INFORMATION

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

  | **Name**   | **Opcode / Argument**                              | **Format**                  |
  |:-----------|:---------------------------------------------------|:----------------------------|
  | `vsetivli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `vsetvli rd, rs1, vtypei`   |
  | `vsetvli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `vsetivli rd, uimm, vtypei` |
  | `vsetvl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `vsetvl  rd, rs1, rs2`      |

  : Configuration Setting

**OPLS (Vector Loads and Store)**

* **Vector Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Format**               |
  |:----------|:-----------------------------------------------------------------|:-------------------------|
  | `vlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  vd 6..0=0x07` | `vlm.v   vd, (rs1)`      |
  | `vsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27` | `vsm.v   vs3, (rs1)`     |
  | `vle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  vd 6..0=0x07`      | `vle8.v  vd, (rs1), vm`  |
  | `vle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  vd 6..0=0x07`      | `vle16.v vd, (rs1), vm`  |
  | `vle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  vd 6..0=0x07`      | `vle32.v vd, (rs1), vm`  |
  | `vle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  vd 6..0=0x07`      | `vle64.v vd, (rs1), vm`  |
  | `vse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 vs3 6..0=0x27`      | `vse8.v  vs3, (rs1), vm` |
  | `vse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 vs3 6..0=0x27`      | `vse16.v vs3, (rs1), vm` |
  | `vse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 vs3 6..0=0x27`      | `vse32.v vs3, (rs1), vm` |
  | `vse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 vs3 6..0=0x27`      | `vse64.v vs3, (rs1), vm` |

  : Vector Unit-Stride Instructions (including segment part)

* **Vector Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Format**                        |
  |:-------------|:-------------------------------------------------------|:----------------------------------|
  | `vluxei8.v`  | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0  vd 6..0=0x07` | `vluxei8.v    vd, (rs1), vs2, vm` |
  | `vluxei16.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5  vd 6..0=0x07` | `vluxei16.v   vd, (rs1), vs2, vm` |
  | `vluxei32.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6  vd 6..0=0x07` | `vluxei32.v   vd, (rs1), vs2, vm` |
  | `vluxei64.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7  vd 6..0=0x07` | `vluxei64.v   vd, (rs1), vs2, vm` |
  | `vsuxei8.v`  | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27` | `vsuxei8.v   vs3, (rs1), vs2, vm` |
  | `vsuxei16.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27` | `vsuxei16.v  vs3, (rs1), vs2, vm` |
  | `vsuxei32.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27` | `vsuxei32.v  vs3, (rs1), vs2, vm` |
  | `vsuxei64.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27` | `vsuxei64.v  vs3, (rs1), vs2, vm` |

  : Vector Indexed-Unordered Instructions (including segment part)

* **Vector Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Format**                       |
  |:-----------|:-------------------------------------------------------|:---------------------------------|
  | `vlse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  vd 6..0=0x07` | `vlse8.v    vd,  (rs1), rs2, vm` |
  | `vlse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  vd 6..0=0x07` | `vlse16.v   vd,  (rs1), rs2, vm` |
  | `vlse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  vd 6..0=0x07` | `vlse32.v   vd,  (rs1), rs2, vm` |
  | `vlse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  vd 6..0=0x07` | `vlse64.v   vd,  (rs1), rs2, vm` |
  | `vsse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 vs3 6..0=0x27` | `vsse8.v    vs3, (rs1), rs2, vm` |
  | `vsse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 vs3 6..0=0x27` | `vsse16.v   vs3, (rs1), rs2, vm` |
  | `vsse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 vs3 6..0=0x27` | `vsse32.v   vs3, (rs1), rs2, vm` |
  | `vsse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 vs3 6..0=0x27` | `vsse64.v   vs3, (rs1), rs2, vm` |

  : Vector Strided Instructions (including segment part)

* **Vector Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Format**                         |
  |:-------------|:-------------------------------------------------------|:-----------------------------------|
  | `vloxei8.v`  | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0  vd 6..0=0x07` | `vloxei8.v    vd, (rs1), vs2, vm`  |
  | `vloxei16.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5  vd 6..0=0x07` | `vloxei16.v   vd, (rs1), vs2, vm`  |
  | `vloxei32.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6  vd 6..0=0x07` | `vloxei32.v   vd, (rs1), vs2, vm`  |
  | `vloxei64.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7  vd 6..0=0x07` | `vloxei64.v   vd, (rs1), vs2, vm`  |
  | `vsoxei8.v`  | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27` | `vsoxei8.v    vs3, (rs1), vs2, vm` |
  | `vsoxei16.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27` | `vsoxei16.v   vs3, (rs1), vs2, vm` |
  | `vsoxei32.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27` | `vsoxei32.v   vs3, (rs1), vs2, vm` |
  | `vsoxei64.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27` | `vsoxei64.v   vs3, (rs1), vs2, vm` |

  : Vector Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Format**                  |
  |:------------|:---------------------------------------------------------------|:----------------------------|
  | `vle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  vd 6..0=0x07` | `vle8ff.v    vd, (rs1), vm` |
  | `vle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  vd 6..0=0x07` | `vle16ff.v   vd, (rs1), vm` |
  | `vle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  vd 6..0=0x07` | `vle32ff.v   vd, (rs1), vm` |
  | `vle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  vd 6..0=0x07` | `vle64ff.v   vd, (rs1), vm` |

  : Unit-stride Fault-Only-First Loads

* **Vector Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Format**             |
  |:------------|:-----------------------------------------------------------------------|:-----------------------|
  | `vl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vl1re8.v    v3, (a0)` |
  | `vl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `vl1re16.v   v3, (a0)` |
  | `vl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `vl1re32.v   v3, (a0)` |
  | `vl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `vl1re64.v   v3, (a0)` |
  | `vl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vl2re8.v    v2, (a0)` |
  | `vl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `vl2re16.v   v2, (a0)` |
  | `vl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `vl2re32.v   v2, (a0)` |
  | `vl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `vl2re64.v   v2, (a0)` |
  | `vl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vl4re8.v    v4, (a0)` |
  | `vl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `vl4re16.v   v4, (a0)` |
  | `vl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `vl4re32.v   v4, (a0)` |
  | `vl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `vl4re64.v   v4, (a0)` |
  | `vl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `vl8re8.v    v8, (a0)` |
  | `vl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `vl8re16.v   v8, (a0)` |
  | `vl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `vl8re32.v   v8, (a0)` |
  | `vl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `vl8re64.v   v8, (a0)` |
  | `vs1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `vs1r.v v3, (a1)`      |
  | `vs2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `vs2r.v v2, (a1)`      |
  | `vs4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `vs4r.v v4, (a1)`      |
  | `vs8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `vs8r.v v8, (a1)`      |

  : Vector Load/Store Whole Registers

**Vector Float-Point Instructions**

* **OPFVF**

  | **Name**          | **Opcode / Argument**                                   | **Format**                         |
  |:------------------|:--------------------------------------------------------|:-----------------------------------|
  | `vfadd.vf`        | `31..26=0x00 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfadd.vf vd, vs2, rs1, vm`        |
  | `vfsub.vf`        | `31..26=0x02 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfsub.vf vd, vs2, rs1, vm`        |
  | `vfmin.vf`        | `31..26=0x04 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfmin.vf vd, vs2, rs1, vm`        |
  | `vfmax.vf`        | `31..26=0x06 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfmax.vf vd, vs2, rs1, vm`        |
  | `vfsgnj.vf`       | `31..26=0x08 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfsgnj.vf vd, vs2, rs1, vm`       |
  | `vfsgnjn.vf`      | `31..26=0x09 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfsgnjn.vf vd, vs2, rs1, vm`      |
  | `vfsgnjx.vf`      | `31..26=0x0a vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfsgnjx.vf vd, vs2, rs1, vm`      |
  | `vfslide1up.vf`   | `31..26=0x0e vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfslide1up.vf vd, vs2, rs1, vm`   |
  | `vfslide1down.vf` | `31..26=0x0f vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vfslide1down.vf vd, vs2, rs1, vm` |
  | `vfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57` | `vfmv.s.f vd, rs1`                 |

  : OPFVF I

  | **Name**      | **Opcode / Argument**                                   | **Format**                     |
  |:--------------|:--------------------------------------------------------|:-------------------------------|
  | `vfmerge.vfm` | `31..26=0x17 25=0 vs2 rs1 14..12=0x5 vd 6..0=0x57`      | `vfmerge.vfm vd, vs2, rs1, v0` |
  | `vfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57` | `vfmv.v.f vd, rs1`             |
  | `vmfeq.vf`    | `31..26=0x18 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vmfeq.vf vd, vs2, rs1, vm`    |
  | `vmfle.vf`    | `31..26=0x19 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vmfle.vf vd, vs2, rs1, vm`    |
  | `vmflt.vf`    | `31..26=0x1b vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vmflt.vf vd, vs2, rs1, vm`    |
  | `vmfne.vf`    | `31..26=0x1c vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vmfne.vf vd, vs2, rs1, vm`    |
  | `vmfgt.vf`    | `31..26=0x1d vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vmfgt.vf vd, vs2, rs1, vm`    |
  | `vmfge.vf`    | `31..26=0x1f vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `vmfge.vf vd, vs2, rs1, vm`    |

  : OPFVF II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `vfdiv.vf`   | `31..26=0x20 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfdiv.vf vd, vs2, rs1, vm`   |
  | `vfrdiv.vf`  | `31..26=0x21 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfrdiv.vf vd, vs2, rs1, vm`  |
  | `vfmul.vf`   | `31..26=0x24 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfmul.vf vd, vs2, rs1, vm`   |
  | `vfrsub.vf`  | `31..26=0x27 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfrsub.vf vd, vs2, rs1, vm`  |
  | `vfmadd.vf`  | `31..26=0x28 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfmadd.vf vd, rs1, vs2, vm`  |
  | `vfnmadd.vf` | `31..26=0x29 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfnmadd.vf vd, rs1, vs2, vm` |
  | `vfmsub.vf`  | `31..26=0x2a vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfmsub.vf vd, rs1, vs2, vm`  |
  | `vfnmsub.vf` | `31..26=0x2b vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfnmsub.vf vd, rs1, vs2, vm` |
  | `vfmacc.vf`  | `31..26=0x2c vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfmacc.vf vd, rs1, vs2, vm`  |
  | `vfnmacc.vf` | `31..26=0x2d vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfnmacc.vf vd, rs1, vs2, vm` |
  | `vfmsac.vf`  | `31..26=0x2e vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfmsac.vf vd, rs1, vs2, vm`  |
  | `vfnmsac.vf` | `31..26=0x2f vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfnmsac.vf vd, rs1, vs2, vm` |

  : OPFVF III

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `vfwadd.vf`   | `31..26=0x30 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwadd.vf vd, vs2, rs1, vm`   |
  | `vfwsub.vf`   | `31..26=0x32 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwsub.vf vd, vs2, rs1, vm`   |
  | `vfwadd.wf`   | `31..26=0x34 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwadd.wf vd, vs2, rs1, vm`   |
  | `vfwsub.wf`   | `31..26=0x36 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwsub.wf vd, vs2, rs1, vm`   |
  | `vfwmul.vf`   | `31..26=0x38 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwmul.vf vd, vs2, rs1, vm`   |
  | `vfwmacc.vf`  | `31..26=0x3c vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwmacc.vf vd, rs1, vs2, vm`  |
  | `vfwnmacc.vf` | `31..26=0x3d vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwnmacc.vf vd, rs1, vs2, vm` |
  | `vfwmsac.vf`  | `31..26=0x3e vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwmsac.vf vd, rs1, vs2, vm`  |
  | `vfwnmsac.vf` | `31..26=0x3f vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `vfwnmsac.vf vd, rs1, vs2, vm` |

  : OPFVF IV

* **OPFVV**

  | **Name**       | **Opcode / Argument**                                   | **Format**                      |
  |:---------------|:--------------------------------------------------------|:--------------------------------|
  | `vfadd.vv`     | `31..26=0x00 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfadd.vv vd, vs2, vs1, vm`     |
  | `vfredusum.vs` | `31..26=0x01 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfredusum.vs vd, vs2, vs1, vm` |
  | `vfsub.vv`     | `31..26=0x02 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfsub.vv vd, vs2, vs1, vm`     |
  | `vfredosum.vs` | `31..26=0x03 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfredosum.vs vd, vs2, vs1, vm` |
  | `vfmin.vv`     | `31..26=0x04 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfmin.vv vd, vs2, vs1, vm`     |
  | `vfredmin.vs`  | `31..26=0x05 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfredmin.vs  vd, vs2, vs1, vm` |
  | `vfmax.vv`     | `31..26=0x06 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfmax.vv vd, vs2, vs1, vm`     |
  | `vfredmax.vs`  | `31..26=0x07 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfredmax.vs  vd, vs2, vs1, vm` |
  | `vfsgnj.vv`    | `31..26=0x08 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfsgnj.vv vd, vs2, vs1, vm`    |
  | `vfsgnjn.vv`   | `31..26=0x09 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfsgnjn.vv vd, vs2, vs1, vm`   |
  | `vfsgnjx.vv`   | `31..26=0x0a vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `vfsgnjx.vv vd, vs2, vs1, vm`   |
  | `vfmv.f.s`     | `31..26=0x10 25=1 vs2 19..15=0 14..12=0x1 rd 6..0=0x57` | `vfmv.f.s rd, vs2`              |

  : OPFVV I

  | **Name**   | **Opcode / Argument**                            | **Format**                  |
  |:-----------|:-------------------------------------------------|:----------------------------|
  | `vmfeq.vv` | `31..26=0x18 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vmfeq.vv vd, vs2, vs1, vm` |
  | `vmfle.vv` | `31..26=0x19 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vmfle.vv vd, vs2, vs1, vm` |
  | `vmflt.vv` | `31..26=0x1b vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vmflt.vv vd, vs2, vs1, vm` |
  | `vmfne.vv` | `31..26=0x1c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vmfne.vv vd, vs2, vs1, vm` |

  : OPFVV II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `vfdiv.vv`   | `31..26=0x20 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfdiv.vv vd, vs2, vs1, vm`   |
  | `vfmul.vv`   | `31..26=0x24 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfmul.vv vd, vs2, vs1, vm`   |
  | `vfmadd.vv`  | `31..26=0x28 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfmadd.vv vd, vs1, vs2, vm`  |
  | `vfnmadd.vv` | `31..26=0x29 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfnmadd.vv vd, vs1, vs2, vm` |
  | `vfmsub.vv`  | `31..26=0x2a vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfmsub.vv vd, vs1, vs2, vm`  |
  | `vfnmsub.vv` | `31..26=0x2b vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfnmsub.vv vd, vs1, vs2, vm` |
  | `vfmacc.vv`  | `31..26=0x2c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfmacc.vv vd, vs1, vs2, vm`  |
  | `vfnmacc.vv` | `31..26=0x2d vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfnmacc.vv vd, vs1, vs2, vm` |
  | `vfmsac.vv`  | `31..26=0x2e vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfmsac.vv vd, vs1, vs2, vm`  |
  | `vfnmsac.vv` | `31..26=0x2f vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfnmsac.vv vd, vs1, vs2, vm` |

  : OPFVV III

  | **Name**           | **Opcode / Argument**                                    | **Format**                     |
  |:-------------------|:---------------------------------------------------------|:-------------------------------|
  | `vfcvt.xu.f.v`     | `31..26=0x12 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57` | `vfcvt.xu.f.v vd, vs2, vm`     |
  | `vfcvt.x.f.v`      | `31..26=0x12 vm vs2 19..15=0x01 14..12=0x1 vd 6..0=0x57` | `vfcvt.x.f.v  vd, vs2, vm`     |
  | `vfcvt.f.xu.v`     | `31..26=0x12 vm vs2 19..15=0x02 14..12=0x1 vd 6..0=0x57` | `vfcvt.f.xu.v vd, vs2, vm`     |
  | `vfcvt.f.x.v`      | `31..26=0x12 vm vs2 19..15=0x03 14..12=0x1 vd 6..0=0x57` | `vfcvt.f.x.v  vd, vs2, vm`     |
  | `vfcvt.rtz.xu.f.v` | `31..26=0x12 vm vs2 19..15=0x06 14..12=0x1 vd 6..0=0x57` | `vfcvt.rtz.xu.f.v vd, vs2, vm` |
  | `vfcvt.rtz.x.f.v`  | `31..26=0x12 vm vs2 19..15=0x07 14..12=0x1 vd 6..0=0x57` | `vfcvt.rtz.x.f.v  vd, vs2, vm` |

  : OPFVV IV

  | **Name**            | **Opcode / Argument**                                    | **Format**                      |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `vfwcvt.xu.f.v`     | `31..26=0x12 vm vs2 19..15=0x08 14..12=0x1 vd 6..0=0x57` | `vfwcvt.xu.f.v vd, vs2, vm`     |
  | `vfwcvt.x.f.v`      | `31..26=0x12 vm vs2 19..15=0x09 14..12=0x1 vd 6..0=0x57` | `vfwcvt.x.f.v  vd, vs2, vm`     |
  | `vfwcvt.f.xu.v`     | `31..26=0x12 vm vs2 19..15=0x0A 14..12=0x1 vd 6..0=0x57` | `vfwcvt.f.xu.v vd, vs2, vm`     |
  | `vfwcvt.f.x.v`      | `31..26=0x12 vm vs2 19..15=0x0B 14..12=0x1 vd 6..0=0x57` | `vfwcvt.f.x.v  vd, vs2, vm`     |
  | `vfwcvt.f.f.v`      | `31..26=0x12 vm vs2 19..15=0x0C 14..12=0x1 vd 6..0=0x57` | `vfwcvt.f.f.v vd, vs2, vm`      |
  | `vfwcvt.rtz.xu.f.v` | `31..26=0x12 vm vs2 19..15=0x0E 14..12=0x1 vd 6..0=0x57` | `vfwcvt.rtz.xu.f.v vd, vs2, vm` |
  | `vfwcvt.rtz.x.f.v`  | `31..26=0x12 vm vs2 19..15=0x0F 14..12=0x1 vd 6..0=0x57` | `vfwcvt.rtz.x.f.v  vd, vs2, vm` |

  : OPFVV V

  | **Name**            | **Opcode / Argument**                                    | **Format**                      |
  |:--------------------|:---------------------------------------------------------|:--------------------------------|
  | `vfncvt.xu.f.w`     | `31..26=0x12 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57` | `vfncvt.xu.f.w vd, vs2, vm`     |
  | `vfncvt.x.f.w`      | `31..26=0x12 vm vs2 19..15=0x11 14..12=0x1 vd 6..0=0x57` | `vfncvt.x.f.w  vd, vs2, vm`     |
  | `vfncvt.f.xu.w`     | `31..26=0x12 vm vs2 19..15=0x12 14..12=0x1 vd 6..0=0x57` | `vfncvt.f.xu.w vd, vs2, vm`     |
  | `vfncvt.f.x.w`      | `31..26=0x12 vm vs2 19..15=0x13 14..12=0x1 vd 6..0=0x57` | `vfncvt.f.x.w  vd, vs2, vm`     |
  | `vfncvt.f.f.w`      | `31..26=0x12 vm vs2 19..15=0x14 14..12=0x1 vd 6..0=0x57` | `vfncvt.f.f.w vd, vs2, vm`      |
  | `vfncvt.rod.f.f.w`  | `31..26=0x12 vm vs2 19..15=0x15 14..12=0x1 vd 6..0=0x57` | `vfncvt.rod.f.f.w vd, vs2, vm`  |
  | `vfncvt.rtz.xu.f.w` | `31..26=0x12 vm vs2 19..15=0x16 14..12=0x1 vd 6..0=0x57` | `vfncvt.rtz.xu.f.w vd, vs2, vm` |
  | `vfncvt.rtz.x.f.w`  | `31..26=0x12 vm vs2 19..15=0x17 14..12=0x1 vd 6..0=0x57` | `vfncvt.rtz.x.f.w  vd, vs2, vm` |

  : OPFVV VI

  | **Name**     | **Opcode / Argument**                                    | **Format**               |
  |:-------------|:---------------------------------------------------------|:-------------------------|
  | `vfsqrt.v`   | `31..26=0x13 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57` | `vfsqrt.v   vd, vs2, vm` |
  | `vfrsqrt7.v` | `31..26=0x13 vm vs2 19..15=0x04 14..12=0x1 vd 6..0=0x57` | `vfrsqrt7.v vd, vs2, vm` |
  | `vfrec7.v`   | `31..26=0x13 vm vs2 19..15=0x05 14..12=0x1 vd 6..0=0x57` | `vfrec7.v   vd, vs2, vm` |
  | `vfclass.v`  | `31..26=0x13 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57` | `vfclass.v  vd, vs2, vm` |

  : OPFVV VII

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `vfwadd.vv`     | `31..26=0x30 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwadd.vv vd, vs2, vs1, vm`     |
  | `vfwredusum.vs` | `31..26=0x31 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwredusum.vs vd, vs2, vs1, vm` |
  | `vfwsub.vv`     | `31..26=0x32 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwsub.vv vd, vs2, vs1, vm`     |
  | `vfwredosum.vs` | `31..26=0x33 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwredosum.vs vd, vs2, vs1, vm` |
  | `vfwadd.wv`     | `31..26=0x34 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwadd.wv  vd, vs2, vs1, vm`    |
  | `vfwsub.wv`     | `31..26=0x36 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwsub.wv  vd, vs2, vs1, vm`    |
  | `vfwmul.vv`     | `31..26=0x38 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwmul.vv    vd, vs2, vs1, vm`  |
  | `vfwmacc.vv`    | `31..26=0x3c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwmacc.vv vd, vs1, vs2, vm`    |
  | `vfwnmacc.vv`   | `31..26=0x3d vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwnmacc.vv vd, vs1, vs2, vm`   |
  | `vfwmsac.vv`    | `31..26=0x3e vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwmsac.vv vd, vs1, vs2, vm`    |
  | `vfwnmsac.vv`   | `31..26=0x3f vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `vfwnmsac.vv vd, vs1, vs2, vm`   |

  : OPFVV VIII

**Vector Integer Instructions**

* **OPIVX**

  | **Name**        | **Opcode / Argument**                            | **Format**                       |
  |:----------------|:-------------------------------------------------|:---------------------------------|
  | `vadd.vx`       | `31..26=0x00 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vadd.vx vd, vs2, rs1, vm`       |
  | `vsub.vx`       | `31..26=0x02 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vsub.vx vd, vs2, rs1, vm`       |
  | `vrsub.vx`      | `31..26=0x03 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vrsub.vx vd, vs2, rs1, vm`      |
  | `vminu.vx`      | `31..26=0x04 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vminu.vx vd, vs2, rs1, vm`      |
  | `vmin.vx`       | `31..26=0x05 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vmin.vx vd, vs2, rs1, vm`       |
  | `vmaxu.vx`      | `31..26=0x06 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vmaxu.vx vd, vs2, rs1, vm`      |
  | `vmax.vx`       | `31..26=0x07 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vmax.vx vd, vs2, rs1, vm`       |
  | `vand.vx`       | `31..26=0x09 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vand.vx vd, vs2, rs1, vm`       |
  | `vor.vx`        | `31..26=0x0a vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vor.vx vd, vs2, rs1, vm`        |
  | `vxor.vx`       | `31..26=0x0b vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vxor.vx vd, vs2, rs1, vm`       |
  | `vrgather.vx`   | `31..26=0x0c vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vrgather.vx vd, vs2, rs1, vm`   |
  | `vslideup.vx`   | `31..26=0x0e vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vslideup.vx vd, vs2, rs1, vm`   |
  | `vslidedown.vx` | `31..26=0x0f vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vslidedown.vx vd, vs2, rs1, vm` |

  : OPIVX I

  | **Name**     | **Opcode / Argument**                                   | **Format**                    |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `vadc.vxm`   | `31..26=0x10 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vadc.vxm vd, vs2, rs1, v0`   |
  | `vmadc.vxm`  | `31..26=0x11 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vmadc.vxm vd, vs2, rs1, v0`  |
  | `vmadc.vx`   | `31..26=0x11 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vmadc.vx vd, vs2, rs1`       |
  | `vsbc.vxm`   | `31..26=0x12 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vsbc.vxm vd, vs2, rs1, v0`   |
  | `vmsbc.vxm`  | `31..26=0x13 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vmsbc.vxm vd, vs2, rs1, v0`  |
  | `vmsbc.vx`   | `31..26=0x13 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vmsbc.vx vd, vs2, rs1`       |
  | `vmerge.vxm` | `31..26=0x17 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `vmerge.vxm vd, vs2, rs1, v0` |
  | `vmv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 vd 6..0=0x57` | `vmv.v.x vd, rs1`             |
  | `vmseq.vx`   | `31..26=0x18 vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vmseq.vx vd, vs2, rs1, vm`   |
  | `vmsne.vx`   | `31..26=0x19 vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vmsne.vx vd, vs2, rs1, vm`   |
  | `vmsltu.vx`  | `31..26=0x1a vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vmsltu.vx vd, vs2, rs1, vm`  |
  | `vmslt.vx`   | `31..26=0x1b vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vmslt.vx vd, vs2, rs1, vm`   |
  | `vmsleu.vx`  | `31..26=0x1c vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vmsleu.vx vd, vs2, rs1, vm`  |
  | `vmsle.vx`   | `31..26=0x1d vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vmsle.vx vd, vs2, rs1, vm`   |
  | `vmsgtu.vx`  | `31..26=0x1e vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vmsgtu.vx vd, vs2, rs1, vm`  |
  | `vmsgt.vx`   | `31..26=0x1f vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `vmsgt.vx vd, vs2, rs1, vm`   |

  : OPIVX II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `vsaddu.vx`  | `31..26=0x20 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vsaddu.vx vd, vs2, rs1, vm`  |
  | `vsadd.vx`   | `31..26=0x21 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vsadd.vx vd, vs2, rs1, vm`   |
  | `vssubu.vx`  | `31..26=0x22 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vssubu.vx vd, vs2, rs1, vm`  |
  | `vssub.vx`   | `31..26=0x23 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vssub.vx vd, vs2, rs1, vm`   |
  | `vsll.vx`    | `31..26=0x25 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vsll.vx vd, vs2, rs1, vm`    |
  | `vsmul.vx`   | `31..26=0x27 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vsmul.vx vd, vs2, rs1, vm`   |
  | `vsrl.vx`    | `31..26=0x28 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vsrl.vx vd, vs2, rs1, vm`    |
  | `vsra.vx`    | `31..26=0x29 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vsra.vx vd, vs2, rs1, vm`    |
  | `vssrl.vx`   | `31..26=0x2a vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vssrl.vx vd, vs2, rs1, vm`   |
  | `vssra.vx`   | `31..26=0x2b vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vssra.vx vd, vs2, rs1, vm`   |
  | `vnsrl.wx`   | `31..26=0x2c vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vnsrl.wx vd, vs2, rs1, vm`   |
  | `vnsra.wx`   | `31..26=0x2d vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vnsra.wx vd, vs2, rs1, vm`   |
  | `vnclipu.wx` | `31..26=0x2e vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vnclipu.wx vd, vs2, rs1, vm` |
  | `vnclip.wx`  | `31..26=0x2f vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `vnclip.wx vd, vs2, rs1, vm`  |

  : OPIVX III

* **OPIVV**

  | **Name**          | **Opcode / Argument**                            | **Format**                         |
  |:------------------|:-------------------------------------------------|:-----------------------------------|
  | `vadd.vv`         | `31..26=0x00 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vadd.vv vd, vs2, vs1, vm`         |
  | `vsub.vv`         | `31..26=0x02 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vsub.vv vd, vs2, vs1, vm`         |
  | `vminu.vv`        | `31..26=0x04 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vminu.vv vd, vs2, vs1, vm`        |
  | `vmin.vv`         | `31..26=0x05 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vmin.vv vd, vs2, vs1, vm`         |
  | `vmaxu.vv`        | `31..26=0x06 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vmaxu.vv vd, vs2, vs1, vm`        |
  | `vmax.vv`         | `31..26=0x07 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vmax.vv vd, vs2, vs1, vm`         |
  | `vand.vv`         | `31..26=0x09 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vand.vv vd, vs2, vs1, vm`         |
  | `vor.vv`          | `31..26=0x0a vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vor.vv vd, vs2, vs1, vm`          |
  | `vxor.vv`         | `31..26=0x0b vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vxor.vv vd, vs2, vs1, vm`         |
  | `vrgather.vv`     | `31..26=0x0c vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vrgather.vv vd, vs2, vs1, vm`     |
  | `vrgatherei16.vv` | `31..26=0x0e vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vrgatherei16.vv vd, vs2, vs1, vm` |

  : OPIVV I

  | **Name**     | **Opcode / Argument**                                   | **Format**                    |
  |:-------------|:--------------------------------------------------------|:------------------------------|
  | `vadc.vvm`   | `31..26=0x10 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vadc.vvm vd, vs2, vs1, v0`   |
  | `vmadc.vvm`  | `31..26=0x11 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vmadc.vvm vd, vs2, vs1, v0`  |
  | `vmadc.vv`   | `31..26=0x11 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vmadc.vv vd, vs2, vs1`       |
  | `vsbc.vvm`   | `31..26=0x12 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vsbc.vvm vd, vs2, vs1, v0`   |
  | `vmsbc.vvm`  | `31..26=0x13 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vmsbc.vvm vd, vs2, vs1, v0`  |
  | `vmsbc.vv`   | `31..26=0x13 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vmsbc.vv vd, vs2, vs1`       |
  | `vmerge.vvm` | `31..26=0x17 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `vmerge.vvm vd, vs2, vs1, v0` |
  | `vmv.v.v`    | `31..26=0x17 25=1 24..20=0 vs1 14..12=0x0 vd 6..0=0x57` | `vmv.v.v vd, vs1`             |
  | `vmseq.vv`   | `31..26=0x18 vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vmseq.vv vd, vs2, vs1, vm`   |
  | `vmsne.vv`   | `31..26=0x19 vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vmsne.vv vd, vs2, vs1, vm`   |
  | `vmsltu.vv`  | `31..26=0x1a vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vmsltu.vv vd, vs2, vs1, vm`  |
  | `vmslt.vv`   | `31..26=0x1b vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vmslt.vv vd, vs2, vs1, vm`   |
  | `vmsleu.vv`  | `31..26=0x1c vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vmsleu.vv vd, vs2, vs1, vm`  |
  | `vmsle.vv`   | `31..26=0x1d vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `vmsle.vv vd, vs2, vs1, vm`   |

  : OPIVV II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `vsaddu.vv`  | `31..26=0x20 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vsaddu.vv vd, vs2, vs1, vm`  |
  | `vsadd.vv`   | `31..26=0x21 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vsadd.vv vd, vs2, vs1, vm`   |
  | `vssubu.vv`  | `31..26=0x22 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vssubu.vv vd, vs2, vs1, vm`  |
  | `vssub.vv`   | `31..26=0x23 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vssub.vv vd, vs2, vs1, vm`   |
  | `vsll.vv`    | `31..26=0x25 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vsll.vv vd, vs2, vs1, vm`    |
  | `vsmul.vv`   | `31..26=0x27 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vsmul.vv vd, vs2, vs1, vm`   |
  | `vsrl.vv`    | `31..26=0x28 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vsrl.vv vd, vs2, vs1, vm`    |
  | `vsra.vv`    | `31..26=0x29 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vsra.vv vd, vs2, vs1, vm`    |
  | `vssrl.vv`   | `31..26=0x2a vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vssrl.vv vd, vs2, vs1, vm`   |
  | `vssra.vv`   | `31..26=0x2b vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vssra.vv vd, vs2, vs1, vm`   |
  | `vnsrl.wv`   | `31..26=0x2c vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vnsrl.wv vd, vs2, vs1, vm`   |
  | `vnsra.wv`   | `31..26=0x2d vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vnsra.wv vd, vs2, vs1, vm`   |
  | `vnclipu.wv` | `31..26=0x2e vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vnclipu.wv vd, vs2, vs1, vm` |
  | `vnclip.wv`  | `31..26=0x2f vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vnclip.wv vd, vs2, vs1, vm`  |

  : OPIVV III

  | **Name**       | **Opcode / Argument**                            | **Format**                      |
  |:---------------|:-------------------------------------------------|:--------------------------------|
  | `vwredsumu.vs` | `31..26=0x30 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vwredsumu.vs vd, vs2, vs1, vm` |
  | `vwredsum.vs`  | `31..26=0x31 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `vwredsum.vs  vd, vs2, vs1, vm` |

  : OPIVV IV

* **OPIVI**

  | **Name**        | **Opcode / Argument**                              | **Format**                        |
  |:----------------|:---------------------------------------------------|:----------------------------------|
  | `vadd.vi`       | `31..26=0x00 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vadd.vi vd, vs2, imm, vm`        |
  | `vrsub.vi`      | `31..26=0x03 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vrsub.vi vd, vs2, imm, vm`       |
  | `vand.vi`       | `31..26=0x09 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vand.vi vd, vs2, imm, vm`        |
  | `vor.vi`        | `31..26=0x0a vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vor.vi vd, vs2, imm, vm`         |
  | `vxor.vi`       | `31..26=0x0b vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vxor.vi vd, vs2, imm, vm`        |
  | `vrgather.vi`   | `31..26=0x0c vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vrgather.vi vd, vs2, uimm, vm`   |
  | `vslideup.vi`   | `31..26=0x0e vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vslideup.vi vd, vs2, uimm, vm`   |
  | `vslidedown.vi` | `31..26=0x0f vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `vslidedown.vi vd, vs2, uimm, vm` |

  : OPIVI I

  | **Name**     | **Opcode / Argument**                                     | **Format**                    |
  |:-------------|:----------------------------------------------------------|:------------------------------|
  | `vadc.vim`   | `31..26=0x10 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vadc.vim vd, vs2, imm, v0`   |
  | `vmadc.vim`  | `31..26=0x11 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vmadc.vim vd, vs2, imm, v0`  |
  | `vmadc.vi`   | `31..26=0x11 25=1 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vmadc.vi vd, vs2, imm`       |
  | `vmerge.vim` | `31..26=0x17 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vmerge.vim vd, vs2, imm, v0` |
  | `vmv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 vd 6..0=0x57` | `vmv.v.i vd, imm`             |
  | `vmseq.vi`   | `31..26=0x18 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vmseq.vi vd, vs2, imm, vm`   |
  | `vmsne.vi`   | `31..26=0x19 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vmsne.vi vd, vs2, imm, vm`   |
  | `vmsleu.vi`  | `31..26=0x1c vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vmsleu.vi vd, vs2, imm, vm`  |
  | `vmsle.vi`   | `31..26=0x1d vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vmsle.vi vd, vs2, imm, vm`   |
  | `vmsgtu.vi`  | `31..26=0x1e vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vmsgtu.vi vd, vs2, imm, vm`  |
  | `vmsgt.vi`   | `31..26=0x1f vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `vmsgt.vi vd, vs2, imm, vm`   |

  : OPIVI II

  | **Name**     | **Opcode / Argument**                                   | **Format**                     |
  |:-------------|:--------------------------------------------------------|:-------------------------------|
  | `vsaddu.vi`  | `31..26=0x20 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vsaddu.vi vd, vs2, imm, vm`   |
  | `vsadd.vi`   | `31..26=0x21 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vsadd.vi vd, vs2, imm, vm`    |
  | `vsll.vi`    | `31..26=0x25 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vsll.vi vd, vs2, uimm, vm`    |
  | `vmv1r.v`    | `31..26=0x27 25=1 vs2 19..15=0 14..12=0x3 vd 6..0=0x57` | `vmv1r.v v1, v2`               |
  | `vmv2r.v`    | `31..26=0x27 25=1 vs2 19..15=1 14..12=0x3 vd 6..0=0x57` | `vmv2r.v v10, v12`             |
  | `vmv4r.v`    | `31..26=0x27 25=1 vs2 19..15=3 14..12=0x3 vd 6..0=0x57` | `vmv4r.v v4, v8`               |
  | `vmv8r.v`    | `31..26=0x27 25=1 vs2 19..15=7 14..12=0x3 vd 6..0=0x57` | `vmv8r.v v0, v8`               |
  | `vsrl.vi`    | `31..26=0x28 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vsrl.vi vd, vs2, uimm, vm`    |
  | `vsra.vi`    | `31..26=0x29 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vsra.vi vd, vs2, uimm, vm`    |
  | `vssrl.vi`   | `31..26=0x2a vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vssrl.vi vd, vs2, uimm, vm`   |
  | `vssra.vi`   | `31..26=0x2b vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vssra.vi vd, vs2, uimm, vm`   |
  | `vnsrl.wi`   | `31..26=0x2c vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vnsrl.wi vd, vs2, uimm, vm`   |
  | `vnsra.wi`   | `31..26=0x2d vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vnsra.wi vd, vs2, uimm, vm`   |
  | `vnclipu.wi` | `31..26=0x2e vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vnclipu.wi vd, vs2, uimm, vm` |
  | `vnclip.wi`  | `31..26=0x2f vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `vnclip.wi vd, vs2, uimm, vm`  |

  : OPIVI III

* **OPI (Vector Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Format**              |
  |:------------|:------------------------------------------------------|:------------------------|
  | `vzext.vf8` | `31..26=0x12 vm vs2 19..15=2 14..12=0x2 vd 6..0=0x57` | `vzext.vf8 vd, vs2, vm` |
  | `vsext.vf8` | `31..26=0x12 vm vs2 19..15=3 14..12=0x2 vd 6..0=0x57` | `vsext.vf8 vd, vs2, vm` |
  | `vzext.vf4` | `31..26=0x12 vm vs2 19..15=4 14..12=0x2 vd 6..0=0x57` | `vzext.vf4 vd, vs2, vm` |
  | `vsext.vf4` | `31..26=0x12 vm vs2 19..15=5 14..12=0x2 vd 6..0=0x57` | `vsext.vf4 vd, vs2, vm` |
  | `vzext.vf2` | `31..26=0x12 vm vs2 19..15=6 14..12=0x2 vd 6..0=0x57` | `vzext.vf2 vd, vs2, vm` |
  | `vsext.vf2` | `31..26=0x12 vm vs2 19..15=7 14..12=0x2 vd 6..0=0x57` | `vsext.vf2 vd, vs2, vm` |

  : Vector Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Format**                  |
  |:---------------|:---------------------------------------------------|:----------------------------|
  | `vcompress.vm` | `31..26=0x17 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vcompress.vm vd, vs2, vs1` |
  | `vmandn.mm`    | `31..26=0x18 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmandn.mm vd, vs2, vs1`    |
  | `vmand.mm`     | `31..26=0x19 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmand.mm vd, vs2, vs1`     |
  | `vmor.mm`      | `31..26=0x1a 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmxor.mm  vd, vs2, vs1`    |
  | `vmxor.mm`     | `31..26=0x1b 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmor.mm  vd, vs2, vs1`     |
  | `vmorn.mm`     | `31..26=0x1c 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmorn.mm  vd, vs2, vs1`    |
  | `vmnand.mm`    | `31..26=0x1d 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmnand.mm vd, vs2, vs1`    |
  | `vmnor.mm`     | `31..26=0x1e 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmnor.mm  vd, vs2, vs1`    |
  | `vmxnor.mm`    | `31..26=0x1f 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmxnor.mm vd, vs2, vs1`    |

  : Vector Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Format**             |
  |:-----------|:--------------------------------------------------------------|:-----------------------|
  | `vmsbf.m`  | `31..26=0x14 vm vs2 19..15=0x01 14..12=0x2 vd 6..0=0x57`      | `vmsbf.m vd, vs2, vm`  |
  | `vmsof.m`  | `31..26=0x14 vm vs2 19..15=0x02 14..12=0x2 vd 6..0=0x57`      | `vmsof.m vd, vs2, vm`  |
  | `vmsif.m`  | `31..26=0x14 vm vs2 19..15=0x03 14..12=0x2 vd 6..0=0x57`      | `vmsif.m vd, vs2, vm`  |
  | `viota.m`  | `31..26=0x14 vm vs2 19..15=0x10 14..12=0x2 vd 6..0=0x57`      | `viota.m vd, vs2, vm`  |
  | `vid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 vd 6..0=0x57` | `vid.v vd, vm`         |
  | `vcpop.m`  | `31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `vcpop.m rd, vs2, vm`  |
  | `vfirst.m` | `31..26=0x10 vm vs2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `vfirst.m rd, vs2, vm` |

  : Vector Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `vdivu.vv`   | `31..26=0x20 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vdivu.vv vd, vs2, vs1, vm`   |
  | `vdiv.vv`    | `31..26=0x21 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vdiv.vv vd, vs2, vs1, vm`    |
  | `vremu.vv`   | `31..26=0x22 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vremu.vv vd, vs2, vs1, vm`   |
  | `vrem.vv`    | `31..26=0x23 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vrem.vv vd, vs2, vs1, vm`    |
  | `vmulhu.vv`  | `31..26=0x24 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmulhu.vv vd, vs2, vs1, vm`  |
  | `vmul.vv`    | `31..26=0x25 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmul.vv vd, vs2, vs1, vm`    |
  | `vmulhsu.vv` | `31..26=0x26 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmulhsu.vv vd, vs2, vs1, vm` |
  | `vmulh.vv`   | `31..26=0x27 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmulh.vv vd, vs2, vs1, vm`   |
  | `vmadd.vv`   | `31..26=0x29 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmadd.vv vd, vs1, vs2, vm`   |
  | `vnmsub.vv`  | `31..26=0x2b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vnmsub.vv vd, vs1, vs2, vm`  |
  | `vmacc.vv`   | `31..26=0x2d vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vmacc.vv vd, vs1, vs2, vm`   |
  | `vnmsac.vv`  | `31..26=0x2f vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vnmsac.vv vd, vs1, vs2, vm`  |

  : Vector Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `vwaddu.vv`   | `31..26=0x30 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwaddu.vv  vd, vs2, vs1, vm`  |
  | `vwadd.vv`    | `31..26=0x31 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwadd.vv  vd, vs2, vs1, vm`   |
  | `vwsubu.vv`   | `31..26=0x32 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwsubu.vv  vd, vs2, vs1, vm`  |
  | `vwsub.vv`    | `31..26=0x33 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwsub.vv  vd, vs2, vs1, vm`   |
  | `vwaddu.wv`   | `31..26=0x34 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwaddu.wv  vd, vs2, vs1, vm`  |
  | `vwadd.wv`    | `31..26=0x35 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwadd.wv  vd, vs2, vs1, vm`   |
  | `vwsubu.wv`   | `31..26=0x36 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwsubu.wv  vd, vs2, vs1, vm`  |
  | `vwsub.wv`    | `31..26=0x37 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwsub.wv  vd, vs2, vs1, vm`   |
  | `vwmulu.vv`   | `31..26=0x38 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwmulu.vv vd, vs2, vs1, vm`   |
  | `vwmulsu.vv`  | `31..26=0x3a vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwmulsu.vv vd, vs2, vs1, vm`  |
  | `vwmul.vv`    | `31..26=0x3b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwmul.vv  vd, vs2, vs1, vm`   |
  | `vwmaccu.vv`  | `31..26=0x3c vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwmaccu.vv vd, vs1, vs2, vm`  |
  | `vwmacc.vv`   | `31..26=0x3d vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwmacc.vv vd, vs1, vs2, vm`   |
  | `vwmaccsu.vv` | `31..26=0x3f vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vwmaccsu.vv vd, vs1, vs2, vm` |

  : Vector Integer Extension Instructions V

**Vector Mask Instructions**

* **OPMVV**

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `vredsum.vs`  | `31..26=0x00 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vredsum.vs  vd, vs2, vs1, vm` |
  | `vredand.vs`  | `31..26=0x01 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vredand.vs  vd, vs2, vs1, vm` |
  | `vredor.vs`   | `31..26=0x02 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vredor.vs   vd, vs2, vs1, vm` |
  | `vredxor.vs`  | `31..26=0x03 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vredxor.vs  vd, vs2, vs1, vm` |
  | `vredminu.vs` | `31..26=0x04 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vredminu.vs vd, vs2, vs1, vm` |
  | `vredmin.vs`  | `31..26=0x05 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vredmin.vs  vd, vs2, vs1, vm` |
  | `vredmaxu.vs` | `31..26=0x06 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vredmaxu.vs vd, vs2, vs1, vm` |
  | `vredmax.vs`  | `31..26=0x07 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vredmax.vs  vd, vs2, vs1, vm` |
  | `vaaddu.vv`   | `31..26=0x08 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vaadd.vv    vd, vs2, vs1, vm` |
  | `vaadd.vv`    | `31..26=0x09 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vaadd.vv    vd, vs2, vs1, vm` |
  | `vasubu.vv`   | `31..26=0x0a vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vasubu.vv   vd, vs2, vs1, vm` |
  | `vasub.vv`    | `31..26=0x0b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `vasub.vv    vd, vs2, vs1, vm` |

  : OPMVV I

  | **Name**  | **Opcode / Argument**                                   | **Format**        |
  |:----------|:--------------------------------------------------------|:------------------|
  | `vmv.x.s` | `31..26=0x10 25=1 vs2 19..15=0 14..12=0x2 rd 6..0=0x57` | `vmv.x.s rd, vs2` |

  : OPMVV II

* **OPMVX**

  | **Name**    | **Opcode / Argument**                            | **Format**                   |
  |:------------|:-------------------------------------------------|:-----------------------------|
  | `vaaddu.vx` | `31..26=0x08 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vaaddu.vx vd, vs2, rs1, vm` |
  | `vaadd.vx`  | `31..26=0x09 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vaadd.vx vd, vs2, rs1, vm`  |
  | `vasubu.vx` | `31..26=0x0a vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vasubu.vx vd, vs2, rs1, vm` |
  | `vasub.vx`  | `31..26=0x0b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vasub.vx vd, vs2, rs1, vm`  |

  : OPMVX I

  | **Name**         | **Opcode / Argument**                                   | **Format**                         |
  |:-----------------|:--------------------------------------------------------|:-----------------------------------|
  | `vmv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 vd 6..0=0x57` | `vmv.s.x vd, rs1`                  |
  | `vslide1up.vx`   | `31..26=0x0e vm vs2 rs1 14..12=0x6 vd 6..0=0x57`        | `vslide1up.vx  vd, vs2, rs1, vm`   |
  | `vslide1down.vx` | `31..26=0x0f vm vs2 rs1 14..12=0x6 vd 6..0=0x57`        | `vslide1down.vx  vd, vs2, rs1, vm` |

  : OPMVX II

  | **Name**     | **Opcode / Argument**                            | **Format**                    |
  |:-------------|:-------------------------------------------------|:------------------------------|
  | `vdivu.vx`   | `31..26=0x20 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vdivu.vx vd, vs2, rs1, vm`   |
  | `vdiv.vx`    | `31..26=0x21 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vdiv.vx vd, vs2, rs1, vm`    |
  | `vremu.vx`   | `31..26=0x22 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vremu.vx vd, vs2, rs1, vm`   |
  | `vrem.vx`    | `31..26=0x23 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vrem.vx vd, vs2, rs1, vm`    |
  | `vmulhu.vx`  | `31..26=0x24 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vmulhu.vx vd, vs2, rs1, vm`  |
  | `vmul.vx`    | `31..26=0x25 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vmul.vx vd, vs2, rs1, vm`    |
  | `vmulhsu.vx` | `31..26=0x26 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vmulh.vx vd, vs2, rs1, vm`   |
  | `vmulh.vx`   | `31..26=0x27 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vmulhsu.vx vd, vs2, rs1, vm` |
  | `vmadd.vx`   | `31..26=0x29 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vmadd.vx vd, rs1, vs2, vm`   |
  | `vnmsub.vx`  | `31..26=0x2b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vnmsub.vx vd, rs1, vs2, vm`  |
  | `vmacc.vx`   | `31..26=0x2d vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vmacc.vx vd, rs1, vs2, vm`   |
  | `vnmsac.vx`  | `31..26=0x2f vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vnmsac.vx vd, rs1, vs2, vm`  |

  : OPMVX III

  | **Name**      | **Opcode / Argument**                            | **Format**                     |
  |:--------------|:-------------------------------------------------|:-------------------------------|
  | `vwaddu.vx`   | `31..26=0x30 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwaddu.vx vd, vs2, rs1, vm`   |
  | `vwadd.vx`    | `31..26=0x31 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwadd.vx vd, vs2, rs1, vm`    |
  | `vwsubu.vx`   | `31..26=0x32 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwsubu.vx vd, vs2, rs1, vm`   |
  | `vwsub.vx`    | `31..26=0x33 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwsub.vx vd, vs2, rs1, vm`    |
  | `vwaddu.wx`   | `31..26=0x34 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwaddu.wx vd, vs2, rs1, vm`   |
  | `vwadd.wx`    | `31..26=0x35 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwadd.wx vd, vs2, rs1, vm`    |
  | `vwsubu.wx`   | `31..26=0x36 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwsubu.wx vd, vs2, rs1, vm`   |
  | `vwsub.wx`    | `31..26=0x37 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwsub.wx vd, vs2, rs1, vm`    |
  | `vwmulu.vx`   | `31..26=0x38 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwmulu.vx vd, vs2, rs1, vm`   |
  | `vwmulsu.vx`  | `31..26=0x3a vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwmulsu.vx vd, vs2, rs1, vm`  |
  | `vwmul.vx`    | `31..26=0x3b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwmul.vx vd, vs2, rs1, vm`    |
  | `vwmaccu.vx`  | `31..26=0x3c vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwmaccu.vx vd, rs1, vs2, vm`  |
  | `vwmacc.vx`   | `31..26=0x3d vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwmacc.vx vd, rs1, vs2, vm`   |
  | `vwmaccus.vx` | `31..26=0x3e vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwmaccus.vx vd, rs1, vs2, vm` |
  | `vwmaccsu.vx` | `31..26=0x3f vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `vwmaccsu.vx vd, rs1, vs2, vm` |

  : OPMVX IV
