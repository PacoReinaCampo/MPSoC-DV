interface peripheral_uvm_if;

  // Control flags
  bit                has_checks = 1;
  bit                has_coverage = 1;

  // Actual Signals
  logic              clk;
  logic              rst;
  logic       [15:0] adr_i;
  logic       [ 1:0] sig_size;
  logic              sig_read;
  logic              sig_write;
  logic              sig_start;
  logic              sig_bip;
  wire logic  [ 7:0] dat_i;
  logic       [ 7:0] dat_o;
  logic              sig_wait;
  logic              sig_error;

  logic              rw;

  assign dat_i = rw ? dat_o : 8'bz;

  // Coverage and assertions to be implemented here.

endinterface : peripheral_uvm_if
