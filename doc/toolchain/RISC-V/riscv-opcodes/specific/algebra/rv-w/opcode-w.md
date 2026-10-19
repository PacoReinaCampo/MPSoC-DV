```
# format of a line in this file:
# <instruction name> <args> <opcode>

# <opcode> is given by specifying one or more range/value pairs:
# hi..lo=value or bit=value or arg=value (e.g. 6..2=0x45 10=1 rd=0)

# <args> is one of vd, vs3, vs1, vs2, vm, nf, wd, simm5, zimm10, zimm11
```

# Configuration Setting

`https://github.com/riscv/riscv-v-spec/blob/master/vcfg-format.adoc`

```
wsetivli     31=1 30=1 zimm10    zimm5 14..12=0x7 rd 6..0=0x57
wsetvli      31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57
wsetvl       31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57
```

# Vector Loads and Store

`https://github.com/riscv/riscv-v-spec/blob/master/vmem-format.adoc`

# Vector Unit-Stride Instructions (including segment part)

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#74-vector-unit-stride-instructions`

```
wlm.v          31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  vd 6..0=0x07
wsm.v          31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27
wle8.v         nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  vd 6..0=0x07
wle16.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  vd 6..0=0x07
wle32.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  vd 6..0=0x07
wle64.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  vd 6..0=0x07
wse8.v         nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 vs3 6..0=0x27
wse16.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 vs3 6..0=0x27
wse32.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 vs3 6..0=0x27
wse64.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 vs3 6..0=0x27
```

# Vector Indexed-Unordered Instructions (including segment part)

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#76-vector-indexed-instructions`

```
wluxei8.v      nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0  vd 6..0=0x07
wluxei16.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5  vd 6..0=0x07
wluxei32.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6  vd 6..0=0x07
wluxei64.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7  vd 6..0=0x07
wsuxei8.v      nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27
wsuxei16.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27
wsuxei32.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27
wsuxei64.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27
```

# Vector Strided Instructions (including segment part)

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#75-vector-strided-instructions`

```
wlse8.v         nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  vd 6..0=0x07
wlse16.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  vd 6..0=0x07
wlse32.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  vd 6..0=0x07
wlse64.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  vd 6..0=0x07
wsse8.v         nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 vs3 6..0=0x27
wsse16.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 vs3 6..0=0x27
wsse32.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 vs3 6..0=0x27
wsse64.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 vs3 6..0=0x27
```

# Vector Indexed-Ordered Instructions (including segment part)

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#76-vector-indexed-instructions`

```
wloxei8.v        nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0  vd 6..0=0x07
wloxei16.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5  vd 6..0=0x07
wloxei32.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6  vd 6..0=0x07
wloxei64.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7  vd 6..0=0x07
wsoxei8.v        nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27
wsoxei16.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27
wsoxei32.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27
wsoxei64.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27
```

# Unit-stride Fault-Only-First Loads

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#77-unit-stride-fault-only-first-loads`

```
wle8ff.v         nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  vd 6..0=0x07
wle16ff.v        nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  vd 6..0=0x07
wle32ff.v        nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  vd 6..0=0x07
wle64ff.v        nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  vd 6..0=0x07
```

# Vector Load/Store Whole Registers

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#79-vector-loadstore-whole-register-instructions`

```
wl1re8.v       31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07
wl1re16.v      31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07
wl1re32.v      31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07
wl1re64.v      31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07
wl2re8.v       31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07
wl2re16.v      31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07
wl2re32.v      31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07
wl2re64.v      31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07
wl4re8.v       31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07
wl4re16.v      31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07
wl4re32.v      31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07
wl4re64.v      31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07
wl8re8.v       31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07
wl8re16.v      31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07
wl8re32.v      31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07
wl8re64.v      31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07
ws1r.v         31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27
ws2r.v         31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27
ws4r.v         31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27
ws8r.v         31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27
```

# Vector Floating-Point Instructions

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#14-vector-floating-point-instructions`

# OPFVF

```
wfadd.vf        31..26=0x00 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfsub.vf        31..26=0x02 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmin.vf        31..26=0x04 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmax.vf        31..26=0x06 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfsgnj.vf       31..26=0x08 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfsgnjn.vf      31..26=0x09 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfsgnjx.vf      31..26=0x0a vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfslide1up.vf   31..26=0x0e vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfslide1down.vf 31..26=0x0f vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmv.s.f        31..26=0x10 25=1 24..20=0 rs1      14..12=0x5 vd 6..0=0x57

wfmerge.vfm    31..26=0x17 25=0 vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmv.v.f       31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57
wmfeq.vf       31..26=0x18 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wmfle.vf       31..26=0x19 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wmflt.vf       31..26=0x1b vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wmfne.vf       31..26=0x1c vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wmfgt.vf       31..26=0x1d vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wmfge.vf       31..26=0x1f vm vs2 rs1 14..12=0x5 vd 6..0=0x57

wfdiv.vf       31..26=0x20 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfrdiv.vf      31..26=0x21 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmul.vf       31..26=0x24 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfrsub.vf      31..26=0x27 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmadd.vf      31..26=0x28 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfnmadd.vf     31..26=0x29 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmsub.vf      31..26=0x2a vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfnmsub.vf     31..26=0x2b vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmacc.vf      31..26=0x2c vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfnmacc.vf     31..26=0x2d vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfmsac.vf      31..26=0x2e vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfnmsac.vf     31..26=0x2f vm vs2 rs1 14..12=0x5 vd 6..0=0x57

wfwadd.vf      31..26=0x30 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfwsub.vf      31..26=0x32 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfwadd.wf      31..26=0x34 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfwsub.wf      31..26=0x36 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfwmul.vf      31..26=0x38 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfwmacc.vf     31..26=0x3c vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfwnmacc.vf    31..26=0x3d vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfwmsac.vf     31..26=0x3e vm vs2 rs1 14..12=0x5 vd 6..0=0x57
wfwnmsac.vf    31..26=0x3f vm vs2 rs1 14..12=0x5 vd 6..0=0x57
```

# OPFVV

```
wfadd.vv       31..26=0x00 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfredusum.vs   31..26=0x01 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfsub.vv       31..26=0x02 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfredosum.vs   31..26=0x03 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfmin.vv       31..26=0x04 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfredmin.vs    31..26=0x05 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfmax.vv       31..26=0x06 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfredmax.vs    31..26=0x07 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfsgnj.vv      31..26=0x08 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfsgnjn.vv     31..26=0x09 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfsgnjx.vv     31..26=0x0a vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfmv.f.s       31..26=0x10 25=1 vs2      19..15=0 14..12=0x1 rd 6..0=0x57

wmfeq.vv       31..26=0x18 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wmfle.vv       31..26=0x19 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wmflt.vv       31..26=0x1b vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wmfne.vv       31..26=0x1c vm vs2 vs1 14..12=0x1 vd 6..0=0x57

wfdiv.vv       31..26=0x20 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfmul.vv       31..26=0x24 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfmadd.vv      31..26=0x28 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfnmadd.vv     31..26=0x29 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfmsub.vv      31..26=0x2a vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfnmsub.vv     31..26=0x2b vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfmacc.vv      31..26=0x2c vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfnmacc.vv     31..26=0x2d vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfmsac.vv      31..26=0x2e vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfnmsac.vv     31..26=0x2f vm vs2 vs1 14..12=0x1 vd 6..0=0x57

wfcvt.xu.f.v     31..26=0x12 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57
wfcvt.x.f.v      31..26=0x12 vm vs2 19..15=0x01 14..12=0x1 vd 6..0=0x57
wfcvt.f.xu.v     31..26=0x12 vm vs2 19..15=0x02 14..12=0x1 vd 6..0=0x57
wfcvt.f.x.v      31..26=0x12 vm vs2 19..15=0x03 14..12=0x1 vd 6..0=0x57
wfcvt.rtz.xu.f.v 31..26=0x12 vm vs2 19..15=0x06 14..12=0x1 vd 6..0=0x57
wfcvt.rtz.x.f.v  31..26=0x12 vm vs2 19..15=0x07 14..12=0x1 vd 6..0=0x57

wfwcvt.xu.f.v     31..26=0x12 vm vs2 19..15=0x08 14..12=0x1 vd 6..0=0x57
wfwcvt.x.f.v      31..26=0x12 vm vs2 19..15=0x09 14..12=0x1 vd 6..0=0x57
wfwcvt.f.xu.v     31..26=0x12 vm vs2 19..15=0x0A 14..12=0x1 vd 6..0=0x57
wfwcvt.f.x.v      31..26=0x12 vm vs2 19..15=0x0B 14..12=0x1 vd 6..0=0x57
wfwcvt.f.f.v      31..26=0x12 vm vs2 19..15=0x0C 14..12=0x1 vd 6..0=0x57
wfwcvt.rtz.xu.f.v 31..26=0x12 vm vs2 19..15=0x0E 14..12=0x1 vd 6..0=0x57
wfwcvt.rtz.x.f.v  31..26=0x12 vm vs2 19..15=0x0F 14..12=0x1 vd 6..0=0x57

wfncvt.xu.f.w     31..26=0x12 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57
wfncvt.x.f.w      31..26=0x12 vm vs2 19..15=0x11 14..12=0x1 vd 6..0=0x57
wfncvt.f.xu.w     31..26=0x12 vm vs2 19..15=0x12 14..12=0x1 vd 6..0=0x57
wfncvt.f.x.w      31..26=0x12 vm vs2 19..15=0x13 14..12=0x1 vd 6..0=0x57
wfncvt.f.f.w      31..26=0x12 vm vs2 19..15=0x14 14..12=0x1 vd 6..0=0x57
wfncvt.rod.f.f.w  31..26=0x12 vm vs2 19..15=0x15 14..12=0x1 vd 6..0=0x57
wfncvt.rtz.xu.f.w 31..26=0x12 vm vs2 19..15=0x16 14..12=0x1 vd 6..0=0x57
wfncvt.rtz.x.f.w  31..26=0x12 vm vs2 19..15=0x17 14..12=0x1 vd 6..0=0x57

wfsqrt.v       31..26=0x13 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57
wfrsqrt7.v     31..26=0x13 vm vs2 19..15=0x04 14..12=0x1 vd 6..0=0x57
wfrec7.v       31..26=0x13 vm vs2 19..15=0x05 14..12=0x1 vd 6..0=0x57
wfclass.v      31..26=0x13 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57

wfwadd.vv      31..26=0x30 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwredusum.vs  31..26=0x31 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwsub.vv      31..26=0x32 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwredosum.vs  31..26=0x33 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwadd.wv      31..26=0x34 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwsub.wv      31..26=0x36 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwmul.vv      31..26=0x38 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwmacc.vv     31..26=0x3c vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwnmacc.vv    31..26=0x3d vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwmsac.vv     31..26=0x3e vm vs2 vs1 14..12=0x1 vd 6..0=0x57
wfwnmsac.vv    31..26=0x3f vm vs2 vs1 14..12=0x1 vd 6..0=0x57
```

# OPIVX

```
wadd.vx        31..26=0x00 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wsub.vx        31..26=0x02 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wrsub.vx       31..26=0x03 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wminu.vx       31..26=0x04 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmin.vx        31..26=0x05 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmaxu.vx       31..26=0x06 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmax.vx        31..26=0x07 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wand.vx        31..26=0x09 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wor.vx         31..26=0x0a vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wxor.vx        31..26=0x0b vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wrgather.vx    31..26=0x0c vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wslideup.vx    31..26=0x0e vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wslidedown.vx  31..26=0x0f vm vs2 rs1 14..12=0x4 vd 6..0=0x57

wadc.vxm       31..26=0x10 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
wmadc.vxm      31..26=0x11 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
wmadc.vx       31..26=0x11 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57
wsbc.vxm       31..26=0x12 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
wmsbc.vxm      31..26=0x13 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
wmsbc.vx       31..26=0x13 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57
wmerge.vxm     31..26=0x17 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
wmv.v.x        31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 vd 6..0=0x57
wmseq.vx       31..26=0x18 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmsne.vx       31..26=0x19 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmsltu.vx      31..26=0x1a vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmslt.vx       31..26=0x1b vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmsleu.vx      31..26=0x1c vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmsle.vx       31..26=0x1d vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmsgtu.vx      31..26=0x1e vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wmsgt.vx       31..26=0x1f vm vs2 rs1 14..12=0x4 vd 6..0=0x57

wsaddu.vx      31..26=0x20 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wsadd.vx       31..26=0x21 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wssubu.vx      31..26=0x22 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wssub.vx       31..26=0x23 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wsll.vx        31..26=0x25 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wsmul.vx       31..26=0x27 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wsrl.vx        31..26=0x28 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wsra.vx        31..26=0x29 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wssrl.vx       31..26=0x2a vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wssra.vx       31..26=0x2b vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wnsrl.wx       31..26=0x2c vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wnsra.wx       31..26=0x2d vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wnclipu.wx     31..26=0x2e vm vs2 rs1 14..12=0x4 vd 6..0=0x57
wnclip.wx      31..26=0x2f vm vs2 rs1 14..12=0x4 vd 6..0=0x57
```

# OPIVV

```
wadd.vv         31..26=0x00 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wsub.vv         31..26=0x02 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wminu.vv        31..26=0x04 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wmin.vv         31..26=0x05 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wmaxu.vv        31..26=0x06 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wmax.vv         31..26=0x07 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wand.vv         31..26=0x09 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wor.vv          31..26=0x0a vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wxor.vv         31..26=0x0b vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wrgather.vv     31..26=0x0c vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wrgatherei16.vv 31..26=0x0e vm vs2 vs1 14..12=0x0 vd 6..0=0x57

wadc.vvm       31..26=0x10 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
wmadc.vvm      31..26=0x11 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
wmadc.vv       31..26=0x11 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57
wsbc.vvm       31..26=0x12 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
wmsbc.vvm      31..26=0x13 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
wmsbc.vv       31..26=0x13 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57
wmerge.vvm     31..26=0x17 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
wmv.v.v        31..26=0x17 25=1 24..20=0 vs1 14..12=0x0 vd 6..0=0x57
wmseq.vv       31..26=0x18 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wmsne.vv       31..26=0x19 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wmsltu.vv      31..26=0x1a vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wmslt.vv       31..26=0x1b vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wmsleu.vv      31..26=0x1c vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wmsle.vv       31..26=0x1d vm vs2 vs1 14..12=0x0 vd 6..0=0x57

wsaddu.vv      31..26=0x20 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wsadd.vv       31..26=0x21 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wssubu.vv      31..26=0x22 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wssub.vv       31..26=0x23 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wsll.vv        31..26=0x25 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wsmul.vv       31..26=0x27 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wsrl.vv        31..26=0x28 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wsra.vv        31..26=0x29 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wssrl.vv       31..26=0x2a vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wssra.vv       31..26=0x2b vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wnsrl.wv       31..26=0x2c vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wnsra.wv       31..26=0x2d vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wnclipu.wv     31..26=0x2e vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wnclip.wv      31..26=0x2f vm vs2 vs1 14..12=0x0 vd 6..0=0x57

wwredsumu.vs   31..26=0x30 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
wwredsum.vs    31..26=0x31 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
```

# OPIVI

```
wadd.vi        31..26=0x00 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wrsub.vi       31..26=0x03 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wand.vi        31..26=0x09 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wor.vi         31..26=0x0a vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wxor.vi        31..26=0x0b vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wrgather.vi    31..26=0x0c vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wslideup.vi    31..26=0x0e vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wslidedown.vi  31..26=0x0f vm vs2 zimm5 14..12=0x3 vd 6..0=0x57

wadc.vim       31..26=0x10 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57
wmadc.vim      31..26=0x11 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57
wmadc.vi       31..26=0x11 25=1 vs2 simm5 14..12=0x3 vd 6..0=0x57
wmerge.vim     31..26=0x17 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57
wmv.v.i        31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 vd 6..0=0x57
wmseq.vi       31..26=0x18 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wmsne.vi       31..26=0x19 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wmsleu.vi      31..26=0x1c vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wmsle.vi       31..26=0x1d vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wmsgtu.vi      31..26=0x1e vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wmsgt.vi       31..26=0x1f vm vs2 simm5 14..12=0x3 vd 6..0=0x57

wsaddu.vi      31..26=0x20 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wsadd.vi       31..26=0x21 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
wsll.vi        31..26=0x25 vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wmv1r.v        31..26=0x27 25=1 vs2 19..15=0 14..12=0x3 vd 6..0=0x57
wmv2r.v        31..26=0x27 25=1 vs2 19..15=1 14..12=0x3 vd 6..0=0x57
wmv4r.v        31..26=0x27 25=1 vs2 19..15=3 14..12=0x3 vd 6..0=0x57
wmv8r.v        31..26=0x27 25=1 vs2 19..15=7 14..12=0x3 vd 6..0=0x57
wsrl.vi        31..26=0x28 vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wsra.vi        31..26=0x29 vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wssrl.vi       31..26=0x2a vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wssra.vi       31..26=0x2b vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wnsrl.wi       31..26=0x2c vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wnsra.wi       31..26=0x2d vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wnclipu.wi     31..26=0x2e vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
wnclip.wi      31..26=0x2f vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
```

# Vector Integer Extension Instructions

`https://github.com/riscv/riscv-v-spec/blob/e49574c92b072fd4d71e6cb20f7e8154de5b83fe/v-spec.adoc#123-vector-integer-extension`

```
wzext.vf8      31..26=0x12 vm vs2 19..15=2 14..12=0x2 vd 6..0=0x57
wsext.vf8      31..26=0x12 vm vs2 19..15=3 14..12=0x2 vd 6..0=0x57
wzext.vf4      31..26=0x12 vm vs2 19..15=4 14..12=0x2 vd 6..0=0x57
wsext.vf4      31..26=0x12 vm vs2 19..15=5 14..12=0x2 vd 6..0=0x57
wzext.vf2      31..26=0x12 vm vs2 19..15=6 14..12=0x2 vd 6..0=0x57
wsext.vf2      31..26=0x12 vm vs2 19..15=7 14..12=0x2 vd 6..0=0x57

wcompress.vm   31..26=0x17 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
wmandn.mm      31..26=0x18 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
wmand.mm       31..26=0x19 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
wmor.mm        31..26=0x1a 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
wmxor.mm       31..26=0x1b 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
wmorn.mm       31..26=0x1c 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
wmnand.mm      31..26=0x1d 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
wmnor.mm       31..26=0x1e 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
wmxnor.mm      31..26=0x1f 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57

wmsbf.m        31..26=0x14 vm vs2 19..15=0x01 14..12=0x2 vd 6..0=0x57
wmsof.m        31..26=0x14 vm vs2 19..15=0x02 14..12=0x2 vd 6..0=0x57
wmsif.m        31..26=0x14 vm vs2 19..15=0x03 14..12=0x2 vd 6..0=0x57
wiota.m        31..26=0x14 vm vs2 19..15=0x10 14..12=0x2 vd 6..0=0x57
wid.v          31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 vd 6..0=0x57
wcpop.m        31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57
wfirst.m       31..26=0x10 vm vs2 19..15=0x11 14..12=0x2 rd 6..0=0x57

wdivu.vv       31..26=0x20 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wdiv.vv        31..26=0x21 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wremu.vv       31..26=0x22 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wrem.vv        31..26=0x23 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wmulhu.vv      31..26=0x24 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wmul.vv        31..26=0x25 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wmulhsu.vv     31..26=0x26 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wmulh.vv       31..26=0x27 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wmadd.vv       31..26=0x29 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wnmsub.vv      31..26=0x2b vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wmacc.vv       31..26=0x2d vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wnmsac.vv      31..26=0x2f vm vs2 vs1 14..12=0x2 vd 6..0=0x57

wwaddu.vv      31..26=0x30 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwadd.vv       31..26=0x31 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwsubu.vv      31..26=0x32 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwsub.vv       31..26=0x33 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwaddu.wv      31..26=0x34 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwadd.wv       31..26=0x35 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwsubu.wv      31..26=0x36 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwsub.wv       31..26=0x37 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwmulu.vv      31..26=0x38 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwmulsu.vv     31..26=0x3a vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwmul.vv       31..26=0x3b vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwmaccu.vv     31..26=0x3c vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwmacc.vv      31..26=0x3d vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wwmaccsu.vv    31..26=0x3f vm vs2 vs1 14..12=0x2 vd 6..0=0x57
```

# OPMVV

```
wredsum.vs     31..26=0x00 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wredand.vs     31..26=0x01 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wredor.vs      31..26=0x02 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wredxor.vs     31..26=0x03 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wredminu.vs    31..26=0x04 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wredmin.vs     31..26=0x05 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wredmaxu.vs    31..26=0x06 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wredmax.vs     31..26=0x07 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
waaddu.vv      31..26=0x08 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
waadd.vv       31..26=0x09 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wasubu.vv      31..26=0x0a vm vs2 vs1 14..12=0x2 vd 6..0=0x57
wasub.vv       31..26=0x0b vm vs2 vs1 14..12=0x2 vd 6..0=0x57

wmv.x.s        31..26=0x10 25=1 vs2 19..15=0 14..12=0x2 rd 6..0=0x57
```

# OPMVX

```
waaddu.vx      31..26=0x08 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
waadd.vx       31..26=0x09 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wasubu.vx      31..26=0x0a vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wasub.vx       31..26=0x0b vm vs2 rs1 14..12=0x6 vd 6..0=0x57

wmv.s.x        31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 vd 6..0=0x57
wslide1up.vx   31..26=0x0e vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wslide1down.vx 31..26=0x0f vm vs2 rs1 14..12=0x6 vd 6..0=0x57

wdivu.vx       31..26=0x20 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wdiv.vx        31..26=0x21 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wremu.vx       31..26=0x22 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wrem.vx        31..26=0x23 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wmulhu.vx      31..26=0x24 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wmul.vx        31..26=0x25 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wmulhsu.vx     31..26=0x26 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wmulh.vx       31..26=0x27 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wmadd.vx       31..26=0x29 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wnmsub.vx      31..26=0x2b vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wmacc.vx       31..26=0x2d vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wnmsac.vx      31..26=0x2f vm vs2 rs1 14..12=0x6 vd 6..0=0x57

wwaddu.vx      31..26=0x30 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwadd.vx       31..26=0x31 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwsubu.vx      31..26=0x32 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwsub.vx       31..26=0x33 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwaddu.wx      31..26=0x34 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwadd.wx       31..26=0x35 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwsubu.wx      31..26=0x36 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwsub.wx       31..26=0x37 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwmulu.vx      31..26=0x38 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwmulsu.vx     31..26=0x3a vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwmul.vx       31..26=0x3b vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwmaccu.vx     31..26=0x3c vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwmacc.vx      31..26=0x3d vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwmaccus.vx    31..26=0x3e vm vs2 rs1 14..12=0x6 vd 6..0=0x57
wwmaccsu.vx    31..26=0x3f vm vs2 rs1 14..12=0x6 vd 6..0=0x57

# vmv1r.v, vmv2r.v, vmv4r.v, vmv8r.v
#@vmvnfr.v     31..26=0x27 25=1 vs2 simm5 14..12=0x3 vd 6..0=0x57
```
