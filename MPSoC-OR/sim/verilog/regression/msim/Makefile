all: build_mpsoc4d

build_mpsoc2d:
	@if [ ! -e work ]; then vlib work; fi
	@vlog -sv -f mpsoc2d.vc
	vsim -c -do run.do work.or1k_mpsoc2d_testbench

build_mpsoc3d:
	@if [ ! -e work ]; then vlib work; fi
	@vlog -sv -f mpsoc3d.vc
	vsim -c -do run.do work.or1k_mpsoc3d_testbench

build_mpsoc4d:
	@if [ ! -e work ]; then vlib work; fi
	@vlog -sv -f mpsoc4d.vc
	vsim -c -do run.do work.or1k_mpsoc4d_testbench
