interface peripheral_uvm_if;

  // Control flags
  bit                has_checks = 1;
  bit                has_coverage = 1;

  // Actual Signals
  logic              clk;
  logic              rst;

  logic       [31:0] adri_i;
  wire logic  [31:0] d_i;
  logic       [ 3:0] size_i;
  logic              we_i;
  logic       [ 1:0] type_i;
  logic       [ 2:0] prot_i;
  logic              lock_i;
  logic              stb_i;

  logic              ack_o;
  logic              err_o;
  logic       [31:0] q_o;

  logic              sig_read;
  logic              sig_write;

  logic              rw;

  assign d_i = rw ? q_o : 32'bz;

  // Coverage and assertions to be implemented here.

endinterface : peripheral_uvm_if
