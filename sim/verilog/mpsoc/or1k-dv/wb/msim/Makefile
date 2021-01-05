all: build

build:
	if [ ! -e work ]; then vlib work; fi
	vlog -sv -stats=none +incdir+../../../../../../uvm/src -f system.vc

simulate:
	vsim -c -do run.do work.testbench

clean:
	rm -rf work transcript
