# PADD.BS

**Encoding**

PADD.BS is encoded using the OP-IMM-32 major opcode with a scalar second source
operand and packed byte elements.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12  | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|---------|-------|---------|
| 1  | f=001  | 1  | w=11   | rs2    | rs1    | 010     | rd    | 0011011 |

**Operation**

```python
s1    = X[rs1]
s2_b0 = X[rs2][7:0]  // least-significant byte of X[rs2]

for i = 0 .. (XLEN/8 - 1):
    s1_b = s1[(8*i+7) : (8*i)]
    d[(8*i+7) : (8*i)] = s1_b + s2_b0

X[rd] = d
```

**Description**

The PADD.BS instruction adds the least-significant byte of `rs2` to each packed
8-bit element of `rs1`, producing a packed byte result in `rd`.

**Notes**

* Each 8-bit element addition wraps modulo 2^8.
* The scalar operand is taken only from bits [7:0] of `rs2`; higher bits are ignored.

# PABD.B

**Encoding**

PABD.B is encoded in the OP-32 major opcode. It uses packed byte elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=10   | rs2    | rs1    | 000    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/8 - 1):
    a = s1[(8*i+7) : (8*i)]
    b = s2[(8*i+7) : (8*i)]
    d[(8*i+7) : (8*i)] = (a <_s b) ? (b - a) : (a - b)

X[rd] = d
```

**Description**

The PABD.B instruction computes the absolute difference of corresponding packed
8-bit elements of `rs1` and `rs2`, using signed comparison, and writes the result
to `rd`.

**Notes**

* Signed ordering is used to determine the magnitude of each element difference.

# PABDU.B

**Encoding**

PABDU.B is encoded in the OP-32 major opcode. It uses packed byte elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=10   | rs2    | rs1    | 000    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/8 - 1):
    a = s1[(8*i+7) : (8*i)]
    b = s2[(8*i+7) : (8*i)]
    d[(8*i+7) : (8*i)] = (a <_u b) ? (b - a) : (a - b)

X[rd] = d
```

**Description**

The PABDU.B instruction computes the absolute difference of corresponding packed
8-bit elements of `rs1` and `rs2`, using unsigned comparison, and writes the
result to `rd`.

**Notes**

* Unsigned ordering is used to determine the magnitude of each element difference.

# PREDSUM.BS

**Encoding**

PREDSUM.BS is encoded in the OP-32 major opcode. It performs a reduction
operation using packed byte elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | w=10   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
sum = X[rs2]

for i = 0 .. (XLEN/8 - 1):
    b   = s1[(8*i+7) : (8*i)]
    sum = sum + sign_extend(XLEN, b)

X[rd] = sum
```

**Description**

The PREDSUM.BS instruction computes a signed reduction sum of packed 8-bit
elements in `rs1`. Each element is sign-extended to XLEN and accumulated into
the initial value in `rs2`. The final sum is written to `rd`.

# PREDSUMU.BS

**Encoding**

PREDSUMU.BS is encoded in the OP-32 major opcode. It performs a reduction
operation using packed byte elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=011  | w=10   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
sum = X[rs2]

for i = 0 .. (XLEN/8 - 1):
    b   = s1[(8*i+7) : (8*i)]
    sum = sum + zero_extend(XLEN, b)

X[rd] = sum
```

**Description**

The PREDSUMU.BS instruction computes an unsigned reduction sum of packed 8-bit
elements in `rs1`. Each element is zero-extended to XLEN and accumulated into
the initial value in `rs2`. The final sum is written to `rd`.

# PADD.HS

**Encoding**

PADD.HS is encoded in the OP-32 major opcode with a scalar second source
operand and packed halfword elements.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=00   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1    = X[rs1]
s2_h0 = X[rs2][15:0]

for i = 0 .. (XLEN/16 - 1):
    h = s1[(16*i+15) : (16*i)]
    d[(16*i+15) : (16*i)] = h + s2_h0

X[rd] = d
```

**Description**

The PADD.HS instruction adds the least-significant halfword of `rs2` to each
packed 16-bit element of `rs1`, producing a packed halfword result in `rd`.

# PSH1ADD.H

**Encoding**

PSH1ADD.H is encoded in the OP-32 major opcode. It uses packed halfword elements.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=010  | 0  | w=00   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15) : (16*i)]
    b = s2[(16*i+15) : (16*i)]
    d[(16*i+15) : (16*i)] = (a << 1) + b

X[rd] = d
```

**Description**

The PSH1ADD.H instruction computes, for each packed 16-bit element, `(rs1_h << 1) + rs2_h`, and writes the packed halfword result to `rd`.

# PSSH1SADD.H

**Encoding**

PSSH1SADD.H is encoded in the OP-32 major opcode. It uses packed halfword
elements and performs signed saturating arithmetic.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=011  | 0  | w=00   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15) : (16*i)]  // signed 16-bit
    b = s2[(16*i+15) : (16*i)]  // signed 16-bit

    // Saturating shift-left-by-1 of a (signed 16-bit)
    t = a << 1
    if t overflows signed16:
        vxsat = 1
        t = (a <_s 0) ? 0x8000 : 0x7FFF

    // Saturating add of t and b (signed 16-bit)
    s = signed(t) + signed(b)  // compute in wider precision
    if s < -32768:
        vxsat = 1
        r = 0x8000
    else if s > 32767:
        vxsat = 1
        r = 0x7FFF
    else
        r = to_bits(16, s)

    d[(16*i+15) : (16*i)] = r

X[rd] = d
```

**Description**

The PSSH1SADD.H instruction performs a signed saturating left shift by 1 on each
packed 16-bit element of `rs1`, then performs a signed saturating add with the
corresponding packed 16-bit element of `rs2`. The packed halfword result is
written to `rd`.

**Notes**

* `vxsat` is set to 1 if saturation occurs in any element, either during the
  shift-left-by-1 step or during the subsequent add.

# PABD.H

**Encoding**

PABD.H is encoded in the OP-32 major opcode. It uses packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=00   | rs2    | rs1    | 000    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15) : (16*i)]
    b = s2[(16*i+15) : (16*i)]
    d[(16*i+15) : (16*i)] = (a <_s b) ? (b - a) : (a - b)

X[rd] = d
```

**Description**

The PABD.H instruction computes the absolute difference of corresponding packed
16-bit elements of `rs1` and `rs2`, using signed comparison, and writes the
result to `rd`.

# PABDU.H

**Encoding**

PABDU.H is encoded in the OP-32 major opcode. It uses packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=00   | rs2    | rs1    | 000    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15) : (16*i)]
    b = s2[(16*i+15) : (16*i)]
    d[(16*i+15) : (16*i)] = (a <_u b) ? (b - a) : (a - b)

X[rd] = d
```

**Description**

The PABDU.H instruction computes the absolute difference of corresponding packed
16-bit elements of `rs1` and `rs2`, using unsigned comparison, and writes the
result to `rd`.

# PREDSUM.HS

**Encoding**

PREDSUM.HS is encoded in the OP-IMM-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=00   | rs2    | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1  = X[rs1]
sum = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    h   = s1[(16*i+15) : (16*i)]
    sum = sum + sign_extend(XLEN, h)

X[rd] = sum
```

**Description**

The PREDSUM.HS instruction computes a signed reduction sum of packed 16-bit
elements in `rs1`, accumulating into the initial value in `rs2`.

# PREDSUMU.HS

**Encoding**

PREDSUMU.HS is encoded in the OP-IMM-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=011  | 1  | w=00   | rs2    | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1  = X[rs1]
sum = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    h   = s1[(16*i+15) : (16*i)]
    sum = sum + zero_extend(XLEN, h)

X[rd] = sum
```

**Description**

The PREDSUMU.HS instruction computes an unsigned reduction sum of packed 16-bit
elements in `rs1`, accumulating into the initial value in `rs2`.

# PREDSUM.WS (RV64)

**Encoding**

PREDSUM.WS is encoded in the OP-IMM-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=01   | rs2    | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1 = X[rs1]
X[rd] = X[rs2]
        + sign_extend(64, s1[31:0])
        + sign_extend(64, s1[63:32])
```

**Description**

The PREDSUM.WS instruction computes a signed reduction sum of the two packed
32-bit elements in `rs1`, accumulating into `rs2`.

# PREDSUMU.WS (RV64)

**Encoding**

PREDSUMU.WS is encoded in the OP-IMM-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=011  | 1  | w=01   | rs2    | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1 = X[rs1]
X[rd] = X[rs2]
        + zero_extend(64, s1[31:0])
        + zero_extend(64, s1[63:32])
```

**Description**

The PREDSUMU.WS instruction computes an unsigned reduction sum of the two packed
32-bit elements in `rs1`, accumulating into `rs2`.

# PADD.WS (RV64)

**Encoding**

PADD.WS is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=01   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1    = X[rs1]
s2_w0 = X[rs2][31:0]

d[31:0]  = s1[31:0]  + s2_w0
d[63:32] = s1[63:32] + s2_w0

X[rd] = d
```

**Description**

The PADD.WS instruction adds the least-significant word of `rs2` to each packed
32-bit element of `rs1`.

# PSH1ADD.W (RV64)

**Encoding**

PSH1ADD.W is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=010  | 0  | w=01   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d[31:0]  = (s1[31:0]  << 1) + s2[31:0]
d[63:32] = (s1[63:32] << 1) + s2[63:32]

X[rd] = d
```

**Description**

The PSH1ADD.W instruction computes, for each packed 32-bit element, `(rs1_w << 1) + rs2_w`.

# SSH1SADD (RV32)

**Encoding**

SSH1SADD is encoded in the OP-32 major opcode and is available only in RV32.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=011  | 0  | w=01   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

// Saturating shift-left-by-1
t = s1 << 1
if t overflows signed32:
    vxsat = 1
    t = (s1 <_s 0) ? 0x80000000 : 0x7FFFFFFF

// Saturating add
s = signed(t) + signed(s2)
if s < -2^31:
    vxsat = 1
    X[rd] = 0x80000000
else if s > 2^31-1:
    vxsat = 1
    X[rd] = 0x7FFFFFFF
else
    X[rd] = to_bits(32, s)
```

**Description**

The SSH1SADD instruction performs a signed saturating left shift by 1 on `rs1`,
followed by a signed saturating add with `rs2`.

# PSSH1SADD.W (RV64)

**Encoding**

PSSH1SADD.W is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=011  | 0  | w=01   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 1:
    a = s1[(32*i+31):(32*i)]
    b = s2[(32*i+31):(32*i)]

    // Saturating shift-left-by-1
    t = a << 1
    if t overflows signed32:
        vxsat = 1
        t = (a <_s 0) ? 0x80000000 : 0x7FFFFFFF

    // Saturating add
    s = signed(t) + signed(b)
    if s < -2^31:
        vxsat = 1
        r = 0x80000000
    else if s > 2^31-1:
        vxsat = 1
        r = 0x7FFFFFFF
    else
        r = to_bits(32, s)

    d[(32*i+31):(32*i)] = r

X[rd] = d
```

**Description**

The PSSH1SADD.W instruction performs a signed saturating left shift by 1 on each
packed 32-bit element of `rs1`, followed by a signed saturating add with the
corresponding element of `rs2`.

# PSLL.BS

**Encoding**

PSLL.BS is encoded in the OP-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=000  | 1  | w=10   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]
for i = 0 .. (XLEN/8 - 1):
    b = s1[(8*i+7):(8*i)]
    d[(8*i+7):(8*i)] = (zero_extend(32, b) << shamt)[7:0]
X[rd] = d
```

**Description**

The PSLL.BS instruction shifts each packed 8-bit element of `rs1` left by the
shift amount in `rs2[4:0]` and writes the packed byte result to `rd`.

# PSLL.HS

**Encoding**

PSLL.HS is encoded in the OP-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=000  | 1  | w=00   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]
for i = 0 .. (XLEN/16 - 1):
    h = s1[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = (zero_extend(32, h) << shamt)[15:0]
X[rd] = d
```

**Description**

The PSLL.HS instruction shifts each packed 16-bit element of `rs1` left by the
shift amount in `rs2[4:0]` and writes the packed halfword result to `rd`.

# PSRL.BS

**Encoding**

PSRL.BS is encoded in the OP-IMM-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=000  | 1  | w=10   | rs2    | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]
for i = 0 .. (XLEN/8 - 1):
    b = s1[(8*i+7):(8*i)]
    d[(8*i+7):(8*i)] = (zero_extend(32, b) >> shamt)[7:0]
X[rd] = d
```

**Description**

The PSRL.BS instruction logically shifts each packed 8-bit element of `rs1`
right by the shift amount in `rs2[4:0]` and writes the packed byte result to `rd`.

# PSRL.HS

**Encoding**

PSRL.HS is encoded in the OP-IMM-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=000  | 1  | w=00   | rs2    | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]
for i = 0 .. (XLEN/16 - 1):
    h = s1[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = (zero_extend(32, h) >> shamt)[15:0]
X[rd] = d
```

**Description**

The PSRL.HS instruction logically shifts each packed 16-bit element of `rs1`
right by the shift amount in `rs2[4:0]` and writes the packed halfword result to `rd`.

# PSRA.BS

**Encoding**

PSRA.BS is encoded in the OP-IMM-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=100  | 1  | w=10   | rs2    | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]
for i = 0 .. (XLEN/8 - 1):
    b = s1[(8*i+7):(8*i)]
    d[(8*i+7):(8*i)] = (sign_extend(40, b) >> shamt)[7:0]
X[rd] = d
```

**Description**

The PSRA.BS instruction arithmetically shifts each packed 8-bit element of `rs1`
right by the shift amount in `rs2[4:0]` and writes the packed byte result to `rd`.

# PSRA.HS

**Encoding**

PSRA.HS is encoded in the OP-IMM-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=100  | 1  | w=00   | rs2    | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]
for i = 0 .. (XLEN/16 - 1):
    h = s1[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = (sign_extend(48, h) >> shamt)[15:0]
X[rd] = d
```

**Description**

The PSRA.HS instruction arithmetically shifts each packed 16-bit element of `rs1`
right by the shift amount in `rs2[4:0]` and writes the packed halfword result to `rd`.

# PSSHA.HS

**Encoding**

PSSHA.HS is encoded in the OP-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=110  | 1  | w=00   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][7:0]
sshamt = signed(shamt)

for i = 0 .. (XLEN/16 - 1):
    h  = s1[(16*i+15):(16*i)]
    xh = sign_extend(32, h)

    if sshamt < 0:
    // arithmetic shift right by (-sshamt), saturating not required
        if sshamt <= -16:
            r = xh[31:16]
        else
            r = (xh >> (0 - shamt)[3:0])[15:0]
    else:
    // shift left with signed saturation to 16-bit range
        if sshamt >= 16:
            shx = (h @ 0x0000)
        else
            shx = xh << shamt[3:0]

        if shx <_s 0xFFFF8000:
            vxsat = 1
            r = 0x8000
        else if shx >_s 0x00007FFF:
            vxsat = 1
            r = 0x7FFF
        else
            r = shx[15:0]

    d[(16*i+15):(16*i)] = r

X[rd] = d
```

**Description**

The PSSHA.HS instruction performs a signed variable shift on each packed 16-bit
element of `rs1` using the signed shift amount in `rs2[7:0]`. Left shifts saturate
to the signed 16-bit range.

**Notes**

* `vxsat` is set to 1 if saturation occurs in any element.

# PSSHAR.HS

**Encoding**

PSSHAR.HS is encoded in the OP-IMM-32 major opcode.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=111  | 1  | w=00   | rs2    | rs1    | 010    | rd    | 0011011 |

**Operation**

```python
s1     = X[rs1]
shamt  = X[rs2][7:0]
sshamt = signed(shamt)

for i = 0 .. (XLEN/16 - 1):
    h = s1[(16*i+15):(16*i)]  // signed 16-bit

    if sshamt < 0:
    // arithmetic right shift with rounding
        x  = sign_extend(32, h) @ 0b0  // 33-bit
        y  = (sshamt <= -16) ? x[32:16]
                             : (x >> (0 - shamt)[3:0])[16:0]
        r  = (y + 1)[16:1]
    else:
    // shift left with signed saturation to 16-bit range
        shx = (sshamt >= 16) ? (h @ 0x0000)
                             : (sign_extend(32, h) << shamt[3:0])

        if shx <_s 0xFFFF8000:
            vxsat = 1
            r = 0x8000
        else if shx >_s 0x00007FFF:
            vxsat = 1
            r = 0x7FFF
        else
            r = shx[15:0]

    d[(16*i+15):(16*i)] = r

X[rd] = d
```

**Description**

The PSSHAR.HS instruction performs a signed variable shift on each packed 16-bit
element of `rs1` using the signed shift amount in `rs2[7:0]`. Right shifts are
rounded, and left shifts saturate to the signed 16-bit range.

**Notes**

* `vxsat` is set to 1 if saturation occurs in any element.

# SSHA (RV32)

**Encoding**

SSHA is encoded in the OP-IMM-32 major opcode and is available only in RV32.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=110  | 1  | w=01   | rs2    | rs1    | 010    | rd    | 0011011 |

**Operation**

```python
s1     = X[rs1]
shamt  = X[rs2][7:0]
sshamt = signed(shamt)
xs1    = sign_extend(64, s1)

if sshamt < 0:
    if sshamt <= -32:
        X[rd] = xs1[63:32]
    else
        X[rd] = (xs1 >> (0 - shamt)[4:0])[31:0]
else:
    shx = (sshamt >= 32) ? (s1 @ 0x00000000)
                         : (xs1 << shamt[4:0])

    if shx <_s 0xFFFFFFFF80000000:
        vxsat = 1
        X[rd] = 0x80000000
    else if shx >_s 0x000000007FFFFFFF:
        vxsat = 1
        X[rd] = 0x7FFFFFFF
    else
        X[rd] = shx[31:0]
```

**Description**

The SSHA instruction performs a signed variable shift of `rs1` using the signed
shift amount in `rs2[7:0]`. Left shifts saturate to the signed 32-bit range.

# SSHAR (RV32)

**Encoding**

SSHAR is encoded in the OP-IMM-32 major opcode and is available only in RV32.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=111  | 1  | w=01   | rs2    | rs1    | 010    | rd    | 0011011 |

**Operation**

```python
s1     = X[rs1]
shamt  = X[rs2][7:0]
sshamt = signed(shamt)

if sshamt < 0:
    // arithmetic right shift with rounding
    x  = sign_extend(64, s1) @ 0b0  // 65-bit
    y  = (sshamt <= -32) ? x[64:32]
                         : (x >> (0 - shamt)[4:0])[32:0]
    X[rd] = (y + 1)[32:1]
else:
    // shift left with signed saturation to 32-bit range
    shx = (sshamt >= 32) ? (s1 @ 0x00000000)
                         : (sign_extend(64, s1) << shamt[4:0])

    if shx <_s 0xFFFFFFFF80000000:
        vxsat = 1
        X[rd] = 0x80000000
    else if shx >_s 0x000000007FFFFFFF:
        vxsat = 1
        X[rd] = 0x7FFFFFFF
    else
        X[rd] = shx[31:0]
```

**Description**

The SSHAR instruction performs a signed variable shift of `rs1` using the signed
shift amount in `rs2[7:0]`. Right shifts are rounded, and left shifts saturate
to the signed 32-bit range.

**Notes**

* `vxsat` is set to 1 if saturation occurs.

# MSEQ (RV32)

**Encoding**

MSEQ is available only in RV32.

| 31 | 30..28 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1000 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
X[rd] = (X[rs1] == X[rs2]) ? 0xFFFFFFFF : 0x00000000
```

**Description**

The MSEQ instruction sets `rd` to all ones if `rs1` equals `rs2`; otherwise it
sets `rd` to zero.

# MSLT (RV32)

**Encoding**

MSLT is available only in RV32.

| 31 | 30..28 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1010 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
X[rd] = (X[rs1] <_s X[rs2]) ? 0xFFFFFFFF : 0x00000000
```

**Description**

The MSLT instruction sets `rd` to all ones if `rs1` is less than `rs2` using
signed comparison; otherwise it sets `rd` to zero.

# MSLTU (RV32)

**Encoding**

MSLTU is available only in RV32.

| 31 | 30..28 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1011 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
X[rd] = (X[rs1] <_u X[rs2]) ? 0xFFFFFFFF : 0x00000000
```

**Description**

The MSLTU instruction sets `rd` to all ones if `rs1` is less than `rs2` using
unsigned comparison; otherwise it sets `rd` to zero.

# PMSEQ.W (RV64)

**Encoding**

PMSEQ.W is available only in RV64.

| 31 | 30..28 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1000 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d0 = (s1[31:0]  == s2[31:0])  ? 0xFFFFFFFF : 0x00000000
d1 = (s1[63:32] == s2[63:32]) ? 0xFFFFFFFF : 0x00000000
X[rd] = d1 @ d0
```

**Description**

The PMSEQ.W instruction compares corresponding packed 32-bit elements for
equality and produces a packed word mask in `rd`.

# PMSLT.W (RV64)

**Encoding**

PMSLT.W is available only in RV64.

| 31 | 30..28 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1010 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d0 = (s1[31:0]  <_s s2[31:0])  ? 0xFFFFFFFF : 0x00000000
d1 = (s1[63:32] <_s s2[63:32]) ? 0xFFFFFFFF : 0x00000000
X[rd] = d1 @ d0
```

**Description**

The PMSLT.W instruction performs signed less-than comparisons on corresponding
packed 32-bit elements and produces a packed word mask in `rd`.

# PMSLTU.W (RV64)

**Encoding**

PMSLTU.W is available only in RV64.

| 31 | 30..28 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1011 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d0 = (s1[31:0]  <_u s2[31:0])  ? 0xFFFFFFFF : 0x00000000
d1 = (s1[63:32] <_u s2[63:32]) ? 0xFFFFFFFF : 0x00000000
X[rd] = d1 @ d0
```

**Description**

The PMSLTU.W instruction performs unsigned less-than comparisons on corresponding
packed 32-bit elements and produces a packed word mask in `rd`.

# PSEXT.W.B (RV64)

**Encoding**

PSEXT.W.B is available only in RV64.

| 31..27 | 26..25 | 24..20   | 19..15 | 14..12 | 11..7 | 6..0    |
|--------|--------|----------|--------|--------|-------|---------|
| 11100  | w=10   | uf=00100 | rs1    | 010    | rd    | 0011011 |

**Operation**

```python
s1 = X[rs1]
X[rd] = sign_extend(32, s1[39:32]) @ sign_extend(32, s1[7:0])
```

**Description**

The PSEXT.W.B instruction extracts byte elements from `rs1`, sign-extends them
to 32-bit values, and packs them into `rd`.

# PSEXT.W.H (RV64)

**Encoding**

PSEXT.W.H is available only in RV64.

| 31..27 | 26..25 | 24..20   | 19..15 | 14..12 | 11..7 | 6..0    |
|--------|--------|----------|--------|--------|-------|---------|
| 11100  | w=10   | uf=00101 | rs1    | 010    | rd    | 0011011 |

**Operation**

```python
s1 = X[rs1]
X[rd] = sign_extend(32, s1[47:32]) @ sign_extend(32, s1[15:0])
```

**Description**

The PSEXT.W.H instruction extracts halfword elements from `rs1`, sign-extends
them to 32-bit values, and packs them into `rd`.

# PSSHA.WS (RV64)

**Encoding**

PSSHA.WS is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=110  | 1  | w=10   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

// (use your Sail-derived pseudocode as previously, unchanged)

**Description**

The PSSHA.WS instruction performs a signed variable shift on each packed 32-bit
element of `rs1` using the signed shift amount in `rs2[7:0]`. Left shifts
saturate to the signed 32-bit range.

# PSSHAR.WS (RV64)

**Encoding**

PSSHAR.WS is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=111  | 1  | w=10   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

// (use your Sail-derived pseudocode as previously, unchanged)

**Description**

The PSSHAR.WS instruction performs a signed variable shift on each packed 32-bit
element of `rs1` using the signed shift amount in `rs2[7:0]`. Right shifts are
rounded, and left shifts saturate to the signed 32-bit range.

# SATI (RV64)

**Encoding**

SATI is encoded in the OP-IMM-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 1  | f=110  | 0  | w_uimm | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1 = X[rs1]
n  = w_uimm[5:0]

minval = 0xFFFF_FFFF_FFFF_FFFF << n
maxval = ~minval

if (s1 <_s minval):
    vxsat = 1
    X[rd] = minval
else if (s1 >_s maxval):
    vxsat = 1
    X[rd] = maxval
else:
    X[rd] = s1
```

**Description**

The SATI instruction saturates `rs1` to a signed range determined by the
immediate `n` and writes the result to `rd`.

**Notes**

* `vxsat` is set to 1 if saturation occurs.

# USATI (RV64)

**Encoding**

USATI is encoded in the OP-IMM-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 1  | f=010  | 0  | w_uimm | rs1    | 100    | rd    | 0011011 |

**Operation**

```python
s1 = X[rs1]
n  = w_uimm[5:0]

maxval = ~(0xFFFF_FFFF_FFFF_FFFF << n)

if (s1 <_s 0):
    vxsat = 1
    X[rd] = 0
else if (s1 >_s maxval):
    vxsat = 1
    X[rd] = maxval
else:
    X[rd] = s1
```

**Description**

The USATI instruction saturates `rs1` to the unsigned range [0, maxval]
determined by the immediate `n` and writes the result to `rd`.

**Notes**

* `vxsat` is set to 1 if saturation occurs.

# SHA (RV64)

**Encoding**

SHA is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=110  | 1  | w=11   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1     = X[rs1]
shamt  = X[rs2][7:0]
sshamt = signed(shamt)

if (sshamt < 0):
    xs1 = sign_extend(128, s1)
    if (sshamt <= -64):
        X[rd] = xs1[127:64]
    else:
        X[rd] = (xs1 >> (0 - shamt)[5:0])[63:0]
else:
    if (sshamt >= 64):
        X[rd] = 0
    else:
        X[rd] = s1 << shamt[5:0]
```

**Description**

The SHA instruction performs a signed variable shift of `rs1` using the signed
shift amount in `rs2[7:0]`. Negative shift amounts shift right; non-negative
shift amounts shift left.

# SHAR (RV64)

**Encoding**

SHAR is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=111  | 1  | w=11   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1     = X[rs1]
shamt  = X[rs2][7:0]
sshamt = signed(shamt)

if (sshamt < 0):
    xs1 = sign_extend(128, s1) @ 0b0  // 129-bit
    if (sshamt <= -64):
        shx = xs1[128:64]
    else:
        shx = (xs1 >> (0 - shamt)[5:0])[64:0]
    X[rd] = (shx + 1)[64:1]
else:
    if (sshamt >= 64):
        X[rd] = 0
    else:
        X[rd] = s1 << shamt[5:0]
```

**Description**

The SHAR instruction matches SHA for non-negative shift amounts. For negative
shift amounts it performs a rounding right shift as specified in the Sail code.

# PPAIRE.B

**Encoding**

PPAIRE.B is encoded in the OP-32 major opcode with packed-byte pairing.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=000  | 0  | w=00   | rs2    | rs1    | 100    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = b[7:0] @ a[7:0]

X[rd] = d
```

**Description**

The PPAIRE.B instruction forms packed 16-bit elements by pairing the low byte of each
halfword element of `rs2` as the high byte with the low byte of the corresponding
halfword element of `rs1` as the low byte.

# PPAIREO.B

**Encoding**

PPAIREO.B is encoded in the OP-32 major opcode with packed-byte pairing.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 0  | w=00   | rs2    | rs1    | 100    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = b[15:8] @ a[7:0]

X[rd] = d
```

**Description**

The PPAIREO.B instruction pairs the high byte of each halfword element of `rs2` with
the low byte of the corresponding halfword element of `rs1`, producing packed halfwords.

# PPAIROE.B

**Encoding**

PPAIROE.B is encoded in the OP-32 major opcode with packed-byte pairing.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=010  | 0  | w=00   | rs2    | rs1    | 100    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = b[7:0] @ a[15:8]

X[rd] = d
```

**Description**

The PPAIROE.B instruction pairs the low byte of each halfword element of `rs2` with
the high byte of the corresponding halfword element of `rs1`, producing packed halfwords.

# PPAIRO.B

**Encoding**

PPAIRO.B is encoded in the OP-32 major opcode with packed-byte pairing.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=011  | 0  | w=00   | rs2    | rs1    | 100    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = b[15:8] @ a[15:8]

X[rd] = d
```

**Description**

The PPAIRO.B instruction pairs the high byte of each halfword element of `rs2` with
the high byte of the corresponding halfword element of `rs1`, producing packed halfwords.

# REV16 (RV64)

**Encoding**

REV16 is a scalar instruction encoded in the OP-IMM major opcode and is available only in RV64.

|31..20|19..15|14..12|11..7|6..0|
|011010110000| rs1    | 101    | rd    | 0010011 |

**Operation**

```python
s1 = X[rs1]
X[rd] = s1[15:0] @ s1[31:16] @ s1[47:32] @ s1[63:48]
```

**Description**

The REV16 instruction reverses the order of 16-bit chunks within the 64-bit value in `rs1`.

# ZIP8P (RV64)

**Encoding**

ZIP8P is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=111  | 0  | w=00   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
    s2[31:24] @ s1[31:24] @ s2[23:16] @ s1[23:16]
  @ s2[15:8]  @ s1[15:8]  @ s2[7:0]   @ s1[7:0]
```

**Description**

The ZIP8P instruction interleaves bytes from `rs2` and `rs1` to form a packed 64-bit result:
for each byte position, the corresponding byte from `rs2` is placed above the byte from `rs1`.

# ZIP8HP (RV64)

**Encoding**

ZIP8HP is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=111  | 0  | w=10   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
    s2[63:56] @ s1[63:56] @ s2[55:48] @ s1[55:48]
  @ s2[47:40] @ s1[47:40] @ s2[39:32] @ s1[39:32]
```

**Description**

The ZIP8HP instruction interleaves bytes from the high 32-bit halves of `rs2` and
`rs1` to form a 64-bit result.

# UNZIP8P (RV64)

**Encoding**

UNZIP8P is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=110  | 0  | w=00   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
    s2[55:48] @ s2[39:32] @ s2[23:16] @ s2[7:0]
  @ s1[55:48] @ s1[39:32] @ s1[23:16] @ s1[7:0]
```

**Description**

The UNZIP8P instruction de-interleaves bytes from `rs2` and `rs1` to form a 64-bit
result containing selected byte lanes from each source.

# UNZIP8HP (RV64)

**Encoding**

UNZIP8HP is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=110  | 0  | w=10   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
    s2[63:56] @ s2[47:40] @ s2[31:24] @ s2[15:8]
  @ s1[63:56] @ s1[47:40] @ s1[31:24] @ s1[15:8]
```

**Description**

The UNZIP8HP instruction de-interleaves bytes from `rs2` and `rs1` using the
high-part byte selection pattern and forms a 64-bit result.

# ZIP16P (RV64)

**Encoding**

ZIP16P is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=111  | 0  | w=01   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] = s2[31:16] @ s1[31:16] @ s2[15:0] @ s1[15:0]
```

**Description**

The ZIP16P instruction interleaves 16-bit chunks from `rs2` and `rs1` to form a
64-bit result.

# ZIP16HP (RV64)

**Encoding**

ZIP16HP is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=111  | 0  | w=11   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] = s2[63:48] @ s1[63:48] @ s2[47:32] @ s1[47:32]
```

**Description**

The ZIP16HP instruction interleaves 16-bit chunks from the high 32-bit halves of
`rs2` and `rs1` to form a 64-bit result.

# UNZIP16P (RV64)

**Encoding**

UNZIP16P is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=110  | 0  | w=01   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] = s2[47:32] @ s2[15:0] @ s1[47:32] @ s1[15:0]
```

**Description**

The UNZIP16P instruction de-interleaves 16-bit chunks from `rs2` and `rs1` and
forms a 64-bit result.

# UNZIP16HP (RV64)

**Encoding**

UNZIP16HP is encoded in the OP-32 major opcode and is available only in RV64.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=110  | 0  | w=11   | rs2    | rs1    | 010    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] = s2[63:48] @ s2[31:16] @ s1[63:48] @ s1[31:16]
```

**Description**

The UNZIP16HP instruction de-interleaves 16-bit chunks from the high 32-bit halves
of `rs2` and `rs1` and forms a 64-bit result.

# ABS

**Encoding**

ABS is encoded in the OP-IMM major opcode.

|31..20|19..15|14..12|11..7|6..0|
|imm=0x607| rs1 | 001 | rd | 0010011 |

**Operation**

```python
s1 = X[rs1]
X[rd] = (signed(s1) < 0) ? (0 - s1) : s1
```

**Description**

ABS writes the absolute value of `X[rs1]` to `rd`.

# CLS

**Encoding**

CLS is encoded in the OP-IMM major opcode.

|31..20|19..15|14..12|11..7|6..0|
|imm=0x603| rs1 | 001 | rd | 0010011 |

**Operation**

```python
v = X[rs1]
lo_bound = to_bits(XLEN, -(2^(XLEN - 2)))
hi_bound = ~lo_bound
c = 0

while (c < XLEN - 1) & (v >=_s lo_bound) & (v <=_s hi_bound) do
    c = c + 1
    v = v << 1

X[rd] = to_bits(XLEN, c)
```

**Description**

CLS returns the count `c` produced by the Sail reference algorithm.

# SLX

**Encoding**

SLX is encoded in the OP-32 major opcode.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
shamt = X[rs2][log2(XLEN)-1:0]
X[rd] = ((X[rd] @ X[rs1]) << shamt)[(2*XLEN-1):XLEN]
```

**Description**

SLX shifts the 2*XLEN-bit concatenation `X[rd] @ X[rs1]` left by `shamt` and
writes the upper XLEN bits to `rd`.

# SRX

**Encoding**

SRX is encoded in the OP-32 major opcode.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=11   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
shamt = X[rs2][log2(XLEN)-1:0]
X[rd] = ((X[rs1] @ X[rd]) >> shamt)[(XLEN-1):0]
```

**Description**

SRX shifts the 2*XLEN-bit concatenation `X[rs1] @ X[rd]` right by `shamt` and
writes the lower XLEN bits to `rd`.

# MVM

**Encoding**

MVM is encoded in the OP-32 major opcode.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
m = X[rs2]
X[rd] = (~m & X[rd]) | (m & X[rs1])
```

**Description**

MVM merges `rs1` and the prior value of `rd` under control of the mask `rs2`.

# MVMN

**Encoding**

MVMN is encoded in the OP-32 major opcode.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
m = X[rs2]
X[rd] = (~m & X[rs1]) | (m & X[rd])
```

**Description**

MVMN is like MVM, but swaps the roles of `rs1` and the prior `rd` value.

# MERGE

**Encoding**

MERGE is encoded in the OP-32 major opcode.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=10   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
d0 = X[rd]
X[rd] = (~d0 & X[rs1]) | (d0 & X[rs2])
```

**Description**

MERGE uses the prior value of `rd` as the mask to select between `rs1` and `rs2`.

# ABSW (RV64)

**Encoding**

ABSW is encoded in the OP-IMM-32 major opcode and is available only in RV64.

|31..20|19..15|14..12|11..7|6..0|
|imm=0x607| rs1 | 001 | rd | 0011011 |

**Operation**

```python
w = X[rs1][31:0]
X[rd] = sign_extend(64, (signed(w) <_s 0) ? (0 - w) : w)
```

**Description**

ABSW writes the absolute value of the low 32 bits of `rs1` (treated as signed)
to `rd`, sign-extended to XLEN.

# CLSW (RV64)

**Encoding**

CLSW is encoded in the OP-IMM-32 major opcode and is available only in RV64.

|31..20|19..15|14..12|11..7|6..0|
|imm=0x603| rs1 | 001 | rd | 0011011 |

**Operation**

```python
w = X[rs1][31:0]
c = 0
while (c < 31) & (w >=_s 0xC0000000) & (w <=_s 0x3FFFFFFF) do
    c = c + 1
    w = w << 1
X[rd] = to_bits(XLEN, c)
```

**Description**

CLSW applies the CLS definition to the low 32 bits of `rs1` and writes the count
as an XLEN value.

# PWADD.B (RV32)

**Encoding**

PWADD.B is available only in RV32. It writes a 64-bit result to an even-odd
register pair specified by `rd_p`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  |f=0000  | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    b = s2[(8*i+7):(8*i)]
    d[(16*i+15):(16*i)] = to_bits(16, signed(a) + signed(b))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWADD.B sign-extends corresponding packed 8-bit elements of `rs1` and `rs2` to
signed values, adds them, and produces four packed 16-bit results. The 64-bit
result is written to the register pair `{X[2*rd_p+1], X[2*rd_p]}` when `rd_p != 0`.

# PWADDA.B (RV32)

**Encoding**

PWADDA.B is available only in RV32. It accumulates into the destination register pair.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0001 | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d = (rd_p == 0) ? 0 : (X[2*rd_p+1] @ X[2*rd_p])

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    b = s2[(8*i+7):(8*i)]
    acc = d[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = acc + to_bits(16, signed(a) + signed(b))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWADDA.B performs the same packed byte-to-halfword signed additions as PWADD.B,
then adds each 16-bit result into the corresponding 16-bit element of the
destination register pair.

# PWADDU.B (RV32)

**Encoding**

PWADDU.B is available only in RV32. It writes a 64-bit result to an even-odd
register pair specified by `rd_p`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0010 | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    b = s2[(8*i+7):(8*i)]
    d[(16*i+15):(16*i)] = to_bits(16, unsigned(a) + unsigned(b))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWADDU.B zero-extends corresponding packed 8-bit elements of `rs1` and `rs2` to
unsigned values, adds them, and produces four packed 16-bit results, written to
the destination register pair when `rd_p != 0`.

# PWADDAU.B (RV32)

**Encoding**

PWADDAU.B is available only in RV32. It accumulates into the destination register pair.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0011 | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d = (rd_p == 0) ? 0 : (X[2*rd_p+1] @ X[2*rd_p])

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    b = s2[(8*i+7):(8*i)]
    acc = d[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = acc + to_bits(16, unsigned(a) + unsigned(b))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWADDAU.B performs the same packed byte-to-halfword unsigned additions as PWADDU.B,
then adds each 16-bit result into the corresponding 16-bit element of the
destination register pair.

# PWSUB.B (RV32)

**Encoding**

PWSUB.B is available only in RV32. It writes a 64-bit result to an even-odd
register pair specified by `rd_p`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1000 | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    b = s2[(8*i+7):(8*i)]
    d[(16*i+15):(16*i)] = to_bits(16, signed(a) - signed(b))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWSUB.B sign-extends corresponding packed 8-bit elements of `rs1` and `rs2`,
subtracts them, and produces four packed 16-bit results. When `rd_p != 0`,
the 64-bit result is written to the destination register pair
`{X[2*rd_p+1], X[2*rd_p]}`.

# PWSUBA.B (RV32)

**Encoding**

PWSUBA.B is available only in RV32 and accumulates into the destination
register pair.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1001 | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d = (rd_p == 0) ? 0 : (X[2*rd_p+1] @ X[2*rd_p])

for i = 0 .. 3:
    a   = s1[(8*i+7):(8*i)]
    b   = s2[(8*i+7):(8*i)]
    acc = d[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = acc + to_bits(16, signed(a) - signed(b))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWSUBA.B performs the same packed byte-to-halfword signed subtraction as
PWSUB.B, then adds each 16-bit result into the corresponding 16-bit element
of the destination register pair.

# PWSUBU.B (RV32)

**Encoding**

PWSUBU.B is available only in RV32. It writes a 64-bit result to an even-odd
register pair specified by `rd_p`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1010 | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    b = s2[(8*i+7):(8*i)]
    d[(16*i+15):(16*i)] = to_bits(16, unsigned(a) - unsigned(b))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWSUBU.B zero-extends corresponding packed 8-bit elements of `rs1` and `rs2`,
subtracts them as unsigned values, and produces four packed 16-bit results,
written to the destination register pair when `rd_p != 0`.

# PWSUBAU.B (RV32)

**Encoding**

PWSUBAU.B is available only in RV32 and accumulates into the destination
register pair.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1011 | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d = (rd_p == 0) ? 0 : (X[2*rd_p+1] @ X[2*rd_p])

for i = 0 .. 3:
    a   = s1[(8*i+7):(8*i)]
    b   = s2[(8*i+7):(8*i)]
    acc = d[(16*i+15):(16*i)]
    d[(16*i+15):(16*i)] = acc + to_bits(16, unsigned(a) - unsigned(b))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWSUBAU.B performs the same packed byte-to-halfword unsigned subtraction as
PWSUBU.B, then adds each 16-bit result into the corresponding 16-bit element
of the destination register pair.

# PWSLLI.B (RV32)

**Encoding**

PWSLLI.B is available only in RV32. The shift amount is encoded in the `w_uimm`
field (element width plus immediate). The destination is a register pair `rd_p`.
:contentReference[oaicite:3]{index=3}

| 31 | 30..28 | 27 | 26..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---|---------|
| 0  | f=000  | 0  | w_uimm | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = w_uimm[3:0]

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    d[(16*i+15):(16*i)] = zero_extend(16, a) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWSLLI.B widens each 8-bit element of `rs1` to 16 bits by zero-extension, then
shifts left by an immediate amount, producing four 16-bit results.

# PWSLL.BS (RV32)

**Encoding**

PWSLL.BS is available only in RV32. The shift amount is taken from `rs2`.
:contentReference[oaicite:4]{index=4}

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---|---------|
| 0  | f=000  | 1  | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    d[(16*i+15):(16*i)] = (zero_extend(32, a) << shamt)[15:0]

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWSLL.BS widens each 8-bit element of `rs1` to 16 bits by zero-extension, then
shifts left by the amount in `rs2` (low 5 bits), producing four 16-bit results.

# PWSLAI.B (RV32)

**Encoding**

PWSLAI.B is available only in RV32. The shift amount is encoded in `w_uimm`.
:contentReference[oaicite:5]{index=5}

| 31 | 30..28 | 27 | 26..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---|---------|
| 0  | f=100  | 0  | w_uimm | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = w_uimm[3:0]

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    d[(16*i+15):(16*i)] = sign_extend(16, a) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWSLAI.B widens each 8-bit element of `rs1` to 16 bits by sign-extension, then
shifts left by an immediate amount, producing four 16-bit results.

# PWSLA.BS (RV32)

**Encoding**

PWSLA.BS is available only in RV32. The shift amount is taken from `rs2`.
:contentReference[oaicite:6]{index=6}

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---|---------|
| 0  | f=100  | 1  | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]

for i = 0 .. 3:
    a = s1[(8*i+7):(8*i)]
    d[(16*i+15):(16*i)] = (sign_extend(32, a) << shamt)[15:0]

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

PWSLA.BS widens each 8-bit element of `rs1` to 16 bits by sign-extension, then
shifts left by the amount in `rs2` (low 5 bits), producing four 16-bit results.

# PWADD.H (RV32)

**Encoding**

PWADD.H is available only in RV32. It writes results to an even-odd register
pair specified by `rd_p`.
:contentReference[oaicite:3]{index=3}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  |f=0000  | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d0 = to_bits(32, signed(s1[15:0])  + signed(s2[15:0]))
d1 = to_bits(32, signed(s1[31:16]) + signed(s2[31:16]))

if (rd_p != 0):
    X[2*rd_p]   = d0
    X[2*rd_p+1] = d1
```

**Description**

PWADD.H sign-extends each 16-bit halfword element of `rs1` and `rs2`, adds them,
and writes two 32-bit results to the destination register pair when `rd_p != 0`.

# PWADDA.H (RV32)

**Encoding**

PWADDA.H is available only in RV32 and accumulates into the destination register pair.
:contentReference[oaicite:4]{index=4}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0001 | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc0 = X[2*rd_p]
acc1 = (rd_p == 0) ? 0 : X[2*rd_p+1]

acc0 = acc0 + to_bits(32, signed(s1[15:0])  + signed(s2[15:0]))
acc1 = acc1 + to_bits(32, signed(s1[31:16]) + signed(s2[31:16]))

if (rd_p != 0):
    X[2*rd_p]   = acc0
    X[2*rd_p+1] = acc1
```

**Description**

PWADDA.H performs PWADD.H and adds each 32-bit result into the corresponding
32-bit element of the destination register pair.

# PWADDU.H (RV32)

**Encoding**

PWADDU.H is available only in RV32.
:contentReference[oaicite:5]{index=5}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0010 | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d0 = to_bits(32, unsigned(s1[15:0])  + unsigned(s2[15:0]))
d1 = to_bits(32, unsigned(s1[31:16]) + unsigned(s2[31:16]))

if (rd_p != 0):
    X[2*rd_p]   = d0
    X[2*rd_p+1] = d1
```

**Description**

PWADDU.H zero-extends each 16-bit halfword element of `rs1` and `rs2`, adds them,
and writes two 32-bit results to the destination register pair when `rd_p != 0`.

# PWADDAU.H (RV32)

**Encoding**

PWADDAU.H is available only in RV32 and accumulates into the destination register pair.
:contentReference[oaicite:6]{index=6}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0011 | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc0 = X[2*rd_p]
acc1 = (rd_p == 0) ? 0 : X[2*rd_p+1]

acc0 = acc0 + to_bits(32, unsigned(s1[15:0])  + unsigned(s2[15:0]))
acc1 = acc1 + to_bits(32, unsigned(s1[31:16]) + unsigned(s2[31:16]))

if (rd_p != 0):
    X[2*rd_p]   = acc0
    X[2*rd_p+1] = acc1
```

**Description**

PWADDAU.H performs PWADDU.H and accumulates the two 32-bit results into the
destination register pair.

# PWSUB.H (RV32)

**Encoding**

PWSUB.H is available only in RV32.
:contentReference[oaicite:7]{index=7}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1000 | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d0 = to_bits(32, signed(s1[15:0])  - signed(s2[15:0]))
d1 = to_bits(32, signed(s1[31:16]) - signed(s2[31:16]))

if (rd_p != 0):
    X[2*rd_p]   = d0
    X[2*rd_p+1] = d1
```

**Description**

PWSUB.H sign-extends each 16-bit halfword element, subtracts element-wise, and
writes two 32-bit results to the destination register pair when `rd_p != 0`.

# PWSUBA.H (RV32)

**Encoding**

PWSUBA.H is available only in RV32 and accumulates into the destination register pair.
:contentReference[oaicite:8]{index=8}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1001 | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc0 = X[2*rd_p]
acc1 = (rd_p == 0) ? 0 : X[2*rd_p+1]

acc0 = acc0 + to_bits(32, signed(s1[15:0])  - signed(s2[15:0]))
acc1 = acc1 + to_bits(32, signed(s1[31:16]) - signed(s2[31:16]))

if (rd_p != 0):
    X[2*rd_p]   = acc0
    X[2*rd_p+1] = acc1
```

**Description**

PWSUBA.H performs PWSUB.H and accumulates the two 32-bit results into the
destination register pair.

# PWSUBU.H (RV32)

**Encoding**

PWSUBU.H is available only in RV32.
:contentReference[oaicite:9]{index=9}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1010 | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d0 = to_bits(32, unsigned(s1[15:0])  - unsigned(s2[15:0]))
d1 = to_bits(32, unsigned(s1[31:16]) - unsigned(s2[31:16]))

if (rd_p != 0):
    X[2*rd_p]   = d0
    X[2*rd_p+1] = d1
```

**Description**

PWSUBU.H zero-extends each 16-bit halfword element, subtracts element-wise as
unsigned values, and writes two 32-bit results to the destination register pair
when `rd_p != 0`.

# PWSUBAU.H (RV32)

**Encoding**

PWSUBAU.H is available only in RV32 and accumulates into the destination register pair.
:contentReference[oaicite:10]{index=10}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1011 | w=00   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc0 = X[2*rd_p]
acc1 = (rd_p == 0) ? 0 : X[2*rd_p+1]

acc0 = acc0 + to_bits(32, unsigned(s1[15:0])  - unsigned(s2[15:0]))
acc1 = acc1 + to_bits(32, unsigned(s1[31:16]) - unsigned(s2[31:16]))

if (rd_p != 0):
    X[2*rd_p]   = acc0
    X[2*rd_p+1] = acc1
```

**Description**

PWSUBAU.H performs PWSUBU.H and accumulates the two 32-bit results into the
destination register pair.

# PWSLLI.H (RV32)

**Encoding**

PWSLLI.H is available only in RV32. The shift amount is encoded in `w_uimm`.
:contentReference[oaicite:11]{index=11}

| 31 | 30..28 | 27 | 26..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---|---------|
| 0  | f=000  | 0  | w_uimm | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = w_uimm[4:0]

d0 = zero_extend(32, s1[15:0])  << shamt
d1 = zero_extend(32, s1[31:16]) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d0
    X[2*rd_p+1] = d1
```

**Description**

PWSLLI.H widens each 16-bit element of `rs1` to 32 bits by zero-extension, then
shifts left by an immediate amount, producing two 32-bit results.

# PWSLL.HS (RV32)

**Encoding**

PWSLL.HS is available only in RV32. The shift amount is taken from `rs2`.
:contentReference[oaicite:12]{index=12}

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---|---------|
| 0  | f=000  | 1  | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]

d0 = zero_extend(32, s1[15:0])  << shamt
d1 = zero_extend(32, s1[31:16]) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d0
    X[2*rd_p+1] = d1
```

**Description**

PWSLL.HS widens each 16-bit element of `rs1` to 32 bits by zero-extension, then
shifts left by the amount in `rs2` (low 5 bits).

# PWSLAI.H (RV32)

**Encoding**

PWSLAI.H is available only in RV32. The shift amount is encoded in `w_uimm`.
:contentReference[oaicite:13]{index=13}

| 31 | 30..28 | 27 | 26..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---|---------|
| 0  | f=100  | 0  | w_uimm | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = w_uimm[4:0]

d0 = sign_extend(32, s1[15:0])  << shamt
d1 = sign_extend(32, s1[31:16]) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d0
    X[2*rd_p+1] = d1
```

**Description**

PWSLAI.H widens each 16-bit element of `rs1` to 32 bits by sign-extension, then
shifts left by an immediate amount.

# PWSLA.HS (RV32)

**Encoding**

PWSLA.HS is available only in RV32. The shift amount is taken from `rs2`.
:contentReference[oaicite:14]{index=14}

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---|---------|
| 0  | f=100  | 1  | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1    = X[rs1]
shamt = X[rs2][4:0]

d0 = sign_extend(32, s1[15:0])  << shamt
d1 = sign_extend(32, s1[31:16]) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d0
    X[2*rd_p+1] = d1
```

**Description**

PWSLA.HS widens each 16-bit element of `rs1` to 32 bits by sign-extension, then
shifts left by the amount in `rs2` (low 5 bits).

# WADD (RV32)

**Encoding**

WADD is available only in RV32 and writes a 64-bit result to register pair `rd_p`.
:contentReference[oaicite:16]{index=16}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  |f=0000  | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
d = to_bits(64, signed(X[rs1]) + signed(X[rs2]))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

WADD adds `rs1` and `rs2` as signed XLEN values and writes the 64-bit sum to the
destination register pair when `rd_p != 0`.

# WADDA (RV32)

**Encoding**

WADDA is available only in RV32 and accumulates into the destination register pair.
:contentReference[oaicite:17]{index=17}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0001 | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
acc = (rd_p == 0) ? 0 : (X[2*rd_p+1] @ X[2*rd_p])
acc = acc + to_bits(64, signed(X[rs1]) + signed(X[rs2]))

if (rd_p != 0):
    X[2*rd_p]   = acc[31:0]
    X[2*rd_p+1] = acc[63:32]
```

**Description**

WADDA performs WADD and accumulates the 64-bit result into the destination
register pair.

# WADDU (RV32)

**Encoding**

WADDU is available only in RV32.
:contentReference[oaicite:18]{index=18}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0010 | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
d = to_bits(64, unsigned(X[rs1]) + unsigned(X[rs2]))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

WADDU adds `rs1` and `rs2` as unsigned XLEN values and writes the 64-bit sum to
the destination register pair when `rd_p != 0`.

# WADDAU (RV32)

**Encoding**

WADDAU is available only in RV32 and accumulates into the destination register pair.
:contentReference[oaicite:19]{index=19}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=0011 | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
acc = (rd_p == 0) ? 0 : (X[2*rd_p+1] @ X[2*rd_p])
acc = acc + to_bits(64, unsigned(X[rs1]) + unsigned(X[rs2]))

if (rd_p != 0):
    X[2*rd_p]   = acc[31:0]
    X[2*rd_p+1] = acc[63:32]
```

**Description**

WADDAU performs WADDU and accumulates the 64-bit result into the destination
register pair.

# WSUB (RV32)

**Encoding**

WSUB is available only in RV32.
:contentReference[oaicite:20]{index=20}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1000 | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
d = to_bits(64, signed(X[rs1]) - signed(X[rs2]))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

WSUB subtracts `rs2` from `rs1` as signed XLEN values and writes the 64-bit
difference to the destination register pair when `rd_p != 0`.

# WSUBA (RV32)

**Encoding**

WSUBA is available only in RV32 and accumulates into the destination register pair.
:contentReference[oaicite:21]{index=21}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1001 | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
acc = (rd_p == 0) ? 0 : (X[2*rd_p+1] @ X[2*rd_p])
acc = acc + to_bits(64, signed(X[rs1]) - signed(X[rs2]))

if (rd_p != 0):
    X[2*rd_p]   = acc[31:0]
    X[2*rd_p+1] = acc[63:32]
```

**Description**

WSUBA performs WSUB and accumulates the 64-bit result into the destination
register pair.

# WSUBU (RV32)

**Encoding**

WSUBU is available only in RV32.
:contentReference[oaicite:22]{index=22}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1010 | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
d = to_bits(64, unsigned(X[rs1]) - unsigned(X[rs2]))

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

WSUBU subtracts `rs2` from `rs1` as unsigned XLEN values and writes the 64-bit
difference to the destination register pair when `rd_p != 0`.

# WSUBAU (RV32)

**Encoding**

WSUBAU is available only in RV32 and accumulates into the destination register pair.
:contentReference[oaicite:23]{index=23}

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---|---------|
| 0  | f=1011 | w=01   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
acc = (rd_p == 0) ? 0 : (X[2*rd_p+1] @ X[2*rd_p])
acc = acc + to_bits(64, unsigned(X[rs1]) - unsigned(X[rs2]))

if (rd_p != 0):
    X[2*rd_p]   = acc[31:0]
    X[2*rd_p+1] = acc[63:32]
```

**Description**

WSUBAU performs WSUBU and accumulates the 64-bit result into the destination
register pair.

# WSLL (RV32)

**Encoding**

WSLL is available only in RV32. The shift amount is taken from `rs2`.
:contentReference[oaicite:25]{index=25}

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---|---------|
| 0  | f=000  | 1  | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
shamt = X[rs2][5:0]
d = zero_extend(64, X[rs1]) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

WSLL zero-extends `rs1` to 64 bits, shifts left by the amount in `rs2` (low 6 bits),
and writes the 64-bit result to the destination register pair when `rd_p != 0`.

# WSLLI (RV32)

**Encoding**

WSLLI is available only in RV32. The shift amount is encoded in `w_uimm`.
:contentReference[oaicite:24]{index=24}

| 31 | 30..28 | 27 | 26..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---|---------|
| 0  | f=000  | 0  | w_uimm | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
shamt = w_uimm[5:0]
d = zero_extend(64, X[rs1]) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

WSLLI zero-extends `rs1` to 64 bits, shifts left by an immediate amount, and
writes the 64-bit result to the destination register pair when `rd_p != 0`.

# WSLA (RV32)

**Encoding**

WSLA is available only in RV32. The shift amount is taken from `rs2`.
:contentReference[oaicite:27]{index=27}

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---|---------|
| 0  | f=100  | 1  | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
shamt = X[rs2][5:0]
d = sign_extend(64, X[rs1]) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

WSLA sign-extends `rs1` to 64 bits, shifts left by the amount in `rs2` (low 6 bits),
and writes the 64-bit result to the destination register pair when `rd_p != 0`.

# WSLAI (RV32)

**Encoding**

WSLAI is available only in RV32. The shift amount is encoded in `w_uimm`.
:contentReference[oaicite:26]{index=26}

| 31 | 30..28 | 27 | 26..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---|---------|
| 0  | f=100  | 0  | w_uimm | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
shamt = w_uimm[5:0]
d = sign_extend(64, X[rs1]) << shamt

if (rd_p != 0):
    X[2*rd_p]   = d[31:0]
    X[2*rd_p+1] = d[63:32]
```

**Description**

WSLAI sign-extends `rs1` to 64 bits, shifts left by an immediate amount, and
writes the 64-bit result to the destination register pair when `rd_p != 0`.

# WZIP8P (RV32)

**Encoding**

WZIP8P is available only in RV32. It writes its 64-bit result to the even-odd
register pair specified by `rd_p` (no write occurs if `rd_p = 0`).
It is encoded in the RV32 register-pair OP-IMM-32 format with `f=111` and `w=10`.
:contentReference[oaicite:1]{index=1}

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---|---------|
| 0  | f=111  | 1  | w=10   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

lo = s2[15:8]  @ s1[15:8]  @ s2[7:0]   @ s1[7:0]
hi = s2[31:24] @ s1[31:24] @ s2[23:16] @ s1[23:16]

if (rd_p != 0):
    X[2*rd_p]   = lo
    X[2*rd_p+1] = hi
```

**Description**

WZIP8P interleaves the low four bytes of `rs1` and `rs2` into a 64-bit result,
arranged as two 32-bit halves. The lower destination register receives the
interleaving of bytes [15:0], and the upper destination register receives the
interleaving of bytes [31:16].

# WZIP16P (RV32)

**Encoding**

WZIP16P is available only in RV32. It writes its 64-bit result to the even-odd
register pair specified by `rd_p` (no write occurs if `rd_p = 0`).
It is encoded in the RV32 register-pair OP-IMM-32 format with `f=111` and `w=11`.
:contentReference[oaicite:2]{index=2}

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---|---------|
| 0  | f=111  | 1  | w=11   | rs2    | rs1    | 010    | rd_p  | 1 | 0011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

lo = s2[15:0]  @ s1[15:0]
hi = s2[31:16] @ s1[31:16]

if (rd_p != 0):
    X[2*rd_p]   = lo
    X[2*rd_p+1] = hi
```

**Description**

WZIP16P interleaves 16-bit halfwords from `rs1` and `rs2` into a 64-bit result.
The lower destination register receives `{rs2[15:0], rs1[15:0]}`, and the upper
destination register receives `{rs2[31:16], rs1[31:16]}`.

# PREDSUM.DBS (RV32)

**Encoding**

PREDSUM.DBS is available only in RV32. It reads a 64-bit packed source from the
even-odd register pair specified by `rs1_p` and produces a 32-bit scalar result
in `rd`. If `rs1_p = 0`, the source pair is treated as zero.

PREDSUM.DBS is encoded in the OP-IMM-32 major opcode with `func3=100`, bit 28
set to 1, and `rs1_p` selecting the source register pair.
:contentReference[oaicite:2]{index=2}

| 31..29 | 28 | 27..26 | 25..20 | 19..16 | 14..12 | 11..7 | 6..0    |
|--------|----|--------|--------|--------|--------|-------|---------|
| f=001  | 1  | w=01   | rs2    | rs1_p  | 100    | rd    | 0011011 |

**Operation**

```python
s1 =
  (rs1_p == 0) ? 0
               : (X[2*rs1_p+1] @ X[2*rs1_p])  // 64-bit

sum = signed(X[rs2])  // scalar accumulator (int)

for i = 0 .. 7:
    sum += signed(s1[(8*i+7) : (8*i)])  // signed bytes

X[rd] = to_bits(32, sum)
```

**Description**

PREDSUM.DBS adds the eight signed 8-bit elements contained in the 64-bit source
register pair `rs1_p` to the signed scalar value in `rs2`, and writes the low
32 bits of the resulting sum to `rd`.

# PREDSUMU.DBS (RV32)

**Encoding**

PREDSUMU.DBS is available only in RV32. It reads a 64-bit packed source from the
even-odd register pair specified by `rs1_p` and produces a 32-bit scalar result
in `rd`. If `rs1_p = 0`, the source pair is treated as zero.
:contentReference[oaicite:3]{index=3}

| 31..29 | 28 | 27..26 | 25..20 | 19..16 | 14..12 | 11..7 | 6..0    |
|--------|----|--------|--------|--------|--------|-------|---------|
| f=011  | 1  | w=01   | rs2    | rs1_p  | 100    | rd    | 0011011 |

**Operation**

```python
s1 =
  (rs1_p == 0) ? 0
               : (X[2*rs1_p+1] @ X[2*rs1_p])  // 64-bit

sum = unsigned(X[rs2])  // scalar accumulator (int)

for i = 0 .. 7:
    sum += unsigned(s1[(8*i+7) : (8*i)])  // unsigned bytes

X[rd] = to_bits(32, sum)
```

**Description**

PREDSUMU.DBS adds the eight unsigned 8-bit elements contained in the 64-bit
source register pair `rs1_p` to the unsigned scalar value in `rs2`, and writes
the low 32 bits of the resulting sum to `rd`.

# PREDSUM.DHS (RV32)

**Encoding**

PREDSUM.DHS is available only in RV32. It reads a 64-bit packed source from the
even-odd register pair specified by `rs1_p` and produces a 32-bit scalar result
in `rd`. If `rs1_p = 0`, the source pair is treated as zero.
:contentReference[oaicite:4]{index=4}

| 31..29 | 28 | 27..26 | 25..20 | 19..16 | 14..12 | 11..7 | 6..0    |
|--------|----|--------|--------|--------|--------|-------|---------|
| f=001  | 1  |w=00    | rs2    | rs1_p  | 100    | rd    | 0011011 |

**Operation**

```python
s1 =
  (rs1_p == 0) ? 0
               : (X[2*rs1_p+1] @ X[2*rs1_p])  // 64-bit

sum = signed(X[rs2])  // scalar accumulator (int)

for i = 0 .. 3:
    sum += signed(s1[(16*i+15) : (16*i)])  // signed halfwords

X[rd] = to_bits(32, sum)
```

**Description**

PREDSUM.DHS adds the four signed 16-bit elements contained in the 64-bit source
register pair `rs1_p` to the signed scalar value in `rs2`, and writes the low
32 bits of the resulting sum to `rd`.

# PREDSUMU.DHS (RV32)

**Encoding**

PREDSUMU.DHS is available only in RV32. It reads a 64-bit packed source from the
even-odd register pair specified by `rs1_p` and produces a 32-bit scalar result
in `rd`. If `rs1_p = 0`, the source pair is treated as zero.
:contentReference[oaicite:5]{index=5}

|31..29 | 28 | 27..26 | 25..20 | 19..16 | 14..12 | 11..7 | 6..0    |
|-------|----|--------|--------|--------|--------|-------|---------|
| f=011 | 1  | w=00   | rs2    | rs1_p  | 100    | rd    | 0011011 |

**Operation**

```python
s1 =
  (rs1_p == 0) ? 0
               : (X[2*rs1_p+1] @ X[2*rs1_p])  // 64-bit

sum = unsigned(X[rs2])         // scalar accumulator (int)

for i = 0 .. 3:
    sum += unsigned(s1[(16*i+15) : (16*i)])  // unsigned halfwords

X[rd] = to_bits(32, sum)
```

**Description**

PREDSUMU.DHS adds the four unsigned 16-bit elements contained in the 64-bit
source register pair `rs1_p` to the unsigned scalar value in `rs2`, and writes
the low 32 bits of the resulting sum to `rd`.

# PNSRLI.B (RV32)

**Encoding**

PNSRLI.B is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p` and produces a packed byte result in
`rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=000  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm[6:4]` selects the element width and must be `001` for the `.B` form.
`w-uimm[3:0]` provides the 4-bit shift amount.

**Operation**

```python
s1 = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[3:0]

for i = 0 .. 3:
    h = s1[(16*i+15):(16*i)]  // 16-bit lane
    d[(8*i+7):(8*i)] = (zext_32(h) >> shamt)[7:0]

X[rd] = d
```

**Description**

PNSRLI.B extracts four 16-bit lanes from a 64-bit register-pair source, performs
a logical right shift by an immediate amount, and packs the low byte of each
shifted lane into `rd`.

# PNSRL.BS (RV32)

**Encoding**

PNSRL.BS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p` and uses `rs2[4:0]` as the shift amount.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=000  | 1  | w=00   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1 = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 3:
    h = s1[(16*i+15):(16*i)]
    d[(8*i+7):(8*i)] = (zext_32(h) >> shamt)[7:0]

X[rd] = d
```

**Description**

PNSRL.BS performs a per-lane logical right shift of four 16-bit lanes taken from
a 64-bit register-pair source, using a shift amount from `rs2`. The low byte of
each shifted lane is packed into `rd`.

# PNSRAI.B (RV32)

**Encoding**

PNSRAI.B is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p` and produces a packed byte result in
`rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=100  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm[6:4]` must be `001` for the `.B` form and `w-uimm[3:0]` is the shift
amount.

**Operation**

```python
s1 = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[3:0]

for i = 0 .. 3:
    h = s1[(16*i+15):(16*i)]
    d[(8*i+7):(8*i)] = (sext_32(h) >> shamt)[7:0]

X[rd] = d
```

**Description**

PNSRAI.B extracts four 16-bit lanes from a 64-bit register-pair source, performs
an arithmetic right shift by an immediate amount, and packs the low byte of each
shifted lane into `rd`.

# PNSRA.BS (RV32)

**Encoding**

PNSRA.BS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p` and uses `rs2[4:0]` as the shift amount.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=100  | 1  | w=00   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1 = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 3:
    h = s1[(16*i+15):(16*i)]
    d[(8*i+7):(8*i)] = (sext_32(h) >> shamt)[7:0]

X[rd] = d
```

**Description**

PNSRA.BS performs a per-lane arithmetic right shift of four 16-bit lanes taken
from a 64-bit register-pair source, using a shift amount from `rs2`. The low
byte of each shifted lane is packed into `rd`.

# PNSRARI.B (RV32)

**Encoding**

PNSRARI.B is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p` and performs a rounded arithmetic right shift by an immediate amount.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=101  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm[6:4]` must be `001` for the `.B` form and `w-uimm[3:0]` is the shift
amount.

**Operation**

```python
s1 = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[3:0]

for i = 0 .. 3:
    h  = s1[(16*i+15):(16*i)]
    // Compute rounded arithmetic shift: ( (h << 1) >> shamt + 1 ) >> 1
    shx = ((sext_32(h) @ 0b0) >> shamt)[8:0]
    d[(8*i+7):(8*i)] = (shx + 1)[8:1]

X[rd] = d
```

**Description**

PNSRARI.B performs a per-lane rounded arithmetic right shift of four 16-bit lanes
from a 64-bit register-pair source using an immediate shift amount, and packs
the resulting bytes into `rd`.

# PNSRAR.BS (RV32)

**Encoding**

PNSRAR.BS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p` and uses `rs2[4:0]` as the shift amount.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=101  | 1  | w=00   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1 = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 3:
    h  = s1[(16*i+15):(16*i)]
    shx = ((sext_32(h) @ 0b0) >> shamt)[8:0]
    d[(8*i+7):(8*i)] = (shx + 1)[8:1]

X[rd] = d
```

**Description**

PNSRAR.BS performs a per-lane rounded arithmetic right shift of four 16-bit lanes
from a 64-bit register-pair source using a shift amount from `rs2`, and packs
the resulting bytes into `rd`.

# PNCLIPI.B (RV32)

**Encoding**

PNCLIPI.B is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p`, uses an immediate shift amount, and
writes packed clipped bytes to `rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=110  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm[6:4]` selects the element width and must be `001` for the `.B` form.
`w-uimm[3:0]` provides the 4-bit shift amount.

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[3:0]

for i = 0 .. 3:
    h   = s1[(16*i+15):(16*i)]  // 16-bit lane
    shx = (sext_32(h) >> shamt)[15:0]  // arithmetic shift, keep 16 bits

    if (shx <_s 0xFF80):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0x80
    else if (shx >_s 0x007F):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0x7F
    else:
        d[(8*i+7):(8*i)] = shx[7:0]

X[rd] = d
```

**Description**

PNCLIPI.B performs a per-lane arithmetic right shift of four 16-bit lanes from a
64-bit register-pair source using an immediate shift amount. Each shifted value
is then clipped to the signed 8-bit range [-128, 127] and packed into `rd`.

When clipping occurs for any lane, the `vxsat` sticky flag is set to 1.

**Notes**

* The source is taken from the register pair `{X[2*rs1p+1], X[2*rs1p]}`; if
  `rs1p=0`, the source is treated as zero.
* `vxsat` is set if any lane saturates; it is not cleared by this instruction.

# PNSRAR.BS (RV32)

**Encoding**

PNSRAR.BS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p` and uses `rs2[4:0]` as the shift amount.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=101  | 1  | w=00   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1 = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 3:
    h  = s1[(16*i+15):(16*i)]
    shx = ((sext_32(h) @ 0b0) >> shamt)[8:0]
    d[(8*i+7):(8*i)] = (shx + 1)[8:1]

X[rd] = d
```

**Description**

PNSRAR.BS performs a per-lane rounded arithmetic right shift of four 16-bit lanes
from a 64-bit register-pair source using a shift amount from `rs2`, and packs
the resulting bytes into `rd`.

# PNCLIPRI.B (RV32)

**Encoding**

PNCLIPRI.B is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p`, uses an immediate shift amount, and
writes packed clipped bytes to `rd`. This is the *rounded* variant of
PNCLIPI.B.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=111  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm[6:4]` selects the element width and must be `001` for the `.B` form.
`w-uimm[3:0]` provides the 4-bit shift amount.

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[3:0]

for i = 0 .. 3:
    h = s1[(16*i+15):(16*i)]

    // Rounded arithmetic shift:
    // shx = ((sext(h) << 1) >> shamt), then (shx + 1) >> 1
    shx = ((sext_32(h) @ 0b0) >> shamt)[16:0]  // keep 17 bits
    r   = (shx + 1)[16:1]  // rounded 16-bit result

    if (r <_s 0xFF80):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0x80
    else if (r >_s 0x007F):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0x7F
    else:
        d[(8*i+7):(8*i)] = r[7:0]

X[rd] = d
```

**Description**

PNCLIPRI.B performs a per-lane *rounded* arithmetic right shift of four 16-bit
lanes from a 64-bit register-pair source using an immediate shift amount. Each
rounded shifted value is then clipped to the signed 8-bit range [-128, 127] and
packed into `rd`.

When clipping occurs for any lane, the `vxsat` sticky flag is set to 1.

**Notes**

* The source is taken from the register pair `{X[2*rs1p+1], X[2*rs1p]}`; if
  `rs1p=0`, the source is treated as zero.
* `vxsat` is set if any lane saturates; it is not cleared by this instruction.

# PNCLIPR.BS (RV32)

**Encoding**

PNCLIPR.BS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p`, uses `rs2[4:0]` as the shift amount,
and writes packed clipped bytes to `rd`. This is the *rounded* variant of
PNCLIP.BS.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=111  | 1  | w=00   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 3:
    h = s1[(16*i+15):(16*i)]

    // Rounded arithmetic shift:
    // shx = ((sext(h) << 1) >> shamt), then (shx + 1) >> 1
    shx = ((sext_48(h) @ 0b0) >> shamt)[16:0]  // keep 17 bits
    r   = (shx + 1)[16:1]  // rounded 16-bit result

    if (r <_s 0xFF80):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0x80
    else if (r >_s 0x007F):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0x7F
    else:
        d[(8*i+7):(8*i)] = r[7:0]

X[rd] = d
```

**Description**

PNCLIPR.BS performs a per-lane *rounded* arithmetic right shift of four 16-bit
lanes from a 64-bit register-pair source using the shift amount in `rs2[4:0]`.
Each rounded shifted value is then clipped to the signed 8-bit range [-128, 127]
and packed into `rd`.

When clipping occurs for any lane, the `vxsat` sticky flag is set to 1.

**Notes**

* The source is taken from the register pair `{X[2*rs1p+1], X[2*rs1p]}`; if
  `rs1p=0`, the source is treated as zero.
* `vxsat` is set if any lane saturates; it is not cleared by this instruction.

# PNCLIPIU.B (RV32)

**Encoding**

PNCLIPIU.B is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p`, uses an immediate shift amount, and
writes packed *unsigned-clipped* bytes to `rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=010  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm[6:4]` selects the element width and must be `001` for the `.B` form.
`w-uimm[3:0]` provides the 4-bit shift amount.

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[3:0]

for i = 0 .. 3:
    h   = s1[(16*i+15):(16*i)]  // 16-bit lane
    shx = zext_32(h) >> shamt  // logical shift (unsigned)

    if (shx >_u 0x00FF):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0xFF
    else:
        d[(8*i+7):(8*i)] = shx[7:0]

X[rd] = d
```

**Description**

PNCLIPIU.B performs a per-lane logical right shift of four 16-bit lanes from a
64-bit register-pair source using an immediate shift amount. Each shifted value
is then clipped to the unsigned 8-bit range [0, 255] and packed into `rd`.

When clipping occurs for any lane, the `vxsat` sticky flag is set to 1.

**Notes**

* The source is taken from the register pair `{X[2*rs1p+1], X[2*rs1p]}`; if
  `rs1p=0`, the source is treated as zero.
* `vxsat` is set if any lane saturates; it is not cleared by this instruction.

# PNCLIPU.BS (RV32)

**Encoding**

PNCLIPU.BS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p`, uses `rs2[4:0]` as the shift amount,
and writes packed *unsigned-clipped* bytes to `rd`.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=010  | 1  | w=00   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 3:
    h   = s1[(16*i+15):(16*i)]  // 16-bit lane
    shx = (zext_32(h) >> shamt)[15:0]  // keep 16 bits

    if (shx >_u 0x00FF):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0xFF
    else:
        d[(8*i+7):(8*i)] = shx[7:0]

X[rd] = d
```

**Description**

PNCLIPU.BS performs a per-lane logical right shift of four 16-bit lanes from a
64-bit register-pair source using a shift amount from `rs2`. Each shifted value
is clipped to the unsigned 8-bit range [0, 255] and packed into `rd`. The `vxsat`
sticky flag is set if any lane saturates.

# PNCLIPRIU.B (RV32)

**Encoding**

PNCLIPRIU.B is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p`, uses an immediate shift amount, and
writes packed *rounded unsigned-clipped* bytes to `rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=011  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm[6:4]` must be `001` for the `.B` form and `w-uimm[3:0]` provides the
4-bit shift amount.

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[3:0]

for i = 0 .. 3:
    h = s1[(16*i+15):(16*i)]  // 16-bit lane (unsigned)

    // Rounded logical shift:
    shx = ((h @ 0b0) >> shamt)  // 17-bit intermediate
    r   = (shx + 1)[16:1]   // rounded 16-bit result

    if (r >_u 0x00FF):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0xFF
    else:
        d[(8*i+7):(8*i)] = r[7:0]

X[rd] = d
```

**Description**

PNCLIPRIU.B performs a per-lane *rounded* logical right shift of four 16-bit lanes
from a 64-bit register-pair source using an immediate shift amount. Each rounded
shifted value is clipped to the unsigned 8-bit range [0, 255] and packed into
`rd`. The `vxsat` sticky flag is set if any lane saturates.

# PNCLIPRU.BS (RV32)

**Encoding**

PNCLIPRU.BS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from the register pair selected by `rs1p`, uses `rs2[4:0]` as the shift amount,
and writes packed *rounded unsigned-clipped* bytes to `rd`.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=011  | 1  | w=00   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 3:
    h = s1[(16*i+15):(16*i)]

    shx = ((zext_32(h) @ 0b0) >> shamt)[16:0]
    r   = (shx + 1)[16:1]

    if (r >_u 0x00FF):
        vxsat = 1
        d[(8*i+7):(8*i)] = 0xFF
    else:
        d[(8*i+7):(8*i)] = r[7:0]

X[rd] = d
```

**Description**

PNCLIPRU.BS performs a per-lane *rounded* logical right shift of four 16-bit lanes
from a 64-bit register-pair source using a shift amount from `rs2`. Each rounded
shifted value is clipped to [0, 255] and packed into `rd`. The `vxsat` sticky
flag is set if any lane saturates.

# PNSRLI.H (RV32)

**Encoding**

PNSRLI.H is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p`, shifts each 32-bit word lane right by an immediate amount, and packs
the low 16 bits of each shifted word into `rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=000  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm[6:5]` selects the `.H` form and `w-uimm[4:0]` provides the 5-bit shift
amount.

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[4:0]

d[15:0]  = (s1[31:0]  >> shamt)[15:0]
d[31:16] = (s1[63:32] >> shamt)[15:0]

X[rd] = d
```

**Description**

PNSRLI.H performs a logical right shift of each 32-bit word lane in a 64-bit
register-pair source by an immediate amount, then packs the low 16 bits of each
shifted word into `rd`.

# PNSRL.HS (RV32)

**Encoding**

PNSRL.HS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p`, uses `rs2[4:0]` as the shift amount, and packs 16-bit results into
`rd`.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=000  | 1  | w=01   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

d[15:0]  = (s1[31:0]  >> shamt)[15:0]
d[31:16] = (s1[63:32] >> shamt)[15:0]

X[rd] = d
```

**Description**

PNSRL.HS performs a logical right shift of each 32-bit word lane in a 64-bit
register-pair source by a shift amount from `rs2`, then packs the low 16 bits of
each shifted word into `rd`.

# PNSRAI.H (RV32)

**Encoding**

PNSRAI.H is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p`, performs an arithmetic right shift by an immediate amount on each
32-bit word lane, and packs 16-bit results into `rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=100  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

`w-uimm` selects the `.H` form and provides a 5-bit shift amount (`w_uimm[4:0]`).

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[4:0]

d[15:0]  = (sext_48(s1[31:0])  >> shamt)[15:0]
d[31:16] = (sext_48(s1[63:32]) >> shamt)[15:0]

X[rd] = d
```

**Description**

PNSRAI.H performs an arithmetic right shift of each 32-bit word lane in a 64-bit
register-pair source by an immediate amount, then packs the low 16 bits of each
shifted word into `rd`.

# PNSRA.HS (RV32)

**Encoding**

PNSRA.HS is encoded using the OP-IMM-32 major opcode. It reads a 64-bit source
from `rs1p`, uses `rs2[4:0]` as the shift amount, performs per-word arithmetic
right shifts, and packs 16-bit results into `rd`.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=100  | 1  | w=01   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

d[15:0]  = (sext_48(s1[31:0])  >> shamt)[15:0]
d[31:16] = (sext_48(s1[63:32]) >> shamt)[15:0]

X[rd] = d
```

**Description**

PNSRA.HS performs an arithmetic right shift of each 32-bit word lane in a 64-bit
register-pair source by a shift amount from `rs2`, then packs the low 16 bits of
each shifted word into `rd`.

# PNSRARI.H (RV32)

**Encoding**

PNSRARI.H is encoded using the OP-IMM-32 major opcode. It performs a per-word
*rounded* arithmetic right shift by an immediate amount and packs 16-bit results
into `rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=101  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[4:0]

for i = 0 .. 1:
    w   = s1[(32*i+31):(32*i)]
    shx = ((sext_48(w) @ 0b0) >> shamt)[16:0]
    d[(16*i+15):(16*i)] = (shx + 1)[16:1]

X[rd] = d
```

**Description**

PNSRARI.H performs a per-word *rounded* arithmetic right shift of the 64-bit
register-pair source by an immediate amount. The low 16 bits of each rounded
shifted word are packed into `rd`.

# PNSRAR.HS (RV32)

**Encoding**

PNSRAR.HS is encoded using the OP-IMM-32 major opcode. It performs a per-word
*rounded* arithmetic right shift using `rs2[4:0]` as the shift amount.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=101  | 1  | w=01   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 1:
    w   = s1[(32*i+31):(32*i)]
    shx = ((sext_48(w) @ 0b0) >> shamt)[16:0]
    d[(16*i+15):(16*i)] = (shx + 1)[16:1]

X[rd] = d
```

**Description**

PNSRAR.HS performs a per-word *rounded* arithmetic right shift of a 64-bit
register-pair source using a shift amount from `rs2`, and packs 16-bit results
into `rd`.

# PNCLIPIU.H (RV32)

**Encoding**

PNCLIPIU.H is encoded using the OP-IMM-32 major opcode. It performs a per-word
logical right shift by an immediate amount and clips each result to the unsigned
16-bit range [0, 65535], setting `vxsat` on saturation.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=010  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[4:0]

for i = 0 .. 1:
    w   = s1[(32*i+31):(32*i)]
    shx = zext_64(w) >> shamt

    if (shx >_u 0x0000FFFF):
        vxsat = 1
        d[(16*i+15):(16*i)] = 0xFFFF
    else:
        d[(16*i+15):(16*i)] = shx[15:0]

X[rd] = d
```

**Description**

PNCLIPIU.H shifts each 32-bit word lane of the 64-bit register-pair source right
logically by an immediate amount, then clips each shifted value to unsigned
16-bit and packs the two halfwords into `rd`. The `vxsat` sticky flag is set if
any lane saturates.

# PNCLIPU.HS (RV32)

**Encoding**

PNCLIPU.HS is encoded using the OP-IMM-32 major opcode. It uses `rs2[4:0]` as the
shift amount and clips to unsigned 16-bit.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=010  | 1  | w=01   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][4:0]

for i = 0 .. 1:
    w   = s1[(32*i+31):(32*i)]
    shx = zext_64(w) >> shamt

    if (shx >_u 0x0000FFFF):
        vxsat = 1
        d[(16*i+15):(16*i)] = 0xFFFF
    else:
        d[(16*i+15):(16*i)] = shx[15:0]

X[rd] = d
```

**Description**

PNCLIPU.HS performs a per-word logical right shift of a 64-bit register-pair
source using `rs2` as the shift amount, clips each lane to unsigned 16-bit, and
packs the results into `rd`. The `vxsat` sticky flag is set on saturation.

# NSRLI (RV32)

**Encoding**

NSRLI is encoded using the OP-IMM-32 major opcode. It reads a 64-bit register-pair
source from `rs1p`, performs a logical right shift by an immediate amount, and
writes the low 32 bits to `rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=000  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

For NSRLI, `w-uimm` uses the `1xxxxxx` encoding class and `w_uimm[5:0]` is the
shift amount.

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[5:0]
X[rd] = (s1 >> shamt)[31:0]
```

**Description**

NSRLI performs a 64-bit logical right shift of the register-pair source by an
immediate amount and returns the low 32 bits.

# NSRL (RV32)

**Encoding**

NSRL is encoded using the OP-IMM-32 major opcode and uses `rs2[5:0]` as the shift
amount.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=000  | 1  | w=11   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][5:0]
X[rd] = (s1 >> shamt)[31:0]
```

**Description**

NSRL performs a 64-bit logical right shift of the register-pair source by a shift
amount from `rs2` and returns the low 32 bits.

# NSRAI (RV32)

**Encoding**

NSRAI is encoded using the OP-IMM-32 major opcode. It performs an arithmetic
right shift by an immediate amount on the 64-bit register-pair source and writes
the low 32 bits to `rd`.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=100  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[5:0]
X[rd] = (sext_96(s1) >> shamt)[31:0]
```

**Description**

NSRAI performs a 64-bit arithmetic right shift of the register-pair source by an
immediate amount and returns the low 32 bits.

# NSRA (RV32)

**Encoding**

NSRA is encoded using the OP-IMM-32 major opcode and uses `rs2[5:0]` as the shift
amount.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=100  | 1  | w=11   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][5:0]
X[rd] = (sext_96(s1) >> shamt)[31:0]
```

**Description**

NSRA performs a 64-bit arithmetic right shift of the register-pair source by a
shift amount from `rs2` and returns the low 32 bits.

# NSRARI (RV32)

**Encoding**

NSRARI is encoded using the OP-IMM-32 major opcode. It performs a *rounded*
arithmetic right shift by an immediate amount on the 64-bit register-pair source.

| 31 | 30..28 | 27 | 26..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|-------|---------|
| 0  | f=101  | 0  | w-uimm | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = w_uimm[5:0]

shx = ((sext_96(s1) @ 0b0) >> shamt)[32:0]
X[rd] = (shx + 1)[32:1]
```

**Description**

NSRARI performs a 64-bit *rounded* arithmetic right shift of the register-pair
source by an immediate amount and returns the rounded low 32-bit result.

# NSRAR (RV32)

**Encoding**

NSRAR is encoded using the OP-IMM-32 major opcode and uses `rs2[5:0]` as the shift
amount for a *rounded* arithmetic right shift.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=101  | 1  | w=11   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][5:0]

shx = ((sext_96(s1) @ 0b0) >> shamt)[32:0]
X[rd] = (shx + 1)[32:1]
```

**Description**

NSRAR performs a 64-bit *rounded* arithmetic right shift of the register-pair
source by a shift amount from `rs2` and returns the rounded low 32-bit result.

# NCLIPU (RV32)

**Encoding**

NCLIPU is encoded using the OP-IMM-32 major opcode. It shifts a 64-bit register-pair
source right logically by a shift amount from `rs2` and clips the result to the
unsigned 32-bit range, setting `vxsat` on saturation.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..16 | 15..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 0  | f=010  | 1  | w=11   | rs2    | rs1p   | 1100   | rd    | 0011011 |

**Operation**

```python
s1    = (rs1p == 0) ? 0 : (X[2*rs1p+1] @ X[2*rs1p])
shamt = X[rs2][5:0]

shx = s1 >> shamt

if (shx >_u 0x00000000FFFFFFFF):
    vxsat = 1
    X[rd] = 0xFFFFFFFF
else:
    X[rd] = shx[31:0]
```

**Description**

NCLIPU performs a 64-bit logical right shift of the register-pair source and clips
the result to 32-bit unsigned. The `vxsat` sticky flag is set if clipping occurs.

# PMULH.H

**Encoding**

PMULH.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and returns the high half of each signed 16×16 multiplication.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0000 | w=00   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    // signed 16x16 -> 32, take high 16 bits
    d[(16*i+15):(16*i)] = to_bits(32, signed(a) * signed(b))[31:16]

X[rd] = d
```

**Description**

PMULH.H performs lane-wise signed multiplication of packed 16-bit elements from
`rs1` and `rs2`. For each lane, the upper 16 bits of the 32-bit product are
written to the corresponding 16-bit element of `rd`.

**Notes**

* This instruction does not set `vxsat`.
* The result is equivalent to arithmetic right shift by 16 of the full 32-bit
  product, keeping the upper half.

# PMULHR.H

**Encoding**

PMULHR.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and returns the rounded high half of each signed 16×16 multiplication.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0000 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    // add 2^15 before taking high 16 bits (rounding)
    d[(16*i+15):(16*i)] =
        to_bits(32, signed(a) * signed(b) + 2^15)[31:16]

X[rd] = d
```

**Description**

PMULHR.H performs lane-wise signed multiplication of packed 16-bit elements from
`rs1` and `rs2`. For each lane, it adds 2^15 to the 32-bit product and then
writes the upper 16 bits of the adjusted value to the corresponding 16-bit
element of `rd`, implementing rounding when extracting the high half.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane result corresponds to rounding the 32-bit product before
  extracting bits [31:16].

# PMULHSU.H

**Encoding**

PMULHSU.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and returns the high half of each mixed signed×unsigned 16×16
multiplication.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1000 | w=00   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    // signed(a) * unsigned(b) -> 32, take high 16 bits
    d[(16*i+15):(16*i)] = to_bits(32, signed(a) * unsigned(b))[31:16]

X[rd] = d
```

**Description**

PMULHSU.H performs lane-wise multiplication of packed 16-bit elements from `rs1`
and `rs2`, treating each element of `rs1` as signed and each element of `rs2` as
unsigned. For each lane, the upper 16 bits of the 32-bit product are written to
the corresponding 16-bit element of `rd`.

**Notes**

* This instruction does not set `vxsat`.
* The result is equivalent to extracting bits [31:16] of the full 32-bit
  mixed signed×unsigned product.

# PMULHRSU.H

**Encoding**

PMULHRSU.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and returns the rounded high half of each mixed signed×unsigned 16×16
multiplication.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1000 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    // add 2^15 before taking high 16 bits (rounding)
    d[(16*i+15):(16*i)] =
        to_bits(32, signed(a) * unsigned(b) + 2^15)[31:16]

X[rd] = d
```

**Description**

PMULHRSU.H performs lane-wise multiplication of packed 16-bit elements from `rs1`
and `rs2`, treating each element of `rs1` as signed and each element of `rs2` as
unsigned. For each lane, it adds 2^15 to the 32-bit product and then writes the
upper 16 bits of the adjusted value to the corresponding 16-bit element of
`rd`, implementing rounding when extracting the high half.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane result corresponds to rounding the mixed signed×unsigned product
  before extracting bits [31:16].

PMULHU.H:

```
    let s1 = X[rs1];
    let s2 = X[rs2];
    var d : bits(xlen);
    foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
        let s1_h = s1[(i*16+15)..(i*16)];
        let s2_h = s2[(i*16+15)..(i*16)];
        d[(i*16+15)..(i*16)] =
            to_bits(32, unsigned(s1_h) * unsigned(s2_h))[31..16];
    }
    X[rd] = d;
```

PMULHRU.H:

```
    let s1 = X[rs1];
    let s2 = X[rs2];
    var d : bits(xlen);
    foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
        let s1_h = s1[(i*16+15)..(i*16)];
        let s2_h = s2[(i*16+15)..(i*16)];
        d[(i*16+15)..(i*16)] =
            to_bits(32, unsigned(s1_h) * unsigned(s2_h) + 2^15)[31..16];
    }
    X[rd] = d;
```

PMULQR.H:

```
    let s1 = X[rs1];
    let s2 = X[rs2];
    var d : bits(xlen);
    foreach (i from 0 to sizeof(xlen_bytes)/2 - 1) {
        let s1_h = s1[(i*16+15)..(i*16)];
        let s2_h = s2[(i*16+15)..(i*16)];
        d[(i*16+15)..(i*16)] =
            if (s1_h == 0x8000) & (s2_h == 0x8000) then { vxsat = 1; 0x7FFF }
                else to_bits(32, signed(s1_h) * signed(s2_h) + 2^14)[30..15];
    }
    X[rd] = d;
```

# PMULHRU.H

**Encoding**

PMULHRU.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and returns the rounded high half of each unsigned 16×16 multiplication.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0010 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]
    // add 2^15 before taking high 16 bits (rounding)
    d[(16*i+15):(16*i)] =
        to_bits(32, unsigned(a) * unsigned(b) + 2^15)[31:16]

X[rd] = d
```

**Description**

PMULHRU.H performs lane-wise unsigned multiplication of packed 16-bit elements
from `rs1` and `rs2`. For each lane, it adds 2^15 to the 32-bit product and then
writes the upper 16 bits of the adjusted value to the corresponding 16-bit
element of `rd`, implementing rounding when extracting the high half.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane result corresponds to rounding the unsigned product before
  extracting bits [31:16].

# PMULQR.H

**Encoding**

PMULQR.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and produces a signed Q15-style rounded product with saturation.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1010 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = s1[(16*i+15):(16*i)]
    b = s2[(16*i+15):(16*i)]

    if (a == 0x8000) & (b == 0x8000):
        vxsat = 1
        d[(16*i+15):(16*i)] = 0x7FFF
    else:
    // signed 16x16 -> 32, add 2^14 for rounding, then take bits [30:15]
        d[(16*i+15):(16*i)] =
            to_bits(32, signed(a) * signed(b) + 2^14)[30:15]

X[rd] = d
```

**Description**

PMULQR.H performs lane-wise signed multiplication of packed 16-bit elements and
returns a Q15-style rounded result per lane. For each lane, it adds 2^14 to the
32-bit product and extracts bits [30:15] (equivalently, a rounded arithmetic
right shift by 15). If both inputs are `0x8000`, the result saturates to
`0x7FFF` and the `vxsat` sticky flag is set.

**Notes**

* `vxsat` is set if any lane saturates; it is not cleared by this instruction.
* The saturation case corresponds to the only overflow scenario for signed Q15
  multiplication: (-1.0)×(-1.0).

# PMHACC.H

**Encoding**

PMHACC.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and accumulates the high half of each signed 16×16 multiplication into
`rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=00   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a   = s1[(16*i+15):(16*i)]
    b   = s2[(16*i+15):(16*i)]
    acc = d[(16*i+15):(16*i)]

    d[(16*i+15):(16*i)] =
        acc + to_bits(32, signed(a) * signed(b))[31:16]

X[rd] = d
```

**Description**

PMHACC.H performs lane-wise signed multiplication of packed 16-bit elements from
`rs1` and `rs2`. For each lane, it extracts the upper 16 bits of the 32-bit
product and adds that value to the corresponding 16-bit element of `rd`. The
accumulated packed result is written back to `rd`.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane add wraps modulo 2^16.

# PMHRACC.H

**Encoding**

PMHRACC.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and accumulates the rounded high half of each signed 16×16
multiplication into `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a   = s1[(16*i+15):(16*i)]
    b   = s2[(16*i+15):(16*i)]
    acc = d[(16*i+15):(16*i)]

    d[(16*i+15):(16*i)] =
        acc + to_bits(32, signed(a) * signed(b) + 2^15)[31:16]

X[rd] = d
```

**Description**

PMHRACC.H performs lane-wise signed multiplication of packed 16-bit elements from
`rs1` and `rs2`. For each lane, it adds 2^15 to the 32-bit product, extracts the
upper 16 bits of the adjusted value, and accumulates that into the corresponding
16-bit element of `rd`. The packed accumulated result is written back to `rd`,
implementing rounding when extracting the high half.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane add wraps modulo 2^16.

# PMHACCSU.H

**Encoding**

PMHACCSU.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and accumulates the high half of each mixed signed×unsigned 16×16
multiplication into `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=00   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a   = s1[(16*i+15):(16*i)]
    b   = s2[(16*i+15):(16*i)]
    acc = d[(16*i+15):(16*i)]

    d[(16*i+15):(16*i)] =
        acc + to_bits(32, signed(a) * unsigned(b))[31:16]

X[rd] = d
```

**Description**

PMHACCSU.H performs lane-wise multiplication of packed 16-bit elements from `rs1`
and `rs2`, treating `rs1` elements as signed and `rs2` elements as unsigned. For
each lane, it extracts the upper 16 bits of the 32-bit product and accumulates
that value into the corresponding 16-bit element of `rd`. The packed accumulated
result is written back to `rd`.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane add wraps modulo 2^16.

# PMHRACCSU.H

**Encoding**

PMHRACCSU.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and accumulates the rounded high half of each mixed signed×unsigned
16×16 multiplication into `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
|1   | f=1001 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a   = s1[(16*i+15):(16*i)]
    b   = s2[(16*i+15):(16*i)]
    acc = d[(16*i+15):(16*i)]

    d[(16*i+15):(16*i)] =
        acc + to_bits(32, signed(a) * unsigned(b) + 2^15)[31:16]

X[rd] = d
```

**Description**

PMHRACCSU.H performs lane-wise multiplication of packed 16-bit elements from `rs1`
and `rs2`, treating `rs1` elements as signed and `rs2` elements as unsigned. For
each lane, it adds 2^15 to the 32-bit product, extracts the upper 16 bits of the
adjusted value, and accumulates that into the corresponding 16-bit element of
`rd`. The packed accumulated result is written back to `rd`, implementing
rounding when extracting the high half.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane add wraps modulo 2^16.

# PMHACCU.H

**Encoding**

PMHACCU.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and accumulates the high half of each unsigned 16×16 multiplication
into `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
|1   | f=0011 | w=00   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a   = s1[(16*i+15):(16*i)]
    b   = s2[(16*i+15):(16*i)]
    acc = d[(16*i+15):(16*i)]

    d[(16*i+15):(16*i)] =
        acc + to_bits(32, unsigned(a) * unsigned(b))[31:16]

X[rd] = d
```

**Description**

PMHACCU.H performs lane-wise unsigned multiplication of packed 16-bit elements
from `rs1` and `rs2`. For each lane, it extracts the upper 16 bits of the 32-bit
product and accumulates that value into the corresponding 16-bit element of
`rd`. The packed accumulated result is written back to `rd`.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane add wraps modulo 2^16.

# PMHRACCU.H

**Encoding**

PMHRACCU.H is encoded using the OP-32 major opcode. It operates on packed 16-bit
elements and accumulates the rounded high half of each unsigned 16×16
multiplication into `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a   = s1[(16*i+15):(16*i)]
    b   = s2[(16*i+15):(16*i)]
    acc = d[(16*i+15):(16*i)]

    d[(16*i+15):(16*i)] =
        acc + to_bits(32, unsigned(a) * unsigned(b) + 2^15)[31:16]

X[rd] = d
```

**Description**

PMHRACCU.H performs lane-wise unsigned multiplication of packed 16-bit elements
from `rs1` and `rs2`. For each lane, it adds 2^15 to the 32-bit product, extracts
the upper 16 bits of the adjusted value, and accumulates that into the
corresponding 16-bit element of `rd`. The packed accumulated result is written
back to `rd`, implementing rounding when extracting the high half.

**Notes**

* This instruction does not set `vxsat`.
* The per-lane add wraps modulo 2^16.

# MULHRSU (RV32)

**Encoding**

MULHRSU is encoded in the OP-32 major opcode using the scalar
multiply-high rounded sub-encoding.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1000 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a64 = sext_64(X[rs1])
b64 = zext_64(X[rs2])
prod = a64 * b64
X[rd] = (prod + 2^31)[63:32]
```

**Description**

The MULHRSU instruction multiplies `rs1` as a signed value by `rs2` as an
unsigned value, adds 2^31 for rounding, and writes the upper 32 bits of the
result to `rd`.

**Notes**

* Rounding is performed by adding 2^31 before extracting bits [63:32].

# MULHRU (RV32)

**Encoding**

MULHRU is encoded in the OP-32 major opcode using the scalar
multiply-high rounded sub-encoding.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0010 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a64 = zext_64(X[rs1])
b64 = zext_64(X[rs2])
prod = a64 * b64
X[rd] = (prod + 2^31)[63:32]
```

**Description**

The MULHRU instruction multiplie

# MHACC (RV32)

**Encoding**

MHACC is encoded in the OP-32 major opcode as a scalar
multiply-high accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a64 = sext_64(X[rs1])
b64 = sext_64(X[rs2])
hi  = (a64 * b64)[63:32]
X[rd] = X[rd] + hi
```

**Description**

The MHACC instruction multiplies `rs1` and `rs2` as signed values, extracts
the upper 32 bits of the product, and accumulates the result into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MHRACC (RV32)

**Encoding**

MHRACC is encoded in the OP-32 major opcode as a scalar
multiply-high rounded accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a64 = sext_64(X[rs1])
b64 = sext_64(X[rs2])
hi_rnd = (a64 * b64 + 2^31)[63:32]
X[rd] = X[rd] + hi_rnd
```

**Description**

The MHRACC instruction multiplies `rs1` and `rs2` as signed values,
rounds the product, and accumulates the upper 32 bits into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^31.

# MHACCSU (RV32)

**Encoding**

MHACCSU is encoded in the OP-32 major opcode as a scalar
signed×unsigned multiply-high accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a64 = sext_64(X[rs1])
b64 = zext_64(X[rs2])
hi  = (a64 * b64)[63:32]
X[rd] = X[rd] + hi
```

**Description**

The MHACCSU instruction multiplies `rs1` as signed by `rs2` as unsigned,
extracts the upper 32 bits of the product, and accumulates the result.

# MHRACCSU (RV32)

**Encoding**

MHRACCSU is encoded in the OP-32 major opcode as a scalar
signed×unsigned multiply-high rounded accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a64 = sext_64(X[rs1])
b64 = zext_64(X[rs2])
hi_rnd = (a64 * b64 + 2^31)[63:32]
X[rd] = X[rd] + hi_rnd
```

**Description**

The MHRACCSU instruction performs a signed×unsigned multiply, rounds the
product, and accumulates the upper 32 bits into `rd`.

# MHACCU (RV32)

**Encoding**

MHACCU is encoded in the OP-32 major opcode as a scalar
unsigned×unsigned multiply-high accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a64 = zext_64(X[rs1])
b64 = zext_64(X[rs2])
hi  = (a64 * b64)[63:32]
X[rd] = X[rd] + hi
```

**Description**

The MHACCU instruction multiplies `rs1` and `rs2` as unsigned values and
accumulates the upper 32 bits of the product into `rd`.

# MHRACCU (RV32)

**Encoding**

MHRACCU is encoded in the OP-32 major opcode as a scalar
unsigned×unsigned multiply-high rounded accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a64 = zext_64(X[rs1])
b64 = zext_64(X[rs2])
hi_rnd = (a64 * b64 + 2^31)[63:32]
X[rd] = X[rd] + hi_rnd
```

**Description**

The MHRACCU instruction multiplies `rs1` and `rs2` as unsigned values,
rounds the product, and accumulates the upper 32 bits into `rd`.

# PMULHSU.W (RV64)

**Encoding**

PMULHSU.W is encoded in the OP-32 major opcode using packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 1:
    a = sext_64(s1[(32*i+31):(32*i)])
    b = zext_64(s2[(32*i+31):(32*i)])
    d[(32*i+31):(32*i)] = (a * b)[63:32]

X[rd] = d
```

**Description**

The PMULHSU.W instruction multiplies corresponding 32-bit elements of `rs1`
(signed) and `rs2` (unsigned), and writes the upper 32 bits of each product
to `rd`.

# PMULHRSU.W (RV64)

**Encoding**

PMULHRSU.W is encoded in the OP-32 major opcode using packed 32-bit elements
with rounding.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 1:
    a = sext_64(s1[(32*i+31):(32*i)])
    b = zext_64(s2[(32*i+31):(32*i)])
    d[(32*i+31):(32*i)] = (a * b + 2^31)[63:32]

X[rd] = d
```

**Description**

The PMULHRSU.W instruction performs signed×unsigned packed multiplication on
32-bit elements, applies rounding, and writes the upper 32 bits of each result
to `rd`.

**Notes**

* Rounding is performed by adding 2^31 before extracting bits [63:32].

# PMULHU.W (RV64)

**Encoding**

PMULHU.W is encoded in the OP-32 major opcode using packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0010 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 1:
    a = zext_64(s1[(32*i+31):(32*i)])
    b = zext_64(s2[(32*i+31):(32*i)])
    d[(32*i+31):(32*i)] = (a * b)[63:32]

X[rd] = d
```

**Description**

The PMULHU.W instruction multiplies corresponding unsigned 32-bit elements of
`rs1` and `rs2`, writing the upper 32 bits of each product to `rd`.

# PMULHRU.W (RV64)

**Encoding**

PMULHRU.W is encoded in the OP-32 major opcode using packed 32-bit elements
with rounding.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0010 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 1:
    a = zext_64(s1[(32*i+31):(32*i)])
    b = zext_64(s2[(32*i+31):(32*i)])
    d[(32*i+31):(32*i)] = (a * b + 2^31)[63:32]

X[rd] = d
```

**Description**

The PMULHRU.W instruction multiplies corresponding unsigned 32-bit elements,
applies rounding, and writes the upper 32 bits of each product to `rd`.

**Notes**

* Rounding is performed by adding 2^31.

# PMHACC.W (RV64)

**Encoding**

PMHACC.W is encoded in the OP-32 major opcode as a packed multiply-high
accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_64(s1[(32*i+31):(32*i)])
    b = sext_64(s2[(32*i+31):(32*i)])
    hi = (a * b)[63:32]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + hi

X[rd] = d
```

**Description**

The PMHACC.W instruction multiplies signed packed 32-bit elements and
accumulates the upper 32 bits of each product into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMHRACC.W (RV64)

**Encoding**

PMHRACC.W is encoded in the OP-32 major opcode as a packed multiply-high
rounded accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_64(s1[(32*i+31):(32*i)])
    b = sext_64(s2[(32*i+31):(32*i)])
    hi = (a * b + 2^31)[63:32]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + hi

X[rd] = d
```

**Description**

The PMHRACC.W instruction performs signed packed multiplication with rounding
and accumulates the upper 32 bits of each product into `rd`.

# PMHACCSU.W (RV64)

**Encoding**

PMHACCSU.W is encoded in the OP-32 major opcode as a packed signed×unsigned
multiply-high accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_64(s1[(32*i+31):(32*i)])
    b = zext_64(s2[(32*i+31):(32*i)])
    hi = (a * b)[63:32]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + hi

X[rd] = d
```

**Description**

The PMHACCSU.W instruction multiplies signed elements of `rs1` with unsigned
elements of `rs2` and accumulates the upper 32 bits into `rd`.

# PMHRACCSU.W (RV64)

**Encoding**

PMHRACCSU.W is encoded in the OP-32 major opcode as a packed signed×unsigned
multiply-high rounded accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_64(s1[(32*i+31):(32*i)])
    b = zext_64(s2[(32*i+31):(32*i)])
    hi = (a * b + 2^31)[63:32]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + hi

X[rd] = d
```

**Description**

The PMHRACCSU.W instruction performs signed×unsigned packed multiplication with
rounding and accumulates the upper 32 bits into `rd`.

# PMHACCU.W (RV64)

**Encoding**

PMHACCU.W is encoded in the OP-32 major opcode as a packed unsigned×unsigned
multiply-high accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = zext_64(s1[(32*i+31):(32*i)])
    b = zext_64(s2[(32*i+31):(32*i)])
    hi = (a * b)[63:32]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + hi

X[rd] = d
```

**Description**

The PMHACCU.W instruction multiplies unsigned packed 32-bit elements and
accumulates the upper 32 bits of each product into `rd`.

# PMHRACCU.W (RV64)

**Encoding**

PMHRACCU.W is encoded in the OP-32 major opcode as a packed unsigned×unsigned
multiply-high rounded accumulate instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = zext_64(s1[(32*i+31):(32*i)])
    b = zext_64(s2[(32*i+31):(32*i)])
    hi = (a * b + 2^31)[63:32]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + hi

X[rd] = d
```

**Description**

The PMHRACCU.W instruction multiplies unsigned packed 32-bit elements with
rounding and accumulates the upper 32 bits of each product into `rd`.

# MQACC.H00 (RV32)

**Encoding**

MQACC.H00 is encoded in the OP-32 major opcode as a scalar Q-format accumulate
instruction operating on the low halfwords of `rs1` and `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a = sext_47(X[rs1][15:0])
b = sext_47(X[rs2][15:0])
q = (a * b)[46:15]
X[rd] = X[rd] + q
```

**Description**

The MQACC.H00 instruction multiplies the low 16-bit halfwords of `rs1` and `rs2`
as signed values, extracts bits [46:15] of the 47-bit product, and accumulates
the extracted value into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MQACC.H01 (RV32)

**Encoding**

MQACC.H01 is encoded in the OP-32 major opcode as a scalar Q-format accumulate
instruction operating on the low halfword of `rs1` and the high halfword of
`rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
a = sext_47(X[rs1][15:0])
b = sext_47(X[rs2][31:16])
q = (a * b)[46:15]
X[rd] = X[rd] + q
```

**Description**

The MQACC.H01 instruction multiplies `rs1[15:0]` by `rs2[31:16]` as signed
halfwords, extracts bits [46:15] of the product, and accumulates the extracted
value into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MQACC.H11 (RV32)

**Encoding**

MQACC.H11 is encoded in the OP-32 major opcode as a scalar Q-format accumulate
instruction operating on the high halfwords of `rs1` and `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a = sext_47(X[rs1][31:16])
b = sext_47(X[rs2][31:16])
q = (a * b)[46:15]
X[rd] = X[rd] + q
```

**Description**

The MQACC.H11 instruction multiplies the high 16-bit halfwords of `rs1` and
`rs2` as signed values, extracts bits [46:15] of the product, and accumulates
the extracted value into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MQRACC.H00 (RV32)

**Encoding**

MQRACC.H00 is encoded in the OP-32 major opcode as a scalar Q-format rounded
accumulate instruction operating on the low halfwords of `rs1` and `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a = sext_47(X[rs1][15:0])
b = sext_47(X[rs2][15:0])
q = (a * b + 2^14)[46:15]
X[rd] = X[rd] + q
```

**Description**

The MQRACC.H00 instruction is like MQACC.H00 but applies rounding by adding
2^14 before extracting bits [46:15], and then accumulates into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^14.

# MQRACC.H01 (RV32)

**Encoding**

MQRACC.H01 is encoded in the OP-32 major opcode as a scalar Q-format rounded
accumulate instruction operating on `rs1[15:0]` and `rs2[31:16]`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=11   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
a = sext_47(X[rs1][15:0])
b = sext_47(X[rs2][31:16])
q = (a * b + 2^14)[46:15]
X[rd] = X[rd] + q
```

**Description**

The MQRACC.H01 instruction is like MQACC.H01 but applies rounding by adding
2^14 before extracting bits [46:15], and then accumulates into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^14.

# MQRACC.H11 (RV32)

**Encoding**

MQRACC.H11 is encoded in the OP-32 major opcode as a scalar Q-format rounded
accumulate instruction operating on the high halfwords of `rs1` and `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a = sext_47(X[rs1][31:16])
b = sext_47(X[rs2][31:16])
q = (a * b + 2^14)[46:15]
X[rd] = X[rd] + q
```

**Description**

The MQRACC.H11 instruction is like MQACC.H11 but applies rounding by adding
2^14 before extracting bits [46:15], and then accumulates into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^14.

# PMQACC.W.H00 (RV64)

**Encoding**

PMQACC.W.H00 is encoded in the OP-32 major opcode as a packed Q-format
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_47(s1[(32*i+15):(32*i)])
    b = sext_47(s2[(32*i+15):(32*i)])
    q = (a * b)[46:15]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + q

X[rd] = d
```

**Description**

The PMQACC.W.H00 instruction, for each 32-bit lane, multiplies the low 16-bit
halfwords of `rs1` and `rs2` as signed values, extracts bits [46:15] of the
product, and accumulates into the corresponding 32-bit element of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMQACC.W.H01 (RV64)

**Encoding**

PMQACC.W.H01 is encoded in the OP-32 major opcode as a packed Q-format
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_47(s1[(32*i+15):(32*i)])
    b = sext_47(s2[(32*i+31):(32*i+16)])
    q = (a * b)[46:15]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + q

X[rd] = d
```

**Description**

The PMQACC.W.H01 instruction, for each 32-bit lane, multiplies the low halfword
of `rs1` by the high halfword of `rs2` (both signed), extracts bits [46:15] of
the product, and accumulates into `rd`.

# PMQACC.W.H11 (RV64)

**Encoding**

PMQACC.W.H11 is encoded in the OP-32 major opcode as a packed Q-format
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_47(s1[(32*i+31):(32*i+16)])
    b = sext_47(s2[(32*i+31):(32*i+16)])
    q = (a * b)[46:15]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + q

X[rd] = d
```

**Description**

The PMQACC.W.H11 instruction, for each 32-bit lane, multiplies the high 16-bit
halfwords of `rs1` and `rs2` as signed values, extracts bits [46:15] of the
product, and accumulates into `rd`.

# PMQRACC.W.H00 (RV64)

**Encoding**

PMQRACC.W.H00 is encoded in the OP-32 major opcode as a packed Q-format rounded
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_47(s1[(32*i+15):(32*i)])
    b = sext_47(s2[(32*i+15):(32*i)])
    q = (a * b + 2^14)[46:15]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + q

X[rd] = d
```

**Description**

The PMQRACC.W.H00 instruction is like PMQACC.W.H00 but applies rounding by
adding 2^14 before extracting bits [46:15], and then accumulates into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^14.

# PMQRACC.W.H01 (RV64)

**Encoding**

PMQRACC.W.H01 is encoded in the OP-32 major opcode as a packed Q-format rounded
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=11   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_47(s1[(32*i+15):(32*i)])
    b = sext_47(s2[(32*i+31):(32*i+16)])
    q = (a * b + 2^14)[46:15]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + q

X[rd] = d
```

**Description**

The PMQRACC.W.H01 instruction is like PMQACC.W.H01 but applies rounding by
adding 2^14 before extracting bits [46:15], and then accumulates into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^14.

# PMQRACC.W.H11 (RV64)

**Encoding**

PMQRACC.W.H11 is encoded in the OP-32 major opcode as a packed Q-format rounded
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. 1:
    a = sext_47(s1[(32*i+31):(32*i+16)])
    b = sext_47(s2[(32*i+31):(32*i+16)])
    q = (a * b + 2^14)[46:15]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + q

X[rd] = d
```

**Description**

The PMQRACC.W.H11 instruction is like PMQACC.W.H11 but applies rounding by
adding 2^14 before extracting bits [46:15], and then accumulates into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^14.

# PMQ2ADD.H

**Encoding**

PMQ2ADD.H is encoded in the OP-32 major opcode using packed halfword operands
and producing packed 32-bit results (one per halfword pair).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=00   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_47(s1[(32*i+15):(32*i)])
    a1 = sext_47(s1[(32*i+31):(32*i+16)])
    b0 = sext_47(s2[(32*i+15):(32*i)])
    b1 = sext_47(s2[(32*i+31):(32*i+16)])

    q0 = (a0 * b0)[46:15]
    q1 = (a1 * b1)[46:15]
    d[(32*i+31):(32*i)] = q0 + q1

X[rd] = d
```

**Description**

The PMQ2ADD.H instruction computes, for each 32-bit lane, the sum of two
Q-format multiply-high results: one from the low halfword pair and one from the
high halfword pair, and writes the packed 32-bit sums to `rd`.

# PMQ2ADDA.H

**Encoding**

PMQ2ADDA.H is encoded in the OP-32 major opcode as an accumulating form of
PMQ2ADD.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=00   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_47(s1[(32*i+15):(32*i)])
    a1 = sext_47(s1[(32*i+31):(32*i+16)])
    b0 = sext_47(s2[(32*i+15):(32*i)])
    b1 = sext_47(s2[(32*i+31):(32*i+16)])

    q0 = (a0 * b0)[46:15]
    q1 = (a1 * b1)[46:15]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + q0 + q1

X[rd] = d
```

**Description**

The PMQ2ADDA.H instruction adds the PMQ2ADD.H result into the corresponding
packed 32-bit elements of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMQR2ADD.H

**Encoding**

PMQR2ADD.H is encoded in the OP-32 major opcode using packed halfword operands
and producing packed 32-bit results with rounding.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=10   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_47(s1[(32*i+15):(32*i)])
    a1 = sext_47(s1[(32*i+31):(32*i+16)])
    b0 = sext_47(s2[(32*i+15):(32*i)])
    b1 = sext_47(s2[(32*i+31):(32*i+16)])

    q0 = (a0 * b0 + 2^14)[46:15]
    q1 = (a1 * b1 + 2^14)[46:15]
    d[(32*i+31):(32*i)] = q0 + q1

X[rd] = d
```

**Description**

The PMQR2ADD.H instruction is like PMQ2ADD.H but applies rounding (adding 2^14)
to each Q-format product before extracting bits [46:15], and then sums the two
terms per 32-bit lane.

**Notes**

* Rounding is performed by adding 2^14.

# PMQR2ADDA.H

**Encoding**

PMQR2ADDA.H is encoded in the OP-32 major opcode as an accumulating form of
PMQR2ADD.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=10   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_47(s1[(32*i+15):(32*i)])
    a1 = sext_47(s1[(32*i+31):(32*i+16)])
    b0 = sext_47(s2[(32*i+15):(32*i)])
    b1 = sext_47(s2[(32*i+31):(32*i+16)])

    q0 = (a0 * b0 + 2^14)[46:15]
    q1 = (a1 * b1 + 2^14)[46:15]
    d[(32*i+31):(32*i)] = d[(32*i+31):(32*i)] + q0 + q1

X[rd] = d
```

**Description**

The PMQR2ADDA.H instruction adds the PMQR2ADD.H result into the corresponding
packed 32-bit elements of `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^14.

# MQACC.W00 (RV64)

**Encoding**

MQACC.W00 is encoded in the OP-32 major opcode as a scalar Q-format accumulate
instruction operating on the low words of `rs1` and `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a = sext_95(X[rs1][31:0])
b = sext_95(X[rs2][31:0])
q = (a * b)[94:31]
X[rd] = X[rd] + q
```

**Description**

The MQACC.W00 instruction multiplies `rs1[31:0]` and `rs2[31:0]` as signed
32-bit values, extracts bits [94:31] of the 95-bit product, and accumulates the
extracted value into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MQACC.W01 (RV64)

**Encoding**

MQACC.W01 is encoded in the OP-32 major opcode as a scalar Q-format accumulate
instruction operating on the low word of `rs1` and the high word of `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
a = sext_95(X[rs1][31:0])
b = sext_95(X[rs2][63:32])
q = (a * b)[94:31]
X[rd] = X[rd] + q
```

**Description**

The MQACC.W01 instruction multiplies `rs1[31:0]` by `rs2[63:32]` as signed
32-bit values, extracts bits [94:31] of the product, and accumulates the result
into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MQACC.W11 (RV64)

**Encoding**

MQACC.W11 is encoded in the OP-32 major opcode as a scalar Q-format accumulate
instruction operating on the high words of `rs1` and `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a = sext_95(X[rs1][63:32])
b = sext_95(X[rs2][63:32])
q = (a * b)[94:31]
X[rd] = X[rd] + q
```

**Description**

The MQACC.W11 instruction multiplies `rs1[63:32]` and `rs2[63:32]` as signed
32-bit values, extracts bits [94:31] of the product, and accumulates the result
into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MQRACC.W00 (RV64)

**Encoding**

MQRACC.W00 is encoded in the OP-32 major opcode as a scalar Q-format rounded
accumulate instruction operating on the low words of `rs1` and `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a = sext_95(X[rs1][31:0])
b = sext_95(X[rs2][31:0])
q = (a * b + 2^30)[94:31]
X[rd] = X[rd] + q
```

**Description**

The MQRACC.W00 instruction is like MQACC.W00 but applies rounding by adding 2^30
before extracting bits [94:31], and then accumulates the extracted value into
`rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^30.

# MQRACC.W01 (RV64)

**Encoding**

MQRACC.W01 is encoded in the OP-32 major opcode as a scalar Q-format rounded
accumulate instruction operating on `rs1[31:0]` and `rs2[63:32]`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=11   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
a = sext_95(X[rs1][31:0])
b = sext_95(X[rs2][63:32])
q = (a * b + 2^30)[94:31]
X[rd] = X[rd] + q
```

**Description**

The MQRACC.W01 instruction is like MQACC.W01 but applies rounding by adding 2^30
before extracting bits [94:31], and then accumulates into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^30.

# MQRACC.W11 (RV64)

**Encoding**

MQRACC.W11 is encoded in the OP-32 major opcode as a scalar Q-format rounded
accumulate instruction operating on the high words of `rs1` and `rs2`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a = sext_95(X[rs1][63:32])
b = sext_95(X[rs2][63:32])
q = (a * b + 2^30)[94:31]
X[rd] = X[rd] + q
```

**Description**

The MQRACC.W11 instruction is like MQACC.W11 but applies rounding by adding 2^30
before extracting bits [94:31], and then accumulates into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^30.

# PMQ2ADD.W (RV64)

**Encoding**

PMQ2ADD.W is encoded in the OP-32 major opcode as a packed Q-format instruction
that sums two word products to produce a scalar XLEN result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=00   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
a0 = sext_95(X[rs1][31:0])
b0 = sext_95(X[rs2][31:0])
a1 = sext_95(X[rs1][63:32])
b1 = sext_95(X[rs2][63:32])

q0 = (a0 * b0)[94:31]
q1 = (a1 * b1)[94:31]

X[rd] = q0 + q1
```

**Description**

The PMQ2ADD.W instruction multiplies the low words and the high words of `rs1`
and `rs2` as signed 32-bit values, extracts bits [94:31] from each product, and
adds the two extracted values to produce the result in `rd`.

# PMQ2ADDA.W (RV64)

**Encoding**

PMQ2ADDA.W is encoded in the OP-32 major opcode as an accumulating form of
PMQ2ADD.W.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
a0 = sext_95(X[rs1][31:0])
b0 = sext_95(X[rs2][31:0])
a1 = sext_95(X[rs1][63:32])
b1 = sext_95(X[rs2][63:32])

q0 = (a0 * b0)[94:31]
q1 = (a1 * b1)[94:31]

X[rd] = X[rd] + q0 + q1
```

**Description**

The PMQ2ADDA.W instruction adds the PMQ2ADD.W result into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMQR2ADD.W (RV64)

**Encoding**

PMQR2ADD.W is encoded in the OP-32 major opcode as a rounded form of PMQ2ADD.W.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=00   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
a0 = sext_95(X[rs1][31:0])
b0 = sext_95(X[rs2][31:0])
a1 = sext_95(X[rs1][63:32])
b1 = sext_95(X[rs2][63:32])

q0 = (a0 * b0 + 2^30)[94:31]
q1 = (a1 * b1 + 2^30)[94:31]

X[rd] = q0 + q1
```

**Description**

The PMQR2ADD.W instruction is like PMQ2ADD.W but applies rounding by adding 2^30
to each product before extracting bits [94:31], and then sums the two extracted
values.

**Notes**

* Rounding is performed by adding 2^30.

# PMQR2ADDA.W (RV64)

**Encoding**

PMQR2ADDA.W is encoded in the OP-32 major opcode as an accumulating form of
PMQR2ADD.W.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
a0 = sext_95(X[rs1][31:0])
b0 = sext_95(X[rs2][31:0])
a1 = sext_95(X[rs1][63:32])
b1 = sext_95(X[rs2][63:32])

q0 = (a0 * b0 + 2^30)[94:31]
q1 = (a1 * b1 + 2^30)[94:31]

X[rd] = X[rd] + q0 + q1
```

**Description**

The PMQR2ADDA.W instruction adds the PMQR2ADD.W result into `rd`.

**Notes**

* This instruction reads and writes `rd`.
* Rounding is performed by adding 2^30.

# PMUL.H.B00

**Encoding**

PMUL.H.B00 is encoded in the OP-32 major opcode using packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0000 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = sext_16(s1[(16*i+7):(16*i)])
    b = sext_16(s2[(16*i+7):(16*i)])
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

X[rd] = d
```

**Description**

PMUL.H.B00 multiplies the low bytes of each 16-bit lane of `rs1` and `rs2` as
signed 8-bit values and writes the 16-bit products to `rd`.

# PMUL.H.B01|

**Encoding**

PMUL.H.B01 is encoded in the OP-32 major opcode using packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0010 | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = sext_16(s1[(16*i+7):(16*i)])  // byte 0 of lane i
    b = sext_16(s2[(16*i+15):(16*i+8)])  // byte 1 of lane i
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

X[rd] = d
```

**Description**

PMUL.H.B01 multiplies the low byte of each 16-bit lane of `rs1` by the high byte
of the corresponding lane of `rs2` (signed×signed), producing packed 16-bit
products in `rd`.

# PMUL.H.B11|

**Encoding**

PMUL.H.B11 is encoded in the OP-32 major opcode using packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0010 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = sext_16(s1[(16*i+15):(16*i+8)])  // byte 1 of lane i
    b = sext_16(s2[(16*i+15):(16*i+8)])  // byte 1 of lane i
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

X[rd] = d
```

**Description**

PMUL.H.B11 multiplies the high bytes of each 16-bit lane of `rs1` and `rs2`
as signed 8-bit values and writes packed 16-bit products to `rd`.

# PMULSU.H.B00

**Encoding**

PMULSU.H.B00 is encoded in the OP-32 major opcode using packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = sext_16(s1[(16*i+7):(16*i)])
    b = zext_16(s2[(16*i+7):(16*i)])
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

X[rd] = d
```

**Description**

PMULSU.H.B00 multiplies the low bytes of each 16-bit lane of `rs1` (signed) and
`rs2` (unsigned), producing packed 16-bit products in `rd`.

# PMULSU.H.B11|

**Encoding**

PMULSU.H.B11 is encoded in the OP-32 major opcode using packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1110 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = sext_16(s1[(16*i+15):(16*i+8)])
    b = zext_16(s2[(16*i+15):(16*i+8)])
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

X[rd] = d
```

**Description**

PMULSU.H.B11 multiplies the high bytes of each 16-bit lane of `rs1` (signed) and
`rs2` (unsigned), producing packed 16-bit products in `rd`.

# PMULU.H.B00

**Encoding**

PMULU.H.B00 is encoded in the OP-32 major opcode using packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = zext_16(s1[(16*i+7):(16*i)])
    b = zext_16(s2[(16*i+7):(16*i)])
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

X[rd] = d
```

**Description**

PMULU.H.B00 multiplies the low bytes of each 16-bit lane of `rs1` and `rs2`
as unsigned 8-bit values, producing packed 16-bit products in `rd`.

# PMULU.H.B01|

**Encoding**

PMULU.H.B01 is encoded in the OP-32 major opcode using packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = zext_16(s1[(16*i+7):(16*i)])  // byte 0 of lane i
    b = zext_16(s2[(16*i+15):(16*i+8)])  // byte 1 of lane i
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

X[rd] = d
```

**Description**

PMULU.H.B01 multiplies the low byte of each 16-bit lane of `rs1` by the high
byte of the corresponding lane of `rs2` (unsigned×unsigned), producing packed
16-bit products in `rd`.

# PMULU.H.B11|

**Encoding**

PMULU.H.B11 is encoded in the OP-32 major opcode using packed halfword elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a = zext_16(s1[(16*i+15):(16*i+8)])
    b = zext_16(s2[(16*i+15):(16*i+8)])
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

X[rd] = d
```

**Description**

PMULU.H.B11 multiplies the high bytes of each 16-bit lane of `rs1` and `rs2`
as unsigned 8-bit values, producing packed 16-bit products in `rd`.

# MULSU.H00 (RV32)

**Encoding**

MULSU.H00 is encoded in the OP-32 major opcode as a scalar halfword multiply
(signed×unsigned) producing a 32-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_32(X[rs1][15:0])
b = zext_32(X[rs2][15:0])
X[rd] = to_bits(32, a * b)
```

**Description**

MULSU.H00 multiplies `rs1[15:0]` (signed) by `rs2[15:0]` (unsigned) and writes
the 32-bit product to `rd`.

# MULSU.H11 (RV32)

**Encoding**

MULSU.H11 is encoded in the OP-32 major opcode as a scalar halfword multiply
(signed×unsigned) producing a 32-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1110 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_32(X[rs1][31:16])
b = zext_32(X[rs2][31:16])
X[rd] = to_bits(32, a * b)
```

**Description**

MULSU.H11 multiplies `rs1[31:16]` (signed) by `rs2[31:16]` (unsigned) and writes
the 32-bit product to `rd`.

# MULU.H00 (RV32)

**Encoding**

MULU.H00 is encoded in the OP-32 major opcode as a scalar halfword multiply
(unsigned×unsigned) producing a 32-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = zext_32(X[rs1][15:0])
b = zext_32(X[rs2][15:0])
X[rd] = to_bits(32, a * b)
```

**Description**

MULU.H00 multiplies `rs1[15:0]` and `rs2[15:0]` as unsigned halfwords and writes
the 32-bit product to `rd`.

# MULU.H01 (RV32)

**Encoding**

MULU.H01 is encoded in the OP-32 major opcode as a scalar halfword multiply
(unsigned×unsigned) producing a 32-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a = zext_32(X[rs1][15:0])
b = zext_32(X[rs2][31:16])
X[rd] = to_bits(32, a * b)
```

**Description**

MULU.H01 multiplies `rs1[15:0]` by `rs2[31:16]` as unsigned halfwords and writes
the 32-bit product to `rd`.

# MULU.H11 (RV32)

**Encoding**

MULU.H11 is encoded in the OP-32 major opcode as a scalar halfword multiply
(unsigned×unsigned) producing a 32-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = zext_32(X[rs1][31:16])
b = zext_32(X[rs2][31:16])
X[rd] = to_bits(32, a * b)
```

**Description**

MULU.H11 multiplies `rs1[31:16]` and `rs2[31:16]` as unsigned halfwords and
writes the 32-bit product to `rd`.

# MACC.H00 (RV32)

**Encoding**

MACC.H00 is encoded in the OP-32 major opcode as a scalar halfword multiply
accumulate (signed×signed).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_32(X[rs1][15:0])
b = sext_32(X[rs2][15:0])
X[rd] = X[rd] + to_bits(32, a * b)
```

**Description**

MACC.H00 multiplies `rs1[15:0]` and `rs2[15:0]` as signed halfwords and adds the
32-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACC.H01 (RV32)

**Encoding**

MACC.H01 is encoded in the OP-32 major opcode as a scalar halfword multiply
accumulate (signed×signed).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a = sext_32(X[rs1][15:0])
b = sext_32(X[rs2][31:16])
X[rd] = X[rd] + to_bits(32, a * b)
```

**Description**

MACC.H01 multiplies `rs1[15:0]` by `rs2[31:16]` as signed halfwords and adds the
32-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACC.H11 (RV32)

**Encoding**

MACC.H11 is encoded in the OP-32 major opcode as a scalar halfword multiply
accumulate (signed×signed).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_32(X[rs1][31:16])
b = sext_32(X[rs2][31:16])
X[rd] = X[rd] + to_bits(32, a * b)
```

**Description**

MACC.H11 multiplies `rs1[31:16]` and `rs2[31:16]` as signed halfwords and adds
the 32-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCSU.H00 (RV32)

**Encoding**

MACCSU.H00 is encoded in the OP-32 major opcode as a scalar halfword multiply
accumulate (signed×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_32(X[rs1][15:0])
b = zext_32(X[rs2][15:0])
X[rd] = X[rd] + to_bits(32, a * b)
```

**Description**

MACCSU.H00 multiplies `rs1[15:0]` (signed) by `rs2[15:0]` (unsigned) and adds
the 32-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCSU.H11 (RV32)

**Encoding**

MACCSU.H11 is encoded in the OP-32 major opcode as a scalar halfword multiply
accumulate (signed×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_32(X[rs1][31:16])
b = zext_32(X[rs2][31:16])
X[rd] = X[rd] + to_bits(32, a * b)
```

**Description**

MACCSU.H11 multiplies `rs1[31:16]` (signed) by `rs2[31:16]` (unsigned) and adds
the 32-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCU.H00 (RV32)

**Encoding**

MACCU.H00 is encoded in the OP-32 major opcode as a scalar halfword multiply
accumulate (unsigned×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = zext_32(X[rs1][15:0])
b = zext_32(X[rs2][15:0])
X[rd] = X[rd] + to_bits(32, a * b)
```

**Description**

MACCU.H00 multiplies `rs1[15:0]` and `rs2[15:0]` as unsigned halfwords and adds
the 32-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCU.H01 (RV32)

**Encoding**

MACCU.H01 is encoded in the OP-32 major opcode as a scalar halfword multiply
accumulate (unsigned×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a = zext_32(X[rs1][15:0])
b = zext_32(X[rs2][31:16])
X[rd] = X[rd] + to_bits(32, a * b)
```

**Description**

MACCU.H01 multiplies `rs1[15:0]` by `rs2[31:16]` as unsigned halfwords and adds
the 32-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCU.H11 (RV32)

**Encoding**

MACCU.H11 is encoded in the OP-32 major opcode as a scalar halfword multiply
accumulate (unsigned×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = zext_32(X[rs1][31:16])
b = zext_32(X[rs2][31:16])
X[rd] = X[rd] + to_bits(32, a * b)
```

**Description**

MACCU.H11 multiplies `rs1[31:16]` and `rs2[31:16]` as unsigned halfwords and
adds the 32-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMULSU.W.H00 (RV64)

**Encoding**

PMULSU.W.H00 is encoded in the OP-32 major opcode producing packed 32-bit
elements from halfword operands (signed×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d0 = to_bits(32, sext_32(s1[15:0])  * zext_32(s2[15:0]))
d1 = to_bits(32, sext_32(s1[47:32]) * zext_32(s2[47:32]))

X[rd] = d1 @ d0
```

**Description**

PMULSU.W.H00 multiplies, per 32-bit lane, the low halfwords of `rs1` (signed)
and `rs2` (unsigned) and writes packed 32-bit products to `rd`.

# PMULSU.W.H11 (RV64)

**Encoding**

PMULSU.W.H11 is encoded in the OP-32 major opcode producing packed 32-bit
elements from halfword operands (signed×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1110 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d0 = to_bits(32, sext_32(s1[31:16]) * zext_32(s2[31:16]))
d1 = to_bits(32, sext_32(s1[63:48]) * zext_32(s2[63:48]))

X[rd] = d1 @ d0
```

**Description**

PMULSU.W.H11 multiplies, per 32-bit lane, the high halfwords of `rs1` (signed)
and `rs2` (unsigned) and writes packed 32-bit products to `rd`.

# PMULU.W.H00 (RV64)

**Encoding**

PMULU.W.H00 is encoded in the OP-32 major opcode producing packed 32-bit
elements from halfword operands (unsigned×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d0 = to_bits(32, zext_32(s1[15:0])  * zext_32(s2[15:0]))
d1 = to_bits(32, zext_32(s1[47:32]) * zext_32(s2[47:32]))

X[rd] = d1 @ d0
```

**Description**

PMULU.W.H00 multiplies, per 32-bit lane, the low halfwords of `rs1` and `rs2` as
unsigned values and writes packed 32-bit products to `rd`.

# PMULU.W.H01 (RV64)

**Encoding**

PMULU.W.H01 is encoded in the OP-32 major opcode producing packed 32-bit
elements from halfword operands (unsigned×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d0 = to_bits(32, zext_32(s1[15:0])  * zext_32(s2[31:16]))
d1 = to_bits(32, zext_32(s1[47:32]) * zext_32(s2[63:48]))

X[rd] = d1 @ d0
```

**Description**

PMULU.W.H01 multiplies, per 32-bit lane, the low halfword of `rs1` by the high
halfword of `rs2` (unsigned×unsigned) and writes packed 32-bit products to `rd`.

# PMULU.W.H11 (RV64)

**Encoding**

PMULU.W.H11 is encoded in the OP-32 major opcode producing packed 32-bit
elements from halfword operands (unsigned×unsigned).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d0 = to_bits(32, zext_32(s1[31:16]) * zext_32(s2[31:16]))
d1 = to_bits(32, zext_32(s1[63:48]) * zext_32(s2[63:48]))

X[rd] = d1 @ d0
```

**Description**

PMULU.W.H11 multiplies, per 32-bit lane, the high halfwords of `rs1` and `rs2`
as unsigned values and writes packed 32-bit products to `rd`.

# PMACC.W.H00 (RV64)

**Encoding**

PMACC.W.H00 is encoded in the OP-32 major opcode as a packed multiply-accumulate
instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

d0 = din[31:0]  + to_bits(32, sext_32(s1[15:0])  * sext_32(s2[15:0]))
d1 = din[63:32] + to_bits(32, sext_32(s1[47:32]) * sext_32(s2[47:32]))

X[rd] = d1 @ d0
```

**Description**

PMACC.W.H00 multiplies, per 32-bit lane, the low halfwords of `rs1` and `rs2` as
signed values and accumulates the 32-bit products into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMACC.W.H01 (RV64)

**Encoding**

PMACC.W.H01 is encoded in the OP-32 major opcode as a packed multiply-accumulate
instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

d0 = din[31:0]  + to_bits(32, sext_32(s1[15:0])  * sext_32(s2[31:16]))
d1 = din[63:32] + to_bits(32, sext_32(s1[47:32]) * sext_32(s2[63:48]))

X[rd] = d1 @ d0
```

**Description**

PMACC.W.H01 multiplies, per 32-bit lane, the low halfword of `rs1` by the high
halfword of `rs2` (signed×signed) and accumulates the 32-bit products into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMACC.W.H11 (RV64)

**Encoding**

PMACC.W.H11 is encoded in the OP-32 major opcode as a packed multiply-accumulate
instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

d0 = din[31:0]  + to_bits(32, sext_32(s1[31:16]) * sext_32(s2[31:16]))
d1 = din[63:32] + to_bits(32, sext_32(s1[63:48]) * sext_32(s2[63:48]))

X[rd] = d1 @ d0
```

**Description**

PMACC.W.H11 multiplies, per 32-bit lane, the high halfwords of `rs1` and `rs2`
as signed values and accumulates the 32-bit products into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMACCSU.W.H00 (RV64)

**Encoding**

PMACCSU.W.H00 is encoded in the OP-32 major opcode as a packed signed×unsigned
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

d0 = din[31:0]  + to_bits(32, sext_32(s1[15:0])  * zext_32(s2[15:0]))
d1 = din[63:32] + to_bits(32, sext_32(s1[47:32]) * zext_32(s2[47:32]))

X[rd] = d1 @ d0
```

**Description**

PMACCSU.W.H00 multiplies, per 32-bit lane, the low halfwords of `rs1` (signed)
and `rs2` (unsigned) and accumulates the 32-bit products into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMACCSU.W.H11 (RV64)

**Encoding**

PMACCSU.W.H11 is encoded in the OP-32 major opcode as a packed signed×unsigned
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

d0 = din[31:0]  + to_bits(32, sext_32(s1[31:16]) * zext_32(s2[31:16]))
d1 = din[63:32] + to_bits(32, sext_32(s1[63:48]) * zext_32(s2[63:48]))

X[rd] = d1 @ d0
```

**Description**

PMACCSU.W.H11 multiplies, per 32-bit lane, the high halfwords of `rs1` (signed)
and `rs2` (unsigned) and accumulates the 32-bit products into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMACCU.W.H00 (RV64)

**Encoding**

PMACCU.W.H00 is encoded in the OP-32 major opcode as a packed unsigned×unsigned
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

d0 = din[31:0]  + to_bits(32, zext_32(s1[15:0])  * zext_32(s2[15:0]))
d1 = din[63:32] + to_bits(32, zext_32(s1[47:32]) * zext_32(s2[47:32]))

X[rd] = d1 @ d0
```

**Description**

PMACCU.W.H00 multiplies, per 32-bit lane, the low halfwords of `rs1` and `rs2`
as unsigned values and accumulates the 32-bit products into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMACCU.W.H01 (RV64)

**Encoding**

PMACCU.W.H01 is encoded in the OP-32 major opcode as a packed unsigned×unsigned
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

d0 = din[31:0]  + to_bits(32, zext_32(s1[15:0])  * zext_32(s2[31:16]))
d1 = din[63:32] + to_bits(32, zext_32(s1[47:32]) * zext_32(s2[63:48]))

X[rd] = d1 @ d0
```

**Description**

PMACCU.W.H01 multiplies, per 32-bit lane, the low halfword of `rs1` by the high
halfword of `rs2` (unsigned×unsigned) and accumulates the 32-bit products into
`rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMACCU.W.H11 (RV64)

**Encoding**

PMACCU.W.H11 is encoded in the OP-32 major opcode as a packed unsigned×unsigned
multiply-accumulate instruction producing packed 32-bit elements.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

d0 = din[31:0]  + to_bits(32, zext_32(s1[31:16]) * zext_32(s2[31:16]))
d1 = din[63:32] + to_bits(32, zext_32(s1[63:48]) * zext_32(s2[63:48]))

X[rd] = d1 @ d0
```

**Description**

PMACCU.W.H11 multiplies, per 32-bit lane, the high halfwords of `rs1` and `rs2`
as unsigned values and accumulates the 32-bit products into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM2ADD.H

**Encoding**

PM2ADD.H is encoded in the OP-32 major opcode using packed halfword operands and
producing packed 32-bit results (one per halfword pair).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0000 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+15):(32*i)])
    a1 = sext_32(s1[(32*i+31):(32*i+16)])
    b0 = sext_32(s2[(32*i+15):(32*i)])
    b1 = sext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        to_bits(32, a0 * b0) + to_bits(32, a1 * b1)

X[rd] = d
```

**Description**

The PM2ADD.H instruction multiplies corresponding packed halfwords in each
32-bit lane (low×low and high×high), and adds the two 32-bit products to form
each packed 32-bit result in `rd`.

# PM2ADDA.H

**Encoding**

PM2ADDA.H is encoded in the OP-32 major opcode as an accumulating form of
PM2ADD.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+15):(32*i)])
    a1 = sext_32(s1[(32*i+31):(32*i+16)])
    b0 = sext_32(s2[(32*i+15):(32*i)])
    b1 = sext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        d[(32*i+31):(32*i)] + to_bits(32, a0 * b0) + to_bits(32, a1 * b1)

X[rd] = d
```

**Description**

The PM2ADDA.H instruction adds the PM2ADD.H result into the corresponding packed
32-bit elements of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM2ADDSU.H

**Encoding**

PM2ADDSU.H is encoded in the OP-32 major opcode using packed halfword operands,
performing signed×unsigned multiplies per halfword pair.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+15):(32*i)])
    a1 = sext_32(s1[(32*i+31):(32*i+16)])
    b0 = zext_32(s2[(32*i+15):(32*i)])
    b1 = zext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        to_bits(32, a0 * b0) + to_bits(32, a1 * b1)

X[rd] = d
```

**Description**

The PM2ADDSU.H instruction performs signed×unsigned halfword multiplications
(low×low and high×high within each 32-bit lane) and sums the two 32-bit products
to produce each packed 32-bit result in `rd`.

# PM2ADDASU.H

**Encoding**

PM2ADDASU.H is encoded in the OP-32 major opcode as an accumulating form of
PM2ADDSU.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+15):(32*i)])
    a1 = sext_32(s1[(32*i+31):(32*i+16)])
    b0 = zext_32(s2[(32*i+15):(32*i)])
    b1 = zext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        d[(32*i+31):(32*i)] + to_bits(32, a0 * b0) + to_bits(32, a1 * b1)

X[rd] = d
```

**Description**

The PM2ADDASU.H instruction adds the PM2ADDSU.H result into the corresponding
packed 32-bit elements of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM2ADDU.H

**Encoding**

PM2ADDU.H is encoded in the OP-32 major opcode using packed halfword operands and
performing unsigned×unsigned multiplies per halfword pair.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = zext_32(s1[(32*i+15):(32*i)])
    a1 = zext_32(s1[(32*i+31):(32*i+16)])
    b0 = zext_32(s2[(32*i+15):(32*i)])
    b1 = zext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        to_bits(32, a0 * b0) + to_bits(32, a1 * b1)

X[rd] = d
```

**Description**

The PM2ADDU.H instruction performs unsigned×unsigned halfword multiplications
(low×low and high×high within each 32-bit lane) and sums the two 32-bit products
to produce each packed 32-bit result in `rd`.

# PM2ADDAU.H

**Encoding**

PM2ADDAU.H is encoded in the OP-32 major opcode as an accumulating form of
PM2ADDU.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/32 - 1):
    a0 = zext_32(s1[(32*i+15):(32*i)])
    a1 = zext_32(s1[(32*i+31):(32*i+16)])
    b0 = zext_32(s2[(32*i+15):(32*i)])
    b1 = zext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        d[(32*i+31):(32*i)] + to_bits(32, a0 * b0) + to_bits(32, a1 * b1)

X[rd] = d
```

**Description**

The PM2ADDAU.H instruction adds the PM2ADDU.H result into the corresponding
packed 32-bit elements of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM2ADD.HX

**Encoding**

PM2ADD.HX is encoded in the OP-32 major opcode using packed halfword operands and
producing packed 32-bit results from cross products (low×high and high×low).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0010 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+15):(32*i)])
    a1 = sext_32(s1[(32*i+31):(32*i+16)])
    b0 = sext_32(s2[(32*i+15):(32*i)])
    b1 = sext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        to_bits(32, a0 * b1) + to_bits(32, a1 * b0)

X[rd] = d
```

**Description**

The PM2ADD.HX instruction multiplies cross halfword pairs within each 32-bit
lane (low of `rs1` × high of `rs2`, and high of `rs1` × low of `rs2`) and sums the
two 32-bit products to produce each packed 32-bit result in `rd`.

# PM2ADDA.HX

**Encoding**

PM2ADDA.HX is encoded in the OP-32 major opcode as an accumulating form of
PM2ADD.HX.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=10   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+15):(32*i)])
    a1 = sext_32(s1[(32*i+31):(32*i+16)])
    b0 = sext_32(s2[(32*i+15):(32*i)])
    b1 = sext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        d[(32*i+31):(32*i)] + to_bits(32, a0 * b1) + to_bits(32, a1 * b0)

X[rd] = d
```

**Description**

The PM2ADDA.HX instruction adds the PM2ADD.HX result into the corresponding
packed 32-bit elements of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM2SUBA.H

**Encoding**

PM2SUBA.H is encoded in the OP-32 major opcode as an accumulating
multiply-add-subtract instruction using packed halfword operands.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=11   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+15):(32*i)])
    a1 = sext_32(s1[(32*i+31):(32*i+16)])
    b0 = sext_32(s2[(32*i+15):(32*i)])
    b1 = sext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        d[(32*i+31):(32*i)] + to_bits(32, a0 * b0) - to_bits(32, a1 * b1)

X[rd] = d
```

**Description**

The PM2SUBA.H instruction updates each packed 32-bit element of `rd` by adding
the low×low halfword product and subtracting the high×high halfword product.

**Notes**

* This instruction reads and writes `rd`.

# PM2SUBA.HX

**Encoding**

PM2SUBA.HX is encoded in the OP-32 major opcode as an accumulating
multiply-add-subtract instruction using packed halfword operands with cross
products.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=11   | rs2    | rs1    | 110    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+15):(32*i)])
    a1 = sext_32(s1[(32*i+31):(32*i+16)])
    b0 = sext_32(s2[(32*i+15):(32*i)])
    b1 = sext_32(s2[(32*i+31):(32*i+16)])

    d[(32*i+31):(32*i)] =
        d[(32*i+31):(32*i)] + to_bits(32, a0 * b1) - to_bits(32, a1 * b0)

X[rd] = d
```

**Description**

The PM2SUBA.HX instruction updates each packed 32-bit element of `rd` by adding
the low×high cross product and subtracting the high×low cross product.

**Notes**

* This instruction reads and writes `rd`.

# MULSU.W00 (RV64)

**Encoding**

MULSU.W00 is encoded in the OP-32 major opcode as a scalar word multiply
(signed×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_64(X[rs1][31:0])
b = zext_64(X[rs2][31:0])
X[rd] = to_bits(64, a * b)
```

**Description**

MULSU.W00 multiplies `rs1[31:0]` (signed) by `rs2[31:0]` (unsigned) and writes
the 64-bit product to `rd`.

# MULSU.W11 (RV64)

**Encoding**

MULSU.W11 is encoded in the OP-32 major opcode as a scalar word multiply
(signed×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1110 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_64(X[rs1][63:32])
b = zext_64(X[rs2][63:32])
X[rd] = to_bits(64, a * b)
```

**Description**

MULSU.W11 multiplies `rs1[63:32]` (signed) by `rs2[63:32]` (unsigned) and writes
the 64-bit product to `rd`.

# MULU.W00 (RV64)

**Encoding**

MULU.W00 is encoded in the OP-32 major opcode as a scalar word multiply
(unsigned×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = zext_64(X[rs1][31:0])
b = zext_64(X[rs2][31:0])
X[rd] = to_bits(64, a * b)
```

**Description**

MULU.W00 multiplies `rs1[31:0]` and `rs2[31:0]` as unsigned 32-bit values and
writes the 64-bit product to `rd`.

# MULU.W01 (RV64)

**Encoding**

MULU.W01 is encoded in the OP-32 major opcode as a scalar word multiply
(unsigned×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a = zext_64(X[rs1][31:0])
b = zext_64(X[rs2][63:32])
X[rd] = to_bits(64, a * b)
```

**Description**

MULU.W01 multiplies `rs1[31:0]` by `rs2[63:32]` as unsigned 32-bit values and
writes the 64-bit product to `rd`.

# MULU.W11 (RV64)

**Encoding**

MULU.W11 is encoded in the OP-32 major opcode as a scalar word multiply
(unsigned×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0110 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = zext_64(X[rs1][63:32])
b = zext_64(X[rs2][63:32])
X[rd] = to_bits(64, a * b)
```

**Description**

MULU.W11 multiplies `rs1[63:32]` and `rs2[63:32]` as unsigned 32-bit values and
writes the 64-bit product to `rd`.

# MACC.W00 (RV64)

**Encoding**

MACC.W00 is encoded in the OP-32 major opcode as a scalar word multiply
accumulate (signed×signed) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0001 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_64(X[rs1][31:0])
b = sext_64(X[rs2][31:0])
X[rd] = X[rd] + to_bits(64, a * b)
```

**Description**

MACC.W00 multiplies `rs1[31:0]` and `rs2[31:0]` as signed 32-bit values and adds
the 64-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACC.W01 (RV64)

**Encoding**

MACC.W01 is encoded in the OP-32 major opcode as a scalar word multiply
accumulate (signed×signed) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a = sext_64(X[rs1][31:0])
b = sext_64(X[rs2][63:32])
X[rd] = X[rd] + to_bits(64, a * b)
```

**Description**

MACC.W01 multiplies `rs1[31:0]` by `rs2[63:32]` as signed 32-bit values and adds
the 64-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACC.W11 (RV64)

**Encoding**

MACC.W11 is encoded in the OP-32 major opcode as a scalar word multiply
accumulate (signed×signed) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_64(X[rs1][63:32])
b = sext_64(X[rs2][63:32])
X[rd] = X[rd] + to_bits(64, a * b)
```

**Description**

MACC.W11 multiplies `rs1[63:32]` and `rs2[63:32]` as signed 32-bit values and
adds the 64-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCSU.W00 (RV64)

**Encoding**

MACCSU.W00 is encoded in the OP-32 major opcode as a scalar word multiply
accumulate (signed×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_64(X[rs1][31:0])
b = zext_64(X[rs2][31:0])
X[rd] = X[rd] + to_bits(64, a * b)
```

**Description**

MACCSU.W00 multiplies `rs1[31:0]` (signed) by `rs2[31:0]` (unsigned) and adds the
64-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCSU.W11 (RV64)

**Encoding**

MACCSU.W11 is encoded in the OP-32 major opcode as a scalar word multiply
accumulate (signed×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1111 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = sext_64(X[rs1][63:32])
b = zext_64(X[rs2][63:32])
X[rd] = X[rd] + to_bits(64, a * b)
```

**Description**

MACCSU.W11 multiplies `rs1[63:32]` (signed) by `rs2[63:32]` (unsigned) and adds
the 64-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCU.W00 (RV64)

**Encoding**

MACCU.W00 is encoded in the OP-32 major opcode as a scalar word multiply
accumulate (unsigned×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = zext_64(X[rs1][31:0])
b = zext_64(X[rs2][31:0])
X[rd] = X[rd] + to_bits(64, a * b)
```

**Description**

MACCU.W00 multiplies `rs1[31:0]` and `rs2[31:0]` as unsigned 32-bit values and
adds the 64-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCU.W01 (RV64)

**Encoding**

MACCU.W01 is encoded in the OP-32 major opcode as a scalar word multiply
accumulate (unsigned×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a = zext_64(X[rs1][31:0])
b = zext_64(X[rs2][63:32])
X[rd] = X[rd] + to_bits(64, a * b)
```

**Description**

MACCU.W01 multiplies `rs1[31:0]` by `rs2[63:32]` as unsigned 32-bit values and
adds the 64-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MACCU.W11 (RV64)

**Encoding**

MACCU.W11 is encoded in the OP-32 major opcode as a scalar word multiply
accumulate (unsigned×unsigned) producing a 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a = zext_64(X[rs1][63:32])
b = zext_64(X[rs2][63:32])
X[rd] = X[rd] + to_bits(64, a * b)
```

**Description**

MACCU.W11 multiplies `rs1[63:32]` and `rs2[63:32]` as unsigned 32-bit values and
adds the 64-bit product to `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM2ADD.W (RV64)

**Encoding**

PM2ADD.W is encoded in the OP-32 major opcode as a packed word-pair multiply-add
instruction producing a scalar 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0000 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a0 = sext_64(X[rs1][31:0])
b0 = sext_64(X[rs2][31:0])
a1 = sext_64(X[rs1][63:32])
b1 = sext_64(X[rs2][63:32])

X[rd] = to_bits(64, a0 * b0) + to_bits(64, a1 * b1)
```

**Description**

PM2ADD.W multiplies the low words and high words of `rs1` and `rs2` as signed
32-bit values and adds the two 64-bit products to produce the result in `rd`.

# PM2ADDSU.W (RV64)

**Encoding**

PM2ADDSU.W is encoded in the OP-32 major opcode as a packed word-pair
signed×unsigned multiply-add instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a0 = sext_64(X[rs1][31:0])
b0 = zext_64(X[rs2][31:0])
a1 = sext_64(X[rs1][63:32])
b1 = zext_64(X[rs2][63:32])

X[rd] = to_bits(64, a0 * b0) + to_bits(64, a1 * b1)
```

**Description**

PM2ADDSU.W multiplies corresponding word pairs as signed×unsigned (low×low and
high×high) and adds the two 64-bit products to produce the result in `rd`.

# PM2ADDASU.W (RV64)

**Encoding**

PM2ADDASU.W is encoded in the OP-32 major opcode as an accumulating form of
PM2ADDSU.W.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a0 = sext_64(X[rs1][31:0])
b0 = zext_64(X[rs2][31:0])
a1 = sext_64(X[rs1][63:32])
b1 = zext_64(X[rs2][63:32])

X[rd] = X[rd] + to_bits(64, a0 * b0) + to_bits(64, a1 * b1)
```

**Description**

PM2ADDASU.W adds the PM2ADDSU.W result into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM2ADDU.W (RV64)

**Encoding**

PM2ADDU.W is encoded in the OP-32 major opcode as a packed word-pair
unsigned×unsigned multiply-add instruction producing a scalar 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a0 = zext_64(X[rs1][31:0])
b0 = zext_64(X[rs2][31:0])
a1 = zext_64(X[rs1][63:32])
b1 = zext_64(X[rs2][63:32])

X[rd] = to_bits(64, a0 * b0) + to_bits(64, a1 * b1)
```

**Description**

PM2ADDU.W multiplies corresponding word pairs as unsigned×unsigned and adds the
two 64-bit products to produce the result in `rd`.

# PM2ADD.WX (RV64)

**Encoding**

PM2ADD.WX is encoded in the OP-32 major opcode as a packed word-pair multiply-add
instruction using cross products.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0010 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a0 = sext_64(X[rs1][31:0])
a1 = sext_64(X[rs1][63:32])
b0 = sext_64(X[rs2][31:0])
b1 = sext_64(X[rs2][63:32])

X[rd] = to_bits(64, a0 * b1) + to_bits(64, a1 * b0)
```

**Description**

PM2ADD.WX multiplies cross word pairs (low of `rs1` × high of `rs2`, and high of
`rs1` × low of `rs2`) as signed values and sums the two 64-bit products.

# PM2ADDA.WX (RV64)

**Encoding**

PM2ADDA.WX is encoded in the OP-32 major opcode as an accumulating form of
PM2ADD.WX.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0011 | w=10   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a0 = sext_64(X[rs1][31:0])
a1 = sext_64(X[rs1][63:32])
b0 = sext_64(X[rs2][31:0])
b1 = sext_64(X[rs2][63:32])

X[rd] = X[rd] + to_bits(64, a0 * b1) + to_bits(64, a1 * b0)
```

**Description**

PM2ADDA.WX adds the PM2ADD.WX result into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM2SUBA.W (RV64)

**Encoding**

PM2SUBA.W is encoded in the OP-32 major opcode as an accumulating
multiply-add-subtract instruction using packed word pairs.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a0 = sext_64(X[rs1][31:0])
b0 = sext_64(X[rs2][31:0])
a1 = sext_64(X[rs1][63:32])
b1 = sext_64(X[rs2][63:32])

X[rd] = X[rd] + to_bits(64, a0 * b0) - to_bits(64, a1 * b1)
```

**Description**

PM2SUBA.W updates `rd` by adding the low×low signed word product and subtracting
the high×high signed word product.

**Notes**

* This instruction reads and writes `rd`.

# PM2SUBA.WX (RV64)

**Encoding**

PM2SUBA.WX is encoded in the OP-32 major opcode as an accumulating
multiply-add-subtract instruction using cross word products.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=11   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
a0 = sext_64(X[rs1][31:0])
a1 = sext_64(X[rs1][63:32])
b0 = sext_64(X[rs2][31:0])
b1 = sext_64(X[rs2][63:32])

X[rd] = X[rd] + to_bits(64, a0 * b1) - to_bits(64, a1 * b0)
```

**Description**

PM2SUBA.WX updates `rd` by adding the low×high signed word product and
subtracting the high×low signed word product.

**Notes**

* This instruction reads and writes `rd`.

# PM4ADD.B

**Encoding**

PM4ADD.B is encoded in the OP-32 major opcode using packed byte operands and
producing packed 32-bit results (one per 4-byte group).

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0000 | w=11   | rs2    | rs1    | 100    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+7):(32*i)])
    a1 = sext_32(s1[(32*i+15):(32*i+8)])
    a2 = sext_32(s1[(32*i+23):(32*i+16)])
    a3 = sext_32(s1[(32*i+31):(32*i+24)])

    b0 = sext_32(s2[(32*i+7):(32*i)])
    b1 = sext_32(s2[(32*i+15):(32*i+8)])
    b2 = sext_32(s2[(32*i+23):(32*i+16)])
    b3 = sext_32(s2[(32*i+31):(32*i+24)])

    d[(32*i+31):(32*i)] =
        to_bits(32, a0*b0) + to_bits(32, a1*b1) + to_bits(32, a2*b2) + to_bits(32, a3*b3)

X[rd] = d
```

**Description**

The PM4ADD.B instruction multiplies corresponding packed bytes within each
32-bit lane as signed values and sums the four 32-bit products to produce one
packed 32-bit result per lane in `rd`.

# PM4ADDSU.B

**Encoding**

PM4ADDSU.B is encoded in the OP-32 major opcode using packed byte operands and
performing signed×unsigned byte multiplies within each 32-bit lane.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=11   | rs2    | rs1    | 100    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = sext_32(s1[(32*i+7):(32*i)])
    a1 = sext_32(s1[(32*i+15):(32*i+8)])
    a2 = sext_32(s1[(32*i+23):(32*i+16)])
    a3 = sext_32(s1[(32*i+31):(32*i+24)])

    b0 = zext_32(s2[(32*i+7):(32*i)])
    b1 = zext_32(s2[(32*i+15):(32*i+8)])
    b2 = zext_32(s2[(32*i+23):(32*i+16)])
    b3 = zext_32(s2[(32*i+31):(32*i+24)])

    d[(32*i+31):(32*i)] =
        to_bits(32, a0*b0) + to_bits(32, a1*b1) + to_bits(32, a2*b2) + to_bits(32, a3*b3)

X[rd] = d
```

**Description**

The PM4ADDSU.B instruction multiplies corresponding packed bytes within each
32-bit lane as signed×unsigned and sums the four 32-bit products to form one
packed 32-bit result per lane in `rd`.

# PM4ADDU.B

**Encoding**

PM4ADDU.B is encoded in the OP-32 major opcode using packed byte operands and
performing unsigned×unsigned byte multiplies within each 32-bit lane.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=11   | rs2    | rs1    | 100    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/32 - 1):
    a0 = zext_32(s1[(32*i+7):(32*i)])
    a1 = zext_32(s1[(32*i+15):(32*i+8)])
    a2 = zext_32(s1[(32*i+23):(32*i+16)])
    a3 = zext_32(s1[(32*i+31):(32*i+24)])

    b0 = zext_32(s2[(32*i+7):(32*i)])
    b1 = zext_32(s2[(32*i+15):(32*i+8)])
    b2 = zext_32(s2[(32*i+23):(32*i+16)])
    b3 = zext_32(s2[(32*i+31):(32*i+24)])

    d[(32*i+31):(32*i)] =
        to_bits(32, a0*b0) + to_bits(32, a1*b1) + to_bits(32, a2*b2) + to_bits(32, a3*b3)

X[rd] = d
```

**Description**

The PM4ADDU.B instruction multiplies corresponding packed bytes within each
32-bit lane as unsigned values and sums the four 32-bit products to produce one
packed 32-bit result per lane in `rd`.

# PM4ADD.H (RV64)

**Encoding**

PM4ADD.H is encoded in the OP-32 major opcode as a packed halfword-group
multiply-add instruction producing a scalar 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0000 | w=11   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
      to_bits(64, sext_64(s1[15:0])  * sext_64(s2[15:0]))
    + to_bits(64, sext_64(s1[31:16]) * sext_64(s2[31:16]))
    + to_bits(64, sext_64(s1[47:32]) * sext_64(s2[47:32]))
    + to_bits(64, sext_64(s1[63:48]) * sext_64(s2[63:48]))
```

**Description**

The PM4ADD.H instruction multiplies the four packed 16-bit halfwords of `rs1`
and `rs2` as signed values and sums the four 64-bit products to produce the
result in `rd`.

# PM4ADDSU.H (RV64)

**Encoding**

PM4ADDSU.H is encoded in the OP-32 major opcode as a packed halfword-group
signed×unsigned multiply-add instruction producing a scalar 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=11   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
      to_bits(64, sext_64(s1[15:0])  * zext_64(s2[15:0]))
    + to_bits(64, sext_64(s1[31:16]) * zext_64(s2[31:16]))
    + to_bits(64, sext_64(s1[47:32]) * zext_64(s2[47:32]))
    + to_bits(64, sext_64(s1[63:48]) * zext_64(s2[63:48]))
```

**Description**

The PM4ADDSU.H instruction multiplies the four packed halfwords of `rs1` (signed)
with the four packed halfwords of `rs2` (unsigned) and sums the products to
produce the 64-bit result in `rd`.

# PM4ADDASU.H (RV64)

**Encoding**

PM4ADDASU.H is encoded in the OP-32 major opcode as an accumulating form of
PM4ADDSU.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=11   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
    X[rd]
  + to_bits(64, sext_64(s1[15:0])  * zext_64(s2[15:0]))
  + to_bits(64, sext_64(s1[31:16]) * zext_64(s2[31:16]))
  + to_bits(64, sext_64(s1[47:32]) * zext_64(s2[47:32]))
  + to_bits(64, sext_64(s1[63:48]) * zext_64(s2[63:48]))
```

**Description**

The PM4ADDASU.H instruction adds the PM4ADDSU.H sum-of-products result into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PM4ADDU.H (RV64)

**Encoding**

PM4ADDU.H is encoded in the OP-32 major opcode as a packed halfword-group
unsigned×unsigned multiply-add instruction producing a scalar 64-bit result.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0100 | w=11   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
      to_bits(64, zext_64(s1[15:0])  * zext_64(s2[15:0]))
    + to_bits(64, zext_64(s1[31:16]) * zext_64(s2[31:16]))
    + to_bits(64, zext_64(s1[47:32]) * zext_64(s2[47:32]))
    + to_bits(64, zext_64(s1[63:48]) * zext_64(s2[63:48]))
```

**Description**

The PM4ADDU.H instruction multiplies the four packed 16-bit halfwords of `rs1`
and `rs2` as unsigned values and sums the products to produce the 64-bit result
in `rd`.

# PM4ADDAU.H (RV64)

**Encoding**

PM4ADDAU.H is encoded in the OP-32 major opcode as an accumulating form of
PM4ADDU.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=11   | rs2    | rs1    | 101    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

X[rd] =
    X[rd]
  + to_bits(64, zext_64(s1[15:0])  * zext_64(s2[15:0]))
  + to_bits(64, zext_64(s1[31:16]) * zext_64(s2[31:16]))
  + to_bits(64, zext_64(s1[47:32]) * zext_64(s2[47:32]))
  + to_bits(64, zext_64(s1[63:48]) * zext_64(s2[63:48]))
```

**Description**

The PM4ADDAU.H instruction adds the PM4ADDU.H sum-of-products result into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMULH.H.B0

**Encoding**

PMULH.H.B0 is encoded in the OP-32 major opcode using packed halfword elements.
It multiplies each 16-bit element of `rs1` by the low byte of the corresponding
16-bit element of `rs2` and returns the high 16 bits of the signed 24-bit
product.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1000 | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a  = sext_24(s1[(16*i+15):(16*i)])  // 16-bit halfword
    b0 = sext_24(s2[(16*i+7):(16*i)])  // byte 0 of lane i
    p  = a * b0  // 24-bit signed product
    d[(16*i+15):(16*i)] = to_bits(24, p)[23:8]  // high 16 bits

X[rd] = d
```

**Description**

The PMULH.H.B0 instruction multiplies each packed 16-bit element of `rs1` by the
low byte of the corresponding element of `rs2` (signed×signed) and writes the
upper 16 bits of each 24-bit product into `rd`.

# PMULH.H.B1|

**Encoding**

PMULH.H.B1 is encoded in the OP-32 major opcode using packed halfword elements.
It multiplies each 16-bit element of `rs1` by the high byte of the corresponding
16-bit element of `rs2` and returns the high 16 bits of the signed 24-bit
product.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1000 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a  = sext_24(s1[(16*i+15):(16*i)])  // 16-bit halfword
    b1 = sext_24(s2[(16*i+15):(16*i+8)])  // byte 1 of lane i
    p  = a * b1
    d[(16*i+15):(16*i)] = to_bits(24, p)[23:8]

X[rd] = d
```

**Description**

The PMULH.H.B1 instruction multiplies each packed 16-bit element of `rs1` by the
high byte of the corresponding element of `rs2` (signed×signed) and writes the
upper 16 bits of each 24-bit product into `rd`.

# PMULHSU.H.B0

**Encoding**

PMULHSU.H.B0 is encoded in the OP-32 major opcode using packed halfword elements.
It multiplies each 16-bit element of `rs1` (signed) by the low byte of the
corresponding element of `rs2` (unsigned) and returns the high 16 bits of the
24-bit product.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a  = sext_24(s1[(16*i+15):(16*i)])  // signed halfword
    b0 = zext_24(s2[(16*i+7):(16*i)])  // unsigned byte 0
    p  = a * b0
    d[(16*i+15):(16*i)] = to_bits(24, p)[23:8]

X[rd] = d
```

**Description**

The PMULHSU.H.B0 instruction multiplies each packed 16-bit element of `rs1`
(signed) by the low byte of the corresponding element of `rs2` (unsigned), and
writes the upper 16 bits of each 24-bit product into `rd`.

# PMULHSU.H.B1|

**Encoding**

PMULHSU.H.B1 is encoded in the OP-32 major opcode using packed halfword elements.
It multiplies each 16-bit element of `rs1` (signed) by the high byte of the
corresponding element of `rs2` (unsigned) and returns the high 16 bits of the
24-bit product.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. (XLEN/16 - 1):
    a  = sext_24(s1[(16*i+15):(16*i)])  // signed halfword
    b1 = zext_24(s2[(16*i+15):(16*i+8)])  // unsigned byte 1
    p  = a * b1
    d[(16*i+15):(16*i)] = to_bits(24, p)[23:8]

X[rd] = d
```

**Description**

The PMULHSU.H.B1 instruction multiplies each packed 16-bit element of `rs1`
(signed) by the high byte of the corresponding element of `rs2` (unsigned), and
writes the upper 16 bits of each 24-bit product into `rd`.

# PMHACC.H.B0

**Encoding**

PMHACC.H.B0 is encoded in the OP-32 major opcode as an accumulating form of
PMULH.H.B0.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a  = sext_24(s1[(16*i+15):(16*i)])
    b0 = sext_24(s2[(16*i+7):(16*i)])
    p  = a * b0
    d[(16*i+15):(16*i)] =
        d[(16*i+15):(16*i)] + to_bits(24, p)[23:8]

X[rd] = d
```

**Description**

The PMHACC.H.B0 instruction multiplies each packed 16-bit element of `rs1` by
the low byte of the corresponding element of `rs2` (signed×signed), takes the
upper 16 bits of the 24-bit product, and accumulates it into the corresponding
halfword element of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMHACC.H.B1|

**Encoding**

PMHACC.H.B1 is encoded in the OP-32 major opcode as an accumulating form of
PMULH.H.B1.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1001 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a  = sext_24(s1[(16*i+15):(16*i)])
    b1 = sext_24(s2[(16*i+15):(16*i+8)])
    p  = a * b1
    d[(16*i+15):(16*i)] =
        d[(16*i+15):(16*i)] + to_bits(24, p)[23:8]

X[rd] = d
```

**Description**

The PMHACC.H.B1 instruction multiplies each packed 16-bit element of `rs1` by
the high byte of the corresponding element of `rs2` (signed×signed), takes the
upper 16 bits of the 24-bit product, and accumulates it into the corresponding
halfword element of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMHACCSU.H.B0

**Encoding**

PMHACCSU.H.B0 is encoded in the OP-32 major opcode as an accumulating form of
PMULHSU.H.B0.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a  = sext_24(s1[(16*i+15):(16*i)])  // signed halfword
    b0 = zext_24(s2[(16*i+7):(16*i)])  // unsigned byte 0
    p  = a * b0
    d[(16*i+15):(16*i)] =
        d[(16*i+15):(16*i)] + to_bits(24, p)[23:8]

X[rd] = d
```

**Description**

The PMHACCSU.H.B0 instruction multiplies each packed 16-bit element of `rs1`
(signed) by the low byte of the corresponding element of `rs2` (unsigned), takes
the upper 16 bits of the 24-bit product, and accumulates it into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMHACCSU.H.B1|

**Encoding**

PMHACCSU.H.B1 is encoded in the OP-32 major opcode as an accumulating form of
PMULHSU.H.B1.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1101 | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]
d  = X[rd]

for i = 0 .. (XLEN/16 - 1):
    a  = sext_24(s1[(16*i+15):(16*i)])  // signed halfword
    b1 = zext_24(s2[(16*i+15):(16*i+8)])  // unsigned byte 1
    p  = a * b1
    d[(16*i+15):(16*i)] =
        d[(16*i+15):(16*i)] + to_bits(24, p)[23:8]

X[rd] = d
```

**Description**

The PMHACCSU.H.B1 instruction multiplies each packed 16-bit element of `rs1`
(signed) by the high byte of the corresponding element of `rs2` (unsigned), takes
the upper 16 bits of the 24-bit product, and accumulates it into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MULHSU.H0 (RV32)

**Encoding**

MULHSU.H0 is encoded in the OP-32 major opcode with a scalar `rs1` and a
halfword-selected `rs2` operand. The instruction writes the high 32 bits of the
48-bit signed×unsigned product.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=00   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a  = sext_48(X[rs1])  // XLEN=32 signed
b0 = zext_48(X[rs2][15:0])  // halfword 0 (unsigned)
p  = a * b0
X[rd] = to_bits(48, p)[47:16]
```

**Description**

MULHSU.H0 multiplies the 32-bit signed value in `rs1` by the low halfword of
`rs2` treated as unsigned, and writes bits [47:16] of the 48-bit product to
`rd`.

# MULHSU.H1 (RV32)

**Encoding**

MULHSU.H1 is encoded in the OP-32 major opcode with a scalar `rs1` and a
halfword-selected `rs2` operand. The instruction writes the high 32 bits of the
48-bit signed×unsigned product.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=00   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a  = sext_48(X[rs1])  // XLEN=32 signed
b1 = zext_48(X[rs2][31:16])  // halfword 1 (unsigned)
p  = a * b1
X[rd] = to_bits(48, p)[47:16]
```

**Description**

MULHSU.H1 multiplies the 32-bit signed value in `rs1` by the high halfword of
`rs2` treated as unsigned, and writes bits [47:16] of the 48-bit product to
`rd`.

# MHACC.H0 (RV32)

**Encoding**

MHACC.H0 is encoded in the OP-32 major opcode as an accumulating form of
MULH.H0 (signed×signed), producing the high 32 bits of a 48-bit product.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a  = sext_48(X[rs1])
b0 = sext_48(X[rs2][15:0])
p  = a * b0
X[rd] = X[rd] + to_bits(48, p)[47:16]
```

**Description**

MHACC.H0 multiplies the signed 32-bit value in `rs1` by the low halfword of
`rs2` treated as signed, takes bits [47:16] of the 48-bit product, and
accumulates the extracted value into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MHACC.H1 (RV32)

**Encoding**

MHACC.H1 is encoded in the OP-32 major opcode as an accumulating form of
MULH.H1 (signed×signed), producing the high 32 bits of a 48-bit product.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a  = sext_48(X[rs1])
b1 = sext_48(X[rs2][31:16])
p  = a * b1
X[rd] = X[rd] + to_bits(48, p)[47:16]
```

**Description**

MHACC.H1 multiplies the signed 32-bit value in `rs1` by the high halfword of
`rs2` treated as signed, takes bits [47:16] of the 48-bit product, and
accumulates the extracted value into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MHACCSU.H0 (RV32)

**Encoding**

MHACCSU.H0 is encoded in the OP-32 major opcode as an accumulating form of
MULHSU.H0 (signed×unsigned), producing the high 32 bits of a 48-bit product.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=11   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
a  = sext_48(X[rs1])
b0 = zext_48(X[rs2][15:0])
p  = a * b0
X[rd] = X[rd] + to_bits(48, p)[47:16]
```

**Description**

MHACCSU.H0 multiplies the signed 32-bit value in `rs1` by the low halfword of
`rs2` treated as unsigned, takes bits [47:16] of the 48-bit product, and
accumulates the extracted value into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# MHACCSU.H1 (RV32)

**Encoding**

MHACCSU.H1 is encoded in the OP-32 major opcode as an accumulating form of
MULHSU.H1 (signed×unsigned), producing the high 32 bits of a 48-bit product.

| 31 | 30..28 | 27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|----|--------|--------|--------|--------|-------|---------|
| 1  | f=001  | 1  | w=11   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
a  = sext_48(X[rs1])
b1 = zext_48(X[rs2][31:16])
p  = a * b1
X[rd] = X[rd] + to_bits(48, p)[47:16]
```

**Description**

MHACCSU.H1 multiplies the signed 32-bit value in `rs1` by the high halfword of
`rs2` treated as unsigned, takes bits [47:16] of the 48-bit product, and
accumulates the extracted value into `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMULHSU.W.H0 (RV64)

**Encoding**

PMULHSU.W.H0 is encoded in the OP-32 major opcode producing packed 32-bit
elements from word×halfword operands (signed×unsigned), taking the high 32 bits
of each 48-bit product.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=01   | rs2    | rs1    | 001    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

p0 = sext_48(s1[31:0])  * zext_48(s2[15:0])
p1 = sext_48(s1[63:32]) * zext_48(s2[47:32])

d0 = to_bits(48, p0)[47:16]
d1 = to_bits(48, p1)[47:16]

X[rd] = d1 @ d0
```

**Description**

PMULHSU.W.H0 multiplies each 32-bit word of `rs1` (signed) by the low halfword of
the corresponding 32-bit word of `rs2` (unsigned), extracts bits [47:16] of each
48-bit product, and packs the two 32-bit results into `rd`.

# PMULHSU.W.H1 (RV64)

**Encoding**

PMULHSU.W.H1 is encoded in the OP-32 major opcode producing packed 32-bit
elements from word×halfword operands (signed×unsigned), taking the high 32 bits
of each 48-bit product.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=1100 | w=01   | rs2    | rs1    | 011    | rd    | 0111011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

p0 = sext_48(s1[31:0])  * zext_48(s2[31:16])
p1 = sext_48(s1[63:32]) * zext_48(s2[63:48])

d0 = to_bits(48, p0)[47:16]
d1 = to_bits(48, p1)[47:16]

X[rd] = d1 @ d0
```

**Description**

PMULHSU.W.H1 multiplies each 32-bit word of `rs1` (signed) by the high halfword
of the corresponding 32-bit word of `rs2` (unsigned), extracts bits [47:16] of
each 48-bit product, and packs the two 32-bit results into `rd`.

# PMHACC.W.H0 (RV64)

**Encoding**

PMHACC.W.H0 is encoded in the OP-32 major opcode. It performs a packed
multiply-high-accumulate using signed word operands from `rs1` and signed
halfword operands selected from `rs2` (H0 selection per word), producing packed
32-bit results in `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=00   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

// word 0 uses halfword 0 of rs2 word 0; word 1 uses halfword 0 of rs2 word 1
p0 = sext_48(s1[31:0])  * sext_48(s2[15:0])
p1 = sext_48(s1[63:32]) * sext_48(s2[47:32])

d0 = din[31:0]  + to_bits(48, p0)[47:16]
d1 = din[63:32] + to_bits(48, p1)[47:16]

X[rd] = d1 @ d0
```

**Description**

The PMHACC.W.H0 instruction multiplies each signed 32-bit word of `rs1` by the
low halfword (H0) of the corresponding 32-bit word of `rs2` as signed, extracts
bits [47:16] of each 48-bit product (the “high” 32 bits), and accumulates the
result into the corresponding 32-bit element of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMHACC.W.H1 (RV64)

**Encoding**

PMHACC.W.H1 is encoded in the OP-32 major opcode. It performs a packed
multiply-high-accumulate using signed word operands from `rs1` and signed
halfword operands selected from `rs2` (H1 selection per word), producing packed
32-bit results in `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=00   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

// word 0 uses halfword 1 of rs2 word 0; word 1 uses halfword 1 of rs2 word 1
p0 = sext_48(s1[31:0])  * sext_48(s2[31:16])
p1 = sext_48(s1[63:32]) * sext_48(s2[63:48])

d0 = din[31:0]  + to_bits(48, p0)[47:16]
d1 = din[63:32] + to_bits(48, p1)[47:16]

X[rd] = d1 @ d0
```

**Description**

The PMHACC.W.H1 instruction multiplies each signed 32-bit word of `rs1` by the
high halfword (H1) of the corresponding 32-bit word of `rs2` as signed, extracts
bits [47:16] of each 48-bit product, and accumulates the result into the
corresponding 32-bit element of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMHACCSU.W.H0 (RV64)

**Encoding**

PMHACCSU.W.H0 is encoded in the OP-32 major opcode. It performs a packed
multiply-high-accumulate using signed word operands from `rs1` and unsigned
halfword operands selected from `rs2` (H0 selection per word), producing packed
32-bit results in `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0101 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

// word 0 uses halfword 0 of rs2 word 0; word 1 uses halfword 0 of rs2 word 1
p0 = sext_48(s1[31:0])  * zext_48(s2[15:0])
p1 = sext_48(s1[63:32]) * zext_48(s2[47:32])

d0 = din[31:0]  + to_bits(48, p0)[47:16]
d1 = din[63:32] + to_bits(48, p1)[47:16]

X[rd] = d1 @ d0
```

**Description**

The PMHACCSU.W.H0 instruction multiplies each signed 32-bit word of `rs1` by the
low halfword (H0) of the corresponding 32-bit word of `rs2` treated as unsigned,
extracts bits [47:16] of each 48-bit product, and accumulates the result into
the corresponding 32-bit element of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMHACCSU.W.H1 (RV64)

**Encoding**

PMHACCSU.W.H1 is encoded in the OP-32 major opcode. It performs a packed
multiply-high-accumulate using signed word operands from `rs1` and unsigned
halfword operands selected from `rs2` (H1 selection per word), producing packed
32-bit results in `rd`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..7 | 6..0    |
|----|--------|--------|--------|--------|--------|-------|---------|
| 1  | f=0111 | w=01   | rs2    | rs1    | 111    | rd    | 0111011 |

**Operation**

```python
s1  = X[rs1]
s2  = X[rs2]
din = X[rd]

// word 0 uses halfword 1 of rs2 word 0; word 1 uses halfword 1 of rs2 word 1
p0 = sext_48(s1[31:0])  * zext_48(s2[31:16])
p1 = sext_48(s1[63:32]) * zext_48(s2[63:48])

d0 = din[31:0]  + to_bits(48, p0)[47:16]
d1 = din[63:32] + to_bits(48, p1)[47:16]

X[rd] = d1 @ d0
```

**Description**

The PMHACCSU.W.H1 instruction multiplies each signed 32-bit word of `rs1` by the
high halfword (H1) of the corresponding 32-bit word of `rs2` treated as unsigned,
extracts bits [47:16] of each 48-bit product, and accumulates the result into
the corresponding 32-bit element of `rd`.

**Notes**

* This instruction reads and writes `rd`.

# PMQWACC.H (RV32)

**Encoding**

PMQWACC.H is encoded in a register-pair (rdp) OP-IMM-32 format. It uses `rdp` to
select the destination register pair `{X[2*rdp+1], X[2*rdp]}`.

| 31 | 30..28 | 27..26 | 25..21 | 20..16 | 15..13 | 12..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1111 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

// Read 64-bit accumulator from register pair, or use zero if rdp==0
acc = (rdp == 0) ? 0 : (X[2*rdp+1] @ X[2*rdp])

for i = 0 .. 1:
    a = sext_47(s1[(16*i+15):(16*i)])  // signed halfword
    b = sext_47(s2[(16*i+15):(16*i)])  // signed halfword
    p = a * b                    // up to 47 bits here
    hi = to_bits(47, p)[46:15]   // 32-bit extract
    acc[(32*i+31):(32*i)] = acc[(32*i+31):(32*i)] + hi

// Write back unless rdp==0
if (rdp != 0):
    X[2*rdp]   = acc[31:0]
    X[2*rdp+1] = acc[63:32]
```

**Description**

The PMQWACC.H instruction multiplies the two signed 16-bit halfwords of `rs1`
and `rs2`. For each halfword, it extracts bits [46:15] of the signed 47-bit
product (equivalent to an arithmetic right shift by 15) and accumulates the
32-bit extracted value into the corresponding 32-bit lane of a 64-bit
accumulator held in the destination register pair selected by `rdp`.

**Notes**

* If `rdp=0`, the accumulator is treated as zero and the result is not written
  back (i.e., the instruction has no architectural destination).
* The destination is a register pair `{X[2*rdp+1], X[2*rdp]}`.

# PMQRWACC.H (RV32)

**Encoding**

PMQRWACC.H is encoded in the same register-pair (rdp) OP-IMM-32 format as PMQWACC.H,
but uses the rounded variant.

| 31 | 30..28 | 27..26 | 25..21 | 20..16 | 15..13 | 12..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1111 | w=10   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc = (rdp == 0) ? 0 : (X[2*rdp+1] @ X[2*rdp])

for i = 0 .. 1:
    a = sext_47(s1[(16*i+15):(16*i)])
    b = sext_47(s2[(16*i+15):(16*i)])
    p = a * b + (1 << 14)        // rounding bias
    hi = to_bits(47, p)[46:15]
    acc[(32*i+31):(32*i)] = acc[(32*i+31):(32*i)] + hi

if (rdp != 0):
    X[2*rdp]   = acc[31:0]
    X[2*rdp+1] = acc[63:32]
```

**Description**

PMQRWACC.H is the rounded form of PMQWACC.H. It adds a rounding bias of 2^14 to
each halfword product before extracting bits [46:15], then accumulates the
result into the 64-bit destination register pair selected by `rdp`.

**Notes**

* If `rdp=0`, the accumulator is treated as zero and the result is not written
  back.
* The destination is a register pair `{X[2*rdp+1], X[2*rdp]}`.

# MQWACC (RV32)

**Encoding**

MQWACC is encoded in a register-pair (rdp) OP-IMM-32 format and accumulates into the
64-bit destination register pair selected by `rdp`.

| 31 | 30..28 | 27..26 | 25..21 | 20..16 | 15..13 | 12..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1111 | w=01   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
acc = (rdp == 0) ? 0 : (X[2*rdp+1] @ X[2*rdp])

a = sext_95(X[rs1])              // XLEN=32 signed
b = sext_95(X[rs2])
p = a * b                        // conceptually wide
term = to_bits(95, p)[94:31]     // arithmetic >> 31

acc = acc + term

if (rdp != 0):
    X[2*rdp]   = acc[31:0]
    X[2*rdp+1] = acc[63:32]
```

**Description**

The MQWACC instruction multiplies `rs1` and `rs2` as signed 32-bit integers,
takes the product shifted right by 31 (i.e., bits [94:31] of the sign-extended
wide product), and accumulates the 64-bit term into the destination register
pair selected by `rdp`.

**Notes**

* If `rdp=0`, the accumulator is treated as zero and the result is not written
  back.
* The destination is a register pair `{X[2*rdp+1], X[2*rdp]}`.

# MQRWACC (RV32)

**Encoding**

MQRWACC is encoded in the same register-pair (rdp) OP-IMM-32 format as MQWACC, but
uses the rounded variant.

| 31 | 30..28 | 27..26 | 25..21 | 20..16 | 15..13 | 12..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1111 | w=11   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
acc = (rdp == 0) ? 0 : (X[2*rdp+1] @ X[2*rdp])

a = sext_95(X[rs1])
b = sext_95(X[rs2])
p = a * b + (1 << 30)            // rounding bias
term = to_bits(95, p)[94:31]     // arithmetic >> 31

acc = acc + term

if (rdp != 0):
    X[2*rdp]   = acc[31:0]
    X[2*rdp+1] = acc[63:32]
```

**Description**

MQRWACC is the rounded form of MQWACC. It adds a rounding bias of 2^30 before
taking the product shifted right by 31, then accumulates the 64-bit term into
the destination register pair selected by `rdp`.

**Notes**

* If `rdp=0`, the accumulator is treated as zero and the result is not written
  back.
* The destination is a register pair `{X[2*rdp+1], X[2*rdp]}`.

# PWMULSU.B (RV32)

**Encoding**

PWMULSU.B is encoded in a register-pair (rdp) OP-IMM-32 format. It writes a 64-bit
result into the register pair `{X[2*rdp+1], X[2*rdp]}` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1100 | w=10   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

for i = 0 .. 3:
    a = sext_16(s1[(8*i+7):(8*i)])  // signed byte
    b = zext_16(s2[(8*i+7):(8*i)])  // unsigned byte
    d[(16*i+15):(16*i)] = to_bits(16, a * b)

if (rdp != 0):
    X[2*rdp]   = d[31:0]
    X[2*rdp+1] = d[63:32]
```

**Description**

The PWMULSU.B instruction performs four signed×unsigned byte multiplications
between corresponding bytes of `rs1` and `rs2`. Each 16-bit product is packed
into a 64-bit result, which is written to the destination register pair selected
by `rdp`.

**Notes**

* If `rdp=0`, the result is not written (no architectural destination).
* The destination is the register pair `{X[2*rdp+1], X[2*rdp]}`.

# PWMULSU.H (RV32)

**Encoding**

PWMULSU.H is encoded in a register-pair (rdp) OP-IMM-32 format. It writes two 32-bit
results into the register pair `{X[2*rdp+1], X[2*rdp]}` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1100 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

d0 = to_bits(32, sext_32(s1[15:0])  * zext_32(s2[15:0]))
d1 = to_bits(32, sext_32(s1[31:16]) * zext_32(s2[31:16]))

if (rdp != 0):
    X[2*rdp]   = d0
    X[2*rdp+1] = d1
```

**Description**

The PWMULSU.H instruction multiplies each signed 16-bit halfword of `rs1` by the
corresponding unsigned 16-bit halfword of `rs2`, producing two 32-bit products.
The low-halfword product is written to `X[2*rdp]` and the high-halfword product
is written to `X[2*rdp+1]`.

**Notes**

* If `rdp=0`, the result is not written.
* The destination is the register pair `X[2*rdp]` and `X[2*rdp+1]`.

# PWMACC.H (RV32)

**Encoding**

PWMACC.H is encoded in a register-pair (rdp) OP-IMM-32 format as an accumulating
halfword multiply instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=0101 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc0 = X[2*rdp]
acc1 = (rdp == 0) ? 0 : X[2*rdp+1]

acc0 = acc0 + to_bits(32, sext_32(s1[15:0])  * sext_32(s2[15:0]))
acc1 = acc1 + to_bits(32, sext_32(s1[31:16]) * sext_32(s2[31:16]))

if (rdp != 0):
    X[2*rdp]   = acc0
    X[2*rdp+1] = acc1
```

**Description**

The PWMACC.H instruction multiplies corresponding signed 16-bit halfwords of
`rs1` and `rs2` to form two 32-bit products, then accumulates them into the
32-bit values held in the destination register pair selected by `rdp`.

**Notes**

* This instruction reads and writes the destination register pair.
* If `rdp=0`, the instruction does not write back; the upper accumulator input is
  treated as zero.

# PWMACCSU.H (RV32)

**Encoding**

PWMACCSU.H is encoded in a register-pair (rdp) OP-IMM-32 format as an accumulating
signed×unsigned halfword multiply instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1101 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc0 = X[2*rdp]
acc1 = (rdp == 0) ? 0 : X[2*rdp+1]

acc0 = acc0 + to_bits(32, sext_32(s1[15:0])  * zext_32(s2[15:0]))
acc1 = acc1 + to_bits(32, sext_32(s1[31:16]) * zext_32(s2[31:16]))

if (rdp != 0):
    X[2*rdp]   = acc0
    X[2*rdp+1] = acc1
```

**Description**

The PWMACCSU.H instruction performs signed×unsigned halfword multiplications
between `rs1` and `rs2`, producing two 32-bit products that are accumulated into
the destination register pair selected by `rdp`.

**Notes**

* This instruction reads and writes the destination register pair.
* If `rdp=0`, the instruction does not write back; the upper accumulator input is
  treated as zero.

# PWMACCU.H (RV32)

**Encoding**

PWMACCU.H is encoded in a register-pair (rdp) OP-IMM-32 format as an accumulating
unsigned×unsigned halfword multiply instruction.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=0111 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc0 = X[2*rdp]
acc1 = (rdp == 0) ? 0 : X[2*rdp+1]

acc0 = acc0 + to_bits(32, zext_32(s1[15:0])  * zext_32(s2[15:0]))
acc1 = acc1 + to_bits(32, zext_32(s1[31:16]) * zext_32(s2[31:16]))

if (rdp != 0):
    X[2*rdp]   = acc0
    X[2*rdp+1] = acc1
```

**Description**

The PWMACCU.H instruction multiplies corresponding unsigned 16-bit halfwords of
`rs1` and `rs2` to form two 32-bit products, then accumulates them into the
destination register pair selected by `rdp`.

**Notes**

* This instruction reads and writes the destination register pair.
* If `rdp=0`, the instruction does not write back; the upper accumulator input is
  treated as zero.

# WMULSU (RV32)

**Encoding**

WMULSU is encoded in a register-pair (rdp) OP-IMM-32 format. It computes a 64-bit
signed×unsigned product and writes it to the destination register pair selected
by `rdp` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1100 | w=01   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
p = to_bits(64, sext_64(X[rs1]) * zext_64(X[rs2]))

if (rdp != 0):
    X[2*rdp]   = p[31:0]
    X[2*rdp+1] = p[63:32]
```

**Description**

The WMULSU instruction multiplies `rs1` as a signed 32-bit integer by `rs2` as an
unsigned 32-bit integer, producing a 64-bit product. The product is written to
the destination register pair selected by `rdp`.

**Notes**

* If `rdp=0`, the result is not written.
* The destination is the register pair `{X[2*rdp+1], X[2*rdp]}`.

# WMACCSU (RV32)

**Encoding**

WMACCSU is encoded in a register-pair (rdp) OP-IMM-32 format as an accumulating form
of WMULSU.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1101 | w=01   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
acc = (rdp == 0) ? 0 : (X[2*rdp+1] @ X[2*rdp])

prod = to_bits(64, sext_64(X[rs1]) * zext_64(X[rs2]))
acc  = acc + prod

if (rdp != 0):
    X[2*rdp]   = acc[31:0]
    X[2*rdp+1] = acc[63:32]
```

**Description**

The WMACCSU instruction multiplies `rs1` (signed 32-bit) by `rs2` (unsigned
32-bit) and accumulates the 64-bit product into the 64-bit accumulator stored in
the destination register pair selected by `rdp`.

**Notes**

* This instruction reads and writes the destination register pair.
* If `rdp=0`, the accumulator is treated as zero and no result is written back.

# PM2WADD.H (RV32)

**Encoding**

PM2WADD.H is encoded in a register-pair (rdp) OP-IMM-32 format. It produces a 64-bit
sum of two halfword products and writes it to the register pair
`{X[2*rdp+1], X[2*rdp]}` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=0000 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

p0 = to_bits(64, sext_64(s1[15:0])  * sext_64(s2[15:0]))
p1 = to_bits(64, sext_64(s1[31:16]) * sext_64(s2[31:16]))
d  = p0 + p1

if (rdp != 0):
    X[2*rdp]   = d[31:0]
    X[2*rdp+1] = d[63:32]
```

**Description**

PM2WADD.H multiplies the two signed 16-bit halfwords of `rs1` and `rs2`
(halfword0×halfword0 and halfword1×halfword1), sums the two 64-bit products, and
writes the 64-bit result to the destination register pair selected by `rdp`.

**Notes**

* If `rdp=0`, no result is written.
* The destination is the register pair `{X[2*rdp+1], X[2*rdp]}`.

# PM2WADDSU.H (RV32)

**Encoding**

PM2WADDSU.H is encoded in a register-pair (rdp) OP-IMM-32 format. It performs
signed×unsigned halfword multiplications and writes a 64-bit sum to the register
pair selected by `rdp` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1100 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

p0 = to_bits(64, sext_64(s1[15:0])  * zext_64(s2[15:0]))
p1 = to_bits(64, sext_64(s1[31:16]) * zext_64(s2[31:16]))
d  = p0 + p1

if (rdp != 0):
    X[2*rdp]   = d[31:0]
    X[2*rdp+1] = d[63:32]
```

**Description**

PM2WADDSU.H multiplies each signed 16-bit halfword of `rs1` by the corresponding
unsigned 16-bit halfword of `rs2`, sums the two 64-bit products, and writes the
64-bit result to the destination register pair selected by `rdp`.

# PM2WADDASU.H (RV32)

**Encoding**

PM2WADDASU.H is encoded in a register-pair (rdp) OP-IMM-32 format as an accumulating
form of PM2WADDSU.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=1101 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc = (rdp == 0) ? 0 : (X[2*rdp+1] @ X[2*rdp])

p0 = to_bits(64, sext_64(s1[15:0])  * zext_64(s2[15:0]))
p1 = to_bits(64, sext_64(s1[31:16]) * zext_64(s2[31:16]))

acc = acc + p0 + p1

if (rdp != 0):
    X[2*rdp]   = acc[31:0]
    X[2*rdp+1] = acc[63:32]
```

**Description**

PM2WADDASU.H multiplies corresponding halfwords of `rs1` (signed) and `rs2`
(unsigned), sums the two 64-bit products, and accumulates the sum into the 64-bit
accumulator held in the destination register pair selected by `rdp`.

**Notes**

* This instruction reads and writes the destination register pair.
* If `rdp=0`, the accumulator is treated as zero and no result is written back.

# PM2WADDU.H (RV32)

**Encoding**

PM2WADDU.H is encoded in a register-pair (rdp) OP-IMM-32 format. It performs
unsigned×unsigned halfword multiplications and writes a 64-bit sum to the
register pair selected by `rdp` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=0100 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

p0 = to_bits(64, zext_64(s1[15:0])  * zext_64(s2[15:0]))
p1 = to_bits(64, zext_64(s1[31:16]) * zext_64(s2[31:16]))
d  = p0 + p1

if (rdp != 0):
    X[2*rdp]   = d[31:0]
    X[2*rdp+1] = d[63:32]
```

**Description**

PM2WADDU.H multiplies corresponding unsigned 16-bit halfwords of `rs1` and `rs2`,
sums the two 64-bit products, and writes the 64-bit result to the destination
register pair selected by `rdp`.

# PM2WADDAU.H (RV32)

**Encoding**

PM2WADDAU.H is encoded in a register-pair (rdp) OP-IMM-32 format as an accumulating
form of PM2WADDU.H.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=0101 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

acc = (rdp == 0) ? 0 : (X[2*rdp+1] @ X[2*rdp])

p0 = to_bits(64, zext_64(s1[15:0])  * zext_64(s2[15:0]))
p1 = to_bits(64, zext_64(s1[31:16]) * zext_64(s2[31:16]))

acc = acc + p0 + p1

if (rdp != 0):
    X[2*rdp]   = acc[31:0]
    X[2*rdp+1] = acc[63:32]
```

**Description**

PM2WADDAU.H multiplies corresponding unsigned 16-bit halfwords of `rs1` and
`rs2`, sums the two 64-bit products, and accumulates the sum into the 64-bit
accumulator held in the destination register pair selected by `rdp`.

**Notes**

* This instruction reads and writes the destination register pair.
* If `rdp=0`, the accumulator is treated as zero and no result is written back.

# PM2WADD.HX (RV32)

**Encoding**

PM2WADD.HX is encoded in a register-pair (rdp) OP-IMM-32 format. It uses cross
halfword products (h0×h1 and h1×h0) and writes a 64-bit sum to the register pair
selected by `rdp` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=0010 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

p0 = to_bits(64, sext_64(s1[15:0])  * sext_64(s2[31:16]))
p1 = to_bits(64, sext_64(s1[31:16]) * sext_64(s2[15:0]))
d  = p0 + p1

if (rdp != 0):
    X[2*rdp]   = d[31:0]
    X[2*rdp+1] = d[63:32]
```

**Description**

PM2WADD.HX multiplies the low halfword of `rs1` by the high halfword of `rs2` and
the high halfword of `rs1` by the low halfword of `rs2` (both signed), sums the
two 64-bit products, and writes the 64-bit result to the destination register
pair selected by `rdp`.

# PM2WSUB.H (RV32)

**Encoding**

PM2WSUB.H is encoded in a register-pair (rdp) OP-IMM-32 format. It subtracts the
high-halfword product from the low-halfword product and writes a 64-bit result to
the register pair selected by `rdp` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=0001 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

p0 = to_bits(64, sext_64(s1[15:0])  * sext_64(s2[15:0]))
p1 = to_bits(64, sext_64(s1[31:16]) * sext_64(s2[31:16]))
d  = p0 - p1

if (rdp != 0):
    X[2*rdp]   = d[31:0]
    X[2*rdp+1] = d[63:32]
```

**Description**

PM2WSUB.H multiplies corresponding signed halfwords of `rs1` and `rs2` and
computes (low×low) minus (high×high), writing the 64-bit result to the register
pair selected by `rdp`.

# PM2WSUB.HX (RV32)

**Encoding**

PM2WSUB.HX is encoded in a register-pair (rdp) OP-IMM-32 format. It uses cross
halfword products (h0×h1 and h1×h0) and writes the 64-bit difference to the
register pair selected by `rdp` when `rdp != 0`.

| 31 | 30..27 | 26..25 | 24..20 | 19..15 | 14..12 | 11..8 | 7..0     |
|----|--------|--------|--------|--------|--------|-------|----------|
| 0  | f=0011 | w=00   | rs2    | rs1    | 010    | rdp   | 10011011 |

**Operation**

```python
s1 = X[rs1]
s2 = X[rs2]

p0 = to_bits(64, sext_64(s1[15:0])  * sext_64(s2[31:16]))
p1 = to_bits(64, sext_64(s1[31:16]) * sext_64(s2[15:0]))
d  = p0 - p1

if (rdp != 0):
    X[2*rdp]   = d[31:0]
    X[2*rdp+1] = d[63:32]
```

**Description**

PM2WSUB.HX multiplies cross halfword pairs and computes (h0 of `rs1` × h1 of
`rs2`) minus (h1 of `rs1` × h0 of `rs2`), writing the 64-bit result to the
destination register pair selected by `rdp`.

# RV32 Double-Register Equivalences

Some RV32 Base P instructions operate on a double-wide packed value held in an
even-odd register pair. In the Sail reference, these instructions are defined
by equivalence to two single-wide instructions operating on the even register
and the corresponding odd register.

In the notation below, operands `rd`, `rs1`, and `rs2` are required to be even
register numbers (with `x0` permitted). The meaning of `rd+`, `rs1+`, and `rs2+`
is defined in <<sail-code-conventions>> (in particular, `x0+ = x0`).

**Double-wide immediate forms**

For the following instructions:

`PLI.DB`, `PLI.DH`, `PLUI.DH`

the operation of:

`P<op>.D<s> rd, imm`  (destination `rd` must be even)

is equivalent to:

* `P<op>.<s> rd,  imm`
* `P<op>.<s> rd+, imm`

**Double-wide three-register forms**

For the following instructions:

`PADD.DB`, `PSUB.DB`, `PSADD.DB`, `PSADDU.DB`, `PSSUB.DB`, `PSSUBU.DB`, `PAADD.DB`, `PAADDU.DB`, `PASUB.DB`, `PASUBU.DB`, `PABD.DB`, `PABDU.DB`, `PADD.DH`, `PSUB.DH`, `PSADD.DH`, `PSADDU.DH`, `PSSUB.DH`, `PSSUBU.DH`, `PAADD.DH`, `PAADDU.DH`, `PASUB.DH`, `PASUBU.DH`, `PSH1ADD.DH`, `PSSH1SADD.DH`, `PABD.DH`, `PABDU.DH`

the operation of:

`P<op>.D<s> rd, rs1, rs2`  (`rd`, `rs1`, and `rs2` must be even)

is equivalent to:

* `P<op>.<s> rd,  rs1,  rs2`
* `P<op>.<s> rd+, rs1+, rs2+`

**Double-wide HX-defined forms**

For the following instructions:

`PAS.DHX`, `PSA.DHX`, `PSAS.DHX`, `PSSA.DHX`, `PAAS.DHX`, `PASA.DHX`

the operation of:

`P<op>.DHX rd, rs1, rs2`  (`rd`, `rs1`, and `rs2` must be even)

is equivalent to:

* `P<op>.HX rd,  rs1,  rs2`
* `P<op>.HX rd+, rs1+, rs2+`

**Double-wide absolute-value forms**

For the following instructions:

`PSABS.DB`, `PSABS.DH`

the operation of:

`PSABS.D<s> rd, rs1`  (`rd` and `rs1` must be even)

is equivalent to:

* `PSABS.<s> rd,  rs1`
* `PSABS.<s> rd+, rs1+`

**Double-wide word forms**

For the following instructions:

`PADD.DW`, `PSUB.DW`, `PSADD.DW`, `PSADDU.DW`, `PSSUB.DW`, `PSSUBU.DW`, `PAADD.DW`, `PAADDU.DW`, `PASUB.DW`, `PASUBU.DW`, `PSH1ADD.DW`, `PSSH1SADD.DW`

the operation of:

`P<op>.DW rd, rs1, rs2`  (`rd`, `rs1`, and `rs2` must be even)

is equivalent to:

* `<op> rd,  rs1,  rs2`
* `<op> rd+, rs1+, rs2+`

**Double-wide immediate shift/saturate forms**

For the following instructions:

`PSLLI.DB`, `PSRLI.DB`, `PSRAI.DB`, `PSATI.DH`, `PUSATI.DH`, `PSLLI.DH`, `PSRLI.DH`, `PSRAI.DH`, `PSSLAI.DH`, `PSRARI.DH`

`P<op>.D<s> rd, rs1, imm` (only even `rd`/`rs1`) is equivalent to:

* `P<op>.<s> rd,  rs1,  imm`
* `P<op>.<s> rd+, rs1+, imm`

**Double-wide scalar-second-source forms**

For the following instructions:

`PADD.DBS`, `PSLL.DBS`, `PSRL.DBS`, `PSRA.DBS`, `PADD.DHS`, `PSLL.DHS`, `PSRL.DHS`, `PSRA.DHS`, `PSSHA.DHS`, `PSSHAR.DHS`, `PADD.DWS`, `PSLL.DWS`, `PSRL.DWS`, `PSRA.DWS`, `PSSHA.DWS`, `PSSHAR.DWS`

the double-wide instruction is equivalent to two single-wide instructions that
share the same scalar `rs2` (no `rs2+`), and must be performed simultaneously,
or in an order that does not overwrite `rs2` between the two operations.
