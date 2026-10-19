# Old Names for fmv.x.w/fmv.w.x

```
$pseudo_op rv_f::fmv.x.w fmv.x.s   rd rs1 24..20=0 31..27=0x1C 14..12=0 26..25=0 6..2=0x14 1..0=3
$pseudo_op rv_f::fmv.w.x fmv.s.x   rd rs1 24..20=0 31..27=0x1E 14..12=0 26..25=0 6..2=0x14 1..0=3
```

# Pseudo-Intructions

```
$pseudo_op rv_f::fsgnj.s  fmv.s   rd rs1 rs2=rs1 31..27=0x04 14..12=0 26..25=0 6..2=0x14 1..0=3
$pseudo_op rv_f::fsgnjx.s fabs.s  rd rs1 rs2=rs1 31..27=0x04 14..12=2 26..25=0 6..2=0x14 1..0=3
$pseudo_op rv_f::fsgnjn.s fneg.s  rd rs1 rs2=rs1 31..27=0x04 14..12=1 26..25=0 6..2=0x14 1..0=3
```

# CSRs

```
$pseudo_op rv_zicsr::csrrs  frflags    rd 19..15=0 31..20=0x001 14..12=2 6..2=0x1C 1..0=3
$pseudo_op rv_zicsr::csrrw  fsflags    rd rs1      31..20=0x001 14..12=1 6..2=0x1C 1..0=3
$pseudo_op rv_zicsr::csrrwi fsflagsi   rd zimm5     31..20=0x001 14..12=5 6..2=0x1C 1..0=3
$pseudo_op rv_zicsr::csrrs  frrm       rd 19..15=0 31..20=0x002 14..12=2 6..2=0x1C 1..0=3
$pseudo_op rv_zicsr::csrrw  fsrm       rd rs1      31..20=0x002 14..12=1 6..2=0x1C 1..0=3
$pseudo_op rv_zicsr::csrrwi fsrmi      rd zimm5     31..20=0x002 14..12=5 6..2=0x1C 1..0=3
$pseudo_op rv_zicsr::csrrw  fscsr      rd rs1      31..20=0x003 14..12=1 6..2=0x1C 1..0=3
$pseudo_op rv_zicsr::csrrs  frcsr      rd 19..15=0 31..20=0x003 14..12=2 6..2=0x1C 1..0=3
```
