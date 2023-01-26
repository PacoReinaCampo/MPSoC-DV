`include "interface.sv"

module testbench;
  import axi_package::*;
  import uvm_pkg::*;

  bit clock;

  always begin
    #10 clock = ~clock;
  end

  axi_if in0 (clock);

  initial begin

    $dumpfile("dump.vcd");
    $dumpvars(1);
    //master_sequence_item req;

    uvm_config_db#(virtual axi_if)::set(null, "*", "vif", in0);
    run_test("axi_test");
  end
endmodule
