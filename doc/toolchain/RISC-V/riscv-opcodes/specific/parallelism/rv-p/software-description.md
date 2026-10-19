**RVP - "RVP Standard Extension for Packed-SIMD"**

PADD.BS:

```
let s1 = X(rs1);
let s2_b0 = X(rs2)[7..0];
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes) - 1) {
    let s1_b = s1[(i*8+7)..(i*8)];
    d[(i*8+7)..(i*8)] = s1_b + s2_b0;
}
X(rd) = d;
```

PABD.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes) - 1) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    d[(i*8+7)..(i*8)] =
        if (s1_b <_s s2_b) then s2_b - s1_b else s1_b - s2_b;
}
X(rd) = d;
```

PABDU.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes) - 1) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    d[(i*8+7)..(i*8)] =
        if (s1_b <_u s2_b) then s2_b - s1_b else s1_b - s2_b;
}
X(rd) = d;
```

PREDSUM.BS:

```
let s1 = X(rs1);
var sum : bits(xlen) = X(rs2);
foreach (i from 0 to sizeof(xlen_bytes) - 1) {
    let s1_b = s1[(i*8+7)..(i*8)];
    sum = sum + sign_extend(sizeof(xlen), s1_b);
}
X(rd) = sum;
```

PREDSUMU.BS:

```
let s1 = X(rs1);
var sum : bits(xlen) = X(rs2);
foreach (i from 0 to sizeof(xlen_bytes) - 1) {
    let s1_b = s1[(i*8+7)..(i*8)];
    sum = sum + zero_extend(sizeof(xlen), s1_b);
}
X(rd) = sum;
```

PADD.HS:

```
let s1 = X(rs1);
let s2_h0 = X(rs2)[15..0];
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = s1_h + s2_h0;
}
X(rd) = d;
```

PSH1ADD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = (s1_h << 1) + s2_h;
}
X(rd) = d;
```

PSSH1SADD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let ssh1_s1_h : bits(16) =
        if (s1_h <_s 0xC000) then { vxsat = 1; 0x8000 }
            else if (s1_h >=_s 0x4000) then { vxsat = 1; 0x7FFF }
                else s1_h << 1;
    let xadd_ssh1 = to_bits(20, signed(ssh1_s1_h) + signed(s2_h));
    d[(i*16+15)..(i*16)] =
        if (xadd_ssh1 <_s 0xF8000) then { vxsat = 1; 0x8000 }
            else if (xadd_ssh1 >_s 0x07FFF) then { vxsat = 1; 0x7FFF }
                else xadd_ssh1[15..0];
}
X(rd) = d;
```

PABD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        if (s1_h <_s s2_h) then s2_h - s1_h else s1_h - s2_h;
}
X(rd) = d;
```

PABDU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        if (s1_h <_u s2_h) then s2_h - s1_h else s1_h - s2_h;
}
X(rd) = d;
```

PREDSUM.HS:

```
let s1 = X(rs1);
var sum : bits(xlen) = X(rs2);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    sum = sum + sign_extend(sizeof(xlen), s1_h);
}
X(rd) = sum;
```

PREDSUMU.HS:

```
let s1 = X(rs1);
var sum : bits(xlen) = X(rs2);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    sum = sum + zero_extend(sizeof(xlen), s1_h);
}
X(rd) = sum;
```

RV32 SSH1SADD:

```
let s1 = X(rs1);
let s2 = X(rs2);
let ssh1_s1 : bits(32) =
    if (s1 <_s 0xC0000000) then { vxsat = 1; 0x80000000 }
        else if (s1 >=_s 0x40000000) then { vxsat = 1; 0x7FFFFFFF }
            else s1 << 1;
let xadd_ssh1 = to_bits(36, signed(ssh1_s1) + signed(s2));
X(rd) =
    if (xadd_ssh1 <_s 0xF80000000) then { vxsat = 1; 0x80000000 }
        else if (xadd_ssh1 >_s 0x07FFFFFFF) then { vxsat = 1; 0x7FFFFFFF }
            else xadd_ssh1[31..0];
```

RV64 PADD.WS:

```
let s1 = X(rs1);
let s2_w0 = X(rs2)[31..0];
var d : bits(64);
d[31..0]  = s1[31..0]  + s2_w0;
d[63..32] = s1[63..32] + s2_w0;
X(rd) = d;
```

RV64 PSH1ADD.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
d[31..0]  = (s1[31..0]  << 1) + s2[31..0];
d[63..32] = (s1[63..32] << 1) + s2[63..32];
X(rd) = d;
```

RV64 PSSH1SADD.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    let ssh1_s1_w : bits(32) =
        if (s1_w <_s 0xC0000000) then { vxsat = 1; 0x80000000 }
            else if (s1_w >=_s 0x40000000) then { vxsat = 1; 0x7FFFFFFF }
                else s1_w << 1;
    let xadd_ssh1 = to_bits(36, signed(ssh1_s1_w) + signed(s2_w));
    d[(i*32+31)..(i*32)] =
        if (xadd_ssh1 <_s 0xF80000000) then { vxsat = 1; 0x80000000 }
            else if (xadd_ssh1 >_s 0x07FFFFFFF)
                then { vxsat = 1; 0x7FFFFFFF } else xadd_ssh1[31..0];
}
X(rd) = d;
```

RV64 PREDSUM.WS:

```
let s1 = X(rs1);
X(rd) = X(rs2) + sign_extend(64, s1[31..0]) + sign_extend(64, s1[63..32]);
```

RV64 PREDSUMU.WS:

```
let s1 = X(rs1);
X(rd) = X(rs2) + zero_extend(64, s1[31..0]) + zero_extend(64, s1[63..32]);
```

PSLL.BS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes) - 1) {
    let s1_b = s1[(i*8+7)..(i*8)];
    d[(i*8+7)..(i*8)] = (zero_extend(32, s1_b) << shamt)[7..0];
}
X(rd) = d;
```

PSRL.BS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes) - 1) {
    let s1_b = s1[(i*8+7)..(i*8)];
    d[(i*8+7)..(i*8)] = (zero_extend(32, s1_b) >> shamt)[7..0];
}
X(rd) = d;
```

PSRA.BS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes) - 1) {
    let s1_b = s1[(i*8+7)..(i*8)];
    d[(i*8+7)..(i*8)] = (sign_extend(40, s1_b) >> shamt)[7..0];
}
X(rd) = d;
```

PSLL.HS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = (zero_extend(32, s1_h) << shamt)[15..0];
}
X(rd) = d;
```

PSRL.HS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = (zero_extend(32, s1_h) >> shamt)[15..0];
}
X(rd) = d;
```

PSRA.HS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = (sign_extend(48, s1_h) >> shamt)[15..0];
}
X(rd) = d;
```

PSSHA.HS:

```
let s1 = X(rs1);
let shamt = X(rs2)[7..0];
let sshamt = signed(shamt);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s1_xh = sign_extend(32, s1_h);
    d[(i*16+15)..(i*16)] =
        if (sshamt < 0) then {
            if (sshamt <= -16) then s1_xh[31..16]
                else (s1_xh >> (0x00 - shamt)[3..0])[15..0]
        } else {
            let shx : bits(32) =
                if (sshamt >= 16) then s1_h @ 0x0000
                    else s1_xh << shamt[3..0];
            if (shx <_s 0xFFFF8000) then { vxsat = 1; 0x8000 }
                else if (shx >_s 0x00007FFF) then { vxsat = 1; 0x7FFF }
                    else shx[15..0]
        };
}
X(rd) = d;
```

PSSHAR.HS:

```
let s1 = X(rs1);
let shamt = X(rs2)[7..0];
let sshamt = signed(shamt);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        if (sshamt < 0) then {
            let s1_xh : bits(33) = sign_extend(32, s1_h) @ 0b0;
            let shx : bits(17) =
                if (sshamt <= -16) then s1_xh[32..16]
                    else (s1_xh >> (0x00 - shamt)[3..0])[16..0];
            (shx + 1)[16..1]
        } else {
            let shx : bits(32) =
                if (sshamt >= 16) then s1_h @ 0x0000
                    else sign_extend(32, s1_h) << shamt[3..0];
            if (shx <_s 0xFFFF8000) then { vxsat = 1; 0x8000 }
                else if (shx >_s 0x00007FFF) then { vxsat = 1; 0x7FFF }
                    else shx[15..0]
        };
}
X(rd) = d;
```

RV32 SSHA:

```
let s1 = X(rs1);
let shamt = X(rs2)[7..0];
let sshamt = signed(shamt);
let xs1 = sign_extend(64, s1);
X(rd) =
    if (sshamt < 0) then {
        if (sshamt <= -32) then xs1[63..32]
            else (xs1 >> (0x00 - shamt)[4..0])[31..0]
    } else {
        let shx : bits(64) =
            if (sshamt >= 32) then s1 @ 0x00000000 else xs1 << shamt[4..0];
        if (shx <_s 0xFFFFFFFF80000000) then { vxsat = 1; 0x80000000 }
            else if (shx >_s 0x000000007FFFFFFF)
                then { vxsat = 1; 0x7FFFFFFF } else shx[31..0]
    };
```

RV32 SSHAR:

```
let s1 = X(rs1);
let shamt = X(rs2)[7..0];
let sshamt = signed(shamt);
X(rd) =
    if (sshamt < 0) then {
        let xs1 : bits(65) = sign_extend(64, s1) @ 0b0;
        let shx : bits(33) =
            if (sshamt <= -32) then xs1[64..32]
                else (xs1 >> (0x00 - shamt)[4..0])[32..0]
        (shx + 1)[32..1]
    } else {
        let shx : bits(64) =
            if (sshamt >= 32) then s1 @ 0x00000000
                else sign_extend(64, s1) << shamt[4..0];
        if (shx <_s 0xFFFFFFFF80000000) then { vxsat = 1; 0x80000000 }
            else if (shx >_s 0x000000007FFFFFFF)
                then { vxsat = 1; 0x7FFFFFFF } else shx[31..0]
    };
```

RV32 MSEQ:

```
X(rd) = if (X(rs1) == X(rs2)) then 0xFFFFFFFF else 0x00000000;
```

RV32 MSLT:

```
X(rd) = if (X(rs1) <_s X(rs2)) then 0xFFFFFFFF else 0x00000000;
```

RV32 MSLTU:

```
X(rd) = if (X(rs1) <_u X(rs2)) then 0xFFFFFFFF else 0x00000000;
```

RV64 PSEXT.W.B:

```
let s1 = X(rs1);
X(rd) = sign_extend(32, s1[39..32]) @ sign_extend(32, s1[7..0]);
```

RV64 PSEXT.W.H:

```
let s1 = X(rs1);
X(rd) = sign_extend(32, s1[47..32]) @ sign_extend(32, s1[15..0]);
```

RV64 PSSHA.WS:

```
let s1 = X(rs1);
let shamt = X(rs2)[7..0];
let sshamt = signed(shamt);
var d : bits(64);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s1_xw = sign_extend(64, s1_w);
    d[(i*32+31)..(i*32)] =
        if (sshamt < 0) then {
            if (sshamt <= -32) then s1_xw[63..32]
                else (s1_xw >> (0x00 - shamt)[4..0])[31..0]
        } else {
            let shx : bits(64) =
                if (sshamt >= 32) then s1_w @ 0x00000000
                    else s1_xw << shamt[4..0];
            if (shx <_s 0xFFFFFFFF80000000) then { vxsat = 1; 0x80000000 }
                else if (shx >_s 0x000000007FFFFFFF)
                    then { vxsat = 1; 0x7FFFFFFF } else shx[31..0]
        };
}
X(rd) = d;
```

RV64 PSSHAR.WS:

```
let s1 = X(rs1);
let shamt = X(rs2)[7..0];
let sshamt = signed(shamt);
var d : bits(64);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        if (sshamt < 0) then {
            let s1_xw : bits(65) = sign_extend(64, s1_w) @ 0b0;
            let shx : bits(33) =
                if (sshamt <= -32) then s1_xw[64..32]
                    else (s1_xw >> (0x00 - shamt)[4..0])[32..0];
            (shx + 1)[32..1]
        } else {
            let shx : bits(64) =
                if (sshamt >= 32) then s1_w @ 0x00000000
                    else sign_extend(64, s1_w) << shamt[4..0];
            if (shx <_s 0xFFFFFFFF80000000) then { vxsat = 1; 0x80000000 }
                else if (shx >_s 0x000000007FFFFFFF)
                    then { vxsat = 1; 0x7FFFFFFF } else shx[31..0]
        };
}
X(rd) = d;
```

RV64 PMSEQ.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = if (s1[31..0]  == s2[31..0] ) then 0xFFFFFFFF else 0x00000000;
let d_w1 = if (s1[63..32] == s2[63..32]) then 0xFFFFFFFF else 0x00000000;
X(rd) = d_w1 @ d_w0;
```

RV64 PMSLT.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = if (s1[31..0]  <_s s2[31..0] ) then 0xFFFFFFFF else 0x00000000;
let d_w1 = if (s1[63..32] <_s s2[63..32]) then 0xFFFFFFFF else 0x00000000;
X(rd) = d_w1 @ d_w0;
```

RV64 PMSLTU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = if (s1[31..0]  <_u s2[31..0] ) then 0xFFFFFFFF else 0x00000000;
let d_w1 = if (s1[63..32] <_u s2[63..32]) then 0xFFFFFFFF else 0x00000000;
X(rd) = d_w1 @ d_w0;
```

RV64 SATI:

```
let s1 = X(rs1);
let n = w_uimm[5..0];
let minval : bits(64) = 0xFFFFFFFFFFFFFFFF << n;
let maxval = ~minval;
X(rd) =
    if (s1 <_s minval) then { vxsat = 1; minval }
        else if (s1 >_s maxval) then { vxsat = 1; maxval } else s1;
```

RV64 USATI:

```
let s1 = X(rs1);
let n = w_uimm[5..0];
let maxval : bits(64) = ~(0xFFFFFFFFFFFFFFFF << n);
X(rd) =
    if (s1 <_s 0x0000000000000000) then { vxsat = 1; 0x0000000000000000 }
        else if (s1 >_s maxval) then { vxsat = 1; maxval } else s1;
```

RV64 SHA:

```
let s1 = X(rs1);
let shamt = X(rs2)[7..0];
let sshamt = signed(shamt);
X(rd) =
    if (sshamt < 0) then {
        let xs1 = sign_extend(128, s1);
        if (sshamt <= -64) then xs1[127..64]
            else (xs1 >> (0x00 - shamt)[5..0])[63..0]
    } else {
        if (sshamt >= 64) then 0x0000000000000000 else s1 << shamt[5..0]
    };
```

RV64 SHAR:

```
let s1 = X(rs1);
let shamt = X(rs2)[7..0];
let sshamt = signed(shamt);
X(rd) =
    if (sshamt < 0) then {
        let xs1 : bits(129) = sign_extend(128, s1) @ 0b0;
        let shx : bits(65) =
            if (sshamt <= -64) then xs1[128..64]
                else (xs1 >> (0x00 - shamt)[5..0])[64..0];
        (shx + 1)[64..1]
    } else {
        if (sshamt >= 64) then 0x0000000000000000 else s1 << shamt[5..0]
    };
```

PPAIRE.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = s2_h[7..0] @ s1_h[7..0];
}
X(rd) = d;
```

PPAIREO.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = s2_h[15..8] @ s1_h[7..0];
}
X(rd) = d;
```

PPAIROE.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = s2_h[7..0] @ s1_h[15..8];
}
X(rd) = d;
```

PPAIRO.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = s2_h[15..8] @ s1_h[15..8];
}
X(rd) = d;
```

RV64 REV16:

```
let s1 = X(rs1);
X(rd) = s1[15..0] @ s1[31..16] @ s1[47..32] @ s1[63..48];
```

RV64 ZIP8P:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    s2[31..24] @ s1[31..24] @ s2[23..16] @ s1[23..16]
        @ s2[15..8] @ s1[15..8] @ s2[7..0] @ s1[7..0];
```

RV64 ZIP8HP:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    s2[63..56] @ s1[63..56] @ s2[55..48] @ s1[55..48]
        @ s2[47..40] @ s1[47..40] @ s2[39..32] @ s1[39..32];
```

RV64 UNZIP8P:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    s2[55..48] @ s2[39..32] @ s2[23..16] @ s2[7..0]
        @ s1[55..48] @ s1[39..32] @ s1[23..16] @ s1[7..0];
```

RV64 UNZIP8HP:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    s2[63..56] @ s2[47..40] @ s2[31..24] @ s2[15..8]
        @ s1[63..56] @ s1[47..40] @ s1[31..24] @ s1[15..8];
```

RV64 ZIP16P:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) = s2[31..16] @ s1[31..16] @ s2[15..0] @ s1[15..0];
```

RV64 ZIP16HP:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) = s2[63..48] @ s1[63..48] @ s2[47..32] @ s1[47..32];
```

RV64 UNZIP16P:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) = s2[47..32] @ s2[15..0] @ s1[47..32] @ s1[15..0];
```

RV64 UNZIP16HP:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) = s2[63..48] @ s2[31..16] @ s1[63..48] @ s1[31..16];
```


ABS:

```
let s1 = X(rs1);
X(rd) = if (signed(s1) < 0) then 0 - s1 else s1;
```

CLS:

```
var v : bits(xlen) = X(rs1);
let lo_bound = to_bits(sizeof(xlen), -(2^(sizeof(xlen) - 2)));
let hi_bound = ~lo_bound;
var c : int = 0;
while (c < sizeof(xlen) - 1) & (v >=_s lo_bound) & (v <=_s hi_bound) do {
    c = c + 1;
    v = v << 1;
}
X(rd) = to_bits(sizeof(xlen), c);
```

SLX:

```
let shamt = X(rs2)[(log2(sizeof(xlen))-1)..0];
X(rd) = ((X(rd) @ X(rs1)) << shamt)[(sizeof(xlen)*2-1)..sizeof(xlen)];
```

SRX:

```
let shamt = X(rs2)[(log2(sizeof(xlen))-1)..0];
X(rd) = ((X(rs1) @ X(rd)) >> shamt)[(sizeof(xlen)-1)..0];
```

MVM:

```
let s2 = X(rs2);
X(rd) = (~s2 & X(rd)) | (s2 & X(rs1));
```

MVMN:

```
let s2 = X(rs2);
X(rd) = (~s2 & X(rs1)) | (s2 & X(rd));
```

MERGE:

```
let d = X(rd);
X(rd) = (~d & X(rs1)) | (d & X(rs2));
```

RV64 ABSW:

```
let s1_w = X(rs1)[31..0];
X(rd) =
    sign_extend(
        64, if (signed(s1_w) <_s 0) then 0x00000000 - s1_w else s1_w);
```

RV64 CLSW:

```
var w : bits(32) = X(rs1)[31..0];
var c : int = 0;
while (c < 31) & (w >=_s 0xC0000000) & (w <=_s 0x3FFFFFFF) do {
    c = c + 1;
    w = w << 1;
}
X(rd) = to_bits(sizeof(xlen), c);
```

RV32 PWADD.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = to_bits(16, signed(s1_b) + signed(s2_b));
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWADDA.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = d_h + to_bits(16, signed(s1_b) + signed(s2_b));
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWADDU.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = to_bits(16, unsigned(s1_b) + unsigned(s2_b));
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWADDAU.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(16, unsigned(s1_b) + unsigned(s2_b));
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWSUB.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = to_bits(16, signed(s1_b) - signed(s2_b));
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWSUBA.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] = d_h + to_bits(16, signed(s1_b) - signed(s2_b));
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWSUBU.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = to_bits(16, unsigned(s1_b) - unsigned(s2_b));
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWSUBAU.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(16, unsigned(s1_b) - unsigned(s2_b));
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWSLLI.B:

```
let s1 = X(rs1);
let shamt = w_uimm[3..0];
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = zero_extend(16, s1_b) << shamt;
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWSLL.BS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = (zero_extend(32, s1_b) << shamt)[15..0];
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWSLAI.B:

```
let s1 = X(rs1);
let shamt = w_uimm[3..0];
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = sign_extend(16, s1_b) << shamt;
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWSLA.BS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = (sign_extend(32, s1_b) << shamt)[15..0];
};
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWADD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, signed(s1[15..0])  + signed(s2[15..0]) );
let d_w1 = to_bits(32, signed(s1[31..16]) + signed(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWADDA.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d_w0 = X(rd_p*2);
var d_w1 = if (rd_p == 0x0) then 0x00000000 else X(rd_p*2+1);
d_w0 = d_w0 + to_bits(32, signed(s1[15..0])  + signed(s2[15..0]) );
d_w1 = d_w1 + to_bits(32, signed(s1[31..16]) + signed(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWADDU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, unsigned(s1[15..0])  + unsigned(s2[15..0]) );
let d_w1 = to_bits(32, unsigned(s1[31..16]) + unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWADDAU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d_w0 = X(rd_p*2);
var d_w1 = if (rd_p == 0x0) then 0x00000000 else X(rd_p*2+1);
d_w0 = d_w0 + to_bits(32, unsigned(s1[15..0])  + unsigned(s2[15..0]) );
d_w1 = d_w1 + to_bits(32, unsigned(s1[31..16]) + unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWSUB.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, signed(s1[15..0])  - signed(s2[15..0]) );
let d_w1 = to_bits(32, signed(s1[31..16]) - signed(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWSUBA.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d_w0 = X(rd_p*2);
var d_w1 = if (rd_p == 0x0) then 0x00000000 else X(rd_p*2+1);
d_w0 = d_w0 + to_bits(32, signed(s1[15..0])  - signed(s2[15..0]) );
d_w1 = d_w1 + to_bits(32, signed(s1[31..16]) - signed(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWSUBU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, unsigned(s1[15..0])  - unsigned(s2[15..0]) );
let d_w1 = to_bits(32, unsigned(s1[31..16]) - unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWSUBAU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d_w0 = X(rd_p*2);
var d_w1 = if (rd_p == 0x0) then 0x00000000 else X(rd_p*2+1);
d_w0 = d_w0 + to_bits(32, unsigned(s1[15..0])  - unsigned(s2[15..0]) );
d_w1 = d_w1 + to_bits(32, unsigned(s1[31..16]) - unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWSLLI.H:

```
let s1 = X(rs1);
let shamt = w_uimm[4..0];
let d_w0 = zero_extend(32, s1[15..0] ) << shamt;
let d_w1 = zero_extend(32, s1[31..16]) << shamt;
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWSLL.HS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
let d_w0 = zero_extend(32, s1[15..0] ) << shamt;
let d_w1 = zero_extend(32, s1[31..16]) << shamt;
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWSLAI.H:

```
let s1 = X(rs1);
let shamt = w_uimm[4..0];
let d_w0 = sign_extend(32, s1[15..0] ) << shamt;
let d_w1 = sign_extend(32, s1[31..16]) << shamt;
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWSLA.HS:

```
let s1 = X(rs1);
let shamt = X(rs2)[4..0];
let d_w0 = sign_extend(32, s1[15..0] ) << shamt;
let d_w1 = sign_extend(32, s1[31..16]) << shamt;
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 WADD:

```
let d = to_bits(64, signed(X(rs1)) + signed(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WADDA:

```
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(64, signed(X(rs1)) + signed(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WADDU:

```
let d = to_bits(64, unsigned(X(rs1)) + unsigned(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WADDAU:

```
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(64, unsigned(X(rs1)) + unsigned(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WSUB:

```
let d = to_bits(64, signed(X(rs1)) - signed(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WSUBA:

```
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(64, signed(X(rs1)) - signed(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WSUBU:

```
let d = to_bits(64, unsigned(X(rs1)) - unsigned(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WSUBAU:

```
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(64, unsigned(X(rs1)) - unsigned(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WSLLI:

```
let shamt = w_uimm[5..0];
let d = zero_extend(64, X(rs1)) << shamt;
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WSLL:

```
let shamt = X(rs2)[5..0];
let d = zero_extend(64, X(rs1)) << shamt;
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WSLAI:

```
let shamt = w_uimm[5..0];
let d = sign_extend(64, X(rs1)) << shamt;
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WSLA:

```
let shamt = X(rs2)[5..0];
let d = sign_extend(64, X(rs1)) << shamt;
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WZIP8P:

```
let s1 = X(rs1);
let s2 = X(rs2);
if (rd_p != 0x0) then {
    X(rd_p*2)   = s2[15..8]  @ s1[15..8]  @ s2[7..0]   @ s1[7..0];
    X(rd_p*2+1) = s2[31..24] @ s1[31..24] @ s2[23..16] @ s1[23..16];
}
```

RV32 WZIP16P:

```
let s1 = X(rs1);
let s2 = X(rs2);
if (rd_p != 0x0) then {
    X(rd_p*2)   = s2[15..0]  @ s1[15..0];
    X(rd_p*2+1) = s2[31..16] @ s1[31..16];
}
```

RV32 PLI.DB, PLI.DH, PLUI.DH:

```
For these instructions, the function of

    P<op>.D<s> rd,imm    // only even destination register number allowed

is the same as two instructions:

    P<op>.<s> rd,imm     // the even destination register
    P<op>.<s> rd+,imm    // the odd destination register

See the introduction for the precise meaning of "rd+".
```

RV32 PADD.DB, PSUB.DB, PSADD.DB, PSADDU.DB, PSSUB.DB, PSSUBU.DB, PAADD.DB, PAADDU.DB, PASUB.DB, PASUBU.DB, PABD.DB, PABDU.DB, PADD.DH, PSUB.DH, PSADD.DH, PSADDU.DH, PSSUB.DH, PSSUBU.DH, PAADD.DH, PAADDU.DH, PASUB.DH, PASUBU.DH, PSH1ADD.DH, PSSH1SADD.DH, PABD.DH, PABDU.DH:

```
For these instructions, the function of

    P<op>.D<s> rd,rs1,rs2     // only even register numbers allowed

is the same as two instructions:

    P<op>.<s> rd,rs1,rs2      // the even registers
    P<op>.<s> rd+,rs1+,rs2+   // the odd registers

See the introduction for the precise meaning of "rd+", "rs1+", and
"rs2+".
```

RV32 PAS.DHX, PSA.DHX, PSAS.DHX, PSSA.DHX, PAAS.DHX, PASA.DHX:

```
For these instructions, the function of

    P<op>.DHX rd,rs1,rs2      // only even register numbers allowed

is the same as two instructions:

    P<op>.HX rd,rs1,rs2       // the even registers
    P<op>.HX rd+,rs1+,rs2+    // the odd registers

See the introduction for the precise meaning of "rd+", "rs1+", and
"rs2+".
```

RV32 PSABS.DB, PSABS.DH:

```
For these instructions, the function of

    PSABS.D<s> rd,rs1         // only even register numbers allowed

is the same as two instructions:

    PSABS.<s> rd,rs1          // the even registers
    PSABS.<s> rd+,rs1+        // the odd registers

See the introduction for the precise meaning of "rd+" and "rs1+".
```

RV32 PADD.DW, PSUB.DW, PSADD.DW, PSADDU.DW, PSSUB.DW, PSSUBU.DW, PAADD.DW, PAADDU.DW, PASUB.DW, PASUBU.DW, PSH1ADD.DW, PSSH1SADD.DW:

```
For these instructions, the function of

    P<op>.DW rd,rs1,rs2       // only even register numbers allowed

is the same as two instructions:

    <op> rd,rs1,rs2           // the even registers
    <op> rd+,rs1+,rs2+        // the odd registers

See the introduction for the precise meaning of "rd+", "rs1+", and
"rs2+".
```

RV32 PREDSUM.DBS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
X(rd) =
    to_bits(
        32,
        signed(X(rs2)) + signed(s1[7..0]) + signed(s1[15..8])
            + signed(s1[23..16]) + signed(s1[31..24])
            + signed(s1[39..32]) + signed(s1[47..40])
            + signed(s1[55..48]) + signed(s1[63..56])
    );
```

RV32 PREDSUMU.DBS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
X(rd) =
    to_bits(
        32,
        unsigned(X(rs2)) + unsigned(s1[7..0]) + unsigned(s1[15..8])
            + unsigned(s1[23..16]) + unsigned(s1[31..24])
            + unsigned(s1[39..32]) + unsigned(s1[47..40])
            + unsigned(s1[55..48]) + unsigned(s1[63..56])
    );
```

RV32 PREDSUM.DHS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
X(rd) =
    to_bits(
        32,
        signed(X(rs2)) + signed(s1[15..0]) + signed(s1[31..16])
            + signed(s1[47..32]) + signed(s1[63..48])
    );
```

RV32 PREDSUMU.DHS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
X(rd) =
    to_bits(
        32,
        unsigned(X(rs2)) + unsigned(s1[15..0]) + unsigned(s1[31..16])
            + unsigned(s1[47..32]) + unsigned(s1[63..48])
    );
```

RV32 PSLLI.DB, PSRLI.DB, PSRAI.DB, PSATI.DH, PUSATI.DH, PSLLI.DH, PSRLI.DH, PSRAI.DH, PSSLAI.DH, PSRARI.DH:

```
For these instructions, the function of

    P<op>.D<s> rd,rs1,imm     // only even register numbers allowed

is the same as two instructions:

    P<op>.<s> rd,rs1,imm      // the even registers
    P<op>.<s> rd+,rs1+,imm    // the odd registers

See the introduction for the precise meaning of "rd+" and "rs1+".
```

RV32 PMIN.DB, PMINU.DB, PMAX.DB, PMAXU.DB, PMSEQ.DB, PMSLT.DB, PMSLTU.DB, PMIN.DH, PMINU.DH, PMAX.DH, PMAXU.DH, PMSEQ.DH, PMSLT.DH, PMSLTU.DH:

```
For these instructions, the function of

    P<op>.D<s> rd,rs1,rs2     // only even register numbers allowed

is the same as two instructions:

    P<op>.<s> rd,rs1,rs2      // the even registers
    P<op>.<s> rd+,rs1+,rs2+   // the odd registers

See the introduction for the precise meaning of "rd+", "rs1+", and
"rs2+".
```

RV32 PSEXT.DH.B:

```
The function of

    PSEXT.DH.B rd,rs1         // only even register numbers allowed

is the same as two instructions:

    PSEXT.H.B rd,rs1          // the even registers
    PSEXT.H.B rd+,rs1+        // the odd registers

See the introduction for the precise meaning of "rd+" and "rs1+".
```

RV32 PSEXT.DW.B, PSEXT.DW.H:

```
For these instructions, the function of

    PSEXT.DW.<s> rd,rs1       // only even register numbers allowed

is the same as two instructions:

    SEXT.<s> rd,rs1           // the even registers
    SEXT.<s> rd+,rs1+         // the odd registers

See the introduction for the precise meaning of "rd+" and "rs1+".
```

RV32 PSATI.DW, PUSATI.DW, PSLLI.DW, PSRLI.DW, PSRAI.DW, PSSLAI.DW, PSRARI.DW:

```
For these instructions, the function of

    P<op>.DW rd,rs1,imm       // only even register numbers allowed

is the same as two instructions:

    <op> rd,rs1,imm           // the even registers
    <op> rd+,rs1+,imm         // the odd registers

See the introduction for the precise meaning of "rd+" and "rs1+".
```

RV32 PMIN.DW, PMINU.DW, PMAX.DW, PMAXU.DW, PMSEQ.DW, PMSLT.DW, PMSLTU.DW:

```
For these instructions, the function of

    P<op>.DW rd,rs1,rs2       // only even register numbers allowed

is the same as two instructions:

    <op> rd,rs1,rs2           // the even registers
    <op> rd+,rs1+,rs2+        // the odd registers

See the introduction for the precise meaning of "rd+", "rs1+", and
"rs2+".
```

RV32 PADD.DBS, PSLL.DBS, PSRL.DBS, PSRA.DBS, PADD.DHS, PSLL.DHS, PSRL.DHS, PSRA.DHS, PSSHA.DHS, PSSHAR.DHS:

```
For these instructions, the function of

    P<op>.D<s>S rd,rs1,rs2    // only even register numbers allowed
                              //  for rd and rs1

is the same as two instructions:

    P<op>.<s>S rd,rs1,rs2     // the even registers for rd and rs1
    P<op>.<s>S rd+,rs1+,rs2   // the odd registers for rd and rs1

when performed simultaneously, or in an order such that writes to
destination registers rd and rd+ do not overwrite the scalar second
operand rs2 between the two instructions.  (For example, if rs2 is an
even-numbered register, the second instruction that writes odd register
rd+ could be executed before the first instruction.)

See the introduction for the precise meaning of "rd+" and "rs1+".
```

RV32 PADD.DWS, PSLL.DWS, PSRL.DWS, PSRA.DWS, PSSHA.DWS, PSSHAR.DWS:

```
For these instructions, the function of

    P<op>.DWS rd,rs1,rs2      // only even register numbers allowed for
                              //  rd and rs1

is the same as two instructions:

    <op> rd,rs1,rs2           // the even registers for rd and rs1
    <op> rd+,rs1+,rs2         // the odd registers for rd and rs1

when performed simultaneously, or in an order such that writes to
destination registers rd and rd+ do not overwrite the scalar second
operand rs2 between the two instructions.  (For example, if rs2 is an
even-numbered register, the second instruction that writes odd register
rd+ could be executed before the first instruction.)

See the introduction for the precise meaning of "rd+" and "rs1+".
```

RV32 PPAIRE.DB, PPAIREO.DB, PPAIROE.DB, PPAIRO.DB, PPAIRE.DH, PPAIREO.DH, PPAIROE.DH, PPAIRO.DH:

```
For these instructions, the function of

    P<op>.D<s> rd,rs1,rs2     // only even register numbers allowed

is the same as two instructions:

    P<op>.<s> rd,rs1,rs2      // the even registers
    P<op>.<s> rd+,rs1+,rs2+   // the odd registers

See the introduction for the precise meaning of "rd+", "rs1+", and
"rs2+".

(For RV32, pseudoinstruction PPAIRE.H is an alias for actual instruction
PACK.)
```

RV32 PNSRLI.B:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[3..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*8+7)..(i*8)] = (s1_h >> shamt)[7..0];
}
X(rd) = d;
```

RV32 PNSRL.BS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*8+7)..(i*8)] = (zero_extend(32, s1_h) >> shamt)[7..0];
}
X(rd) = d;
```

RV32 PNSRAI.B:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[3..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*8+7)..(i*8)] = (sign_extend(24, s1_h) >> shamt)[7..0];
}
X(rd) = d;
```

RV32 PNSRA.BS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    d[(i*8+7)..(i*8)] = (sign_extend(40, s1_h) >> shamt)[7..0];
}
X(rd) = d;
```

RV32 PNSRARI.B:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[3..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx : bits(9) = ((sign_extend(24, s1_h) @ 0b0) >> shamt)[8..0];
    d[(i*8+7)..(i*8)] = (shx + 1)[8..1];
}
X(rd) = d;
```

RV32 PNSRAR.BS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx : bits(9) = ((sign_extend(40, s1_h) @ 0b0) >> shamt)[8..0];
    d[(i*8+7)..(i*8)] = (shx + 1)[8..1];
}
X(rd) = d;
```

RV32 PNCLIPI.B:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[3..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx : bits(16) = (sign_extend(32, s1_h) >> shamt)[15..0];
    d[(i*8+7)..(i*8)] =
        if (shx <_s 0xFF80) then { vxsat = 1; 0x80 }
            else if (shx >_s 0x007F) then { vxsat = 1; 0x7F }
                else shx[7..0];
}
X(rd) = d;
```

RV32 PNCLIP.BS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx : bits(16) = (sign_extend(48, s1_h) >> shamt)[15..0];
    d[(i*8+7)..(i*8)] =
        if (shx <_s 0xFF80) then { vxsat = 1; 0x80 }
            else if (shx >_s 0x007F) then { vxsat = 1; 0x7F }
                else shx[7..0];
}
X(rd) = d;
```

RV32 PNCLIPRI.B:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[3..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx : bits(17) = ((sign_extend(32, s1_h) @ 0b0) >> shamt)[16..0];
    let round_shx : bits(16) = (shx + 1)[16..1];
    d[(i*8+7)..(i*8)] =
        if (round_shx <_s 0xFF80) then { vxsat = 1; 0x80 }
            else if (round_shx >_s 0x007F) then { vxsat = 1; 0x7F }
                else round_shx[7..0];
}
X(rd) = d;
```

RV32 PNCLIPR.BS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx : bits(17) = ((sign_extend(48, s1_h) @ 0b0) >> shamt)[16..0];
    let round_shx : bits(16) = (shx + 1)[16..1];
    d[(i*8+7)..(i*8)] =
        if (round_shx <_s 0xFF80) then { vxsat = 1; 0x80 }
            else if (round_shx >_s 0x007F) then { vxsat = 1; 0x7F }
                else round_shx[7..0];
}
X(rd) = d;
```

RV32 PNCLIPIU.B:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[3..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx = s1_h >> shamt;
    d[(i*8+7)..(i*8)] =
        if (shx >_u 0x00FF) then { vxsat = 1; 0xFF } else shx[7..0];
}
X(rd) = d;
```

RV32 PNCLIPU.BS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx = (zero_extend(32, s1_h) >> shamt)[15..0];
    d[(i*8+7)..(i*8)] =
        if (shx >_u 0x00FF) then { vxsat = 1; 0xFF } else shx[7..0];
}
X(rd) = d;
```

RV32 PNCLIPRIU.B:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[3..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx : bits(17) = (s1_h @ 0b0) >> shamt;
    let round_shx : bits(16) = (shx + 1)[16..1];
    d[(i*8+7)..(i*8)] =
        if (round_shx >_u 0x00FF) then { vxsat = 1; 0xFF }
            else round_shx[7..0];
}
X(rd) = d;
```

RV32 PNCLIPRU.BS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 3) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let shx : bits(17) = ((zero_extend(32, s1_h) @ 0b0) >> shamt)[16..0];
    let round_shx : bits(16) = (shx + 1)[16..1];
    d[(i*8+7)..(i*8)] =
        if (round_shx >_u 0x00FF) then { vxsat = 1; 0xFF }
            else round_shx[7..0];
}
X(rd) = d;
```

RV32 PNSRLI.H:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[4..0];
var d : bits(32);
d[15..0]  = (s1[31..0]  >> shamt)[15..0];
d[31..16] = (s1[63..32] >> shamt)[15..0];
X(rd) = d;
```

RV32 PNSRL.HS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
d[15..0]  = (s1[31..0]  >> shamt)[15..0];
d[31..16] = (s1[63..32] >> shamt)[15..0];
X(rd) = d;
```

RV32 PNSRAI.H:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[4..0];
var d : bits(32);
d[15..0]  = (sign_extend(48, s1[31..0]))  >> shamt)[15..0];
d[31..16] = (sign_extend(48, s1[63..32])) >> shamt)[15..0];
X(rd) = d;
```

RV32 PNSRA.HS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
d[15..0]  = (sign_extend(48, s1[31..0]))  >> shamt)[15..0];
d[31..16] = (sign_extend(48, s1[63..32])) >> shamt)[15..0];
X(rd) = d;
```

RV32 PNSRARI.H:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx : bits(17) = ((sign_extend(48, s1_w) @ 0b0) >> shamt)[16..0];
    d[(i*16+15)..(i*16)] = (shx + 1)[17..1];
}
X(rd) = d;
```

RV32 PNSRAR.HS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx : bits(17) = ((sign_extend(48, s1_w) @ 0b0) >> shamt)[16..0];
    d[(i*16+15)..(i*16)] = (shx + 1)[17..1];
}
X(rd) = d;
```

RV32 PNCLIPI.H:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx : bits(32) = (sign_extend(64, s1_w) >> shamt)[31..0];
    d[(i*16+15)..(i*16)] =
        if (shx <_s 0xFFFF8000) then { vxsat = 1; 0x8000 }
            else if (shx >_s 0x00007FFF) then { vxsat = 1; 0x7FFF }
                else shx[15..0];
}
X(rd) = d;
```

RV32 PNCLIP.HS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx : bits(32) = (sign_extend(64, s1_w) >> shamt)[31..0];
    d[(i*16+15)..(i*16)] =
        if (shx <_s 0xFFFF8000) then { vxsat = 1; 0x8000 }
            else if (shx >_s 0x00007FFF) then { vxsat = 1; 0x7FFF }
                else shx[15..0];
}
X(rd) = d;
```

RV32 PNCLIPRI.H:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx : bits(33) = ((sign_extend(64, s1_w) @ 0b0) >> shamt)[32..0];
    let round_shx : bits(32) = (shx + 1)[32..1];
    d[(i*16+15)..(i*16)] =
        if (round_shx <_s 0xFFFF8000) then { vxsat = 1; 0x8000 }
            else if (round_shx >_s 0x00007FFF) then { vxsat = 1; 0x7FFF }
                else round_shx[15..0];
}
X(rd) = d;
```

RV32 PNCLIPR.HS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx : bits(33) = ((sign_extend(64, s1_w) @ 0b0) >> shamt)[32..0];
    let round_shx : bits(32) = (shx + 1)[32..1];
    d[(i*16+15)..(i*16)] =
        if (round_shx <_s 0xFFFF8000) then { vxsat = 1; 0x8000 }
            else if (round_shx >_s 0x00007FFF) then { vxsat = 1; 0x7FFF }
                else round_shx[15..0];
}
X(rd) = d;
```

RV32 PNCLIPIU.H:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx = s1_w >> shamt;
    d[(i*16+15)..(i*16)] =
        if (shx >_u 0x0000FFFF) then { vxsat = 1; 0xFFFF } else shx[15..0];
}
X(rd) = d;
```

RV32 PNCLIPU.HS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx = s1_w >> shamt;
    d[(i*16+15)..(i*16)] =
        if (shx >_u 0x0000FFFF) then { vxsat = 1; 0xFFFF } else shx[15..0];
}
X(rd) = d;
```

RV32 PNCLIPRIU.H:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx : bits(33) = (s1_w @ 0b0) >> shamt;
    let round_shx : bits(32) = (shx + 1)[32..1];
    d[(i*16+15)..(i*16)] =
        if (round_shx >_u 0x0000FFFF) then { vxsat = 1; 0xFFFF }
            else round_shx[15..0];
}
X(rd) = d;
```

RV32 PNCLIPRU.HS:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[4..0];
var d : bits(32);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let shx : bits(33) = (s1_w @ 0b0) >> shamt;
    let round_shx : bits(32) = (shx + 1)[32..1];
    d[(i*16+15)..(i*16)] =
        if (round_shx >_u 0x0000FFFF) then { vxsat = 1; 0xFFFF }
            else round_shx[15..0];
}
X(rd) = d;
```

RV32 NSRLI:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[5..0];
X(rd) = (s1 >> shamt)[31..0];
```

RV32 NSRL:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[5..0];
X(rd) = (s1 >> shamt)[31..0];
```

RV32 NSRAI:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[5..0];
X(rd) = (sign_extend(96, s1) >> shamt)[31..0];
```

RV32 NSRA:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[5..0];
X(rd) = (sign_extend(96, s1) >> shamt)[31..0];
```

RV32 NSRARI:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[5..0];
let shx : bits(33) = ((sign_extend(96, s1) @ 0b0) >> shamt)[32..0];
X(rd) = (shx + 1)[32..1];
```

RV32 NSRAR:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[5..0];
let shx : bits(33) = ((sign_extend(96, s1) @ 0b0) >> shamt)[32..0];
X(rd) = (shx + 1)[32..1];
```

RV32 NCLIPI:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[5..0];
let shx : bits(64) = (sign_extend(128, s1) >> shamt)[63..0];
X(rd) =
    if (shx <_s 0xFFFFFFFF80000000) then { vxsat = 1; 0x80000000 }
        else if (shx >_s 0x000000007FFFFFFF) then { vxsat = 1; 0x7FFFFFFF }
            else shx[31..0];
```

RV32 NCLIP:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[5..0];
let shx : bits(64) = (sign_extend(128, s1) >> shamt)[63..0];
X(rd) =
    if (shx <_s 0xFFFFFFFF80000000) then { vxsat = 1; 0x80000000 }
        else if (shx >_s 0x000000007FFFFFFF) then { vxsat = 1; 0x7FFFFFFF }
            else shx[31..0];
```

RV32 NCLIPRI:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[5..0];
let shx : bits(65) = ((sign_extend(128, s1) @ 0b0) >> shamt)[64..0];
let round_shx : bits(64) = (shx + 1)[64..1];
X(rd) =
    if (round_shx <_s 0xFFFFFFFF80000000) then { vxsat = 1; 0x80000000 }
        else if (round_shx >_s 0x000000007FFFFFFF)
            then { vxsat = 1; 0x7FFFFFFF } else round_shx[31..0];
```

RV32 NCLIPR:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[5..0];
let shx : bits(65) = ((sign_extend(128, s1) @ 0b0) >> shamt)[64..0];
let round_shx : bits(64) = (shx + 1)[64..1];
X(rd) =
    if (round_shx <_s 0xFFFFFFFF80000000) then { vxsat = 1; 0x80000000 }
        else if (round_shx >_s 0x000000007FFFFFFF)
            then { vxsat = 1; 0x7FFFFFFF } else round_shx[31..0];
```

RV32 NCLIPIU:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[5..0];
let shx = s1 >> shamt;
X(rd) =
    if (shx >_u 0x00000000FFFFFFFF) then { vxsat = 1; 0xFFFFFFFF }
        else shx[31..0];
```

RV32 NCLIPU:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[5..0];
let shx = s1 >> shamt;
X(rd) =
    if (shx >_u 0x00000000FFFFFFFF) then { vxsat = 1; 0xFFFFFFFF }
        else shx[31..0];
```

RV32 NCLIPRIU:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = w_uimm[5..0];
let shx : bits(65) = (s1 @ 0b0) >> shamt;
let round_shx : bits(64) = (shx + 1)[64..1];
X(rd) =
    if (round_shx >_u 0x00000000FFFFFFFF) then { vxsat = 1; 0xFFFFFFFF }
        else round_shx[31..0];
```

RV32 NCLIPRU:

```
let s1 : bits(64) =
    if (rs1_p == 0x0) then zeros() else X(rs1_p*2+1) @ X(rs1_p*2);
let shamt = X(rs2)[5..0];
let shx : bits(65) = (s1 @ 0b0) >> shamt;
let round_shx : bits(64) = (shx + 1)[64..1];
X(rd) =
    if (round_shx >_u 0x00000000FFFFFFFF) then { vxsat = 1; 0xFFFFFFFF }
        else round_shx[31..0];
```

PMULH.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        to_bits(32, signed(s1_h) * signed(s2_h))[31..16];
}
X(rd) = d;
```

PMULHR.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        to_bits(32, signed(s1_h) * signed(s2_h) + 2^15)[31..16];
}
X(rd) = d;
```

PMULHSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        to_bits(32, signed(s1_h) * unsigned(s2_h))[31..16];
}
X(rd) = d;
```

PMULHRSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        to_bits(32, signed(s1_h) * unsigned(s2_h) + 2^15)[31..16];
}
X(rd) = d;
```

PMULHU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        to_bits(32, unsigned(s1_h) * unsigned(s2_h))[31..16];
}
X(rd) = d;
```

PMULHRU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        to_bits(32, unsigned(s1_h) * unsigned(s2_h) + 2^15)[31..16];
}
X(rd) = d;
```

PMULQR.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        if (s1_h == 0x8000) & (s2_h == 0x8000) then { vxsat = 1; 0x7FFF }
            else to_bits(32, signed(s1_h) * signed(s2_h) + 2^14)[30..15];
}
X(rd) = d;
```

PMHACC.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(32, signed(s1_h) * signed(s2_h))[31..16];
}
X(rd) = d;
```

PMHRACC.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(32, signed(s1_h) * signed(s2_h) + 2^15)[31..16];
}
X(rd) = d;
```

PMHACCSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(32, signed(s1_h) * unsigned(s2_h))[31..16];
}
X(rd) = d;
```

PMHRACCSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(32, signed(s1_h) * unsigned(s2_h) + 2^15)[31..16];
}
X(rd) = d;
```

PMHACCU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(32, unsigned(s1_h) * unsigned(s2_h))[31..16];
}
X(rd) = d;
```

PMHRACCU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(32, unsigned(s1_h) * unsigned(s2_h) + 2^15)[31..16];
}
X(rd) = d;
```

RV32 MULHRSU:

```
X(rd) = to_bits(64, signed(X(rs1)) * unsigned(X(rs2)) + 2^31)[63..32];
```

RV32 MULHRU:

```
X(rd) = to_bits(64, unsigned(X(rs1)) * unsigned(X(rs2)) + 2^31)[63..32];
```

RV32 MHACC:

```
X(rd) = X(rd) + to_bits(64, signed(X(rs1)) * signed(X(rs2)))[63..32];
```

RV32 MHRACC:

```
X(rd) =
    X(rd) + to_bits(64, signed(X(rs1)) * signed(X(rs2)) + 2^31)[63..32];
```

RV32 MHACCSU:

```
X(rd) = X(rd) + to_bits(64, signed(X(rs1)) * unsigned(X(rs2)))[63..32];
```

RV32 MHRACCSU:

```
X(rd) =
    X(rd) + to_bits(64, signed(X(rs1)) * unsigned(X(rs2)) + 2^31)[63..32];
```

RV32 MHACCU:

```
X(rd) = X(rd) + to_bits(64, unsigned(X(rs1)) * unsigned(X(rs2)))[63..32];
```

RV32 MHRACCU:

```
X(rd) =
    X(rd)
        + to_bits(64, unsigned(X(rs1)) * unsigned(X(rs2)) + 2^31)[63..32];
```

RV64 PMULHSU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        to_bits(64, signed(s1_w) * unsigned(s2_w))[63..32];
}
X(rd) = d;
```

RV64 PMULHRSU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        to_bits(64, signed(s1_w) * unsigned(s2_w) + 2^31)[63..32];
}
X(rd) = d;
```

RV64 PMULHU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        to_bits(64, unsigned(s1_w) * unsigned(s2_w))[63..32];
}
X(rd) = d;
```

RV64 PMULHRU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        to_bits(64, unsigned(s1_w) * unsigned(s2_w) + 2^31)[63..32];
}
X(rd) = d;
```

RV64 PMHACC.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(64, signed(s1_w) * signed(s2_w))[63..32];
}
X(rd) = d;
```

RV64 PMHRACC.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(64, signed(s1_w) * signed(s2_w) + 2^31)[63..32];
}
X(rd) = d;
```

RV64 PMHACCSU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(64, signed(s1_w) * unsigned(s2_w))[63..32];
}
X(rd) = d;
```

RV64 PMHRACCSU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(64, signed(s1_w) * unsigned(s2_w) + 2^31)[63..32];
}
X(rd) = d;
```

RV64 PMHACCU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(64, unsigned(s1_w) * unsigned(s2_w))[63..32];
}
X(rd) = d;
```

RV64 PMHRACCU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_w = s1[(i*32+31)..(i*32)];
    let s2_w = s2[(i*32+31)..(i*32)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(64, unsigned(s1_w) * unsigned(s2_w) + 2^31)[63..32];
}
X(rd) = d;
```

RV32 MQACC.H00:

```
let s1_h0 = X(rs1)[15..0];
let s2_h0 = X(rs2)[15..0];
X(rd) = X(rd) + to_bits(47, signed(s1_h0) * signed(s2_h0))[46..15];
```

RV32 MQACC.H01:

```
let s1_h0 = X(rs1)[15..0];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(47, signed(s1_h0) * signed(s2_h1))[46..15];
```

RV32 MQACC.H11:

```
let s1_h1 = X(rs1)[31..16];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(47, signed(s1_h1) * signed(s2_h1))[46..15];
```

RV32 MQRACC.H00:

```
let s1_h0 = X(rs1)[15..0];
let s2_h0 = X(rs2)[15..0];
X(rd) = X(rd) + to_bits(47, signed(s1_h0) * signed(s2_h0) + 2^14)[46..15];
```

RV32 MQRACC.H01:

```
let s1_h0 = X(rs1)[15..0];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(47, signed(s1_h0) * signed(s2_h1) + 2^14)[46..15];
```

RV32 MQRACC.H11:

```
let s1_h1 = X(rs1)[31..16];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(47, signed(s1_h1) * signed(s2_h1) + 2^14)[46..15];
```

RV64 PMQACC.W.H00:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h0) * signed(s2_h0))[46..15];
}
X(rd) = d;
```

RV64 PMQACC.W.H01:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h0) * signed(s2_h1))[46..15];
}
X(rd) = d;
```

RV64 PMQACC.W.H11:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h1) * signed(s2_h1))[46..15];
}
X(rd) = d;
```

RV64 PMQRACC.W.H00:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h0) * signed(s2_h0) + 2^14)[46..15];
}
X(rd) = d;
```

RV64 PMQRACC.W.H01:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h0) * signed(s2_h1) + 2^14)[46..15];
}
X(rd) = d;
```

RV64 PMQRACC.W.H11:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d = X(rd);
foreach (i from 0 to 1) {
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h1) * signed(s2_h1) + 2^14)[46..15];
}
X(rd) = d;
```

PMQ2ADD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    d[(i*32+31)..(i*32)] =
          to_bits(47, signed(s1_h0) * signed(s2_h0))[46..15]
        + to_bits(47, signed(s1_h1) * signed(s2_h1))[46..15];
}
X(rd) = d;
```

PMQ2ADDA.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h0) * signed(s2_h0))[46..15]
            + to_bits(47, signed(s1_h1) * signed(s2_h1))[46..15];
}
X(rd) = d;
```

PMQR2ADD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    d[(i*32+31)..(i*32)] =
          to_bits(47, signed(s1_h0) * signed(s2_h0) + 2^14)[46..15]
        + to_bits(47, signed(s1_h1) * signed(s2_h1) + 2^14)[46..15];
}
X(rd) = d;
```

PMQR2ADDA.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h0) * signed(s2_h0) + 2^14)[46..15]
            + to_bits(47, signed(s1_h1) * signed(s2_h1) + 2^14)[46..15];
}
X(rd) = d;
```

RV64 MQACC.W00:

```
let s1_w0 = X(rs1)[31..0];
let s2_w0 = X(rs2)[31..0];
X(rd) = X(rd) + to_bits(95, signed(s1_w0) * signed(s2_w0))[94..31];
```

RV64 MQACC.W01:

```
let s1_w0 = X(rs1)[31..0];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(95, signed(s1_w0) * signed(s2_w1))[94..31];
```

RV64 MQACC.W11:

```
let s1_w1 = X(rs1)[63..32];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(95, signed(s1_w1) * signed(s2_w1))[94..31];
```

RV64 MQRACC.W00:

```
let s1_w0 = X(rs1)[31..0];
let s2_w0 = X(rs2)[31..0];
X(rd) = X(rd) + to_bits(95, signed(s1_w0) * signed(s2_w0) + 2^30)[94..31];
```

RV64 MQRACC.W01:

```
let s1_w0 = X(rs1)[31..0];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(95, signed(s1_w0) * signed(s2_w1) + 2^30)[94..31];
```

RV64 MQRACC.W11:

```
let s1_w1 = X(rs1)[63..32];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(95, signed(s1_w1) * signed(s2_w1) + 2^30)[94..31];
```

RV64 PMQ2ADD.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(95, signed(s1[31..0])  * signed(s2[31..0]) )[94..31]
    + to_bits(95, signed(s1[63..32]) * signed(s2[63..32]))[94..31];
```

RV64 PMQ2ADDA.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    X(rd) + to_bits(95, signed(s1[31..0])  * signed(s2[31..0]) )[94..31]
          + to_bits(95, signed(s1[63..32]) * signed(s2[63..32]))[94..31];
```

RV64 PMQR2ADD.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(95, signed(s1[31..0])  * signed(s2[31..0])  + 2^30)[94..31]
    + to_bits(95, signed(s1[63..32]) * signed(s2[63..32]) + 2^30)[94..31];
```

RV64 PMQR2ADDA.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    X(rd)
        + to_bits(95, signed(s1[31..0])  * signed(s2[31..0])  + 2^30)[
              94..31]
        + to_bits(95, signed(s1[63..32]) * signed(s2[63..32]) + 2^30)[
              94..31];
```

PMUL.H.B00:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_b0 = s1[(i*16+7)..(i*16)];
    let s2_b0 = s2[(i*16+7)..(i*16)];
    d[(i*16+15)..(i*16)] = to_bits(16, signed(s1_b0) * signed(s2_b0));
}
X(rd) = d;
```

PMUL.H.B01:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_b0 = s1[(i*16+7)..(i*16)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    d[(i*16+15)..(i*16)] = to_bits(16, signed(s1_b0) * signed(s2_b1));
}
X(rd) = d;
```

PMUL.H.B11:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_b1 = s1[(i*16+15)..(i*16+8)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    d[(i*16+15)..(i*16)] = to_bits(16, signed(s1_b1) * signed(s2_b1));
}
X(rd) = d;
```

PMULSU.H.B00:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_b0 = s1[(i*16+7)..(i*16)];
    let s2_b0 = s2[(i*16+7)..(i*16)];
    d[(i*16+15)..(i*16)] = to_bits(16, signed(s1_b0) * unsigned(s2_b0));
}
X(rd) = d;
```

PMULSU.H.B11:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_b1 = s1[(i*16+15)..(i*16+8)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    d[(i*16+15)..(i*16)] = to_bits(16, signed(s1_b1) * unsigned(s2_b1));
}
X(rd) = d;
```

PMULU.H.B00:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_b0 = s1[(i*16+7)..(i*16)];
    let s2_b0 = s2[(i*16+7)..(i*16)];
    d[(i*16+15)..(i*16)] = to_bits(16, unsigned(s1_b0) * unsigned(s2_b0));
}
X(rd) = d;
```

PMULU.H.B01:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_b0 = s1[(i*16+7)..(i*16)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    d[(i*16+15)..(i*16)] = to_bits(16, unsigned(s1_b0) * unsigned(s2_b1));
}
X(rd) = d;
```

PMULU.H.B11:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_b1 = s1[(i*16+15)..(i*16+8)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    d[(i*16+15)..(i*16)] = to_bits(16, unsigned(s1_b1) * unsigned(s2_b1));
}
X(rd) = d;
```

RV32 MULSU.H00:

```
let s1_h0 = X(rs1)[15..0];
let s2_h0 = X(rs2)[15..0];
X(rd) = to_bits(32, signed(s1_h0) * unsigned(s2_h0));
```

RV32 MULSU.H11:

```
let s1_h1 = X(rs1)[31..16];
let s2_h1 = X(rs2)[31..16];
X(rd) = to_bits(32, signed(s1_h1) * unsigned(s2_h1));
```

RV32 MULU.H00:

```
let s1_h0 = X(rs1)[15..0];
let s2_h0 = X(rs2)[15..0];
X(rd) = to_bits(32, unsigned(s1_h0) * unsigned(s2_h0));
```

RV32 MULU.H01:

```
let s1_h0 = X(rs1)[15..0];
let s2_h1 = X(rs2)[31..16];
X(rd) = to_bits(32, unsigned(s1_h0) * unsigned(s2_h1));
```

RV32 MULU.H11:

```
let s1_h1 = X(rs1)[31..16];
let s2_h1 = X(rs2)[31..16];
X(rd) = to_bits(32, unsigned(s1_h1) * unsigned(s2_h1));
```

RV32 MACC.H00:

```
let s1_h0 = X(rs1)[15..0];
let s2_h0 = X(rs2)[15..0];
X(rd) = X(rd) + to_bits(32, signed(s1_h0) * signed(s2_h0));
```

RV32 MACC.H01:

```
let s1_h0 = X(rs1)[15..0];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(32, signed(s1_h0) * signed(s2_h1));
```

RV32 MACC.H11:

```
let s1_h1 = X(rs1)[31..16];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(32, signed(s1_h1) * signed(s2_h1));
```

RV32 MACCSU.H00:

```
let s1_h0 = X(rs1)[15..0];
let s2_h0 = X(rs2)[15..0];
X(rd) = X(rd) + to_bits(32, signed(s1_h0) * unsigned(s2_h0));
```

RV32 MACCSU.H11:

```
let s1_h1 = X(rs1)[31..16];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(32, signed(s1_h1) * unsigned(s2_h1));
```

RV32 MACCU.H00:

```
let s1_h0 = X(rs1)[15..0];
let s2_h0 = X(rs2)[15..0];
X(rd) = X(rd) + to_bits(32, unsigned(s1_h0) * unsigned(s2_h0));
```

RV32 MACCU.H01:

```
let s1_h0 = X(rs1)[15..0];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(32, unsigned(s1_h0) * unsigned(s2_h1));
```

RV32 MACCU.H11:

```
let s1_h1 = X(rs1)[31..16];
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(32, unsigned(s1_h1) * unsigned(s2_h1));
```

RV64 PMULSU.W.H00:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, signed(s1[15..0])  * unsigned(s2[15..0]) );
let d_w1 = to_bits(32, signed(s1[47..32]) * unsigned(s2[47..32]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMULSU.W.H11:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, signed(s1[31..16]) * unsigned(s2[31..16]));
let d_w1 = to_bits(32, signed(s1[63..48]) * unsigned(s2[63..48]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMULU.W.H00:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, unsigned(s1[15..0])  * unsigned(s2[15..0]) );
let d_w1 = to_bits(32, unsigned(s1[47..32]) * unsigned(s2[47..32]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMULU.W.H01:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, unsigned(s1[15..0])  * unsigned(s2[31..16]));
let d_w1 = to_bits(32, unsigned(s1[47..32]) * unsigned(s2[63..48]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMULU.W.H11:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, unsigned(s1[31..16]) * unsigned(s2[31..16]));
let d_w1 = to_bits(32, unsigned(s1[63..48]) * unsigned(s2[63..48]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMACC.W.H00:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]  + to_bits(32, signed(s1[15..0])  * signed(s2[15..0]) );
let d_w1 =
    din[63..32] + to_bits(32, signed(s1[47..32]) * signed(s2[47..32]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMACC.W.H01:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]  + to_bits(32, signed(s1[15..0])  * signed(s2[31..16]));
let d_w1 =
    din[63..32] + to_bits(32, signed(s1[47..32]) * signed(s2[63..48]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMACC.W.H11:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]  + to_bits(32, signed(s1[31..16]) * signed(s2[31..16]));
let d_w1 =
    din[63..32] + to_bits(32, signed(s1[63..48]) * signed(s2[63..48]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMACCSU.W.H00:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]  + to_bits(32, signed(s1[15..0])  * unsigned(s2[15..0]) );
let d_w1 =
    din[63..32] + to_bits(32, signed(s1[47..32]) * unsigned(s2[47..32]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMACCSU.W.H11:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]  + to_bits(32, signed(s1[31..16]) * unsigned(s2[31..16]));
let d_w1 =
    din[63..32] + to_bits(32, signed(s1[63..48]) * unsigned(s2[63..48]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMACCU.W.H00:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]  + to_bits(32, unsigned(s1[15..0])  * unsigned(s2[15..0]) );
let d_w1 =
    din[63..32] + to_bits(32, unsigned(s1[47..32]) * unsigned(s2[47..32]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMACCU.W.H01:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]  + to_bits(32, unsigned(s1[15..0])  * unsigned(s2[31..16]));
let d_w1 =
    din[63..32] + to_bits(32, unsigned(s1[47..32]) * unsigned(s2[63..48]));
X(rd) = d_w1 @ d_w0;
```

RV64 PMACCU.W.H11:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]  + to_bits(32, unsigned(s1[31..16]) * unsigned(s2[31..16]));
let d_w1 =
    din[63..32] + to_bits(32, unsigned(s1[63..48]) * unsigned(s2[63..48]));
X(rd) = d_w1 @ d_w0;
```

PM2ADD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    d[(i*32+31)..(i*32)] =
          to_bits(32, signed(s1_h0) * signed(s2_h0));
        + to_bits(32, signed(s1_h1) * signed(s2_h1));
}
X(rd) = d;
```

PM2ADDA.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(32, signed(s1_h0) * signed(s2_h0))
            + to_bits(32, signed(s1_h1) * signed(s2_h1));
}
X(rd) = d;
```

PM2ADDSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    d[(i*32+31)..(i*32)] =
          to_bits(32, signed(s1_h0) * unsigned(s2_h0))
        + to_bits(32, signed(s1_h1) * unsigned(s2_h1));
}
X(rd) = d;
```

PM2ADDASU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(32, signed(s1_h0) * unsigned(s2_h0))
            + to_bits(32, signed(s1_h1) * unsigned(s2_h1));
}
X(rd) = d;
```

PM2ADDU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    d[(i*32+31)..(i*32)] =
          to_bits(32, unsigned(s1_h0) * unsigned(s2_h0))
        + to_bits(32, unsigned(s1_h1) * unsigned(s2_h1));
}
X(rd) = d;
```

PM2ADDAU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(32, unsigned(s1_h0) * unsigned(s2_h0))
            + to_bits(32, unsigned(s1_h1) * unsigned(s2_h1));
}
X(rd) = d;
```

PM2ADD.HX:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    d[(i*32+31)..(i*32)] =
          to_bits(32, signed(s1_h0) * signed(s2_h1))
        + to_bits(32, signed(s1_h1) * signed(s2_h0));
}
X(rd) = d;
```

PM2ADDA.HX:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(32, signed(s1_h0) * signed(s2_h1))
            + to_bits(32, signed(s1_h1) * signed(s2_h0));
}
X(rd) = d;
```

PM2SUBA.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(32, signed(s1_h0) * signed(s2_h0))
            - to_bits(32, signed(s1_h1) * signed(s2_h1));
}
X(rd) = d;
```

PM2SUBA.HX:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_h0 = s1[(i*32+15)..(i*32)];
    let s1_h1 = s1[(i*32+31)..(i*32+16)];
    let s2_h0 = s2[(i*32+15)..(i*32)];
    let s2_h1 = s2[(i*32+31)..(i*32+16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(32, signed(s1_h0) * signed(s2_h1))
            - to_bits(32, signed(s1_h1) * signed(s2_h0));
}
X(rd) = d;
```

RV64 MULSU.W00:

```
let s1_w0 = X(rs1)[31..0];
let s2_w0 = X(rs2)[31..0];
X(rd) = to_bits(64, signed(s1_w0) * unsigned(s2_w0));
```

RV64 MULSU.W11:

```
let s1_w1 = X(rs1)[63..32];
let s2_w1 = X(rs2)[63..32];
X(rd) = to_bits(64, signed(s1_w1) * unsigned(s2_w1));
```

RV64 MULU.W00:

```
let s1_w0 = X(rs1)[31..0];
let s2_w0 = X(rs2)[31..0];
X(rd) = to_bits(64, unsigned(s1_w0) * unsigned(s2_w0));
```

RV64 MULU.W01:

```
let s1_w0 = X(rs1)[31..0];
let s2_w1 = X(rs2)[63..32];
X(rd) = to_bits(64, unsigned(s1_w0) * unsigned(s2_w1));
```

RV64 MULU.W11:

```
let s1_w1 = X(rs1)[63..32];
let s2_w1 = X(rs2)[63..32];
X(rd) = to_bits(64, unsigned(s1_w1) * unsigned(s2_w1));
```

RV64 MACC.W00:

```
let s1_w0 = X(rs1)[31..0];
let s2_w0 = X(rs2)[31..0];
X(rd) = X(rd) + to_bits(64, signed(s1_w0) * signed(s2_w0));
```

RV64 MACC.W01:

```
let s1_w0 = X(rs1)[31..0];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(64, signed(s1_w0) * signed(s2_w1));
```

RV64 MACC.W11:

```
let s1_w1 = X(rs1)[63..32];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(64, signed(s1_w1) * signed(s2_w1));
```

RV64 MACCSU.W00:

```
let s1_w0 = X(rs1)[31..0];
let s2_w0 = X(rs2)[31..0];
X(rd) = X(rd) + to_bits(64, signed(s1_w0) * unsigned(s2_w0));
```

RV64 MACCSU.W11:

```
let s1_w1 = X(rs1)[63..32];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(64, signed(s1_w1) * unsigned(s2_w1));
```

RV64 MACCU.W00:

```
let s1_w0 = X(rs1)[31..0];
let s2_w0 = X(rs2)[31..0];
X(rd) = X(rd) + to_bits(64, unsigned(s1_w0) * unsigned(s2_w0));
```

RV64 MACCU.W01:

```
let s1_w0 = X(rs1)[31..0];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(64, unsigned(s1_w0) * unsigned(s2_w1));
```

RV64 MACCU.W11:

```
let s1_w1 = X(rs1)[63..32];
let s2_w1 = X(rs2)[63..32];
X(rd) = X(rd) + to_bits(64, unsigned(s1_w1) * unsigned(s2_w1));
```

RV64 PM2ADD.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(64, signed(s1[31..0])  * signed(s2[31..0]) )
    + to_bits(64, signed(s1[63..32]) * signed(s2[63..32]));
```

RV64 PM2ADDSU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(64, signed(s1[31..0])  * unsigned(s2[31..0] ))
    + to_bits(64, signed(s1[63..32]) * unsigned(s2[63..32]));
```

RV64 PM2ADDASU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    X(rd) + to_bits(64, signed(s1[31..0])  * unsigned(s2[31..0]) )
          + to_bits(64, signed(s1[63..32]) * unsigned(s2[63..32]));
```

RV64 PM2ADDU.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(64, unsigned(s1[31..0])  * unsigned(s2[31..0]) )
    + to_bits(64, unsigned(s1[63..32]) * unsigned(s2[63..32]));
```

RV64 PM2ADD.WX:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(64, signed(s1[31..0])  * signed(s2[63..32]))
    + to_bits(64, signed(s1[63..32]) * signed(s2[31..0]) );
```

RV64 PM2ADDA.WX:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    X(rd) + to_bits(64, signed(s1[31..0])  * signed(s2[63..32]))
          + to_bits(64, signed(s1[63..32]) * signed(s2[31..0]) );
```

RV64 PM2SUBA.W:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    X(rd) + to_bits(64, signed(s1[31..0])  * signed(s2[31..0]) )
          - to_bits(64, signed(s1[63..32]) * signed(s2[63..32]));
```

RV64 PM2SUBA.WX:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    X(rd) + to_bits(64, signed(s1[31..0])  * signed(s2[63..32]))
          - to_bits(64, signed(s1[63..32]) * signed(s2[31..0]) );
```

PM4ADD.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_b0 = s1[(i*32+7)..(i*32)];
    let s1_b1 = s1[(i*32+15)..(i*32+8)];
    let s1_b2 = s1[(i*32+23)..(i*32+16)];
    let s1_b3 = s1[(i*32+31)..(i*32+24)];
    let s2_b0 = s2[(i*32+7)..(i*32)];
    let s2_b1 = s2[(i*32+15)..(i*32+8)];
    let s2_b2 = s2[(i*32+23)..(i*32+16)];
    let s2_b3 = s2[(i*32+31)..(i*32+24)];
    d[(i*32+31)..(i*32)] =
          to_bits(32, signed(s1_b0) * signed(s2_b0))
        + to_bits(32, signed(s1_b1) * signed(s2_b1))
        + to_bits(32, signed(s1_b2) * signed(s2_b2))
        + to_bits(32, signed(s1_b3) * signed(s2_b3));
}
X(rd) = d;
```

PM4ADDSU.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_b0 = s1[(i*32+7)..(i*32)];
    let s1_b1 = s1[(i*32+15)..(i*32+8)];
    let s1_b2 = s1[(i*32+23)..(i*32+16)];
    let s1_b3 = s1[(i*32+31)..(i*32+24)];
    let s2_b0 = s2[(i*32+7)..(i*32)];
    let s2_b1 = s2[(i*32+15)..(i*32+8)];
    let s2_b2 = s2[(i*32+23)..(i*32+16)];
    let s2_b3 = s2[(i*32+31)..(i*32+24)];
    d[(i*32+31)..(i*32)] =
          to_bits(32, signed(s1_b0) * unsigned(s2_b0))
        + to_bits(32, signed(s1_b1) * unsigned(s2_b1))
        + to_bits(32, signed(s1_b2) * unsigned(s2_b2))
        + to_bits(32, signed(s1_b3) * unsigned(s2_b3));
}
X(rd) = d;
```

PM4ADDU.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/4 - 1) {
    let s1_b0 = s1[(i*32+7)..(i*32)];
    let s1_b1 = s1[(i*32+15)..(i*32+8)];
    let s1_b2 = s1[(i*32+23)..(i*32+16)];
    let s1_b3 = s1[(i*32+31)..(i*32+24)];
    let s2_b0 = s2[(i*32+7)..(i*32)];
    let s2_b1 = s2[(i*32+15)..(i*32+8)];
    let s2_b2 = s2[(i*32+23)..(i*32+16)];
    let s2_b3 = s2[(i*32+31)..(i*32+24)];
    d[(i*32+31)..(i*32)] =
          to_bits(32, unsigned(s1_b0) * unsigned(s2_b0))
        + to_bits(32, unsigned(s1_b1) * unsigned(s2_b1))
        + to_bits(32, unsigned(s1_b2) * unsigned(s2_b2))
        + to_bits(32, unsigned(s1_b3) * unsigned(s2_b3));
}
X(rd) = d;
```

RV64 PM4ADD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(64, signed(s1[15..0])  * signed(s2[15..0]) )
    + to_bits(64, signed(s1[31..16]) * signed(s2[31..16]))
    + to_bits(64, signed(s1[47..32]) * signed(s2[47..32]))
    + to_bits(64, signed(s1[63..48]) * signed(s2[63..48]));
```

RV64 PM4ADDSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(64, signed(s1[15..0])  * unsigned(s2[15..0]) )
    + to_bits(64, signed(s1[31..16]) * unsigned(s2[31..16]))
    + to_bits(64, signed(s1[47..32]) * unsigned(s2[47..32]))
    + to_bits(64, signed(s1[63..48]) * unsigned(s2[63..48]));
```

RV64 PM4ADDASU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    X(rd) + to_bits(64, signed(s1[15..0])  * unsigned(s2[15..0]) )
          + to_bits(64, signed(s1[31..16]) * unsigned(s2[31..16]))
          + to_bits(64, signed(s1[47..32]) * unsigned(s2[47..32]))
          + to_bits(64, signed(s1[63..48]) * unsigned(s2[63..48]));
```

RV64 PM4ADDU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
      to_bits(64, unsigned(s1[15..0])  * unsigned(s2[15..0]) )
    + to_bits(64, unsigned(s1[31..16]) * unsigned(s2[31..16]))
    + to_bits(64, unsigned(s1[47..32]) * unsigned(s2[47..32]))
    + to_bits(64, unsigned(s1[63..48]) * unsigned(s2[63..48]));
```

RV64 PM4ADDAU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
X(rd) =
    X(rd) + to_bits(64, unsigned(s1[15..0])  * unsigned(s2[15..0]) )
          + to_bits(64, unsigned(s1[31..16]) * unsigned(s2[31..16]))
          + to_bits(64, unsigned(s1[47..32]) * unsigned(s2[47..32]))
          + to_bits(64, unsigned(s1[63..48]) * unsigned(s2[63..48]));
```

PMULH.H.B0:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_b0 = s2[(i*16+7)..(i*16)];
    d[(i*16+15)..(i*16)] =
        to_bits(24, signed(s1_h) * signed(s2_b0))[23..8];
}
X(rd) = d;
```

PMULH.H.B1:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    d[(i*16+15)..(i*16)] =
        to_bits(24, signed(s1_h) * signed(s2_b1))[23..8];
}
X(rd) = d;
```

PMULHSU.H.B0:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_b0 = s2[(i*16+7)..(i*16)];
    d[(i*16+15)..(i*16)] =
        to_bits(24, signed(s1_h) * unsigned(s2_b0))[23..8];
}
X(rd) = d;
```

PMULHSU.H.B1:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    d[(i*16+15)..(i*16)] =
        to_bits(24, signed(s1_h) * unsigned(s2_b1))[23..8];
}
X(rd) = d;
```

PMHACC.H.B0:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_b0 = s2[(i*16+7)..(i*16)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(24, signed(s1_h) * signed(s2_b0))[23..8];
}
X(rd) = d;
```

PMHACC.H.B1:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(24, signed(s1_h) * signed(s2_b1))[23..8];
}
X(rd) = d;
```

PMHACCSU.H.B0:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);;
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_b0 = s2[(i*16+7)..(i*16)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(24, signed(s1_h) * unsigned(s2_b0))[23..8];
}
X(rd) = d;
```

PMHACCSU.H.B1:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(xlen) = X(rd);;
foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_b1 = s2[(i*16+15)..(i*16+8)];
    let d_h = d[(i*16+15)..(i*16)];
    d[(i*16+15)..(i*16)] =
        d_h + to_bits(24, signed(s1_h) * unsigned(s2_b1))[23..8];
}
X(rd) = d;
```

RV32 MULHSU.H0:

```
let s2_h0 = X(rs2)[15..0];
X(rd) = to_bits(48, signed(X(rs1)) * unsigned(s2_h0))[47..16];
```

RV32 MULHSU.H1:

```
let s2_h1 = X(rs2)[31..16];
X(rd) = to_bits(48, signed(X(rs1)) * unsigned(s2_h1))[47..16];
```

RV32 MHACC.H0:

```
let s2_h0 = X(rs2)[15..0];
X(rd) = X(rd) + to_bits(48, signed(X(rs1)) * signed(s2_h0))[47..16];
```

RV32 MHACC.H1:

```
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(48, signed(X(rs1)) * signed(s2_h1))[47..16];
```

RV32 MHACCSU.H0:

```
let s2_h0 = X(rs2)[15..0];
X(rd) = X(rd) + to_bits(48, signed(X(rs1)) * unsigned(s2_h0))[47..16];
```

RV32 MHACCSU.H1:

```
let s2_h1 = X(rs2)[31..16];
X(rd) = X(rd) + to_bits(48, signed(X(rs1)) * unsigned(s2_h1))[47..16];
```

RV64 PMULHSU.W.H0:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(48, signed(s1[31..0])  * unsigned(s2[15..0]) )[47..16];
let d_w1 = to_bits(48, signed(s1[63..32]) * unsigned(s2[47..32]))[47..16];
X(rd) = d_w1 @ d_w0;
```

RV64 PMULHSU.W.H1:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(48, signed(s1[31..0])  * unsigned(s2[31..16]))[47..16];
let d_w1 = to_bits(48, signed(s1[63..32]) * unsigned(s2[63..48]))[47..16];
X(rd) = d_w1 @ d_w0;
```

RV64 PMHACC.W.H0:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]
        + to_bits(48, signed(s1[31..0])  * signed(s2[15..0]) )[47..16];
let d_w1 =
    din[63..32]
        + to_bits(48, signed(s1[63..32]) * signed(s2[47..32]))[47..16];
X(rd) = d_w1 @ d_w0;
```

RV64 PMHACC.W.H1:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]
        + to_bits(48, signed(s1[31..0])  * signed(s2[31..16]))[47..16];
let d_w1 =
    din[63..32]
        + to_bits(48, signed(s1[63..32]) * signed(s2[63..48]))[47..16];
X(rd) = d_w1 @ d_w0;
```

RV64 PMHACCSU.W.H0:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]
        + to_bits(48, signed(s1[31..0])  * unsigned(s2[15..0]) )[47..16];
let d_w1 =
    din[63..32]
        + to_bits(48, signed(s1[63..32]) * unsigned(s2[47..32]))[47..16];
X(rd) = d_w1 @ d_w0;
```

RV64 PMHACCSU.W.H1:

```
let s1 = X(rs1);
let s2 = X(rs2);
let din = X(rd);
let d_w0 =
    din[31..0]
        + to_bits(48, signed(s1[31..0])  * unsigned(s2[31..16]))[47..16];
let d_w1 =
    din[63..32]
        + to_bits(48, signed(s1[63..32]) * unsigned(s2[63..48]))[47..16];
X(rd) = d_w1 @ d_w0;
```

RV32 PMQWACC.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
foreach (i from 0 to 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h) * signed(s2_h))[46..15];
}
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PMQRWACC.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
foreach (i from 0 to 1) {
    let s1_h = s1[(i*16+15)..(i*16)];
    let s2_h = s2[(i*16+15)..(i*16)];
    let d_w = d[(i*32+31)..(i*32)];
    d[(i*32+31)..(i*32)] =
        d_w + to_bits(47, signed(s1_h) * signed(s2_h) + 2^14)[46..15];
}
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 MQWACC:

```
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(95, signed(X(rs1)) * signed(X(rs2)))[94..31];
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 MQRWACC:

```
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(95, signed(X(rs1)) * signed(X(rs2)) + 2^30)[94..31];
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWMULSU.B:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64);
foreach (i from 0 to 3) {
    let s1_b = s1[(i*8+7)..(i*8)];
    let s2_b = s2[(i*8+7)..(i*8)];
    d[(i*16+15)..(i*16)] = to_bits(16, signed(s1_b) * unsigned(s2_b));
}
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PWMULSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d_w0 = to_bits(32, signed(s1[15..0])  * unsigned(s2[15..0]) );
let d_w1 = to_bits(32, signed(s1[31..16]) * unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWMACC.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d_w0 = X(rd_p*2);
var d_w1 = if (rd_p == 0x0) then 0x00000000 else X(rd_p*2+1);
d_w0 = d_w0 + to_bits(32, signed(s1[15..0])  * signed(s2[15..0]) );
d_w1 = d_w1 + to_bits(32, signed(s1[31..16]) * signed(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWMACCSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d_w0 = X(rd_p*2);
var d_w1 = if (rd_p == 0x0) then 0x00000000 else X(rd_p*2+1);
d_w0 = d_w0 + to_bits(32, signed(s1[15..0])  * unsigned(s2[15..0]) );
d_w1 = d_w1 + to_bits(32, signed(s1[31..16]) * unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 PWMACCU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d_w0 = X(rd_p*2);
var d_w1 = if (rd_p == 0x0) then 0x00000000 else X(rd_p*2+1);
d_w0 = d_w0 + to_bits(32, unsigned(s1[15..0])  * unsigned(s2[15..0]) );
d_w1 = d_w1 + to_bits(32, unsigned(s1[31..16]) * unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d_w0;
    X(rd_p*2+1) = d_w1;
}
```

RV32 WMULSU:

```
let d = to_bits(64, signed(X(rs1)) * unsigned(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 WMACCSU:

```
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(64, signed(X(rs1)) * unsigned(X(rs2)));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PM2WADD.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d =
      to_bits(64, signed(s1[15..0])  * signed(s2[15..0]) )
    + to_bits(64, signed(s1[31..16]) * signed(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PM2WADDSU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d =
      to_bits(64, signed(s1[15..0])  * unsigned(s2[15..0]) )
    + to_bits(64, signed(s1[31..16]) * unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PM2WADDASU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(64, signed(s1[15..0])  * unsigned(s2[15..0]) )
      + to_bits(64, signed(s1[31..16]) * unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PM2WADDU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d =
      to_bits(64, unsigned(s1[15..0])  * unsigned(s2[15..0]) )
    + to_bits(64, unsigned(s1[31..16]) * unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PM2WADDAU.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
var d : bits(64) =
    if (rd_p == 0x0) then zeros() else X(rd_p*2+1) @ X(rd_p*2);
d = d + to_bits(64, unsigned(s1[15..0])  * unsigned(s2[15..0]) )
      + to_bits(64, unsigned(s1[31..16]) * unsigned(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PM2WADD.HX:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d =
      to_bits(64, signed(s1[15..0])  * signed(s2[31..16]))
    + to_bits(64, signed(s1[31..16]) * signed(s2[15..0]) );
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PM2WSUB.H:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d =
      to_bits(64, signed(s1[15..0])  * signed(s2[15..0]) )
    - to_bits(64, signed(s1[31..16]) * signed(s2[31..16]));
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```

RV32 PM2WSUB.HX:

```
let s1 = X(rs1);
let s2 = X(rs2);
let d =
      to_bits(64, signed(s1[15..0])  * signed(s2[31..16]))
    - to_bits(64, signed(s1[31..16]) * signed(s2[15..0]) );
if (rd_p != 0x0) then {
    X(rd_p*2)   = d[31..0];
    X(rd_p*2+1) = d[63..32];
}
```
