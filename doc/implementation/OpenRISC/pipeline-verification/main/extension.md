# EXTENSION

`HAS_RV32I = 1`
`HAS_RV64I = 1`
`HAS_RV32A = 1`
`HAS_RV64A = 1`
`HAS_RV32M = 1`
`HAS_RV64M = 1`
`HAS_RV32F = 1`
`HAS_RV64F = 1`
`HAS_RV32D = 1`
`HAS_RV64D = 1`
`HAS_RV32C = 1`
`HAS_RV64C = 1`

`HAS_RV64SVNAPOT = 1`

`HAS_RV64ZICBO = 1`

`HAS_RV32ZBA = 1`
`HAS_RV64ZBA = 1`
`HAS_RV32ZBB = 1`
`HAS_RV64ZBB = 1`
`HAS_RV32ZBC = 1`
`HAS_RV64ZBC = 1`
`HAS_RV32ZBS = 1`
`HAS_RV64ZBS = 1`
`HAS_RV32ZFH = 1`
`HAS_RV64ZFH = 1`

`HAS_U32 = 1`
`HAS_U64 = 1`
`HAS_S32 = 1`
`HAS_S64 = 1`
`HAS_H32 = 1`
`HAS_H64 = 1`
`HAS_M32 = 1`
`HAS_M64 = 1`

# USER MODE RV64I TESTS

`USER_RV32I_TESTS = \`
`add \`
`addi \`
`and \`
`andi \`
`auipc \`
`beq \`
`bge \`
`bgeu \`
`blt \`
`bltu \`
`bne \`
`fence_i \`
`jal \`
`jalr \`
`lb \`
`lbu \`
`lh \`
`lhu \`
`lui \`
`lw \`
`ma_data \`
`or \`
`ori \`
`sb \`
`sh \`
`simple \`
`sll \`
`slli \`
`slt \`
`slti \`
`sltiu \`
`sltu \`
`sra \`
`srai \`
`srl \`
`srli \`
`sub \`
`sw \`
`xor \`
`xori`

# USER MODE RV32I TESTS

`USER_RV64I_TESTS = \`
`add \`
`addi \`
`addiw \`
`addw \`
`and \`
`andi \`
`auipc \`
`beq \`
`bge \`
`bgeu \`
`blt \`
`bltu \`
`bne \`
`fence_i \`
`jal \`
`jalr \`
`lb \`
`lbu \`
`ld \`
`lh \`
`lhu \`
`lui \`
`lw \`
`lwu \`
`ma_data \`
`or \`
`ori \`
`sb \`
`sd \`
`sh \`
`simple \`
`sll \`
`slli \`
`slliw \`
`sllw \`
`slt \`
`slti \`
`sltiu \`
`sltu \`
`sra \`
`srai \`
`sraiw \`
`sraw \`
`srl \`
`srli \`
`srliw \`
`srlw \`
`sub \`
`subw \`
`sw \`
`xor \`
`xori`

# USER MODE RV32M TESTS

`USER_RV32M_TESTS = \`
`div \`
`divu \`
`mul \`
`mulh \`
`mulhsu \`
`mulhu \`
`rem \`
`remu`

# USER MODE RV64M TESTS

`USER_RV64M_TESTS = \`
`div \`
`divu \`
`divuw \`
`divw \`
`mul \`
`mulh \`
`mulhsu \`
`mulhu \`
`mulw \`
`rem \`
`remu \`
`remuw \`
`remw`

# USER MODE RV32A TESTS

`USER_RV32A_TESTS = \`
`amoadd_w \`
`amoand_w \`
`amomaxu_w \`
`amomax_w \`
`amominu_w \`
`amomin_w \`
`amoor_w \`
`amoswap_w \`
`amoxor_w \`
`lrsc`

# USER MODE RV64A TESTS

`USER_RV64A_TESTS = \`
`amoadd_d \`
`amoadd_w \`
`amoand_d \`
`amoand_w \`
`amomax_d \`
`amomaxu_d \`
`amomaxu_w \`
`amomax_w \`
`amomin_d \`
`amominu_d \`
`amominu_w \`
`amomin_w \`
`amoor_d \`
`amoor_w \`
`amoswap_d \`
`amoswap_w \`
`amoxor_d \`
`amoxor_w \`
`lrsc`

# USER MODE RV32C TESTS

`USER_RV32C_TESTS = \`
`rvc`

# USER MODE RV64C TESTS

`USER_RV64C_TESTS = \`
`rvc`

# USER MODE RV32F TESTS

`USER_RV32F_TESTS = \`
`fadd \`
`fclass \`
`fcmp \`
`fcvt \`
`fcvt_w \`
`fdiv \`
`fmadd \`
`fmin \`
`ldst \`
`move \`
`recoding`

# USER MODE RV64F TESTS

`USER_RV64F_TESTS = \`
`fadd \`
`fclass \`
`fcmp \`
`fcvt \`
`fcvt_w \`
`fdiv \`
`fmadd \`
`fmin \`
`ldst \`
`move \`
`recoding`

# USER MODE RV32D TESTS

`USER_RV32D_TESTS = \`
`fadd \`
`fclass \`
`fcmp \`
`fcvt \`
`fcvt_w \`
`fdiv \`
`fmadd \`
`fmin \`
`ldst \`
`recoding`

# USER MODE RV64D TESTS

`USER_RV64D_TESTS = \`
`fadd \`
`fclass \`
`fcmp \`
`fcvt \`
`fcvt_w \`
`fdiv \`
`fmadd \`
`fmin \`
`ldst \`
`move \`
`recoding \`
`structural`

# USER MODE RV32ZBA TESTS

`USER_RV32ZBA_TESTS = \`
`sh1add \`
`sh2add \`
`sh3add`

# USER MODE RV64ZBA TESTS

`USER_RV64ZBA_TESTS = \`
`add_uw \`
`sh1add \`
`sh1add_uw \`
`sh2add \`
`sh2add_uw \`
`sh3add \`
`sh3add_uw \`
`slli_uw`

# USER MODE RV32ZBB TESTS

`USER_RV32ZBB_TESTS = \`
`andn \`
`clz \`
`cpop \`
`ctz \`
`max \`
`maxu \`
`min \`
`minu \`
`orc_b \`
`orn \`
`rev8 \`
`rol \`
`ror \`
`rori \`
`sext_b \`
`sext_h \`
`xnor \`
`zext_h`

# USER MODE RV64ZBB TESTS

`USER_RV64ZBB_TESTS = \`
`andn \`
`clz \`
`clzw \`
`cpop \`
`cpopw \`
`ctz \`
`ctzw \`
`max \`
`maxu \`
`min \`
`minu \`
`orc_b \`
`orn \`
`rev8 \`
`rol \`
`rolw \`
`ror \`
`rori \`
`roriw \`
`rorw \`
`sext_b \`
`sext_h \`
`xnor \`
`zext_h`

# USER MODE RV32ZBC TESTS

`USER_RV32ZBC_TESTS = \`
`clmul \`
`clmulh \`
`clmulr`

# USER MODE RV64ZBC TESTS

`USER_RV64ZBC_TESTS = \`
`clmul \`
`clmulh \`
`clmulr`

# USER MODE RV32ZBS TESTS

`USER_RV32ZBS_TESTS = \`
`bclr \`
`bclri \`
`bext \`
`bexti \`
`binv \`
`binvi \`
`bset \`
`bseti`

# USER MODE RV64ZBS TESTS

`USER_RV64ZBS_TESTS = \`
`bclr \`
`bclri \`
`bext \`
`bexti \`
`binv \`
`binvi \`
`bset \`
`bseti`

# USER MODE RV32ZFH TESTS

`USER_RV32ZFH_TESTS = \`
`fadd \`
`fclass \`
`fcmp \`
`fcvt \`
`fcvt_w \`
`fdiv \`
`fmadd \`
`fmin \`
`ldst \`
`move \`
`recoding`

# USER MODE RV64ZFH TESTS

`USER_RV64ZFH_TESTS = \`
`fadd \`
`fclass \`
`fcmp \`
`fcvt \`
`fcvt_w \`
`fdiv \`
`fmadd \`
`fmin \`
`ldst \`
`move \`
`recoding`


# SUPERVISOR MODE RV32I TESTS

`SUPERVISOR_RV32I_TESTS = \`
`csr \`
`dirty \`
`ma_fetch \`
`sbreak \`
`scall \`
`wfi`

# SUPERVISOR MODE RV64I TESTS

`SUPERVISOR_RV64I_TESTS = \`
`csr \`
`dirty \`
`icache-alias \`
`ma_fetch \`
`sbreak \`
`scall \`
`wfi`

# SUPERVISOR MODE RV64SVNAPOT TESTS

`SUPERVISOR_RV64SVNAPOT_TESTS = \`
`napot`


# MACHINE MODE RV32I TESTS

`MACHINE_RV32I_TESTS = \`
`breakpoint \`
`csr \`
`illegal \`
`lh-misaligned \`
`lw-misaligned \`
`ma_addr \`
`ma_fetch \`
`mcsr \`
`sbreak \`
`scall \`
`shamt \`
`sh-misaligned \`
`sw-misaligned \`
`zicntr`

# MACHINE MODE RV64I TESTS

`MACHINE_RV64I_TESTS = \`
`access \`
`breakpoint \`
`csr \`
`illegal \`
`ld-misaligned \`
`lh-misaligned \`
`lw-misaligned \`
`ma_addr \`
`ma_fetch \`
`mcsr \`
`sbreak \`
`scall \`
`sd-misaligned \`
`sh-misaligned \`
`sw-misaligned \`
`zicntr`

# MACHINE MODE RV64ZICBO TESTS

`MACHINE_RV64ZICBO_TESTS = \`
`zero`


# USER MODE RV32I TESTS

`u32itst_lst += $(if $(HAS_RV32I) > 0, $(foreach t, $(USER_RV32I_TESTS),rv32ui-p-$t))`

# USER MODE RV64I TESTS

`u64itst_lst += $(if $(HAS_RV64I) > 0, $(foreach t, $(USER_RV64I_TESTS),rv64ui-p-$t))`

# USER MODE RV32M TESTS

`u32mtst_lst += $(if $(HAS_RV32M) > 0, $(foreach t, $(USER_RV32M_TESTS),rv32um-p-$t))`

# USER MODE RV64M TESTS

`u64mtst_lst += $(if $(HAS_RV64M) > 0, $(foreach t, $(USER_RV64M_TESTS),rv64um-p-$t))`

# USER MODE RV32A TESTS

`u32atst_lst += $(if $(HAS_RV32A) > 0, $(foreach t, $(USER_RV32A_TESTS),rv32ua-p-$t))`

# USER MODE RV64A TESTS

`u64atst_lst += $(if $(HAS_RV64A) > 0, $(foreach t, $(USER_RV64A_TESTS),rv64ua-p-$t))`

# USER MODE RV32F TESTS

`u32ftst_lst += $(if $(HAS_RV32F) > 0, $(foreach t, $(USER_RV32F_TESTS),rv32uf-p-$t))`

# USER MODE RV64F TESTS

`u64ftst_lst += $(if $(HAS_RV64F) > 0, $(foreach t, $(USER_RV64F_TESTS),rv64uf-p-$t))`

# USER MODE RV32D TESTS

`u32dtst_lst += $(if $(HAS_RV32D) > 0, $(foreach t, $(USER_RV32D_TESTS),rv32ud-p-$t))`

# USER MODE RV64D TESTS

`u64dtst_lst += $(if $(HAS_RV64D) > 0, $(foreach t, $(USER_RV64D_TESTS),rv64ud-p-$t))`

# USER MODE RV32C TESTS

`u32ctst_lst += $(if $(HAS_RV32C) > 0, $(foreach t, $(USER_RV32C_TESTS),rv32uc-p-$t))`

# USER MODE RV64C TESTS

`u64ctst_lst += $(if $(HAS_RV64C) > 0, $(foreach t, $(USER_RV64C_TESTS),rv64uc-p-$t))`

# USER MODE RV32ZBA TESTS

`u64zbatst_lst += $(if $(HAS_RV32ZBA) > 0, $(foreach t, $(USER_RV32ZBA_TESTS),rv32uzba-p-$t))`

# USER MODE RV64ZBA TESTS

`u64zbatst_lst += $(if $(HAS_RV64ZBA) > 0, $(foreach t, $(USER_RV64ZBA_TESTS),rv64uzba-p-$t))`

# USER MODE RV32ZBB TESTS

`u64zbbtst_lst += $(if $(HAS_RV32ZBB) > 0, $(foreach t, $(USER_RV32ZBB_TESTS),rv32uzbb-p-$t))`

# USER MODE RV64ZBB TESTS

`u64zbbtst_lst += $(if $(HAS_RV64ZBB) > 0, $(foreach t, $(USER_RV64ZBB_TESTS),rv64uzbb-p-$t))`

# USER MODE RV32ZBC TESTS

`u64zbctst_lst += $(if $(HAS_RV32ZBC) > 0, $(foreach t, $(USER_RV32ZBC_TESTS),rv32uzbc-p-$t))`

# USER MODE RV64ZBC TESTS

`u64zbctst_lst += $(if $(HAS_RV64ZBC) > 0, $(foreach t, $(USER_RV64ZBC_TESTS),rv64uzbc-p-$t))`

# USER MODE RV32ZFH TESTS

`u64zfhtst_lst += $(if $(HAS_RV32ZFH) > 0, $(foreach t, $(USER_RV32ZFH_TESTS),rv32uzfh-p-$t))`

# USER MODE RV64ZFH TESTS

`u64zfhtst_lst += $(if $(HAS_RV64ZFH) > 0, $(foreach t, $(USER_RV64ZFH_TESTS),rv64uzfh-p-$t))`

# USER MODE`
`u32tests = $(if $(HAS_U32) > 0, $(u32itst_lst) $(u32mtst_lst) $(u32atst_lst) $(u32ftst_lst))`
`u64tests = $(if $(HAS_U64) > 0, $(u64itst_lst) $(u64mtst_lst) $(u64atst_lst) $(u64ftst_lst))`


# SUPERVISOR MODE RV32I TESTS

`s32itst_lst = $(if $(HAS_S32) > 0, $(foreach t, $(SUPERVISOR_RV32I_TESTS),rv32si-p-$t))`

# SUPERVISOR MODE RV64I TESTS

`s64itst_lst = $(if $(HAS_S64) > 0, $(foreach t, $(SUPERVISOR_RV64I_TESTS),rv64si-p-$t))`

# SUPERVISOR MODE RV64SVNAPOT TESTS

`s64svnapottst_lst = $(if $(HAS_RV64SVNAPOT) > 0, $(foreach t, $(SUPERVISOR_RV64SVNAPOT_TESTS),rv64ssvnapot-p-$t))`

# SUPERVISOR MODE`
`s32tests = $(if $(HAS_M32) > 0, $(s32itst_lst))`
`s64tests = $(if $(HAS_M64) > 0, $(s64itst_lst) $(s64svnapottst_lst))`


# HYPERVISOR MODE RV32I TESTS

`h32itst_lst = $(if $(HAS_H32) > 0, $(foreach t, $(HYPERVISOR_RV32I_TESTS),rv32hi-p-$t))`

# HYPERVISOR MODE RV64I TESTS

`h64itst_lst = $(if $(HAS_H64) > 0, $(foreach t, $(HYPERVISOR_RV64I_TESTS),rv64hi-p-$t))`

# HYPERVISOR MODE`
`h32tests = $(if $(HAS_M32) > 0, $(h32itst_lst))`
`h64tests = $(if $(HAS_M64) > 0, $(h64itst_lst))`


# MACHINE MODE RV32I TESTS

`m32itst_lst = $(if $(HAS_M32) > 0, $(foreach t, $(MACHINE_RV32I_TESTS),rv32mi-p-$t))`

# MACHINE MODE RV64I TESTS

`m64itst_lst = $(if $(HAS_M64) > 0, $(foreach t, $(MACHINE_RV64I_TESTS),rv64mi-p-$t))`

# MACHINE MODE RV64ZICBO TESTS

`m64zicbotst_lst = $(if $(HAS_RV64ZICBO) > 0, $(foreach t, $(MACHINE_RV64ZICBO_TESTS),rv64mzicbo-p-$t))`

# MACHINE MODE`
`m32tests = $(if $(HAS_M32) > 0, $(m32itst_lst))`
`m64tests = $(if $(HAS_M64) > 0, $(m64itst_lst) $(m64zicbotst_lst))`


# ALL TESTS

`tests = $(u32tests) $(m32tests)`
