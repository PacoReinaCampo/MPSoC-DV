interface peripheral_uvm_if;

  // Control flags
  bit                has_checks = 1;
  bit                has_coverage = 1;

  // Actual Signals
  logic              mclk;
  logic              rst;

  logic       [ 1:0] wen;
  logic              cen;
  logic       [15:0] addr;
  wire logic  [ 7:0] din;
  logic       [ 7:0] dout;

  logic              rw;

  assign din = rw ? dout : 8'bz;

  // Coverage and assertions to be implemented here.

endinterface : peripheral_uvm_if
