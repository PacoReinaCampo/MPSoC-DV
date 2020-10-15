all: build

build:
	if [ ! -e work ]; then vlib work; fi
	vlog -sv -stats=none +incdir+../../../../../../uvm/src +incdir+../../../../../../pu-msp430/rtl/verilog/pkg -f system.vc

simulate:
	vsim -c -do run.do work.testbench
