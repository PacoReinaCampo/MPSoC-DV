import peripheral_ahb3_pkg::*;

interface peripheral_uvm_if;

  // Control flags
  bit                         has_checks = 1;
  bit                         has_coverage = 1;

  // Actual Signals
  logic                       hclk;
  logic                       hresetn;

  logic                       hsel;
  logic      [HADDR_SIZE-1:0] haddr;
  wire logic [HDATA_SIZE-1:0] hwdata;
  logic      [HDATA_SIZE-1:0] hrdata;
  logic                       hwrite;
  logic      [           2:0] hburst;
  logic      [           2:0] hsize;
  logic      [           3:0] hprot;
  logic      [           1:0] htrans;
  logic                       hmastlock;
  logic                       hreadyout;
  logic                       hready;
  logic                       hresp;

  logic                       rw;

  assign hwdata = rw ? hrdata : 32'bz;

  // Coverage and assertions to be implemented here.

endinterface : peripheral_uvm_if
