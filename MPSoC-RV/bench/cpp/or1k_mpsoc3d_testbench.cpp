#include "Vor1k_mpsoc3d_testbench__Syms.h"
#include "Vor1k_mpsoc3d_testbench__Dpi.h"

#include <VerilatedToplevel.h>
#include <VerilatedControl.h>

#include <ctime>
#include <cstdlib>

using namespace simutilVerilator;

VERILATED_TOPLEVEL(or1k_mpsoc3d_testbench, clk, rst)

int main(int argc, char *argv[])
{
    or1k_mpsoc3d_testbench ct("TOP");

    VerilatedControl &simctrl = VerilatedControl::instance();
    simctrl.init(ct, argc, argv);

    simctrl.addMemory("TOP.or1k_mpsoc3d_testbench.u_system.gen_ct[0].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc3d_testbench.u_system.gen_ct[1].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc3d_testbench.u_system.gen_ct[2].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc3d_testbench.u_system.gen_ct[3].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc3d_testbench.u_system.gen_ct[4].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc3d_testbench.u_system.gen_ct[5].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc3d_testbench.u_system.gen_ct[6].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.addMemory("TOP.or1k_mpsoc3d_testbench.u_system.gen_ct[7].u_ct.gen_sram.u_ram.sp_ram.gen_sram_sp_impl.u_impl");
    simctrl.setMemoryFuncs(do_readmemh, do_readmemh_file);
    simctrl.run();

    return 0;
}
