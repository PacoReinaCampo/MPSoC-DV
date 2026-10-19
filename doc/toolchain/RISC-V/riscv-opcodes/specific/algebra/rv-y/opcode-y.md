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
ysetivli     31=1 30=1 zimm10    zimm5 14..12=0x7 rd 6..0=0x57
ysetvli      31=0 zimm11          rs1 14..12=0x7 rd 6..0=0x57
ysetvl       31=1 30..25=0x0 rs2  rs1 14..12=0x7 rd 6..0=0x57
```

# Vector Loads and Store

`https://github.com/riscv/riscv-v-spec/blob/master/vmem-format.adoc`

# Vector Unit-Stride Instructions (including segment part)

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#74-vector-unit-stride-instructions`

```
ylm.v          31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  vd 6..0=0x07
ysm.v          31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 vs3 6..0=0x27
yle8.v         nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0  vd 6..0=0x07
yle16.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5  vd 6..0=0x07
yle32.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6  vd 6..0=0x07
yle64.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7  vd 6..0=0x07
yse8.v         nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x0 vs3 6..0=0x27
yse16.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x5 vs3 6..0=0x27
yse32.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x6 vs3 6..0=0x27
yse64.v        nf 28=0 27..26=0 vm 24..20=0 rs1 14..12=0x7 vs3 6..0=0x27
```

# Vector Indexed-Unordered Instructions (including segment part)

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#76-vector-indexed-instructions`

```
yluxei8.v      nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0  vd 6..0=0x07
yluxei16.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5  vd 6..0=0x07
yluxei32.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6  vd 6..0=0x07
yluxei64.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7  vd 6..0=0x07
ysuxei8.v      nf 28=0 27..26=1 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27
ysuxei16.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27
ysuxei32.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27
ysuxei64.v     nf 28=0 27..26=1 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27
```

# Vector Strided Instructions (including segment part)

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#75-vector-strided-instructions`

```
ylse8.v         nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0  vd 6..0=0x07
ylse16.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5  vd 6..0=0x07
ylse32.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6  vd 6..0=0x07
ylse64.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7  vd 6..0=0x07
ysse8.v         nf 28=0 27..26=2 vm rs2 rs1 14..12=0x0 vs3 6..0=0x27
ysse16.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x5 vs3 6..0=0x27
ysse32.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x6 vs3 6..0=0x27
ysse64.v        nf 28=0 27..26=2 vm rs2 rs1 14..12=0x7 vs3 6..0=0x27
```

# Vector Indexed-Ordered Instructions (including segment part)

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#76-vector-indexed-instructions`

```
yloxei8.v        nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0  vd 6..0=0x07
yloxei16.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5  vd 6..0=0x07
yloxei32.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6  vd 6..0=0x07
yloxei64.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7  vd 6..0=0x07
ysoxei8.v        nf 28=0 27..26=3 vm vs2 rs1 14..12=0x0 vs3 6..0=0x27
ysoxei16.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x5 vs3 6..0=0x27
ysoxei32.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x6 vs3 6..0=0x27
ysoxei64.v       nf 28=0 27..26=3 vm vs2 rs1 14..12=0x7 vs3 6..0=0x27
```

# Unit-stride Fault-Only-First Loads

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#77-unit-stride-fault-only-first-loads`

```
yle8ff.v         nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x0  vd 6..0=0x07
yle16ff.v        nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x5  vd 6..0=0x07
yle32ff.v        nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x6  vd 6..0=0x07
yle64ff.v        nf 28=0 27..26=0 vm 24..20=0x10 rs1 14..12=0x7  vd 6..0=0x07
```

# Vector Load/Store Whole Registers

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#79-vector-loadstore-whole-register-instructions`

```
yl1re8.v       31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07
yl1re16.v      31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07
yl1re32.v      31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07
yl1re64.v      31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07
yl2re8.v       31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07
yl2re16.v      31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07
yl2re32.v      31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07
yl2re64.v      31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07
yl4re8.v       31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07
yl4re16.v      31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07
yl4re32.v      31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07
yl4re64.v      31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07
yl8re8.v       31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vd  6..0=0x07
yl8re16.v      31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x5 vd  6..0=0x07
yl8re32.v      31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x6 vd  6..0=0x07
yl8re64.v      31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x7 vd  6..0=0x07
ys1r.v         31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27
ys2r.v         31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27
ys4r.v         31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27
ys8r.v         31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 vs3 6..0=0x27
```

# Vector Floating-Point Instructions

`https://github.com/riscv/riscv-v-spec/blob/master/v-spec.adoc#14-vector-floating-point-instructions`

# OPFVF

```
yfadd.vf        31..26=0x00 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfsub.vf        31..26=0x02 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmin.vf        31..26=0x04 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmax.vf        31..26=0x06 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfsgnj.vf       31..26=0x08 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfsgnjn.vf      31..26=0x09 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfsgnjx.vf      31..26=0x0a vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfslide1up.vf   31..26=0x0e vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfslide1down.vf 31..26=0x0f vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmv.s.f        31..26=0x10 25=1 24..20=0 rs1      14..12=0x5 vd 6..0=0x57

yfmerge.vfm    31..26=0x17 25=0 vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmv.v.f       31..26=0x17 25=1 24..20=0 rs1 14..12=0x5 vd 6..0=0x57
ymfeq.vf       31..26=0x18 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
ymfle.vf       31..26=0x19 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
ymflt.vf       31..26=0x1b vm vs2 rs1 14..12=0x5 vd 6..0=0x57
ymfne.vf       31..26=0x1c vm vs2 rs1 14..12=0x5 vd 6..0=0x57
ymfgt.vf       31..26=0x1d vm vs2 rs1 14..12=0x5 vd 6..0=0x57
ymfge.vf       31..26=0x1f vm vs2 rs1 14..12=0x5 vd 6..0=0x57

yfdiv.vf       31..26=0x20 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfrdiv.vf      31..26=0x21 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmul.vf       31..26=0x24 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfrsub.vf      31..26=0x27 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmadd.vf      31..26=0x28 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfnmadd.vf     31..26=0x29 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmsub.vf      31..26=0x2a vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfnmsub.vf     31..26=0x2b vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmacc.vf      31..26=0x2c vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfnmacc.vf     31..26=0x2d vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfmsac.vf      31..26=0x2e vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfnmsac.vf     31..26=0x2f vm vs2 rs1 14..12=0x5 vd 6..0=0x57

yfwadd.vf      31..26=0x30 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfwsub.vf      31..26=0x32 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfwadd.wf      31..26=0x34 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfwsub.wf      31..26=0x36 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfwmul.vf      31..26=0x38 vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfwmacc.vf     31..26=0x3c vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfwnmacc.vf    31..26=0x3d vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfwmsac.vf     31..26=0x3e vm vs2 rs1 14..12=0x5 vd 6..0=0x57
yfwnmsac.vf    31..26=0x3f vm vs2 rs1 14..12=0x5 vd 6..0=0x57
```

# OPFVV

```
yfadd.vv       31..26=0x00 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfredusum.vs   31..26=0x01 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfsub.vv       31..26=0x02 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfredosum.vs   31..26=0x03 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfmin.vv       31..26=0x04 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfredmin.vs    31..26=0x05 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfmax.vv       31..26=0x06 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfredmax.vs    31..26=0x07 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfsgnj.vv      31..26=0x08 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfsgnjn.vv     31..26=0x09 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfsgnjx.vv     31..26=0x0a vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfmv.f.s       31..26=0x10 25=1 vs2      19..15=0 14..12=0x1 rd 6..0=0x57

ymfeq.vv       31..26=0x18 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
ymfle.vv       31..26=0x19 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
ymflt.vv       31..26=0x1b vm vs2 vs1 14..12=0x1 vd 6..0=0x57
ymfne.vv       31..26=0x1c vm vs2 vs1 14..12=0x1 vd 6..0=0x57

yfdiv.vv       31..26=0x20 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfmul.vv       31..26=0x24 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfmadd.vv      31..26=0x28 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfnmadd.vv     31..26=0x29 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfmsub.vv      31..26=0x2a vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfnmsub.vv     31..26=0x2b vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfmacc.vv      31..26=0x2c vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfnmacc.vv     31..26=0x2d vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfmsac.vv      31..26=0x2e vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfnmsac.vv     31..26=0x2f vm vs2 vs1 14..12=0x1 vd 6..0=0x57

yfcvt.xu.f.v     31..26=0x12 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57
yfcvt.x.f.v      31..26=0x12 vm vs2 19..15=0x01 14..12=0x1 vd 6..0=0x57
yfcvt.f.xu.v     31..26=0x12 vm vs2 19..15=0x02 14..12=0x1 vd 6..0=0x57
yfcvt.f.x.v      31..26=0x12 vm vs2 19..15=0x03 14..12=0x1 vd 6..0=0x57
yfcvt.rtz.xu.f.v 31..26=0x12 vm vs2 19..15=0x06 14..12=0x1 vd 6..0=0x57
yfcvt.rtz.x.f.v  31..26=0x12 vm vs2 19..15=0x07 14..12=0x1 vd 6..0=0x57

yfwcvt.xu.f.v     31..26=0x12 vm vs2 19..15=0x08 14..12=0x1 vd 6..0=0x57
yfwcvt.x.f.v      31..26=0x12 vm vs2 19..15=0x09 14..12=0x1 vd 6..0=0x57
yfwcvt.f.xu.v     31..26=0x12 vm vs2 19..15=0x0A 14..12=0x1 vd 6..0=0x57
yfwcvt.f.x.v      31..26=0x12 vm vs2 19..15=0x0B 14..12=0x1 vd 6..0=0x57
yfwcvt.f.f.v      31..26=0x12 vm vs2 19..15=0x0C 14..12=0x1 vd 6..0=0x57
yfwcvt.rtz.xu.f.v 31..26=0x12 vm vs2 19..15=0x0E 14..12=0x1 vd 6..0=0x57
yfwcvt.rtz.x.f.v  31..26=0x12 vm vs2 19..15=0x0F 14..12=0x1 vd 6..0=0x57

yfncvt.xu.f.w     31..26=0x12 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57
yfncvt.x.f.w      31..26=0x12 vm vs2 19..15=0x11 14..12=0x1 vd 6..0=0x57
yfncvt.f.xu.w     31..26=0x12 vm vs2 19..15=0x12 14..12=0x1 vd 6..0=0x57
yfncvt.f.x.w      31..26=0x12 vm vs2 19..15=0x13 14..12=0x1 vd 6..0=0x57
yfncvt.f.f.w      31..26=0x12 vm vs2 19..15=0x14 14..12=0x1 vd 6..0=0x57
yfncvt.rod.f.f.w  31..26=0x12 vm vs2 19..15=0x15 14..12=0x1 vd 6..0=0x57
yfncvt.rtz.xu.f.w 31..26=0x12 vm vs2 19..15=0x16 14..12=0x1 vd 6..0=0x57
yfncvt.rtz.x.f.w  31..26=0x12 vm vs2 19..15=0x17 14..12=0x1 vd 6..0=0x57

yfsqrt.v       31..26=0x13 vm vs2 19..15=0x00 14..12=0x1 vd 6..0=0x57
yfrsqrt7.v     31..26=0x13 vm vs2 19..15=0x04 14..12=0x1 vd 6..0=0x57
yfrec7.v       31..26=0x13 vm vs2 19..15=0x05 14..12=0x1 vd 6..0=0x57
yfclass.v      31..26=0x13 vm vs2 19..15=0x10 14..12=0x1 vd 6..0=0x57

yfwadd.vv      31..26=0x30 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwredusum.vs  31..26=0x31 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwsub.vv      31..26=0x32 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwredosum.vs  31..26=0x33 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwadd.wv      31..26=0x34 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwsub.wv      31..26=0x36 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwmul.vv      31..26=0x38 vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwmacc.vv     31..26=0x3c vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwnmacc.vv    31..26=0x3d vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwmsac.vv     31..26=0x3e vm vs2 vs1 14..12=0x1 vd 6..0=0x57
yfwnmsac.vv    31..26=0x3f vm vs2 vs1 14..12=0x1 vd 6..0=0x57
```

# OPIVX

```
yadd.vx        31..26=0x00 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ysub.vx        31..26=0x02 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yrsub.vx       31..26=0x03 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yminu.vx       31..26=0x04 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymin.vx        31..26=0x05 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymaxu.vx       31..26=0x06 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymax.vx        31..26=0x07 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yand.vx        31..26=0x09 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yor.vx         31..26=0x0a vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yxor.vx        31..26=0x0b vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yrgather.vx    31..26=0x0c vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yslideup.vx    31..26=0x0e vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yslidedown.vx  31..26=0x0f vm vs2 rs1 14..12=0x4 vd 6..0=0x57

yadc.vxm       31..26=0x10 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
ymadc.vxm      31..26=0x11 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
ymadc.vx       31..26=0x11 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57
ysbc.vxm       31..26=0x12 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
ymsbc.vxm      31..26=0x13 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
ymsbc.vx       31..26=0x13 25=1 vs2 rs1 14..12=0x4 vd 6..0=0x57
ymerge.vxm     31..26=0x17 25=0 vs2 rs1 14..12=0x4 vd 6..0=0x57
ymv.v.x        31..26=0x17 25=1 24..20=0 rs1 14..12=0x4 vd 6..0=0x57
ymseq.vx       31..26=0x18 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymsne.vx       31..26=0x19 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymsltu.vx      31..26=0x1a vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymslt.vx       31..26=0x1b vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymsleu.vx      31..26=0x1c vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymsle.vx       31..26=0x1d vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymsgtu.vx      31..26=0x1e vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ymsgt.vx       31..26=0x1f vm vs2 rs1 14..12=0x4 vd 6..0=0x57

ysaddu.vx      31..26=0x20 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ysadd.vx       31..26=0x21 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yssubu.vx      31..26=0x22 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yssub.vx       31..26=0x23 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ysll.vx        31..26=0x25 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ysmul.vx       31..26=0x27 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ysrl.vx        31..26=0x28 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ysra.vx        31..26=0x29 vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yssrl.vx       31..26=0x2a vm vs2 rs1 14..12=0x4 vd 6..0=0x57
yssra.vx       31..26=0x2b vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ynsrl.wx       31..26=0x2c vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ynsra.wx       31..26=0x2d vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ynclipu.wx     31..26=0x2e vm vs2 rs1 14..12=0x4 vd 6..0=0x57
ynclip.wx      31..26=0x2f vm vs2 rs1 14..12=0x4 vd 6..0=0x57
```

# OPIVV

```
yadd.vv         31..26=0x00 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ysub.vv         31..26=0x02 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yminu.vv        31..26=0x04 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ymin.vv         31..26=0x05 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ymaxu.vv        31..26=0x06 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ymax.vv         31..26=0x07 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yand.vv         31..26=0x09 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yor.vv          31..26=0x0a vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yxor.vv         31..26=0x0b vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yrgather.vv     31..26=0x0c vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yrgatherei16.vv 31..26=0x0e vm vs2 vs1 14..12=0x0 vd 6..0=0x57

yadc.vvm       31..26=0x10 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
ymadc.vvm      31..26=0x11 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
ymadc.vv       31..26=0x11 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57
ysbc.vvm       31..26=0x12 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
ymsbc.vvm      31..26=0x13 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
ymsbc.vv       31..26=0x13 25=1 vs2 vs1 14..12=0x0 vd 6..0=0x57
ymerge.vvm     31..26=0x17 25=0 vs2 vs1 14..12=0x0 vd 6..0=0x57
ymv.v.v        31..26=0x17 25=1 24..20=0 vs1 14..12=0x0 vd 6..0=0x57
ymseq.vv       31..26=0x18 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ymsne.vv       31..26=0x19 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ymsltu.vv      31..26=0x1a vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ymslt.vv       31..26=0x1b vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ymsleu.vv      31..26=0x1c vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ymsle.vv       31..26=0x1d vm vs2 vs1 14..12=0x0 vd 6..0=0x57

ysaddu.vv      31..26=0x20 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ysadd.vv       31..26=0x21 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yssubu.vv      31..26=0x22 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yssub.vv       31..26=0x23 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ysll.vv        31..26=0x25 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ysmul.vv       31..26=0x27 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ysrl.vv        31..26=0x28 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ysra.vv        31..26=0x29 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yssrl.vv       31..26=0x2a vm vs2 vs1 14..12=0x0 vd 6..0=0x57
yssra.vv       31..26=0x2b vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ynsrl.wv       31..26=0x2c vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ynsra.wv       31..26=0x2d vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ynclipu.wv     31..26=0x2e vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ynclip.wv      31..26=0x2f vm vs2 vs1 14..12=0x0 vd 6..0=0x57

ywredsumu.vs   31..26=0x30 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
ywredsum.vs    31..26=0x31 vm vs2 vs1 14..12=0x0 vd 6..0=0x57
```

# OPIVI

```
yadd.vi        31..26=0x00 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
yrsub.vi       31..26=0x03 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
yand.vi        31..26=0x09 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
yor.vi         31..26=0x0a vm vs2 simm5 14..12=0x3 vd 6..0=0x57
yxor.vi        31..26=0x0b vm vs2 simm5 14..12=0x3 vd 6..0=0x57
yrgather.vi    31..26=0x0c vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
yslideup.vi    31..26=0x0e vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
yslidedown.vi  31..26=0x0f vm vs2 zimm5 14..12=0x3 vd 6..0=0x57

yadc.vim       31..26=0x10 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57
ymadc.vim      31..26=0x11 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57
ymadc.vi       31..26=0x11 25=1 vs2 simm5 14..12=0x3 vd 6..0=0x57
ymerge.vim     31..26=0x17 25=0 vs2 simm5 14..12=0x3 vd 6..0=0x57
ymv.v.i        31..26=0x17 25=1 24..20=0 simm5 14..12=0x3 vd 6..0=0x57
ymseq.vi       31..26=0x18 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
ymsne.vi       31..26=0x19 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
ymsleu.vi      31..26=0x1c vm vs2 simm5 14..12=0x3 vd 6..0=0x57
ymsle.vi       31..26=0x1d vm vs2 simm5 14..12=0x3 vd 6..0=0x57
ymsgtu.vi      31..26=0x1e vm vs2 simm5 14..12=0x3 vd 6..0=0x57
ymsgt.vi       31..26=0x1f vm vs2 simm5 14..12=0x3 vd 6..0=0x57

ysaddu.vi      31..26=0x20 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
ysadd.vi       31..26=0x21 vm vs2 simm5 14..12=0x3 vd 6..0=0x57
ysll.vi        31..26=0x25 vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
ymv1r.v        31..26=0x27 25=1 vs2 19..15=0 14..12=0x3 vd 6..0=0x57
ymv2r.v        31..26=0x27 25=1 vs2 19..15=1 14..12=0x3 vd 6..0=0x57
ymv4r.v        31..26=0x27 25=1 vs2 19..15=3 14..12=0x3 vd 6..0=0x57
ymv8r.v        31..26=0x27 25=1 vs2 19..15=7 14..12=0x3 vd 6..0=0x57
ysrl.vi        31..26=0x28 vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
ysra.vi        31..26=0x29 vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
yssrl.vi       31..26=0x2a vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
yssra.vi       31..26=0x2b vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
ynsrl.wi       31..26=0x2c vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
ynsra.wi       31..26=0x2d vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
ynclipu.wi     31..26=0x2e vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
ynclip.wi      31..26=0x2f vm vs2 zimm5 14..12=0x3 vd 6..0=0x57
```

# Vector Integer Extension Instructions

`https://github.com/riscv/riscv-v-spec/blob/e49574c92b072fd4d71e6cb20f7e8154de5b83fe/v-spec.adoc#123-vector-integer-extension`

```
yzext.vf8      31..26=0x12 vm vs2 19..15=2 14..12=0x2 vd 6..0=0x57
ysext.vf8      31..26=0x12 vm vs2 19..15=3 14..12=0x2 vd 6..0=0x57
yzext.vf4      31..26=0x12 vm vs2 19..15=4 14..12=0x2 vd 6..0=0x57
ysext.vf4      31..26=0x12 vm vs2 19..15=5 14..12=0x2 vd 6..0=0x57
yzext.vf2      31..26=0x12 vm vs2 19..15=6 14..12=0x2 vd 6..0=0x57
ysext.vf2      31..26=0x12 vm vs2 19..15=7 14..12=0x2 vd 6..0=0x57

ycompress.vm   31..26=0x17 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
ymandn.mm      31..26=0x18 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
ymand.mm       31..26=0x19 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
ymor.mm        31..26=0x1a 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
ymxor.mm       31..26=0x1b 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
ymorn.mm       31..26=0x1c 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
ymnand.mm      31..26=0x1d 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
ymnor.mm       31..26=0x1e 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57
ymxnor.mm      31..26=0x1f 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x57

ymsbf.m        31..26=0x14 vm vs2 19..15=0x01 14..12=0x2 vd 6..0=0x57
ymsof.m        31..26=0x14 vm vs2 19..15=0x02 14..12=0x2 vd 6..0=0x57
ymsif.m        31..26=0x14 vm vs2 19..15=0x03 14..12=0x2 vd 6..0=0x57
yiota.m        31..26=0x14 vm vs2 19..15=0x10 14..12=0x2 vd 6..0=0x57
yid.v          31..26=0x14 vm 24..20=0 19..15=0x11 14..12=0x2 vd 6..0=0x57
ycpop.m        31..26=0x10 vm vs2 19..15=0x10 14..12=0x2 rd 6..0=0x57
yfirst.m       31..26=0x10 vm vs2 19..15=0x11 14..12=0x2 rd 6..0=0x57

ydivu.vv       31..26=0x20 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ydiv.vv        31..26=0x21 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yremu.vv       31..26=0x22 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yrem.vv        31..26=0x23 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ymulhu.vv      31..26=0x24 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ymul.vv        31..26=0x25 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ymulhsu.vv     31..26=0x26 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ymulh.vv       31..26=0x27 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ymadd.vv       31..26=0x29 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ynmsub.vv      31..26=0x2b vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ymacc.vv       31..26=0x2d vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ynmsac.vv      31..26=0x2f vm vs2 vs1 14..12=0x2 vd 6..0=0x57

ywaddu.vv      31..26=0x30 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywadd.vv       31..26=0x31 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywsubu.vv      31..26=0x32 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywsub.vv       31..26=0x33 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywaddu.wv      31..26=0x34 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywadd.wv       31..26=0x35 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywsubu.wv      31..26=0x36 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywsub.wv       31..26=0x37 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywmulu.vv      31..26=0x38 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywmulsu.vv     31..26=0x3a vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywmul.vv       31..26=0x3b vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywmaccu.vv     31..26=0x3c vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywmacc.vv      31..26=0x3d vm vs2 vs1 14..12=0x2 vd 6..0=0x57
ywmaccsu.vv    31..26=0x3f vm vs2 vs1 14..12=0x2 vd 6..0=0x57
```

# OPMVV

```
yredsum.vs     31..26=0x00 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yredand.vs     31..26=0x01 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yredor.vs      31..26=0x02 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yredxor.vs     31..26=0x03 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yredminu.vs    31..26=0x04 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yredmin.vs     31..26=0x05 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yredmaxu.vs    31..26=0x06 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yredmax.vs     31..26=0x07 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yaaddu.vv      31..26=0x08 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yaadd.vv       31..26=0x09 vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yasubu.vv      31..26=0x0a vm vs2 vs1 14..12=0x2 vd 6..0=0x57
yasub.vv       31..26=0x0b vm vs2 vs1 14..12=0x2 vd 6..0=0x57

ymv.x.s        31..26=0x10 25=1 vs2 19..15=0 14..12=0x2 rd 6..0=0x57
```

# OPMVX

```
yaaddu.vx      31..26=0x08 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
yaadd.vx       31..26=0x09 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
yasubu.vx      31..26=0x0a vm vs2 rs1 14..12=0x6 vd 6..0=0x57
yasub.vx       31..26=0x0b vm vs2 rs1 14..12=0x6 vd 6..0=0x57

ymv.s.x        31..26=0x10 25=1 24..20=0 rs1 14..12=0x6 vd 6..0=0x57
yslide1up.vx   31..26=0x0e vm vs2 rs1 14..12=0x6 vd 6..0=0x57
yslide1down.vx 31..26=0x0f vm vs2 rs1 14..12=0x6 vd 6..0=0x57

ydivu.vx       31..26=0x20 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ydiv.vx        31..26=0x21 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
yremu.vx       31..26=0x22 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
yrem.vx        31..26=0x23 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ymulhu.vx      31..26=0x24 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ymul.vx        31..26=0x25 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ymulhsu.vx     31..26=0x26 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ymulh.vx       31..26=0x27 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ymadd.vx       31..26=0x29 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ynmsub.vx      31..26=0x2b vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ymacc.vx       31..26=0x2d vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ynmsac.vx      31..26=0x2f vm vs2 rs1 14..12=0x6 vd 6..0=0x57

ywaddu.vx      31..26=0x30 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywadd.vx       31..26=0x31 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywsubu.vx      31..26=0x32 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywsub.vx       31..26=0x33 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywaddu.wx      31..26=0x34 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywadd.wx       31..26=0x35 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywsubu.wx      31..26=0x36 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywsub.wx       31..26=0x37 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywmulu.vx      31..26=0x38 vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywmulsu.vx     31..26=0x3a vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywmul.vx       31..26=0x3b vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywmaccu.vx     31..26=0x3c vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywmacc.vx      31..26=0x3d vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywmaccus.vx    31..26=0x3e vm vs2 rs1 14..12=0x6 vd 6..0=0x57
ywmaccsu.vx    31..26=0x3f vm vs2 rs1 14..12=0x6 vd 6..0=0x57

# vmv1r.v, vmv2r.v, vmv4r.v, vmv8r.v
#@vmvnfr.v     31..26=0x27 25=1 vs2 simm5 14..12=0x3 vd 6..0=0x57
```
