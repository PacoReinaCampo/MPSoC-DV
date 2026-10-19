# Specialized Fences

```
$pseudo_op rv_e::fence fence.tso 31..28=8 27..24=3 23..20=3 rs1 14..12=0 rd 6..2=0x03 1..0=3
$pseudo_op rv_e::fence pause     31..28=0 27..24=1 23..20=0 19..15=0      14..12=0 11..7=0      6..2=0x03 1..0=3
ecall    31..20=0x000 19..7=0 6..2=0x1C 1..0=3
ebreak   31..20=0x001 19..7=0 6..2=0x1C 1..0=3
```

# Old Names for ecall/ebreak

```
$pseudo_op rv_e::ecall scall     11..7=0 19..15=0 31..20=0x000 14..12=0 6..2=0x1C 1..0=3
$pseudo_op rv_e::ebreak sbreak    11..7=0 19..15=0 31..20=0x001 14..12=0 6..2=0x1C 1..0=3
```

# Pseudo-Instructions from ASM Manual

```
$pseudo_op rv_e::addi   mv rd rs1 31..20=0 14..12=0 6..2=0x04 1..0=3
$pseudo_op rv_e::sub    neg rd rs1 31..25=32 24..20=0x0 14..12=0 6..2=0x0C 1..0=3
$pseudo_op rv_e::addi   nop 31..20=0 19..15=0 14..12=0 11..7=0 6..2=0x04 1..0=3
$pseudo_op rv_e::andi   zext.b rd rs1 31..20=0xff 14..12=7 6..2=0x04 1..0=3

$pseudo_op rv_e::jalr ret 31..20=0 19..15=0x01 14..12=0 11..7=0 6..2=0x19 1..0=3

$pseudo_op rv_e::bgeu   bleu bimm12hi rs2 rs1 bimm12lo 14..12=7 6..2=0x18 1..0=3
$pseudo_op rv_e::bltu   bgtu bimm12hi rs2 rs1 bimm12lo 14..12=6 6..2=0x18 1..0=3
$pseudo_op rv_e::bge    ble  bimm12hi rs2 rs1 bimm12lo 14..12=5 6..2=0x18 1..0=3
$pseudo_op rv_e::bge    bgez bimm12hi rs1     bimm12lo 24..20=0x0 14..12=5 6..2=0x18 1..0=3
$pseudo_op rv_e::bge    blez bimm12hi rs2     bimm12lo 19..15=0x0 14..12=5 6..2=0x18 1..0=3
$pseudo_op rv_e::blt    bgt  bimm12hi rs2 rs1 bimm12lo 14..12=4 6..2=0x18 1..0=3
$pseudo_op rv_e::blt    bgtz bimm12hi rs2     bimm12lo 19..15=0x0 14..12=4 6..2=0x18 1..0=3
$pseudo_op rv_e::blt    bltz bimm12hi rs1     bimm12lo 24..20=0x0 14..12=4 6..2=0x18 1..0=3
$pseudo_op rv_e::bne    bnez bimm12hi rs1     bimm12lo 24..20=0x0 14..12=1 6..2=0x18 1..0=3
$pseudo_op rv_e::beq    beqz bimm12hi rs1     bimm12lo 24..20=0x0 14..12=0 6..2=0x18 1..0=3

$pseudo_op rv_e::sltiu  seqz rd rs1 31..20=1 14..12=3 6..2=0x04 1..0=3
$pseudo_op rv_e::sltu   snez rd rs2 31..25=0 19..15=0x0 14..12=3 6..2=0x0C 1..0=3
$pseudo_op rv_e::slt    sltz rd rs1 31..25=0 24..20=0x0 14..12=2 6..2=0x0C 1..0=3
$pseudo_op rv_e::slt    sgtz rd rs2 31..25=0 19..15=0x0 14..12=2 6..2=0x0C 1..0=3

$pseudo_op rv_e::jalr   jalr rs1    31..20=0 14..12=0 11..7=0x01 6..2=0x19 1..0=3
$pseudo_op rv_e::jalr   jr   rs1    31..20=0 14..12=0 11..7=0x0  6..2=0x19 1..0=3
$pseudo_op rv_e::jal    jal  jimm20                   11..7=0x01 6..2=0x1b 1..0=3
$pseudo_op rv_e::jal    j    jimm20                   11..7=0x0  6..2=0x1b 1..0=3

$pseudo_op rv64_e::slli slli rd rs1 shamtw 31..25=0  14..12=1 6..2=0x04 1..0=3
$pseudo_op rv64_e::srli srli rd rs1 shamtw 31..25=0  14..12=5 6..2=0x04 1..0=3
$pseudo_op rv64_e::srai srai rd rs1 shamtw 31..25=32 14..12=5 6..2=0x04 1..0=3
$pseudo_op rv64_e::slli slli_rv32 rd rs1 shamtw 31..25=0  14..12=1 6..2=0x04 1..0=3
$pseudo_op rv64_e::srli srli_rv32 rd rs1 shamtw 31..25=0  14..12=5 6..2=0x04 1..0=3
$pseudo_op rv64_e::srai srai_rv32 rd rs1 shamtw 31..25=32 14..12=5 6..2=0x04 1..0=3

$pseudo_op rv64_e::addiw sext.w rd rs1 31..20=0 14..12=0 6..2=0x06 1..0=3
```
