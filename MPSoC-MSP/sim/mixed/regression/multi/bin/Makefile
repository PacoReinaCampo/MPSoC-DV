###################################################################################
##                                            __ _      _     _                  ##
##                                           / _(_)    | |   | |                 ##
##                __ _ _   _  ___  ___ _ __ | |_ _  ___| | __| |                 ##
##               / _` | | | |/ _ \/ _ \ '_ \|  _| |/ _ \ |/ _` |                 ##
##              | (_| | |_| |  __/  __/ | | | | | |  __/ | (_| |                 ##
##               \__, |\__,_|\___|\___|_| |_|_| |_|\___|_|\__,_|                 ##
##                  | |                                                          ##
##                  |_|                                                          ##
##                                                                               ##
##                                                                               ##
##              MPSoC-RV64 CPU                                                   ##
##              Regression Test Makefile                                         ##
##                                                                               ##
###################################################################################

###################################################################################
##                                                                               ##
## Copyright (c) 2017-2018 by the author(s)                                      ##
##                                                                               ##
## Permission is hereby granted, free of charge, to any person obtaining a copy  ##
## of this software and associated documentation files (the "Software"), to deal ##
## in the Software without restriction, including without limitation the rights  ##
## to use, copy, modify, merge, publish, distribute, sublicense, and/or sell     ##
## copies of the Software, and to permit persons to whom the Software is         ##
## furnished to do so, subject to the following conditions:                      ##
##                                                                               ##
## The above copyright notice and this permission notice shall be included in    ##
## all copies or substantial portions of the Software.                           ##
##                                                                               ##
## THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    ##
## IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,      ##
## FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE   ##
## AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER        ##
## LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, ##
## OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN     ##
## THE SOFTWARE.                                                                 ##
##                                                                               ##
## ============================================================================= ##
## Author(s):                                                                    ##
##   Francisco Javier Reina Campo <frareicam@gmail.com>                          ##
##                                                                               ##
###################################################################################

all: regression

SIMULATORS = msim riviera
SIM        = msim

MS     = -s

ROOT_DIR=../../../../..
TST_SRC_DIR=$(ROOT_DIR)/../software/tests/regression


##########################################################################
#
# Regression variables
#
##########################################################################
REGRESSION_MEM_LATENCY      = 0 1 3 8 
REGRESSION_XLEN             = 64
REGRESSION_WRITEBUFFER_SIZE = 0 
REGRESSION_ICACHE_SIZE      = 0 4
REGRESSION_DCACHE_SIZE      = 0 4
REGRESSION_MULT_LATENCY     = 3 2 1 0


##########################################################################
#
# Tests
#
##########################################################################
XLEN    = 64
HAS_RVC = 1
HAS_U   = 1
HAS_S   = 1
HAS_H   = 1
HAS_RVA = 1
HAS_FPU = 1
HAS_MMU = 1
HAS_RVM = 1
HAS_DIV = $(HAS_RVM)
U_INT_TESTS =	simple							\
		add addi						\
		and andi						\
		auipc							\
		beq bge bgeu blt bltu bne				\
		fence_i							\
		jal jalr						\
		lb lbu lh lhu lw					\
		lui							\
		or ori							\
		sb sh sw						\
		sll slli						\
		slt slti sltiu sltu					\
		sra srai						\
		srl srli						\
		sub							\
		xor xori						\
	$(if $(filter 64, $(XLEN)),					\
		addiw addw						\
		lwu ld							\
		sd							\
		sllw slliw						\
		sllw slliw						\
		sltu sltiu						\
		sraw sraiw						\
		srlw srliw						\
		subw )
U_RVC_TESTS  =  rvc
U_AMO_TESTS  =	amoadd_w amoand_w amomax_w amomaxu_w			\
		amomin_w amominu_w amoor_w amoxor_w amoswap_w lrsc	\
	$(if $(filter 64, $(XLEN)),					\
		amoadd_d amoand_d amomax_d amomaxu_d			\
		amomin_d amominu_d amoor_d amoxor_d amoswap_d )
U_MUL_TESTS  =	mul mulh mulhu mulhsu					\
	$(if $(filter 64, $(XLEN)), mulw )
U_DIV_TESTS  =	div divu rem remu					\
	 $(if $(filter 64,$(XLEN)), divw divuw remw remuw )

#machine mode tests
M_TESTS      =	breakpoint csr illegal ma_addr ma_fetch mcsr sbreak	\
		scall							\
	$(if $(filter 32,$(XLEN)), shamt)

#supervisor mode tests
S_TESTS      =	csr dirty illegal ma_fetch sbreak scall wfi


#User Mode Integer Tests
uitst_lst  =                      $(foreach t, $(U_INT_TESTS),rv$(XLEN)ui-p-$t)
uitst_lst += $(if $(HAS_RVM) > 0, $(foreach t, $(U_MUL_TESTS),rv$(XLEN)um-p-$t))
uitst_lst += $(if $(HAS_DIV) > 0, $(foreach t, $(U_DIV_TESTS),rv$(XLEN)um-p-$t))
uitests    = $(if $(HAS_U)   > 0, $(uitst_lst))

#User Mode RVC Tests
uctst_lst = $(if $(HAS_RVC), $(foreach t, $(U_RVC_TESTS),rv$(XLEN)uc-p-$t))
uctests   = $(if $(HAS_U) > 0, $(uctst_lst))

#Supervisor Mode Tests
sitst_lst = $(S_TESTS)
sitests   = $(if $(HAS_S) > 0, $(foreach t, $(sitst_lst),rv$(XLEN)si-p-$t))

#Machine Mode Tests
mitst_lst = $(M_TESTS)
mitests   = $(foreach t, $(mitst_lst),rv$(XLEN)mi-p-$t)

#All tests
tests = $(uitests) $(mitests)


##########################################################################
#
# Functions
#
############################################################################
add_regression    = $(foreach p,$(REGRESSION_$(1)), $(addprefix $(1)$(p)@, $(2)))
add_regression_if = $(if $(filter $(2), $(subst -, , $(1))), $(call add_regression,$(3),$(4)),$(4))

logs = $(call add_regression,DCACHE_SIZE,					\
       $(call add_regression,ICACHE_SIZE,					\
       $(call add_regression,MEM_LATENCY,					\
       $(call add_regression,WRITEBUFFER_SIZE,					\
       $(call add_regression,XLEN,						\
       $(foreach t,$(tests),							\
         $(call add_regression_if,$t,$(U_MUL_TESTS),MULT_LATENCY,		\
         $t.log									\
         )									\
       )									\
       )									\
       )									\
       )									\
       )									\
       )

regression: $(logs)

%.log:
	$(MAKE) $(SIM) LOG=./log/$(@F) \
	  PARAMETERS=" INIT_FILE=\"$(TST_SRC_DIR)/$(lastword $(subst @, ,$*)).hex\" "


##########################################################################
#
# Includes
#
##########################################################################
-include Makefile.include


##########################################################################
#
# Make Targets
#
##########################################################################
.PHONY: $(SIMULATORS)
$(SIMULATORS): % : %/Makefile
	@$(MAKE) $(MS) -C $@ sim				\
	VLOG="$(abspath $(RTL_VLOG) $(TB_VLOG))"		\
	VHDL="$(abspath $(RTL_VHDL) $(TB_VHDL))"		\
	INCDIRS="$(abspath $(INCDIRS))"				\
	TOP=$(TB_TOP)						\
	LOG=$(LOG) PARAMETERS="$(PARAMETERS)"


##########################################################################
#
# Make simulation structure
#
##########################################################################
Makefile.include:
	@cp ../bin/Makefile.include .

%/Makefile:
	@mkdir -p $*
	@cp ../bin/sims/Makefile.$* $@
