```
$pseudo_op rv_w::wl1re8.w wl1r.w 31..29=0 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07
$pseudo_op rv_w::wl2re8.w wl2r.w 31..29=1 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07
$pseudo_op rv_w::wl4re8.w wl4r.w 31..29=3 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07
$pseudo_op rv_w::wl8re8.w wl8r.w 31..29=7 28=0 27..26=0 25=1 24..20=0x08 rs1 14..12=0x0 wd  6..0=0x07

$pseudo_op rv_w::wlm.w wle1.w  31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0  wd 6..0=0x07
$pseudo_op rv_w::wsm.w wse1.w  31..28=0 27..26=0 25=1 24..20=0xb rs1 14..12=0x0 ws3 6..0=0x27

$pseudo_op rv_w::wfredusum.ws  wfredsum.ws 31..26=0x01 wm ws2 ws1 14..12=0x1 wd 6..0=0x5b
$pseudo_op rv_w::wfwredusum.ws wfwredsum.ws 31..26=0x31 wm ws2 ws1 14..12=0x1 wd 6..0=0x5b

$pseudo_op rv_w::wcpop.m wpopc.m  31..26=0x10 wm ws2 19..15=0x10 14..12=0x2 rd 6..0=0x5b

$pseudo_op rv_w::wmorn.mm  wmornot.mm 31..26=0x1c wm ws2 ws1 14..12=0x2 wd 6..0=0x5b
$pseudo_op rv_w::wmandn.mm wmandnot.mm  31..26=0x18 wm ws2 ws1 14..12=0x2 wd 6..0=0x5b
```
