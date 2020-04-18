#include "Vor1k_mpsoc4d_testbench__Syms.h"
#include "Vor1k_mpsoc4d_testbench__Dpi.h"

#include <VerilatedToplevel.h>
#include <VerilatedControl.h>

#include <ctime>
#include <cstdlib>

using namespace simutilVerilator;

VERILATED_TOPLEVEL(or1k_mpsoc4d_testbench, clk, rst)

int main(int argc, char *argv[])
{
    or1k_mpsoc4d_testbench ct("TOP");

    VerilatedControl &simctrl = VerilatedControl::instance();
    simctrl.init(ct, argc, argv);

    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[00].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[01].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[02].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[03].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[04].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[05].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[06].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[07].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[08].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[09].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[10].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[11].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[12].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[13].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[14].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc4d_testbench.u_system.gen_ct[15].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.setMemoryFuncs(do_readmemh, do_readmemh_file);
    simctrl.run();

    return 0;
}
