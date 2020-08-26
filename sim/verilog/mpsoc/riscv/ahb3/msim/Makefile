all: build

build:
	if [ ! -e work ]; then vlib work; fi
	vlog -sv -stats=none +incdir+../../../../../../src +incdir+../../../../../../pu-riscv/rtl/verilog/pkg -f system.vc

simulate:
	vsim -c -do run.do work.testbench
