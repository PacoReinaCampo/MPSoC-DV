interface peripheral_uvm_if;

  // Control flags
  bit                has_checks = 1;
  bit                has_coverage = 1;

  // Actual Signals
  logic              pclk;
  logic              presetn;

  logic       [15:0] paddr;
  logic       [ 1:0] pstrb;
  logic              pwrite;
  logic              pready;
  logic              psel;
  wire logic  [ 7:0] pwdata;
  logic       [ 7:0] prdata;
  logic              penable;
  logic              pslverr;

  logic              rw;

  assign pwdata = rw ? prdata : 8'bz;

  // Coverage and assertions to be implemented here.

endinterface : peripheral_uvm_if
