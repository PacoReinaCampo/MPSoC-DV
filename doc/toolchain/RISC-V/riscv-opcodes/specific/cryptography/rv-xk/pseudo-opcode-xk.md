# Import zbkb

```
$pseudo_op rv_zbkb::brev8 brev8 rd rs1 31..20=0x687 14..12=5 6..2=0x4 1..0=0x3
```

# Import zbkb

```
$pseudo_op rv32_zbkb::zip       zip rd rs1 31..25=4 24..20=15 14..12=1 6..2=4 1..0=3
$pseudo_op rv32_zbkb::unzip    unzip rd rs1 31..25=4 24..20=15 14..12=5 6..2=4 1..0=3
$pseudo_op rv64_zbb::rori      rori.rv32 rd rs1   31..25=0x30 shamtw 14..12=5 6..2=0x04 1..0=3
$pseudo_op rv32_zbkb::rev8.rv32 rev8.rv32 rd rs1   31..20=0x698 14..12=5 6..0=0x13
```

# Import zbkb

```
$pseudo_op rv64_zbb::rev8 rev8 rd rs1      31..20=0x6B8 14..12=5 6..0=0x13
```
