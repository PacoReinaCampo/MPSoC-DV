interface peripheral_uvm_interface (
    input logic ram_clk
);

    logic          ram_rst;  // RAM reset

    logic [AW-1:0] ram_addr;  // RAM address
    logic [DW-1:0] ram_dout;  // RAM data output
    logic [DW-1:0] ram_din;   // RAM data input
    logic          ram_cen;   // RAM chip enable (low active)
    logic [   1:0] ram_wen;   // RAM write enable (low active)

  // Clocking block and modport declaration for driver
  clocking dr_cb @(posedge ram_clk);
    output ram_rst;   // RAM reset
 
    output ram_addr;  // RAM address
    input  ram_dout;  // RAM data output
    output ram_din;   // RAM data input
    output ram_cen;   // RAM chip enable (low active)
    output ram_wen;   // RAM write enable (low active)
  endclocking

  modport DRV(clocking dr_cb, input ram_clk);

  // Clocking block and modport declaration for monitor
  clocking rc_cb @(negedge ram_clk);
    input ram_rst;  // RAM reset

    input ram_addr;  // RAM address
    input ram_dout;  // RAM data output
    input ram_din;   // RAM data input
    input ram_cen;   // RAM chip enable (low active)
    input ram_wen;   // RAM write enable (low active)
  endclocking

  modport RCV(clocking rc_cb, input ram_clk);
endinterface
