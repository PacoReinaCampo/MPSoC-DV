## INSTRUCTION DESCRIPTIONS

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

  | **Name**   | **Opcode / Argument**                              | **Description**                                                                                                                                                                                                                                                                                                                                       |
  |:-----------|:---------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vsetivli` | `31=1 30=1 zimm10   zimm5 14..12=0x7 rd 6..0=0x57` | `Set vtype from the immediate and select vl from the unsigned 5-bit AVL immediate; write vl to rd unless rd=x0 and reset vstart. Unsupported vtype sets vill and vl=0; select_vl returns AVL when AVL<=VLMAX, an implementation-deterministic value in [ceil(AVL/2), VLMAX] when VLMAX<AVL<2*VLMAX, and VLMAX otherwise.`                             |
  | `vsetvli`  | `31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57` | `Set vtype from the immediate and select vl from the register-encoded AVL, including the rs1=x0 special cases; write vl to rd unless rd=x0 and reset vstart. Unsupported vtype sets vill and vl=0; select_vl returns AVL when AVL<=VLMAX, an implementation-deterministic value in [ceil(AVL/2), VLMAX] when VLMAX<AVL<2*VLMAX, and VLMAX otherwise.` |
  | `vsetvl`   | `31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57` | `Set vtype from x[rs2] and select vl from the register-encoded AVL, including the rs1=x0 special cases; write vl to rd unless rd=x0 and reset vstart. Unsupported vtype sets vill and vl=0; select_vl returns AVL when AVL<=VLMAX, an implementation-deterministic value in [ceil(AVL/2), VLMAX] when VLMAX<AVL<2*VLMAX, and VLMAX otherwise.`        |

  : Configuration Setting

**OPLS (Vector Loads and Store)**

* **Vector Unit-Stride Instructions (including segment part)**

  | **Name**  | **Opcode / Argument**                                            | **Description**                                                                                                                                     |
  |:----------|:-----------------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vlm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  vd 6..0=0x07` | `Load ceil(vl/8) packed mask bytes at x[rs1], unmasked; vstart counts bytes; the destination uses a tail-agnostic policy.`                          |
  | `vsm.v`   | `31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27` | `Store ceil(vl/8) packed mask bytes at x[rs1], unmasked; vstart counts bytes.`                                                                      |
  | `vle8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  vd 6..0=0x07`      | `Load active 8-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 8 / SEW.`    |
  | `vle16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  vd 6..0=0x07`      | `Load active 16-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 16 / SEW.`  |
  | `vle32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  vd 6..0=0x07`      | `Load active 32-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 32 / SEW.`  |
  | `vle64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  vd 6..0=0x07`      | `Load active 64-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 64 / SEW.`  |
  | `vse8.v`  | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 vs3 6..0=0x27`      | `Store active 8-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 8 / SEW.`   |
  | `vse16.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 vs3 6..0=0x27`      | `Store active 16-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 16 / SEW.` |
  | `vse32.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 vs3 6..0=0x27`      | `Store active 32-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 32 / SEW.` |
  | `vse64.v` | `nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 vs3 6..0=0x27`      | `Store active 64-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 64 / SEW.` |

  : Vector Unit-Stride Instructions (including segment part)

* **Vector Indexed-Unordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Description**                                                                                                                                                                        |
  |:-------------|:-------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vluxei8.v`  | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0  vd 6..0=0x07` | `Load active SEW-bit elements using unsigned 8-bit byte offsets from vs2, without element ordering from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`   |
  | `vluxei16.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5  vd 6..0=0x07` | `Load active SEW-bit elements using unsigned 16-bit byte offsets from vs2, without element ordering from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`  |
  | `vluxei32.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6  vd 6..0=0x07` | `Load active SEW-bit elements using unsigned 32-bit byte offsets from vs2, without element ordering from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`  |
  | `vluxei64.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7  vd 6..0=0x07` | `Load active SEW-bit elements using unsigned 64-bit byte offsets from vs2, without element ordering from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`  |
  | `vsuxei8.v`  | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27` | `Store active SEW-bit elements using unsigned 8-bit byte offsets from vs2, without element ordering from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`  |
  | `vsuxei16.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27` | `Store active SEW-bit elements using unsigned 16-bit byte offsets from vs2, without element ordering from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.` |
  | `vsuxei32.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27` | `Store active SEW-bit elements using unsigned 32-bit byte offsets from vs2, without element ordering from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.` |
  | `vsuxei64.v` | `nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27` | `Store active SEW-bit elements using unsigned 64-bit byte offsets from vs2, without element ordering from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.` |

  : Vector Indexed-Unordered Instructions (including segment part)

* **Vector Strided Instructions (including segment part)**

  | **Name**   | **Opcode / Argument**                                  | **Description**                                                                                                                                                |
  |:-----------|:-------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vlse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  vd 6..0=0x07` | `Load active 8-bit elements using the signed byte stride x[rs2] from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 8 / SEW.`    |
  | `vlse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  vd 6..0=0x07` | `Load active 16-bit elements using the signed byte stride x[rs2] from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 16 / SEW.`  |
  | `vlse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  vd 6..0=0x07` | `Load active 32-bit elements using the signed byte stride x[rs2] from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 32 / SEW.`  |
  | `vlse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  vd 6..0=0x07` | `Load active 64-bit elements using the signed byte stride x[rs2] from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 64 / SEW.`  |
  | `vsse8.v`  | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 vs3 6..0=0x27` | `Store active 8-bit elements using the signed byte stride x[rs2] from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 8 / SEW.`   |
  | `vsse16.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 vs3 6..0=0x27` | `Store active 16-bit elements using the signed byte stride x[rs2] from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 16 / SEW.` |
  | `vsse32.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 vs3 6..0=0x27` | `Store active 32-bit elements using the signed byte stride x[rs2] from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 32 / SEW.` |
  | `vsse64.v` | `nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 vs3 6..0=0x27` | `Store active 64-bit elements using the signed byte stride x[rs2] from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 64 / SEW.` |

  : Vector Strided Instructions (including segment part)

* **Vector Indexed-Ordered Instructions (including segment part)**

  | **Name**     | **Opcode / Argument**                                  | **Description**                                                                                                                                                                |
  |:-------------|:-------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vloxei8.v`  | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0  vd 6..0=0x07` | `Load active SEW-bit elements using unsigned 8-bit byte offsets from vs2, in element order from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`   |
  | `vloxei16.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5  vd 6..0=0x07` | `Load active SEW-bit elements using unsigned 16-bit byte offsets from vs2, in element order from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`  |
  | `vloxei32.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6  vd 6..0=0x07` | `Load active SEW-bit elements using unsigned 32-bit byte offsets from vs2, in element order from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`  |
  | `vloxei64.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7  vd 6..0=0x07` | `Load active SEW-bit elements using unsigned 64-bit byte offsets from vs2, in element order from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`  |
  | `vsoxei8.v`  | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27` | `Store active SEW-bit elements using unsigned 8-bit byte offsets from vs2, in element order from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.`  |
  | `vsoxei16.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27` | `Store active SEW-bit elements using unsigned 16-bit byte offsets from vs2, in element order from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.` |
  | `vsoxei32.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27` | `Store active SEW-bit elements using unsigned 32-bit byte offsets from vs2, in element order from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.` |
  | `vsoxei64.v` | `nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27` | `Store active SEW-bit elements using unsigned 64-bit byte offsets from vs2, in element order from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL.` |

  : Vector Indexed-Ordered Instructions (including segment part)

* **Unit-stride Fault-Only-First Loads**

  | **Name**    | **Opcode / Argument**                                          | **Description**                                                                                                                                                                                                                                                                             |
  |:------------|:---------------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vle8ff.v`  | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  vd 6..0=0x07` | `Load active 8-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 8 / SEW. A synchronous fault at element 0 traps without changing vl; a fault at a later element suppresses the trap and reduces vl to that index.`   |
  | `vle16ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  vd 6..0=0x07` | `Load active 16-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 16 / SEW. A synchronous fault at element 0 traps without changing vl; a fault at a later element suppresses the trap and reduces vl to that index.` |
  | `vle32ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  vd 6..0=0x07` | `Load active 32-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 32 / SEW. A synchronous fault at element 0 traps without changing vl; a fault at a later element suppresses the trap and reduces vl to that index.` |
  | `vle64ff.v` | `nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  vd 6..0=0x07` | `Load active 64-bit elements at consecutive addresses from base x[rs1]; nf+1 fields occupy consecutive register groups with EMUL=LMUL * 64 / SEW. A synchronous fault at element 0 traps without changing vl; a fault at a later element suppresses the trap and reduces vl to that index.` |

  : Unit-stride Fault-Only-First Loads

* **Vector Load/Store Whole Registers**

  | **Name**    | **Opcode / Argument**                                                  | **Description**                                                                                                                                                   |
  |:------------|:-----------------------------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vl1re8.v`  | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `Load 1 consecutive whole vector register from x[rs1], using encoded EEW=8; transfer 1*VLEN/8 bytes independently of vl and vtype, starting at element vstart.`   |
  | `vl1re16.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `Load 1 consecutive whole vector register from x[rs1], using encoded EEW=16; transfer 1*VLEN/8 bytes independently of vl and vtype, starting at element vstart.`  |
  | `vl1re32.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `Load 1 consecutive whole vector register from x[rs1], using encoded EEW=32; transfer 1*VLEN/8 bytes independently of vl and vtype, starting at element vstart.`  |
  | `vl1re64.v` | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `Load 1 consecutive whole vector register from x[rs1], using encoded EEW=64; transfer 1*VLEN/8 bytes independently of vl and vtype, starting at element vstart.`  |
  | `vl2re8.v`  | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `Load 2 consecutive whole vector registers from x[rs1], using encoded EEW=8; transfer 2*VLEN/8 bytes independently of vl and vtype, starting at element vstart.`  |
  | `vl2re16.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `Load 2 consecutive whole vector registers from x[rs1], using encoded EEW=16; transfer 2*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vl2re32.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `Load 2 consecutive whole vector registers from x[rs1], using encoded EEW=32; transfer 2*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vl2re64.v` | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `Load 2 consecutive whole vector registers from x[rs1], using encoded EEW=64; transfer 2*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vl4re8.v`  | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `Load 4 consecutive whole vector registers from x[rs1], using encoded EEW=8; transfer 4*VLEN/8 bytes independently of vl and vtype, starting at element vstart.`  |
  | `vl4re16.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `Load 4 consecutive whole vector registers from x[rs1], using encoded EEW=16; transfer 4*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vl4re32.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `Load 4 consecutive whole vector registers from x[rs1], using encoded EEW=32; transfer 4*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vl4re64.v` | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `Load 4 consecutive whole vector registers from x[rs1], using encoded EEW=64; transfer 4*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vl8re8.v`  | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07` | `Load 8 consecutive whole vector registers from x[rs1], using encoded EEW=8; transfer 8*VLEN/8 bytes independently of vl and vtype, starting at element vstart.`  |
  | `vl8re16.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07` | `Load 8 consecutive whole vector registers from x[rs1], using encoded EEW=16; transfer 8*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vl8re32.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07` | `Load 8 consecutive whole vector registers from x[rs1], using encoded EEW=32; transfer 8*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vl8re64.v` | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07` | `Load 8 consecutive whole vector registers from x[rs1], using encoded EEW=64; transfer 8*VLEN/8 bytes independently of vl and vtype, starting at element vstart.` |
  | `vs1r.v`    | `31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `Store 1 consecutive whole vector register to x[rs1], transferring 1*VLEN/8 bytes independently of vl and vtype; vstart counts bytes.`                            |
  | `vs2r.v`    | `31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `Store 2 consecutive whole vector registers to x[rs1], transferring 2*VLEN/8 bytes independently of vl and vtype; vstart counts bytes.`                           |
  | `vs4r.v`    | `31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `Store 4 consecutive whole vector registers to x[rs1], transferring 4*VLEN/8 bytes independently of vl and vtype; vstart counts bytes.`                           |
  | `vs8r.v`    | `31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27` | `Store 8 consecutive whole vector registers to x[rs1], transferring 8*VLEN/8 bytes independently of vl and vtype; vstart counts bytes.`                           |

  : Vector Load/Store Whole Registers

**Vector Float-Point Instructions**

* **OPFVF**

  | **Name**          | **Opcode / Argument**                                   | **Description**                                                                                                                                                                                                                             |
  |:------------------|:--------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfadd.vf`        | `31..26=0x00 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compute the SEW-bit floating-point sum of vs2 followed by the second operand for each active element. Round using frm. OR active-element exception flags into fflags.`                                                                     |
  | `vfsub.vf`        | `31..26=0x02 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compute the SEW-bit floating-point difference of vs2 followed by the second operand for each active element. Round using frm. OR active-element exception flags into fflags.`                                                              |
  | `vfmin.vf`        | `31..26=0x04 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compute the SEW-bit floating-point minimum of vs2 followed by the second operand for each active element. Use IEEE minimumNumber/maximumNumber semantics, including signed zeros and NaNs. OR active-element exception flags into fflags.` |
  | `vfmax.vf`        | `31..26=0x06 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compute the SEW-bit floating-point maximum of vs2 followed by the second operand for each active element. Use IEEE minimumNumber/maximumNumber semantics, including signed zeros and NaNs. OR active-element exception flags into fflags.` |
  | `vfsgnj.vf`       | `31..26=0x08 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Copy the magnitude bits of vs2 and set the sign to the second operand sign; preserve NaN payload bits and do not raise floating-point exceptions.`                                                                                         |
  | `vfsgnjn.vf`      | `31..26=0x09 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Copy the magnitude bits of vs2 and set the sign to the complement of the second operand sign; preserve NaN payload bits and do not raise floating-point exceptions.`                                                                       |
  | `vfsgnjx.vf`      | `31..26=0x0a vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Copy the magnitude bits of vs2 and set the sign to the XOR of both operand signs; preserve NaN payload bits and do not raise floating-point exceptions.`                                                                                   |
  | `vfslide1up.vf`   | `31..26=0x0e vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Shift active destinations up by one element and insert the scalar at element 0.`                                                                                                                                                           |
  | `vfslide1down.vf` | `31..26=0x0f vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Shift active destinations down by one element and insert the scalar at element vl-1.`                                                                                                                                                      |
  | `vfmv.s.f`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57` | `Copy the SEW-bit scalar floating-point value to element 0 only when vstart<vl; remaining destination elements follow the tail policy.`                                                                                                     |

  : OPFVF I

  | **Name**      | **Opcode / Argument**                                   | **Description**                                                                                                                                                      |
  |:--------------|:--------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfmerge.vfm` | `31..26=0x17 25=0 vs2 rs1 14..12=0x5 vd 6..0=0x57`      | `For every body element, select the second operand when v0 is 1, otherwise select vs2; v0 selects data and does not suppress writes.`                                |
  | `vfmv.v.f`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57` | `Copy fp_scalar(f[rs1], SEW) to every body element, unmasked; preserve prestart elements.`                                                                           |
  | `vmfeq.vf`    | `31..26=0x18 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compare floating-point operands for equal and write each active result to the destination mask. NaNs produce false; invalid is raised for signaling NaNs only.`     |
  | `vmfle.vf`    | `31..26=0x19 vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compare floating-point operands for less than or equal and write each active result to the destination mask. NaNs produce false; invalid is raised for any NaN.`    |
  | `vmflt.vf`    | `31..26=0x1b vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compare floating-point operands for less than and write each active result to the destination mask. NaNs produce false; invalid is raised for any NaN.`             |
  | `vmfne.vf`    | `31..26=0x1c vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compare floating-point operands for not equal and write each active result to the destination mask. NaNs produce true; invalid is raised for signaling NaNs only.`  |
  | `vmfgt.vf`    | `31..26=0x1d vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compare floating-point operands for greater than and write each active result to the destination mask. NaNs produce false; invalid is raised for any NaN.`          |
  | `vmfge.vf`    | `31..26=0x1f vm vs2 rs1 14..12=0x5 vd 6..0=0x57`        | `Compare floating-point operands for greater than or equal and write each active result to the destination mask. NaNs produce false; invalid is raised for any NaN.` |

  : OPFVF II

  | **Name**     | **Opcode / Argument**                            | **Description**                                                                                                                                                              |
  |:-------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfdiv.vf`   | `31..26=0x20 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the SEW-bit floating-point quotient of vs2 followed by the second operand for each active element. Round using frm. OR active-element exception flags into fflags.` |
  | `vfrdiv.vf`  | `31..26=0x21 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the SEW-bit floating-point quotient of the scalar followed by vs2 for each active element. Round using frm. OR active-element exception flags into fflags.`         |
  | `vfmul.vf`   | `31..26=0x24 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the SEW-bit floating-point product of vs2 followed by the second operand for each active element. Round using frm. OR active-element exception flags into fflags.`  |
  | `vfrsub.vf`  | `31..26=0x27 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the SEW-bit floating-point difference of the scalar followed by vs2 for each active element. Round using frm. OR active-element exception flags into fflags.`       |
  | `vfmadd.vf`  | `31..26=0x28 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute (fp_scalar(f[rs1], SEW) * old vd[i]) + vs2[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`  |
  | `vfnmadd.vf` | `31..26=0x29 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute -(fp_scalar(f[rs1], SEW) * old vd[i]) - vs2[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.` |
  | `vfmsub.vf`  | `31..26=0x2a vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute (fp_scalar(f[rs1], SEW) * old vd[i]) - vs2[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`  |
  | `vfnmsub.vf` | `31..26=0x2b vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute -(fp_scalar(f[rs1], SEW) * old vd[i]) + vs2[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.` |
  | `vfmacc.vf`  | `31..26=0x2c vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute (fp_scalar(f[rs1], SEW) * vs2[i]) + old vd[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`  |
  | `vfnmacc.vf` | `31..26=0x2d vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute -(fp_scalar(f[rs1], SEW) * vs2[i]) - old vd[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.` |
  | `vfmsac.vf`  | `31..26=0x2e vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute (fp_scalar(f[rs1], SEW) * vs2[i]) - old vd[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`  |
  | `vfnmsac.vf` | `31..26=0x2f vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute -(fp_scalar(f[rs1], SEW) * vs2[i]) + old vd[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.` |

  : OPFVF III

  | **Name**      | **Opcode / Argument**                            | **Description**                                                                                                                                                                                                                                 |
  |:--------------|:-------------------------------------------------|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfwadd.vf`   | `31..26=0x30 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point sum of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.`        |
  | `vfwsub.vf`   | `31..26=0x32 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point difference of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.` |
  | `vfwadd.wf`   | `31..26=0x34 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point sum of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.`        |
  | `vfwsub.wf`   | `31..26=0x36 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point difference of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.` |
  | `vfwmul.vf`   | `31..26=0x38 vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point product of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.`    |
  | `vfwmacc.vf`  | `31..26=0x3c vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute (fp_scalar(f[rs1], SEW) * vs2[i]) + old vd[i] as one fused operation with a single rounding to 2 * SEW bits using frm; OR active-element exception flags into fflags.`                                                                 |
  | `vfwnmacc.vf` | `31..26=0x3d vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute -(fp_scalar(f[rs1], SEW) * vs2[i]) - old vd[i] as one fused operation with a single rounding to 2 * SEW bits using frm; OR active-element exception flags into fflags.`                                                                |
  | `vfwmsac.vf`  | `31..26=0x3e vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute (fp_scalar(f[rs1], SEW) * vs2[i]) - old vd[i] as one fused operation with a single rounding to 2 * SEW bits using frm; OR active-element exception flags into fflags.`                                                                 |
  | `vfwnmsac.vf` | `31..26=0x3f vm vs2 rs1 14..12=0x5 vd 6..0=0x57` | `Compute -(fp_scalar(f[rs1], SEW) * vs2[i]) + old vd[i] as one fused operation with a single rounding to 2 * SEW bits using frm; OR active-element exception flags into fflags.`                                                                |

  : OPFVF IV

* **OPFVV**

  | **Name**       | **Opcode / Argument**                                   | **Description**                                                                                                                                                                                                                             |
  |:---------------|:--------------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfadd.vv`     | `31..26=0x00 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Compute the SEW-bit floating-point sum of vs2 followed by the second operand for each active element. Round using frm. OR active-element exception flags into fflags.`                                                                     |
  | `vfredusum.vs` | `31..26=0x01 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Sum active vector elements with vs1[0] using a deterministic reduction tree and frm rounding; an increasing-index sequential tree is permitted and is shown here. Leave the destination unchanged when vl=0; vstart must be zero.`         |
  | `vfsub.vv`     | `31..26=0x02 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Compute the SEW-bit floating-point difference of vs2 followed by the second operand for each active element. Round using frm. OR active-element exception flags into fflags.`                                                              |
  | `vfredosum.vs` | `31..26=0x03 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Sum active vector elements into vs1[0] in increasing element order with frm rounding at each addition. Leave the destination unchanged when vl=0; vstart must be zero.`                                                                    |
  | `vfmin.vv`     | `31..26=0x04 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Compute the SEW-bit floating-point minimum of vs2 followed by the second operand for each active element. Use IEEE minimumNumber/maximumNumber semantics, including signed zeros and NaNs. OR active-element exception flags into fflags.` |
  | `vfredmin.vs`  | `31..26=0x05 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Reduce active vector elements and the scalar seed vs1[0] using IEEE minimumNumber. Leave the destination unchanged when vl=0; vstart must be zero.`                                                                                        |
  | `vfmax.vv`     | `31..26=0x06 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Compute the SEW-bit floating-point maximum of vs2 followed by the second operand for each active element. Use IEEE minimumNumber/maximumNumber semantics, including signed zeros and NaNs. OR active-element exception flags into fflags.` |
  | `vfredmax.vs`  | `31..26=0x07 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Reduce active vector elements and the scalar seed vs1[0] using IEEE maximumNumber. Leave the destination unchanged when vl=0; vstart must be zero.`                                                                                        |
  | `vfsgnj.vv`    | `31..26=0x08 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Copy the magnitude bits of vs2 and set the sign to the second operand sign; preserve NaN payload bits and do not raise floating-point exceptions.`                                                                                         |
  | `vfsgnjn.vv`   | `31..26=0x09 vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Copy the magnitude bits of vs2 and set the sign to the complement of the second operand sign; preserve NaN payload bits and do not raise floating-point exceptions.`                                                                       |
  | `vfsgnjx.vv`   | `31..26=0x0a vm vs2 vs1 14..12=0x1 vd 6..0=0x57`        | `Copy the magnitude bits of vs2 and set the sign to the XOR of both operand signs; preserve NaN payload bits and do not raise floating-point exceptions.`                                                                                   |
  | `vfmv.f.s`     | `31..26=0x10 25=1 vs2 19..15=0 14..12=0x1 rd 6..0=0x57` | `Copy element 0 to f[rd] with NaN boxing when SEW<FLEN, even when vl=0 or vstart>=vl.`                                                                                                                                                      |

  : OPFVV I

  | **Name**   | **Opcode / Argument**                            | **Description**                                                                                                                                                     |
  |:-----------|:-------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vmfeq.vv` | `31..26=0x18 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compare floating-point operands for equal and write each active result to the destination mask. NaNs produce false; invalid is raised for signaling NaNs only.`    |
  | `vmfle.vv` | `31..26=0x19 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compare floating-point operands for less than or equal and write each active result to the destination mask. NaNs produce false; invalid is raised for any NaN.`   |
  | `vmflt.vv` | `31..26=0x1b vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compare floating-point operands for less than and write each active result to the destination mask. NaNs produce false; invalid is raised for any NaN.`            |
  | `vmfne.vv` | `31..26=0x1c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compare floating-point operands for not equal and write each active result to the destination mask. NaNs produce true; invalid is raised for signaling NaNs only.` |

  : OPFVV II

  | **Name**     | **Opcode / Argument**                            | **Description**                                                                                                                                                              |
  |:-------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfdiv.vv`   | `31..26=0x20 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute the SEW-bit floating-point quotient of vs2 followed by the second operand for each active element. Round using frm. OR active-element exception flags into fflags.` |
  | `vfmul.vv`   | `31..26=0x24 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute the SEW-bit floating-point product of vs2 followed by the second operand for each active element. Round using frm. OR active-element exception flags into fflags.`  |
  | `vfmadd.vv`  | `31..26=0x28 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute (vs1[i] * old vd[i]) + vs2[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`                  |
  | `vfnmadd.vv` | `31..26=0x29 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute -(vs1[i] * old vd[i]) - vs2[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`                 |
  | `vfmsub.vv`  | `31..26=0x2a vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute (vs1[i] * old vd[i]) - vs2[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`                  |
  | `vfnmsub.vv` | `31..26=0x2b vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute -(vs1[i] * old vd[i]) + vs2[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`                 |
  | `vfmacc.vv`  | `31..26=0x2c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute (vs1[i] * vs2[i]) + old vd[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`                  |
  | `vfnmacc.vv` | `31..26=0x2d vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute -(vs1[i] * vs2[i]) - old vd[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`                 |
  | `vfmsac.vv`  | `31..26=0x2e vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute (vs1[i] * vs2[i]) - old vd[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`                  |
  | `vfnmsac.vv` | `31..26=0x2f vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute -(vs1[i] * vs2[i]) + old vd[i] as one fused operation with a single rounding to SEW bits using frm; OR active-element exception flags into fflags.`                 |

  : OPFVV III

  | **Name**           | **Opcode / Argument**                                    | **Description**                                                                                                                                                                                |
  |:-------------------|:---------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfcvt.xu.f.v`     | `31..26=0x12 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a SEW-bit unsigned integer result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`      |
  | `vfcvt.x.f.v`      | `31..26=0x12 vm vs2 19..15=0x01 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a SEW-bit signed integer result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`        |
  | `vfcvt.f.xu.v`     | `31..26=0x12 vm vs2 19..15=0x02 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit unsigned integer source to a SEW-bit floating-point result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`      |
  | `vfcvt.f.x.v`      | `31..26=0x12 vm vs2 19..15=0x03 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit signed integer source to a SEW-bit floating-point result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`        |
  | `vfcvt.rtz.xu.f.v` | `31..26=0x12 vm vs2 19..15=0x06 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a SEW-bit unsigned integer result using round toward zero and scalar RISC-V conversion exception rules; OR exception flags into fflags.` |
  | `vfcvt.rtz.x.f.v`  | `31..26=0x12 vm vs2 19..15=0x07 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a SEW-bit signed integer result using round toward zero and scalar RISC-V conversion exception rules; OR exception flags into fflags.`   |

  : OPFVV IV

  | **Name**            | **Opcode / Argument**                                    | **Description**                                                                                                                                                                                    |
  |:--------------------|:---------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfwcvt.xu.f.v`     | `31..26=0x12 vm vs2 19..15=0x08 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a 2 * SEW-bit unsigned integer result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`      |
  | `vfwcvt.x.f.v`      | `31..26=0x12 vm vs2 19..15=0x09 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a 2 * SEW-bit signed integer result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`        |
  | `vfwcvt.f.xu.v`     | `31..26=0x12 vm vs2 19..15=0x0A 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit unsigned integer source to a 2 * SEW-bit floating-point result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`      |
  | `vfwcvt.f.x.v`      | `31..26=0x12 vm vs2 19..15=0x0B 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit signed integer source to a 2 * SEW-bit floating-point result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`        |
  | `vfwcvt.f.f.v`      | `31..26=0x12 vm vs2 19..15=0x0C 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a 2 * SEW-bit floating-point result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`        |
  | `vfwcvt.rtz.xu.f.v` | `31..26=0x12 vm vs2 19..15=0x0E 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a 2 * SEW-bit unsigned integer result using round toward zero and scalar RISC-V conversion exception rules; OR exception flags into fflags.` |
  | `vfwcvt.rtz.x.f.v`  | `31..26=0x12 vm vs2 19..15=0x0F 14..12=0x1 vd 6..0=0x57` | `Convert each active SEW-bit floating-point source to a 2 * SEW-bit signed integer result using round toward zero and scalar RISC-V conversion exception rules; OR exception flags into fflags.`   |

  : OPFVV V

  | **Name**            | **Opcode / Argument**                                    | **Description**                                                                                                                                                                                                                                                                |
  |:--------------------|:---------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfncvt.xu.f.w`     | `31..26=0x12 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57` | `Convert each active 2 * SEW-bit floating-point source to a SEW-bit unsigned integer result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`                                                                                  |
  | `vfncvt.x.f.w`      | `31..26=0x12 vm vs2 19..15=0x11 14..12=0x1 vd 6..0=0x57` | `Convert each active 2 * SEW-bit floating-point source to a SEW-bit signed integer result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`                                                                                    |
  | `vfncvt.f.xu.w`     | `31..26=0x12 vm vs2 19..15=0x12 14..12=0x1 vd 6..0=0x57` | `Convert each active 2 * SEW-bit unsigned integer source to a SEW-bit floating-point result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`                                                                                  |
  | `vfncvt.f.x.w`      | `31..26=0x12 vm vs2 19..15=0x13 14..12=0x1 vd 6..0=0x57` | `Convert each active 2 * SEW-bit signed integer source to a SEW-bit floating-point result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`                                                                                    |
  | `vfncvt.f.f.w`      | `31..26=0x12 vm vs2 19..15=0x14 14..12=0x1 vd 6..0=0x57` | `Convert each active 2 * SEW-bit floating-point source to a SEW-bit floating-point result using frm rounding and scalar RISC-V conversion exception rules; OR exception flags into fflags.`                                                                                    |
  | `vfncvt.rod.f.f.w`  | `31..26=0x12 vm vs2 19..15=0x15 14..12=0x1 vd 6..0=0x57` | `Convert each active 2 * SEW-bit floating-point source to a SEW-bit floating-point result using round to odd and scalar RISC-V conversion exception rules; OR exception flags into fflags. Finite overflow returns the largest finite destination value with the source sign.` |
  | `vfncvt.rtz.xu.f.w` | `31..26=0x12 vm vs2 19..15=0x16 14..12=0x1 vd 6..0=0x57` | `Convert each active 2 * SEW-bit floating-point source to a SEW-bit unsigned integer result using round toward zero and scalar RISC-V conversion exception rules; OR exception flags into fflags.`                                                                             |
  | `vfncvt.rtz.x.f.w`  | `31..26=0x12 vm vs2 19..15=0x17 14..12=0x1 vd 6..0=0x57` | `Convert each active 2 * SEW-bit floating-point source to a SEW-bit signed integer result using round toward zero and scalar RISC-V conversion exception rules; OR exception flags into fflags.`                                                                               |

  : OPFVV VI

  | **Name**     | **Opcode / Argument**                                    | **Description**                                                                                                                                                                                                                              |
  |:-------------|:---------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfsqrt.v`   | `31..26=0x13 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57` | `Compute the floating-point square root using frm rounding. Apply the specified zero, infinity, subnormal, and NaN rules; OR active-element exception flags into fflags.`                                                                    |
  | `vfrsqrt7.v` | `31..26=0x13 vm vs2 19..15=0x04 14..12=0x1 vd 6..0=0x57` | `Estimate the reciprocal square root using the specification lookup table, with 7-bit significand accuracy independent of frm. Apply the specified zero, infinity, subnormal, and NaN rules; OR active-element exception flags into fflags.` |
  | `vfrec7.v`   | `31..26=0x13 vm vs2 19..15=0x05 14..12=0x1 vd 6..0=0x57` | `Estimate the reciprocal using the specification lookup table with 7-bit significand accuracy; frm affects overflow results. Apply the specified zero, infinity, subnormal, and NaN rules; OR active-element exception flags into fflags.`   |
  | `vfclass.v`  | `31..26=0x13 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57` | `Classify each active floating-point source into the standard 10-bit FCLASS mask, zero-extended to SEW; do not raise floating-point exceptions.`                                                                                             |

  : OPFVV VII

  | **Name**        | **Opcode / Argument**                            | **Description**                                                                                                                                                                                                                                                                                                       |
  |:----------------|:-------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vfwadd.vv`     | `31..26=0x30 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point sum of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.`                                                                              |
  | `vfwredusum.vs` | `31..26=0x31 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Sum active vector elements with vs1[0] using a deterministic reduction tree and frm rounding; an increasing-index sequential tree is permitted and is shown here. Promote SEW-bit vector values exactly before adding to the 2*SEW-bit accumulator. Leave the destination unchanged when vl=0; vstart must be zero.` |
  | `vfwsub.vv`     | `31..26=0x32 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point difference of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.`                                                                       |
  | `vfwredosum.vs` | `31..26=0x33 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Sum active vector elements into vs1[0] in increasing element order with frm rounding at each addition. Promote SEW-bit vector values exactly before adding to the 2*SEW-bit accumulator. Leave the destination unchanged when vl=0; vstart must be zero.`                                                            |
  | `vfwadd.wv`     | `31..26=0x34 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point sum of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.`                                                                              |
  | `vfwsub.wv`     | `31..26=0x36 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point difference of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.`                                                                       |
  | `vfwmul.vv`     | `31..26=0x38 vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute the 2 * SEW-bit floating-point product of vs2 followed by the second operand for each active element. Promote narrow inputs exactly to 2*SEW before the operation. Round using frm. OR active-element exception flags into fflags.`                                                                          |
  | `vfwmacc.vv`    | `31..26=0x3c vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute (vs1[i] * vs2[i]) + old vd[i] as one fused operation with a single rounding to 2 * SEW bits using frm; OR active-element exception flags into fflags.`                                                                                                                                                       |
  | `vfwnmacc.vv`   | `31..26=0x3d vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute -(vs1[i] * vs2[i]) - old vd[i] as one fused operation with a single rounding to 2 * SEW bits using frm; OR active-element exception flags into fflags.`                                                                                                                                                      |
  | `vfwmsac.vv`    | `31..26=0x3e vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute (vs1[i] * vs2[i]) - old vd[i] as one fused operation with a single rounding to 2 * SEW bits using frm; OR active-element exception flags into fflags.`                                                                                                                                                       |
  | `vfwnmsac.vv`   | `31..26=0x3f vm vs2 vs1 14..12=0x1 vd 6..0=0x57` | `Compute -(vs1[i] * vs2[i]) + old vd[i] as one fused operation with a single rounding to 2 * SEW bits using frm; OR active-element exception flags into fflags.`                                                                                                                                                      |

  : OPFVV VIII

**Vector Integer Instructions**

* **OPIVX**

  | **Name**        | **Opcode / Argument**                            | **Description**                                                                                                                                    |
  |:----------------|:-------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vadd.vx`       | `31..26=0x00 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute vs2[i] + resize_signed(x[rs1], XLEN, SEW) for each active element; integer results wrap to SEW bits.`                                     |
  | `vsub.vx`       | `31..26=0x02 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute vs2[i] - resize_signed(x[rs1], XLEN, SEW) for each active element; integer results wrap to SEW bits.`                                     |
  | `vrsub.vx`      | `31..26=0x03 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute resize_signed(x[rs1], XLEN, SEW) - vs2[i] for each active element; integer results wrap to SEW bits.`                                     |
  | `vminu.vx`      | `31..26=0x04 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Select the minimum of the unsigned SEW-bit source values for each active element.`                                                                |
  | `vmin.vx`       | `31..26=0x05 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Select the minimum of the signed SEW-bit source values for each active element.`                                                                  |
  | `vmaxu.vx`      | `31..26=0x06 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Select the maximum of the unsigned SEW-bit source values for each active element.`                                                                |
  | `vmax.vx`       | `31..26=0x07 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Select the maximum of the signed SEW-bit source values for each active element.`                                                                  |
  | `vand.vx`       | `31..26=0x09 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute vs2[i] & resize_signed(x[rs1], XLEN, SEW) for each active element; integer results wrap to SEW bits.`                                     |
  | `vor.vx`        | `31..26=0x0a vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute vs2[i] \| resize_signed(x[rs1], XLEN, SEW) for each active element; integer results wrap to SEW bits.`                                    |
  | `vxor.vx`       | `31..26=0x0b vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute vs2[i] ^ resize_signed(x[rs1], XLEN, SEW) for each active element; integer results wrap to SEW bits.`                                     |
  | `vrgather.vx`   | `31..26=0x0c vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Copy vs2 elements selected by unsigned XLEN-bit scalar indices to active destinations; indices may exceed vl, but indices >= VLMAX produce zero.` |
  | `vslideup.vx`   | `31..26=0x0e vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Shift active destinations up by the unsigned offset; elements below the offset remain unchanged. Scalar offsets retain all XLEN bits.`            |
  | `vslidedown.vx` | `31..26=0x0f vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Shift active destinations down by the unsigned offset; source indices >= VLMAX yield zero. Scalar offsets retain all XLEN bits.`                  |

  : OPIVX I

  | **Name**     | **Opcode / Argument**                                   | **Description**                                                                                                                                        |
  |:-------------|:--------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vadc.vxm`   | `31..26=0x10 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Add the operands and the v0 carry-in bit. Operate on every body element; v0 is data rather than a predicate.`                                         |
  | `vmadc.vxm`  | `31..26=0x11 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Write the carry-out bit of the untruncated sum; include v0 as input. Operate on every body element; v0 is data rather than a predicate.`              |
  | `vmadc.vx`   | `31..26=0x11 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Write the carry-out bit of the untruncated sum; no carry or borrow input. Operate on every body element; v0 is data rather than a predicate.`         |
  | `vsbc.vxm`   | `31..26=0x12 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Subtract the operands and the v0 borrow-in bit. Operate on every body element; v0 is data rather than a predicate.`                                   |
  | `vmsbc.vxm`  | `31..26=0x13 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Write the borrow-out bit of the untruncated difference; include v0 as input. Operate on every body element; v0 is data rather than a predicate.`      |
  | `vmsbc.vx`   | `31..26=0x13 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `Write the borrow-out bit of the untruncated difference; no carry or borrow input. Operate on every body element; v0 is data rather than a predicate.` |
  | `vmerge.vxm` | `31..26=0x17 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57`      | `For every body element, select the second operand when v0 is 1, otherwise select vs2; v0 selects data and does not suppress writes.`                  |
  | `vmv.v.x`    | `31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 vd 6..0=0x57` | `Copy resize_signed(x[rs1], XLEN, SEW) to every body element, unmasked; preserve prestart elements.`                                                   |
  | `vmseq.vx`   | `31..26=0x18 vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit equal result to the destination mask.`                                  |
  | `vmsne.vx`   | `31..26=0x19 vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit not equal result to the destination mask.`                              |
  | `vmsltu.vx`  | `31..26=0x1a vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Compare unsigned SEW-bit operands for each active element and write the one-bit less than unsigned result to the destination mask.`                   |
  | `vmslt.vx`   | `31..26=0x1b vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit less than signed result to the destination mask.`                       |
  | `vmsleu.vx`  | `31..26=0x1c vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Compare unsigned SEW-bit operands for each active element and write the one-bit less than or equal unsigned result to the destination mask.`          |
  | `vmsle.vx`   | `31..26=0x1d vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit less than or equal signed result to the destination mask.`              |
  | `vmsgtu.vx`  | `31..26=0x1e vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Compare unsigned SEW-bit operands for each active element and write the one-bit greater than unsigned result to the destination mask.`                |
  | `vmsgt.vx`   | `31..26=0x1f vm vs2 rs1 14..12=0x4 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit greater than signed result to the destination mask.`                    |

  : OPIVX II

  | **Name**     | **Opcode / Argument**                            | **Description**                                                                                                                                                                                      |
  |:-------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vsaddu.vx`  | `31..26=0x20 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute the exact unsigned sum or difference, saturate to the unsigned SEW-bit range, and set sticky vxsat if any active result saturates.`                                                         |
  | `vsadd.vx`   | `31..26=0x21 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute the exact signed sum or difference, saturate to the signed SEW-bit range, and set sticky vxsat if any active result saturates.`                                                             |
  | `vssubu.vx`  | `31..26=0x22 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute the exact unsigned sum or difference, saturate to the unsigned SEW-bit range, and set sticky vxsat if any active result saturates.`                                                         |
  | `vssub.vx`   | `31..26=0x23 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Compute the exact signed sum or difference, saturate to the signed SEW-bit range, and set sticky vxsat if any active result saturates.`                                                             |
  | `vsll.vx`    | `31..26=0x25 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vsmul.vx`   | `31..26=0x27 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Multiply signed SEW-bit operands at full precision, shift right by SEW-1 with vxrm rounding, saturate to signed SEW bits, and set sticky vxsat on saturation.`                                      |
  | `vsrl.vx`    | `31..26=0x28 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vsra.vx`    | `31..26=0x29 vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vssrl.vx`   | `31..26=0x2a vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Round and shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits; rounding uses vxrm.`                                                    |
  | `vssra.vx`   | `31..26=0x2b vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Round and shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits; rounding uses vxrm.`                                                    |
  | `vnsrl.wx`   | `31..26=0x2c vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                          |
  | `vnsra.wx`   | `31..26=0x2d vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                          |
  | `vnclipu.wx` | `31..26=0x2e vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Round and shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount, saturate to a unsigned SEW-bit result, and set sticky vxsat on saturation; rounding uses vxrm.` |
  | `vnclip.wx`  | `31..26=0x2f vm vs2 rs1 14..12=0x4 vd 6..0=0x57` | `Round and shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount, saturate to a signed SEW-bit result, and set sticky vxsat on saturation; rounding uses vxrm.`   |

  : OPIVX III

* **OPIVV**

  | **Name**          | **Opcode / Argument**                            | **Description**                                                                                                                                   |
  |:------------------|:-------------------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vadd.vv`         | `31..26=0x00 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute vs2[i] + vs1[i] for each active element; integer results wrap to SEW bits.`                                                              |
  | `vsub.vv`         | `31..26=0x02 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute vs2[i] - vs1[i] for each active element; integer results wrap to SEW bits.`                                                              |
  | `vminu.vv`        | `31..26=0x04 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Select the minimum of the unsigned SEW-bit source values for each active element.`                                                               |
  | `vmin.vv`         | `31..26=0x05 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Select the minimum of the signed SEW-bit source values for each active element.`                                                                 |
  | `vmaxu.vv`        | `31..26=0x06 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Select the maximum of the unsigned SEW-bit source values for each active element.`                                                               |
  | `vmax.vv`         | `31..26=0x07 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Select the maximum of the signed SEW-bit source values for each active element.`                                                                 |
  | `vand.vv`         | `31..26=0x09 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute vs2[i] & vs1[i] for each active element; integer results wrap to SEW bits.`                                                              |
  | `vor.vv`          | `31..26=0x0a vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute vs2[i] \| vs1[i] for each active element; integer results wrap to SEW bits.`                                                             |
  | `vxor.vv`         | `31..26=0x0b vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute vs2[i] ^ vs1[i] for each active element; integer results wrap to SEW bits.`                                                              |
  | `vrgather.vv`     | `31..26=0x0c vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Copy vs2 elements selected by unsigned SEW-bit vector indices to active destinations; indices may exceed vl, but indices >= VLMAX produce zero.` |
  | `vrgatherei16.vv` | `31..26=0x0e vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Copy vs2 elements selected by unsigned 16-bit vector indices to active destinations; indices may exceed vl, but indices >= VLMAX produce zero.`  |

  : OPIVV I

  | **Name**     | **Opcode / Argument**                                   | **Description**                                                                                                                                        |
  |:-------------|:--------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vadc.vvm`   | `31..26=0x10 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Add the operands and the v0 carry-in bit. Operate on every body element; v0 is data rather than a predicate.`                                         |
  | `vmadc.vvm`  | `31..26=0x11 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Write the carry-out bit of the untruncated sum; include v0 as input. Operate on every body element; v0 is data rather than a predicate.`              |
  | `vmadc.vv`   | `31..26=0x11 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Write the carry-out bit of the untruncated sum; no carry or borrow input. Operate on every body element; v0 is data rather than a predicate.`         |
  | `vsbc.vvm`   | `31..26=0x12 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Subtract the operands and the v0 borrow-in bit. Operate on every body element; v0 is data rather than a predicate.`                                   |
  | `vmsbc.vvm`  | `31..26=0x13 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Write the borrow-out bit of the untruncated difference; include v0 as input. Operate on every body element; v0 is data rather than a predicate.`      |
  | `vmsbc.vv`   | `31..26=0x13 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `Write the borrow-out bit of the untruncated difference; no carry or borrow input. Operate on every body element; v0 is data rather than a predicate.` |
  | `vmerge.vvm` | `31..26=0x17 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57`      | `For every body element, select the second operand when v0 is 1, otherwise select vs2; v0 selects data and does not suppress writes.`                  |
  | `vmv.v.v`    | `31..26=0x17 25=1 24..20=0 vs1 14..12=0x0 vd 6..0=0x57` | `Copy vs1[i] to every body element, unmasked; preserve prestart elements.`                                                                             |
  | `vmseq.vv`   | `31..26=0x18 vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit equal result to the destination mask.`                                  |
  | `vmsne.vv`   | `31..26=0x19 vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit not equal result to the destination mask.`                              |
  | `vmsltu.vv`  | `31..26=0x1a vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Compare unsigned SEW-bit operands for each active element and write the one-bit less than unsigned result to the destination mask.`                   |
  | `vmslt.vv`   | `31..26=0x1b vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit less than signed result to the destination mask.`                       |
  | `vmsleu.vv`  | `31..26=0x1c vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Compare unsigned SEW-bit operands for each active element and write the one-bit less than or equal unsigned result to the destination mask.`          |
  | `vmsle.vv`   | `31..26=0x1d vm vs2 vs1 14..12=0x0 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit less than or equal signed result to the destination mask.`              |

  : OPIVV II

  | **Name**     | **Opcode / Argument**                            | **Description**                                                                                                                                                                                      |
  |:-------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vsaddu.vv`  | `31..26=0x20 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute the exact unsigned sum or difference, saturate to the unsigned SEW-bit range, and set sticky vxsat if any active result saturates.`                                                         |
  | `vsadd.vv`   | `31..26=0x21 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute the exact signed sum or difference, saturate to the signed SEW-bit range, and set sticky vxsat if any active result saturates.`                                                             |
  | `vssubu.vv`  | `31..26=0x22 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute the exact unsigned sum or difference, saturate to the unsigned SEW-bit range, and set sticky vxsat if any active result saturates.`                                                         |
  | `vssub.vv`   | `31..26=0x23 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Compute the exact signed sum or difference, saturate to the signed SEW-bit range, and set sticky vxsat if any active result saturates.`                                                             |
  | `vsll.vv`    | `31..26=0x25 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vsmul.vv`   | `31..26=0x27 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Multiply signed SEW-bit operands at full precision, shift right by SEW-1 with vxrm rounding, saturate to signed SEW bits, and set sticky vxsat on saturation.`                                      |
  | `vsrl.vv`    | `31..26=0x28 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vsra.vv`    | `31..26=0x29 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vssrl.vv`   | `31..26=0x2a vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Round and shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits; rounding uses vxrm.`                                                    |
  | `vssra.vv`   | `31..26=0x2b vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Round and shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits; rounding uses vxrm.`                                                    |
  | `vnsrl.wv`   | `31..26=0x2c vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                          |
  | `vnsra.wv`   | `31..26=0x2d vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                          |
  | `vnclipu.wv` | `31..26=0x2e vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Round and shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount, saturate to a unsigned SEW-bit result, and set sticky vxsat on saturation; rounding uses vxrm.` |
  | `vnclip.wv`  | `31..26=0x2f vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Round and shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount, saturate to a signed SEW-bit result, and set sticky vxsat on saturation; rounding uses vxrm.`   |

  : OPIVV III

  | **Name**       | **Opcode / Argument**                            | **Description**                                                                                                                                                                                                                                                        |
  |:---------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vwredsumu.vs` | `31..26=0x30 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using sum unsigned and write the 2 * SEW-bit result to element 0; sums wrap to the destination width. Zero-extend the SEW-bit vector elements before summing. Leave the destination unchanged when vl=0; vstart must be zero.` |
  | `vwredsum.vs`  | `31..26=0x31 vm vs2 vs1 14..12=0x0 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using sum and write the 2 * SEW-bit result to element 0; sums wrap to the destination width. Sign-extend the SEW-bit vector elements before summing. Leave the destination unchanged when vl=0; vstart must be zero.`          |

  : OPIVV IV

* **OPIVI**

  | **Name**        | **Opcode / Argument**                              | **Description**                                                                                                                                    |
  |:----------------|:---------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vadd.vi`       | `31..26=0x00 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Compute vs2[i] + sext(simm5, 5, SEW) for each active element; integer results wrap to SEW bits.`                                                  |
  | `vrsub.vi`      | `31..26=0x03 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Compute sext(simm5, 5, SEW) - vs2[i] for each active element; integer results wrap to SEW bits.`                                                  |
  | `vand.vi`       | `31..26=0x09 vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Compute vs2[i] & sext(simm5, 5, SEW) for each active element; integer results wrap to SEW bits.`                                                  |
  | `vor.vi`        | `31..26=0x0a vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Compute vs2[i] \| sext(simm5, 5, SEW) for each active element; integer results wrap to SEW bits.`                                                 |
  | `vxor.vi`       | `31..26=0x0b vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Compute vs2[i] ^ sext(simm5, 5, SEW) for each active element; integer results wrap to SEW bits.`                                                  |
  | `vrgather.vi`   | `31..26=0x0c vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Copy vs2 elements selected by unsigned 5-bit immediate indices to active destinations; indices may exceed vl, but indices >= VLMAX produce zero.` |
  | `vslideup.vi`   | `31..26=0x0e vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Shift active destinations up by the unsigned offset; elements below the offset remain unchanged. Scalar offsets retain all XLEN bits.`            |
  | `vslidedown.vi` | `31..26=0x0f vm vs2 simm5 14..12=0x3 vd 6..0=0x57` | `Shift active destinations down by the unsigned offset; source indices >= VLMAX yield zero. Scalar offsets retain all XLEN bits.`                  |

  : OPIVI I

  | **Name**     | **Opcode / Argument**                                     | **Description**                                                                                                                                |
  |:-------------|:----------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------|
  | `vadc.vim`   | `31..26=0x10 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Add the operands and the v0 carry-in bit. Operate on every body element; v0 is data rather than a predicate.`                                 |
  | `vmadc.vim`  | `31..26=0x11 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Write the carry-out bit of the untruncated sum; include v0 as input. Operate on every body element; v0 is data rather than a predicate.`      |
  | `vmadc.vi`   | `31..26=0x11 25=1 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Write the carry-out bit of the untruncated sum; no carry or borrow input. Operate on every body element; v0 is data rather than a predicate.` |
  | `vmerge.vim` | `31..26=0x17 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `For every body element, select the second operand when v0 is 1, otherwise select vs2; v0 selects data and does not suppress writes.`          |
  | `vmv.v.i`    | `31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 vd 6..0=0x57` | `Copy sext(simm5, 5, SEW) to every body element, unmasked; preserve prestart elements.`                                                        |
  | `vmseq.vi`   | `31..26=0x18 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit equal result to the destination mask.`                          |
  | `vmsne.vi`   | `31..26=0x19 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit not equal result to the destination mask.`                      |
  | `vmsleu.vi`  | `31..26=0x1c vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Compare unsigned SEW-bit operands for each active element and write the one-bit less than or equal unsigned result to the destination mask.`  |
  | `vmsle.vi`   | `31..26=0x1d vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit less than or equal signed result to the destination mask.`      |
  | `vmsgtu.vi`  | `31..26=0x1e vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Compare unsigned SEW-bit operands for each active element and write the one-bit greater than unsigned result to the destination mask.`        |
  | `vmsgt.vi`   | `31..26=0x1f vm vs2 simm5 14..12=0x3 vd 6..0=0x57`        | `Compare signed SEW-bit operands for each active element and write the one-bit greater than signed result to the destination mask.`            |

  : OPIVI II

  | **Name**     | **Opcode / Argument**                                   | **Description**                                                                                                                                                                                      |
  |:-------------|:--------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vsaddu.vi`  | `31..26=0x20 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Compute the exact unsigned sum or difference, saturate to the unsigned SEW-bit range, and set sticky vxsat if any active result saturates.`                                                         |
  | `vsadd.vi`   | `31..26=0x21 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Compute the exact signed sum or difference, saturate to the signed SEW-bit range, and set sticky vxsat if any active result saturates.`                                                             |
  | `vsll.vi`    | `31..26=0x25 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vmv1r.v`    | `31..26=0x27 25=1 vs2 19..15=0 14..12=0x3 vd 6..0=0x57` | `Copy all 1*VLEN bits from the aligned vs2 register group to the aligned vd group, independently of vl; resume at vstart with effective EEW=min(1*VLEN, SEW).`                                       |
  | `vmv2r.v`    | `31..26=0x27 25=1 vs2 19..15=1 14..12=0x3 vd 6..0=0x57` | `Copy all 2*VLEN bits from the aligned vs2 register group to the aligned vd group, independently of vl; resume at vstart with effective EEW=min(2*VLEN, SEW).`                                       |
  | `vmv4r.v`    | `31..26=0x27 25=1 vs2 19..15=3 14..12=0x3 vd 6..0=0x57` | `Copy all 4*VLEN bits from the aligned vs2 register group to the aligned vd group, independently of vl; resume at vstart with effective EEW=min(4*VLEN, SEW).`                                       |
  | `vmv8r.v`    | `31..26=0x27 25=1 vs2 19..15=7 14..12=0x3 vd 6..0=0x57` | `Copy all 8*VLEN bits from the aligned vs2 register group to the aligned vd group, independently of vl; resume at vstart with effective EEW=min(8*VLEN, SEW).`                                       |
  | `vsrl.vi`    | `31..26=0x28 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vsra.vi`    | `31..26=0x29 vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                                  |
  | `vssrl.vi`   | `31..26=0x2a vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Round and shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits; rounding uses vxrm.`                                                    |
  | `vssra.vi`   | `31..26=0x2b vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Round and shift a SEW-bit source using the low log2(SEW) bits of the unsigned shift amount; retain the low SEW result bits; rounding uses vxrm.`                                                    |
  | `vnsrl.wi`   | `31..26=0x2c vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                          |
  | `vnsra.wi`   | `31..26=0x2d vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount; retain the low SEW result bits.`                                                                          |
  | `vnclipu.wi` | `31..26=0x2e vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Round and shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount, saturate to a unsigned SEW-bit result, and set sticky vxsat on saturation; rounding uses vxrm.` |
  | `vnclip.wi`  | `31..26=0x2f vm vs2 simm5 14..12=0x3 vd 6..0=0x57`      | `Round and shift a 2 * SEW-bit source using the low log2(2 * SEW) bits of the unsigned shift amount, saturate to a signed SEW-bit result, and set sticky vxsat on saturation; rounding uses vxrm.`   |

  : OPIVI III

* **OPI (Vector Integer Extension Instructions)**

  | **Name**    | **Opcode / Argument**                                 | **Description**                                                                 |
  |:------------|:------------------------------------------------------|:--------------------------------------------------------------------------------|
  | `vzext.vf8` | `31..26=0x12 vm vs2 19..15=2 14..12=0x2 vd 6..0=0x57` | `Extend each active SEW/8-bit source element to SEW bits using zero extension.` |
  | `vsext.vf8` | `31..26=0x12 vm vs2 19..15=3 14..12=0x2 vd 6..0=0x57` | `Extend each active SEW/8-bit source element to SEW bits using sign extension.` |
  | `vzext.vf4` | `31..26=0x12 vm vs2 19..15=4 14..12=0x2 vd 6..0=0x57` | `Extend each active SEW/4-bit source element to SEW bits using zero extension.` |
  | `vsext.vf4` | `31..26=0x12 vm vs2 19..15=5 14..12=0x2 vd 6..0=0x57` | `Extend each active SEW/4-bit source element to SEW bits using sign extension.` |
  | `vzext.vf2` | `31..26=0x12 vm vs2 19..15=6 14..12=0x2 vd 6..0=0x57` | `Extend each active SEW/2-bit source element to SEW bits using zero extension.` |
  | `vsext.vf2` | `31..26=0x12 vm vs2 19..15=7 14..12=0x2 vd 6..0=0x57` | `Extend each active SEW/2-bit source element to SEW bits using sign extension.` |

  : Vector Integer Extension Instructions I

  | **Name**       | **Opcode / Argument**                              | **Description**                                                                                                                                                                  |
  |:---------------|:---------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vcompress.vm` | `31..26=0x17 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Pack vs2 elements selected by vs1 mask bits into contiguous destination elements starting at zero, preserving source order; remaining elements are tails. vstart must be zero.` |
  | `vmandn.mm`    | `31..26=0x18 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Apply bitwise AND-NOT to the source mask bits for every body element, unmasked; the destination mask uses a tail-agnostic policy.`                                              |
  | `vmand.mm`     | `31..26=0x19 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Apply bitwise AND to the source mask bits for every body element, unmasked; the destination mask uses a tail-agnostic policy.`                                                  |
  | `vmor.mm`      | `31..26=0x1a 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Apply bitwise OR to the source mask bits for every body element, unmasked; the destination mask uses a tail-agnostic policy.`                                                   |
  | `vmxor.mm`     | `31..26=0x1b 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Apply bitwise XOR to the source mask bits for every body element, unmasked; the destination mask uses a tail-agnostic policy.`                                                  |
  | `vmorn.mm`     | `31..26=0x1c 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Apply bitwise OR-NOT to the source mask bits for every body element, unmasked; the destination mask uses a tail-agnostic policy.`                                               |
  | `vmnand.mm`    | `31..26=0x1d 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Apply bitwise NAND to the source mask bits for every body element, unmasked; the destination mask uses a tail-agnostic policy.`                                                 |
  | `vmnor.mm`     | `31..26=0x1e 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Apply bitwise NOR to the source mask bits for every body element, unmasked; the destination mask uses a tail-agnostic policy.`                                                  |
  | `vmxnor.mm`    | `31..26=0x1f 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Apply bitwise XNOR to the source mask bits for every body element, unmasked; the destination mask uses a tail-agnostic policy.`                                                 |

  : Vector Integer Extension Instructions II

  | **Name**   | **Opcode / Argument**                                         | **Description**                                                                                                                                                                |
  |:-----------|:--------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vmsbf.m`  | `31..26=0x14 vm vs2 19..15=0x01 14..12=0x2 vd 6..0=0x57`      | `Set active mask bits before the first active set bit of vs2; clear that bit and subsequent active bits. Masked-off inputs do not participate; vstart must be zero.`           |
  | `vmsof.m`  | `31..26=0x14 vm vs2 19..15=0x02 14..12=0x2 vd 6..0=0x57`      | `Set only the first active set bit of vs2 in the destination mask; clear all other active bits. Masked-off inputs do not participate; vstart must be zero.`                    |
  | `vmsif.m`  | `31..26=0x14 vm vs2 19..15=0x03 14..12=0x2 vd 6..0=0x57`      | `Set active mask bits through and including the first active set bit of vs2; clear subsequent active bits. Masked-off inputs do not participate; vstart must be zero.`         |
  | `viota.m`  | `31..26=0x14 vm vs2 19..15=0x10 14..12=0x2 vd 6..0=0x57`      | `For each active destination element, write the count of active set source mask bits at lower indices, truncated to SEW; exclude masked-off source bits. vstart must be zero.` |
  | `vid.v`    | `31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 vd 6..0=0x57` | `Write each active element index to that destination element, retaining its low SEW bits; masking does not renumber indices.`                                                  |
  | `vcpop.m`  | `31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57`      | `Count active set bits in vs2 and write the count to x[rd], including zero when vl=0. vstart must be zero.`                                                                    |
  | `vfirst.m` | `31..26=0x10 vm vs2 19..15=0x11 14..12=0x2 rd 6..0=0x57`      | `Write the lowest index of an active set bit in vs2 to x[rd], or -1 if none, including when vl=0. vstart must be zero.`                                                        |

  : Vector Integer Extension Instructions III

  | **Name**     | **Opcode / Argument**                            | **Description**                                                                                                                                                              |
  |:-------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vdivu.vv`   | `31..26=0x20 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute the unsigned SEW-bit quotient with RISC-V scalar division semantics: division by zero returns all ones.`                                                            |
  | `vdiv.vv`    | `31..26=0x21 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute the signed SEW-bit quotient with RISC-V scalar division semantics: division by zero returns all ones and signed minimum divided by -1 returns the signed minimum.`  |
  | `vremu.vv`   | `31..26=0x22 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute the unsigned SEW-bit remainder with RISC-V scalar division semantics: division by zero returns the dividend.`                                                       |
  | `vrem.vv`    | `31..26=0x23 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute the signed SEW-bit remainder with RISC-V scalar division semantics: division by zero returns the dividend and signed minimum divided by -1 returns zero remainder.` |
  | `vmulhu.vv`  | `31..26=0x24 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Multiply unsigned vs2 by unsigned second operands and write the high SEW bits of the 2*SEW-bit product.`                                                                    |
  | `vmul.vv`    | `31..26=0x25 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Multiply signed vs2 by signed second operands and write the low SEW bits of the product.`                                                                                   |
  | `vmulhsu.vv` | `31..26=0x26 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Multiply signed vs2 by unsigned second operands and write the high SEW bits of the 2*SEW-bit product.`                                                                      |
  | `vmulh.vv`   | `31..26=0x27 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Multiply signed vs2 by signed second operands and write the high SEW bits of the 2*SEW-bit product.`                                                                        |
  | `vmadd.vv`   | `31..26=0x29 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute vs2[i] + (signed(vs1[i]) * signed(vd[i])), using the old destination value; retain the low SEW bits.`                                                               |
  | `vnmsub.vv`  | `31..26=0x2b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute vs2[i] - (signed(vs1[i]) * signed(vd[i])), using the old destination value; retain the low SEW bits.`                                                               |
  | `vmacc.vv`   | `31..26=0x2d vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute vd[i] + (signed(vs1[i]) * signed(vs2[i])), using the old destination value; retain the low SEW bits.`                                                               |
  | `vnmsac.vv`  | `31..26=0x2f vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute vd[i] - (signed(vs1[i]) * signed(vs2[i])), using the old destination value; retain the low SEW bits.`                                                               |

  : Vector Integer Extension Instructions IV

  | **Name**      | **Opcode / Argument**                            | **Description**                                                                                                                      |
  |:--------------|:-------------------------------------------------|:-------------------------------------------------------------------------------------------------------------------------------------|
  | `vwaddu.vv`   | `31..26=0x30 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Zero-extend operands to 2*SEW bits and compute a 2*SEW-bit sum; vs2 has width SEW and the second operand has width SEW.`            |
  | `vwadd.vv`    | `31..26=0x31 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Sign-extend operands to 2*SEW bits and compute a 2*SEW-bit sum; vs2 has width SEW and the second operand has width SEW.`            |
  | `vwsubu.vv`   | `31..26=0x32 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Zero-extend operands to 2*SEW bits and compute a 2*SEW-bit difference; vs2 has width SEW and the second operand has width SEW.`     |
  | `vwsub.vv`    | `31..26=0x33 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Sign-extend operands to 2*SEW bits and compute a 2*SEW-bit difference; vs2 has width SEW and the second operand has width SEW.`     |
  | `vwaddu.wv`   | `31..26=0x34 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Zero-extend operands to 2*SEW bits and compute a 2*SEW-bit sum; vs2 has width 2 * SEW and the second operand has width SEW.`        |
  | `vwadd.wv`    | `31..26=0x35 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Sign-extend operands to 2*SEW bits and compute a 2*SEW-bit sum; vs2 has width 2 * SEW and the second operand has width SEW.`        |
  | `vwsubu.wv`   | `31..26=0x36 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Zero-extend operands to 2*SEW bits and compute a 2*SEW-bit difference; vs2 has width 2 * SEW and the second operand has width SEW.` |
  | `vwsub.wv`    | `31..26=0x37 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Sign-extend operands to 2*SEW bits and compute a 2*SEW-bit difference; vs2 has width 2 * SEW and the second operand has width SEW.` |
  | `vwmulu.vv`   | `31..26=0x38 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Multiply unsigned vs2 by unsigned second operands and write the full 2*SEW-bit product.`                                            |
  | `vwmulsu.vv`  | `31..26=0x3a vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Multiply signed vs2 by unsigned second operands and write the full 2*SEW-bit product.`                                              |
  | `vwmul.vv`    | `31..26=0x3b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Multiply signed vs2 by signed second operands and write the full 2*SEW-bit product.`                                                |
  | `vwmaccu.vv`  | `31..26=0x3c vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute vd[i] + (unsigned(vs1[i]) * unsigned(vs2[i])), using the old destination value; retain the low 2*SEW bits.`                 |
  | `vwmacc.vv`   | `31..26=0x3d vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute vd[i] + (signed(vs1[i]) * signed(vs2[i])), using the old destination value; retain the low 2*SEW bits.`                     |
  | `vwmaccsu.vv` | `31..26=0x3f vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute vd[i] + (signed(vs1[i]) * unsigned(vs2[i])), using the old destination value; retain the low 2*SEW bits.`                   |

  : Vector Integer Extension Instructions V

**Vector Mask Instructions**

* **OPMVV**

  | **Name**      | **Opcode / Argument**                            | **Description**                                                                                                                                                                                                |
  |:--------------|:-------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vredsum.vs`  | `31..26=0x00 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using sum and write the SEW-bit result to element 0; sums wrap to the destination width. Leave the destination unchanged when vl=0; vstart must be zero.`              |
  | `vredand.vs`  | `31..26=0x01 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using and and write the SEW-bit result to element 0; sums wrap to the destination width. Leave the destination unchanged when vl=0; vstart must be zero.`              |
  | `vredor.vs`   | `31..26=0x02 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using or and write the SEW-bit result to element 0; sums wrap to the destination width. Leave the destination unchanged when vl=0; vstart must be zero.`               |
  | `vredxor.vs`  | `31..26=0x03 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using xor and write the SEW-bit result to element 0; sums wrap to the destination width. Leave the destination unchanged when vl=0; vstart must be zero.`              |
  | `vredminu.vs` | `31..26=0x04 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using minimum unsigned and write the SEW-bit result to element 0; sums wrap to the destination width. Leave the destination unchanged when vl=0; vstart must be zero.` |
  | `vredmin.vs`  | `31..26=0x05 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using minimum signed and write the SEW-bit result to element 0; sums wrap to the destination width. Leave the destination unchanged when vl=0; vstart must be zero.`   |
  | `vredmaxu.vs` | `31..26=0x06 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using maximum unsigned and write the SEW-bit result to element 0; sums wrap to the destination width. Leave the destination unchanged when vl=0; vstart must be zero.` |
  | `vredmax.vs`  | `31..26=0x07 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Reduce active vs2 elements with vs1[0] using maximum signed and write the SEW-bit result to element 0; sums wrap to the destination width. Leave the destination unchanged when vl=0; vstart must be zero.`   |
  | `vaaddu.vv`   | `31..26=0x08 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute the exact unsigned sum or difference, divide by two with vxrm rounding, and retain the low SEW bits; overflow wraps without setting vxsat.`                                                           |
  | `vaadd.vv`    | `31..26=0x09 vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute the exact signed sum or difference, divide by two with vxrm rounding, and retain the low SEW bits; overflow wraps without setting vxsat.`                                                             |
  | `vasubu.vv`   | `31..26=0x0a vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute the exact unsigned sum or difference, divide by two with vxrm rounding, and retain the low SEW bits; overflow wraps without setting vxsat.`                                                           |
  | `vasub.vv`    | `31..26=0x0b vm vs2 vs1 14..12=0x2 vd 6..0=0x57` | `Compute the exact signed sum or difference, divide by two with vxrm rounding, and retain the low SEW bits; overflow wraps without setting vxsat.`                                                             |

  : OPMVV I

  | **Name**  | **Opcode / Argument**                                   | **Description**                                                                                |
  |:----------|:--------------------------------------------------------|:-----------------------------------------------------------------------------------------------|
  | `vmv.x.s` | `31..26=0x10 25=1 vs2 19..15=0 14..12=0x2 rd 6..0=0x57` | `Copy element 0 to x[rd], truncating or sign-extending to XLEN, even when vl=0 or vstart>=vl.` |

  : OPMVV II

* **OPMVX**

  | **Name**    | **Opcode / Argument**                            | **Description**                                                                                                                                      |
  |:------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vaaddu.vx` | `31..26=0x08 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute the exact unsigned sum or difference, divide by two with vxrm rounding, and retain the low SEW bits; overflow wraps without setting vxsat.` |
  | `vaadd.vx`  | `31..26=0x09 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute the exact signed sum or difference, divide by two with vxrm rounding, and retain the low SEW bits; overflow wraps without setting vxsat.`   |
  | `vasubu.vx` | `31..26=0x0a vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute the exact unsigned sum or difference, divide by two with vxrm rounding, and retain the low SEW bits; overflow wraps without setting vxsat.` |
  | `vasub.vx`  | `31..26=0x0b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute the exact signed sum or difference, divide by two with vxrm rounding, and retain the low SEW bits; overflow wraps without setting vxsat.`   |

  : OPMVX I

  | **Name**         | **Opcode / Argument**                                   | **Description**                                                                                                                              |
  |:-----------------|:--------------------------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------|
  | `vmv.s.x`        | `31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 vd 6..0=0x57` | `Copy x[rs1] to element 0, truncating or sign-extending to SEW, only when vstart<vl; remaining destination elements follow the tail policy.` |
  | `vslide1up.vx`   | `31..26=0x0e vm vs2 rs1 14..12=0x6 vd 6..0=0x57`        | `Shift active destinations up by one element and insert the scalar at element 0.`                                                            |
  | `vslide1down.vx` | `31..26=0x0f vm vs2 rs1 14..12=0x6 vd 6..0=0x57`        | `Shift active destinations down by one element and insert the scalar at element vl-1.`                                                       |

  : OPMVX II

  | **Name**     | **Opcode / Argument**                            | **Description**                                                                                                                                                              |
  |:-------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  | `vdivu.vx`   | `31..26=0x20 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute the unsigned SEW-bit quotient with RISC-V scalar division semantics: division by zero returns all ones.`                                                            |
  | `vdiv.vx`    | `31..26=0x21 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute the signed SEW-bit quotient with RISC-V scalar division semantics: division by zero returns all ones and signed minimum divided by -1 returns the signed minimum.`  |
  | `vremu.vx`   | `31..26=0x22 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute the unsigned SEW-bit remainder with RISC-V scalar division semantics: division by zero returns the dividend.`                                                       |
  | `vrem.vx`    | `31..26=0x23 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute the signed SEW-bit remainder with RISC-V scalar division semantics: division by zero returns the dividend and signed minimum divided by -1 returns zero remainder.` |
  | `vmulhu.vx`  | `31..26=0x24 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Multiply unsigned vs2 by unsigned second operands and write the high SEW bits of the 2*SEW-bit product.`                                                                    |
  | `vmul.vx`    | `31..26=0x25 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Multiply signed vs2 by signed second operands and write the low SEW bits of the product.`                                                                                   |
  | `vmulhsu.vx` | `31..26=0x26 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Multiply signed vs2 by unsigned second operands and write the high SEW bits of the 2*SEW-bit product.`                                                                      |
  | `vmulh.vx`   | `31..26=0x27 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Multiply signed vs2 by signed second operands and write the high SEW bits of the 2*SEW-bit product.`                                                                        |
  | `vmadd.vx`   | `31..26=0x29 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute vs2[i] + (signed(resize_signed(x[rs1], XLEN, SEW)) * signed(vd[i])), using the old destination value; retain the low SEW bits.`                                     |
  | `vnmsub.vx`  | `31..26=0x2b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute vs2[i] - (signed(resize_signed(x[rs1], XLEN, SEW)) * signed(vd[i])), using the old destination value; retain the low SEW bits.`                                     |
  | `vmacc.vx`   | `31..26=0x2d vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute vd[i] + (signed(resize_signed(x[rs1], XLEN, SEW)) * signed(vs2[i])), using the old destination value; retain the low SEW bits.`                                     |
  | `vnmsac.vx`  | `31..26=0x2f vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute vd[i] - (signed(resize_signed(x[rs1], XLEN, SEW)) * signed(vs2[i])), using the old destination value; retain the low SEW bits.`                                     |

  : OPMVX III

  | **Name**      | **Opcode / Argument**                            | **Description**                                                                                                                                |
  |:--------------|:-------------------------------------------------|:-----------------------------------------------------------------------------------------------------------------------------------------------|
  | `vwaddu.vx`   | `31..26=0x30 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Zero-extend operands to 2*SEW bits and compute a 2*SEW-bit sum; vs2 has width SEW and the second operand has width SEW.`                      |
  | `vwadd.vx`    | `31..26=0x31 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Sign-extend operands to 2*SEW bits and compute a 2*SEW-bit sum; vs2 has width SEW and the second operand has width SEW.`                      |
  | `vwsubu.vx`   | `31..26=0x32 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Zero-extend operands to 2*SEW bits and compute a 2*SEW-bit difference; vs2 has width SEW and the second operand has width SEW.`               |
  | `vwsub.vx`    | `31..26=0x33 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Sign-extend operands to 2*SEW bits and compute a 2*SEW-bit difference; vs2 has width SEW and the second operand has width SEW.`               |
  | `vwaddu.wx`   | `31..26=0x34 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Zero-extend operands to 2*SEW bits and compute a 2*SEW-bit sum; vs2 has width 2 * SEW and the second operand has width SEW.`                  |
  | `vwadd.wx`    | `31..26=0x35 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Sign-extend operands to 2*SEW bits and compute a 2*SEW-bit sum; vs2 has width 2 * SEW and the second operand has width SEW.`                  |
  | `vwsubu.wx`   | `31..26=0x36 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Zero-extend operands to 2*SEW bits and compute a 2*SEW-bit difference; vs2 has width 2 * SEW and the second operand has width SEW.`           |
  | `vwsub.wx`    | `31..26=0x37 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Sign-extend operands to 2*SEW bits and compute a 2*SEW-bit difference; vs2 has width 2 * SEW and the second operand has width SEW.`           |
  | `vwmulu.vx`   | `31..26=0x38 vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Multiply unsigned vs2 by unsigned second operands and write the full 2*SEW-bit product.`                                                      |
  | `vwmulsu.vx`  | `31..26=0x3a vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Multiply signed vs2 by unsigned second operands and write the full 2*SEW-bit product.`                                                        |
  | `vwmul.vx`    | `31..26=0x3b vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Multiply signed vs2 by signed second operands and write the full 2*SEW-bit product.`                                                          |
  | `vwmaccu.vx`  | `31..26=0x3c vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute vd[i] + (unsigned(resize_signed(x[rs1], XLEN, SEW)) * unsigned(vs2[i])), using the old destination value; retain the low 2*SEW bits.` |
  | `vwmacc.vx`   | `31..26=0x3d vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute vd[i] + (signed(resize_signed(x[rs1], XLEN, SEW)) * signed(vs2[i])), using the old destination value; retain the low 2*SEW bits.`     |
  | `vwmaccus.vx` | `31..26=0x3e vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute vd[i] + (unsigned(resize_signed(x[rs1], XLEN, SEW)) * signed(vs2[i])), using the old destination value; retain the low 2*SEW bits.`   |
  | `vwmaccsu.vx` | `31..26=0x3f vm vs2 rs1 14..12=0x6 vd 6..0=0x57` | `Compute vd[i] + (signed(resize_signed(x[rs1], XLEN, SEW)) * unsigned(vs2[i])), using the old destination value; retain the low 2*SEW bits.`   |

  : OPMVX IV
