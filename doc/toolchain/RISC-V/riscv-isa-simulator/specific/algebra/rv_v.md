# OPCFG

```
vsetivli
vsetvli
vsetvl
```

# OPLS

```
vlm.v
vsm.v
vle8.v
vle16.v
vle32.v
vle64.v
vse8.v
vse16.v
vse32.v
vse64.v

vluxei8.v
vluxei16.v
vluxei32.v
vluxei64.v
vsuxei8.v
vsuxei16.v
vsuxei32.v
vsuxei64.v

vlse8.v
vlse16.v
vlse32.v
vlse64.v
vsse8.v
vsse16.v
vsse32.v
vsse64.v

vloxei8.v
vloxei16.v
vloxei32.v
vloxei64.v
vsoxei8.v
vsoxei16.v
vsoxei32.v
vsoxei64.v

vle8ff.v
vle16ff.v
vle32ff.v
vle64ff.v

vl1re8.v
vl1re16.v
vl1re32.v
vl1re64.v
vl2re8.v
vl2re16.v
vl2re32.v
vl2re64.v
vl4re8.v
vl4re16.v
vl4re32.v
vl4re64.v
vl8re8.v
vl8re16.v
vl8re32.v
vl8re64.v
vs1r.v
vs2r.v
vs4r.v
vs8r.v
```

# OPFVF

```
vfadd.vf
vfsub.vf
vfmin.vf
vfmax.vf
vfsgnj.vf
vfsgnjn.vf
vfsgnjx.vf
vfslide1up.vf
vfslide1down.vf
vfmv.s.f

vfmerge.vfm
vfmv.v.f
vmfeq.vf
vmfle.vf
vmflt.vf
vmfne.vf
vmfgt.vf
vmfge.vf

vfdiv.vf
vfrdiv.vf
vfmul.vf
vfrsub.vf
vfmadd.vf
vfnmadd.vf
vfmsub.vf
vfnmsub.vf
vfmacc.vf
vfnmacc.vf
vfmsac.vf
vfnmsac.vf

vfwadd.vf
vfwsub.vf
vfwadd.wf
vfwsub.wf
vfwmul.vf
vfwmacc.vf
vfwnmacc.vf
vfwmsac.vf
vfwnmsac.vf
```

# OPFVV

```
vfadd.vv
vfredusum.vs
vfsub.vv
vfredosum.vs
vfmin.vv
vfredmin.vs
vfmax.vv
vfredmax.vs
vfsgnj.vv
vfsgnjn.vv
vfsgnjx.vv
vfmv.f.s

vmfeq.vv
vmfle.vv
vmflt.vv
vmfne.vv

vfdiv.vv
vfmul.vv
vfmadd.vv
vfnmadd.vv
vfmsub.vv
vfnmsub.vv
vfmacc.vv
vfnmacc.vv
vfmsac.vv
vfnmsac.vv

vfcvt.xu.f.v
vfcvt.x.f.v
vfcvt.f.xu.v
vfcvt.f.x.v
vfcvt.rtz.xu.f.v
vfcvt.rtz.x.f.v

vfwcvt.xu.f.v
vfwcvt.x.f.v
vfwcvt.f.xu.v
vfwcvt.f.x.v
vfwcvt.f.f.v
vfwcvt.rtz.xu.f.v
vfwcvt.rtz.x.f.v

vfncvt.xu.f.w
vfncvt.x.f.w
vfncvt.f.xu.w
vfncvt.f.x.w
vfncvt.f.f.w
vfncvt.rod.f.f.w
vfncvt.rtz.xu.f.w
vfncvt.rtz.x.f.w

vfsqrt.v
vfrsqrt7.v
vfrec7.v
vfclass.v

vfwadd.vv
vfwredusum.vs
vfwsub.vv
vfwredosum.vs
vfwadd.wv
vfwsub.wv
vfwmul.vv
vfwmacc.vv
vfwnmacc.vv
vfwmsac.vv
vfwnmsac.vv
```

# OPIVX

```
vadd.vx
vsub.vx
vrsub.vx
vminu.vx
vmin.vx
vmaxu.vx
vmax.vx
vand.vx
vor.vx
vxor.vx
vrgather.vx
vslideup.vx
vslidedown.vx

vadc.vxm
vmadc.vxm
vmadc.vx
vsbc.vxm
vmsbc.vxm
vmsbc.vx
vmerge.vxm
vmv.v.x
vmseq.vx
vmsne.vx
vmsltu.vx
vmslt.vx
vmsleu.vx
vmsle.vx
vmsgtu.vx
vmsgt.vx

vsaddu.vx
vsadd.vx
vssubu.vx
vssub.vx
vsll.vx
vsmul.vx
vsrl.vx
vsra.vx
vssrl.vx
vssra.vx
vnsrl.wx
vnsra.wx
vnclipu.wx
vnclip.wx
```

# OPIVV

```
vadd.vv
vsub.vv
vminu.vv
vmin.vv
vmaxu.vv
vmax.vv
vand.vv
vor.vv
vxor.vv
vrgather.vv
vrgatherei16.vv

vadc.vvm
vmadc.vvm
vmadc.vv
vsbc.vvm
vmsbc.vvm
vmsbc.vv
vmerge.vvm
vmv.v.v
vmseq.vv
vmsne.vv
vmsltu.vv
vmslt.vv
vmsleu.vv
vmsle.vv

vsaddu.vv
vsadd.vv
vssubu.vv
vssub.vv
vsll.vv
vsmul.vv
vsrl.vv
vsra.vv
vssrl.vv
vssra.vv
vnsrl.wv
vnsra.wv
vnclipu.wv
vnclip.wv

vwredsumu.vs
vwredsum.vs
```

# OPIVI

```
vadd.vi
vrsub.vi
vand.vi
vor.vi
vxor.vi
vrgather.vi
vslideup.vi
vslidedown.vi

vadc.vim
vmadc.vim
vmadc.vi
vmerge.vim
vmv.v.i
vmseq.vi
vmsne.vi
vmsleu.vi
vmsle.vi
vmsgtu.vi
vmsgt.vi

vsaddu.vi
vsadd.vi
vsll.vi
vmv1r.v
vmv2r.v
vmv4r.v
vmv8r.v
vsrl.vi
vsra.vi
vssrl.vi
vssra.vi
vnsrl.wi
vnsra.wi
vnclipu.wi
vnclip.wi
```

# OPMVV

```
vredsum.vs
vredand.vs
vredor.vs
vredxor.vs
vredminu.vs
vredmin.vs
vredmaxu.vs
vredmax.vs
vaaddu.vv
vaadd.vv
vasubu.vv
vasub.vv

vmv.x.s
```

# OPI

```
vzext.vf8
vsext.vf8
vzext.vf4
vsext.vf4
vzext.vf2
vsext.vf2

vcompress.vm
vmandn.mm
vmand.mm
vmor.mm
vmxor.mm
vmorn.mm
vmnand.mm
vmnor.mm
vmxnor.mm

vmsbf.m
vmsof.m
vmsif.m
viota.m
vid.v
vcpop.m
vfirst.m

vdivu.vv
vdiv.vv
vremu.vv
vrem.vv
vmulhu.vv
vmul.vv
vmulhsu.vv
vmulh.vv
vmadd.vv
vnmsub.vv
vmacc.vv
vnmsac.vv

vwaddu.vv
vwadd.vv
vwsubu.vv
vwsub.vv
vwaddu.wv
vwadd.wv
vwsubu.wv
vwsub.wv
vwmulu.vv
vwmulsu.vv
vwmul.vv
vwmaccu.vv
vwmacc.vv
vwmaccsu.vv
```

# OPMVX

```
vaaddu.vx
vaadd.vx
vasubu.vx
vasub.vx

vmv.s.x
vslide1up.vx
vslide1down.vx

vdivu.vx
vdiv.vx
vremu.vx
vrem.vx
vmulhu.vx
vmul.vx
vmulhsu.vx
vmulh.vx
vmadd.vx
vnmsub.vx
vmacc.vx
vnmsac.vx

vwaddu.vx
vwadd.vx
vwsubu.vx
vwsub.vx
vwaddu.wx
vwadd.wx
vwsubu.wx
vwsub.wx
vwmulu.vx
vwmulsu.vx
vwmul.vx
vwmaccu.vx
vwmacc.vx
vwmaccus.vx
vwmaccsu.vx
```
