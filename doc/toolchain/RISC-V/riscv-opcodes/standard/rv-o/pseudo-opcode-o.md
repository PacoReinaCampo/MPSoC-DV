# Specialized Fences

```
$pseudo_op rv_o::fence fence.tso 31..28=8 27..24=3 23..20=3 rs1 14..12=0 rd 6..2=0x03 1..0=3
$pseudo_op rv_o::fence pause     31..28=0 27..24=1 23..20=0 19..15=0      14..12=0 11..7=0      6..2=0x03 1..0=3
ecall    31..20=0x000 19..7=0 6..2=0x1C 1..0=3
ebreak   31..20=0x001 19..7=0 6..2=0x1C 1..0=3
```

# Old Names for ecall/ebreak

```
$pseudo_op rv_o::ecall scall     11..7=0 19..15=0 31..20=0x000 14..12=0 6..2=0x1C 1..0=3
$pseudo_op rv_o::ebreak sbreak    11..7=0 19..15=0 31..20=0x001 14..12=0 6..2=0x1C 1..0=3
```

# Pseudo-Instructions from ASM Manual

```
$pseudo_op rv_o::addi   mv rd rs1 31..20=0 14..12=0 6..2=0x04 1..0=3
$pseudo_op rv_o::sub    neg rd rs1 31..25=32 24..20=0x0 14..12=0 6..2=0x0C 1..0=3
$pseudo_op rv_o::addi   nop 31..20=0 19..15=0 14..12=0 11..7=0 6..2=0x04 1..0=3
$pseudo_op rv_o::andi   zext.b rd rs1 31..20=0xff 14..12=7 6..2=0x04 1..0=3

$pseudo_op rv_o::jalr ret 31..20=0 19..15=0x01 14..12=0 11..7=0 6..2=0x19 1..0=3

$pseudo_op rv_o::bgeu   bleu bimm12hi rs2 rs1 bimm12lo 14..12=7 6..2=0x18 1..0=3
$pseudo_op rv_o::bltu   bgtu bimm12hi rs2 rs1 bimm12lo 14..12=6 6..2=0x18 1..0=3
$pseudo_op rv_o::bge    ble  bimm12hi rs2 rs1 bimm12lo 14..12=5 6..2=0x18 1..0=3
$pseudo_op rv_o::bge    bgez bimm12hi rs1     bimm12lo 24..20=0x0 14..12=5 6..2=0x18 1..0=3
$pseudo_op rv_o::bge    blez bimm12hi rs2     bimm12lo 19..15=0x0 14..12=5 6..2=0x18 1..0=3
$pseudo_op rv_o::blt    bgt  bimm12hi rs2 rs1 bimm12lo 14..12=4 6..2=0x18 1..0=3
$pseudo_op rv_o::blt    bgtz bimm12hi rs2     bimm12lo 19..15=0x0 14..12=4 6..2=0x18 1..0=3
$pseudo_op rv_o::blt    bltz bimm12hi rs1     bimm12lo 24..20=0x0 14..12=4 6..2=0x18 1..0=3
$pseudo_op rv_o::bne    bnez bimm12hi rs1     bimm12lo 24..20=0x0 14..12=1 6..2=0x18 1..0=3
$pseudo_op rv_o::beq    beqz bimm12hi rs1     bimm12lo 24..20=0x0 14..12=0 6..2=0x18 1..0=3

$pseudo_op rv_o::sltiu  seqz rd rs1 31..20=1 14..12=3 6..2=0x04 1..0=3
$pseudo_op rv_o::sltu   snez rd rs2 31..25=0 19..15=0x0 14..12=3 6..2=0x0C 1..0=3
$pseudo_op rv_o::slt    sltz rd rs1 31..25=0 24..20=0x0 14..12=2 6..2=0x0C 1..0=3
$pseudo_op rv_o::slt    sgtz rd rs2 31..25=0 19..15=0x0 14..12=2 6..2=0x0C 1..0=3

$pseudo_op rv_o::jalr   jalr rs1    31..20=0 14..12=0 11..7=0x01 6..2=0x19 1..0=3
$pseudo_op rv_o::jalr   jr   rs1    31..20=0 14..12=0 11..7=0x0  6..2=0x19 1..0=3
$pseudo_op rv_o::jal    jal  jimm20                   11..7=0x01 6..2=0x1b 1..0=3
$pseudo_op rv_o::jal    j    jimm20                   11..7=0x0  6..2=0x1b 1..0=3

$pseudo_op rv64_i::slli slli rd rs1 shamtw 31..25=0  14..12=1 6..2=0x04 1..0=3
$pseudo_op rv64_i::srli srli rd rs1 shamtw 31..25=0  14..12=5 6..2=0x04 1..0=3
$pseudo_op rv64_i::srai srai rd rs1 shamtw 31..25=32 14..12=5 6..2=0x04 1..0=3
$pseudo_op rv64_i::slli slli_rv32 rd rs1 shamtw 31..25=0  14..12=1 6..2=0x04 1..0=3
$pseudo_op rv64_i::srli srli_rv32 rd rs1 shamtw 31..25=0  14..12=5 6..2=0x04 1..0=3
$pseudo_op rv64_i::srai srai_rv32 rd rs1 shamtw 31..25=32 14..12=5 6..2=0x04 1..0=3

$pseudo_op rv64_i::addiw sext.w rd rs1 31..20=0 14..12=0 6..2=0x06 1..0=3
```
