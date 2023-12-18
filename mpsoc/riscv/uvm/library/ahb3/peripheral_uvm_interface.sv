interface peripheral_uvm_interface (
  input logic clk,
  input logic reset
);

  // Declaration of Signals
  logic [3:0] x;
  logic [3:0] y;
  logic       cin;
  logic [3:0] sum;
  logic       cout;

  // Clocking block and modport declaration for driver
  clocking dr_cb @(posedge clk);
    output x;
    output y;
    output cin;
    input sum;
    input cout;
  endclocking

  modport DRV(clocking dr_cb, input clk, reset);

  // Clocking block and modport declaration for monitor
  clocking rc_cb @(negedge clk);
    input x;
    input y;
    input cin;
    input sum;
    input cout;
  endclocking

  modport RCV(clocking rc_cb, input clk, reset);
endinterface
