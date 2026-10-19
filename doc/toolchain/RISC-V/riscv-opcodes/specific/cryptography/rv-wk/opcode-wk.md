# Zwkg - Vector GCM/GMAC

# Vector Multiply over GHASH Galois-Field

```
vgmul.vv 31..26=0x28 25=1 vs2 19..15=0x11 14..12=0x2 vd 6..0=0x77
```

# Vector Add-Multiply over GHASH Galois-Field

```
vghsh.vv 31..26=0x2C 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x77
```

# Zwkn, Vector Crypto Extension, NIST Algorithm Suite

# Import Zwkb (proper subset of Zwbb extension)

```
$import rv_zwbb::vandn.vv
$import rv_zwbb::vandn.vx
$import rv_zwbb::vbrev8.v
$import rv_zwbb::vrev8.v
$import rv_zwbb::vrol.vv
$import rv_zwbb::vrol.vx
$import rv_zwbb::vror.vv
$import rv_zwbb::vror.vx
$import rv_zwbb::vror.vi
```

# Import Zwkned

```
$import rv_zwkned::vaesef.vs
$import rv_zwkned::vaesef.vv
$import rv_zwkned::vaesem.vs
$import rv_zwkned::vaesem.vv
$import rv_zwkned::vaesdf.vs
$import rv_zwkned::vaesdf.vv
$import rv_zwkned::vaesdm.vs
$import rv_zwkned::vaesdm.vv
$import rv_zwkned::vaeskf1.vi
$import rv_zwkned::vaeskf2.vi
$import rv_zwkned::vaesz.vs
```

# Import Zwknh


`Zwkn` implies `Zwknhb`. We import the instructions from `rv_zwknha`, because we cannot import already imported instructions, `rv_zwknhb` imports them from `rv_zwknha`, and the instructions are identical.

```
$import rv_zwknha::vsha2ms.vv
$import rv_zwknha::vsha2ch.vv
$import rv_zwknha::vsha2cl.vv
```

# Zwk, Vector Crypto Extension, ShangMi Algorithm Suite

# Import Zwkb (proper subset of the Zwbb extension)

```
$import rv_zwbb::vandn.vv
$import rv_zwbb::vandn.vx
$import rv_zwbb::vbrev8.v
$import rv_zwbb::vrev8.v
$import rv_zwbb::vrol.vv
$import rv_zwbb::vrol.vx
$import rv_zwbb::vror.vv
$import rv_zwbb::vror.vx
$import rv_zwbb::vror.vi
```

# Import Zwksed

```
$import rv_zwksed::vsm4k.vi
$import rv_zwksed::vsm4r.vv
$import rv_zwksed::vsm4r.vs
```

# Import Zwksh

```
$import rv_zwksh::vsm3c.vi
$import rv_zwksh::vsm3me.vv
```

# Zwksh - Vector Crypto SM3 (Hash)

# SM3 Message Compression

```
vsm3c.vi     31..26=0x2B 25=1 vs2 zimm5 14..12=0x2 vd 6..0=0x77
```

# SM3 Message Expansion

```
vsm3me.vv    31..26=0x20 25=1 vs2 vs1   14..12=0x2 vd 6..0=0x77
```

# Zwkned - Vector Crypto AES Encryption & Decryption (Singe Round)

# AES Single Round Decryption

```
vaesdf.vv    31..26=0x28 25=1 vs2 19..15=0x1 14..12=0x2 vd 6..0=0x77
vaesdf.vs    31..26=0x29 25=1 vs2 19..15=0x1 14..12=0x2 vd 6..0=0x77
vaesdm.vv    31..26=0x28 25=1 vs2 19..15=0x0 14..12=0x2 vd 6..0=0x77
vaesdm.vs    31..26=0x29 25=1 vs2 19..15=0x0 14..12=0x2 vd 6..0=0x77
```

# AES Single Round Encryption

```
vaesef.vv    31..26=0x28 25=1 vs2 19..15=0x3 14..12=0x2 vd 6..0=0x77
vaesef.vs    31..26=0x29 25=1 vs2 19..15=0x3 14..12=0x2 vd 6..0=0x77
vaesem.vv    31..26=0x28 25=1 vs2 19..15=0x2 14..12=0x2 vd 6..0=0x77
vaesem.vs    31..26=0x29 25=1 vs2 19..15=0x2 14..12=0x2 vd 6..0=0x77
```

# AES Scalar Round Zero Encryption/Decryption

```
vaesz.vs     31..26=0x29 25=1 vs2 19..15=0x7 14..12=0x2 vd 6..0=0x77
```

# AES-128 Forward Key Schedule

```
vaeskf1.vi   31..26=0x22 25=1 vs2 zimm5      14..12=0x2 vd 6..0=0x77
```
# AES-256 Forward Key Schedule

```
vaeskf2.vi   31..26=0x2A 25=1 vs2 zimm5      14..12=0x2 vd 6..0=0x77
```

# Zwknha - Vector Crypto SHA-256 Secure Hash

The following three instructions are defined in both Zwknha and Zwknhb:

- in Zwknha, they support SHA-256 (SEW=32) only,
- in Zwknhb, they support both SHA-256 (SEW=32) and SHA-512 (SEW=64).

```
vsha2ms.vv    31..26=0x2D 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x77
vsha2ch.vv    31..26=0x2E 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x77
vsha2cl.vv    31..26=0x2F 25=1 vs2 vs1 14..12=0x2 vd 6..0=0x77
```

# Zwknhb - Vector Crypto SHA-256 and SHA-512 Secure Hash

The following three instructions are defined in both Zwknha and Zwknhb:

- in Zwknha, they support SHA-256 (SEW=32) only,
- in Zwknhb, they support both SHA-256 (SEW=32) and SHA-512 (SEW=64).

```
$import rv_zwknha::vsha2ms.vv
$import rv_zwknha::vsha2ch.vv
$import rv_zwknha::vsha2cl.vv
```

# Zwksed - Vector Crypto SM4 (Block Cipher)

# SM4 Key Expansion

```
vsm4k.vi     31..26=0x21 25=1 vs2 zimm5       14..12=0x2 vd 6..0=0x77
```

# SM4 Encryption/Decryption Rounds

```
vsm4r.vv     31..26=0x28 25=1 vs2 19..15=0x10 14..12=0x2 vd 6..0=0x77
vsm4r.vs     31..26=0x29 25=1 vs2 19..15=0x10 14..12=0x2 vd 6..0=0x77
```
