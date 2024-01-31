interface peripheral_uvm_if;

  // Control flags
  bit                has_checks = 1;
  bit                has_coverage = 1;

  // Actual Signals
  logic              sig_clock;
  logic              sig_reset;
  logic       [15:0] sig_addr;
  logic       [ 1:0] sig_size;
  logic              sig_read;
  logic              sig_write;
  logic              sig_start;
  logic              sig_bip;
  wire logic  [ 7:0] sig_data_in;
  logic       [ 7:0] sig_data_out;
  logic              sig_wait;
  logic              sig_error;

  logic              rw;

  assign sig_data_in = rw ? sig_data_out : 8'bz;

  // Coverage and assertions to be implemented here.

endinterface : peripheral_uvm_if
