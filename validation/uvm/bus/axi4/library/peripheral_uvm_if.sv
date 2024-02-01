interface peripheral_uvm_if (
  input logic aclk
);

  // Global Signals
  logic        aresetn;  // Active LOW

  // Write Address Channel
  logic [ 3:0] awid;     // Address Write ID
  logic [31:0] awadr;    // Write Address
  logic [ 3:0] awlen;    // Burst Length
  logic [ 2:0] awsize;   // Burst Size
  logic [ 1:0] awburst;  // Burst Type
  logic [ 1:0] awlock;   // Lock Type
  logic [ 3:0] awcache;  // Cache Type
  logic [ 2:0] awprot;   // Protection Type
  logic        awvalid;  // Write Address Valid
  logic        awready;  // Write Address Ready

  // Write Data Channel
  logic [ 3:0] wid;     // Write ID
  logic [31:0] wrdata;  // Write Data
  logic [ 3:0] wstrb;   // Write Strobes
  logic        wlast;   // Write Last
  logic        wvalid;  // Write Valid
  logic        wready;  // Write Ready

  // Write Response CHannel
  logic [3:0] bid;     // Response ID
  logic [1:0] bresp;   // Write Response
  logic       bvalid;  // Write Response Valid
  logic       bready;  // Response Ready

  // Read Address Channel
  logic [ 3:0] arid;     // Read Address ID
  logic [31:0] araddr;   // Read Address
  logic [ 3:0] arlen;    // Burst Length
  logic [ 2:0] arsize;   // Burst Size
  logic [ 1:0] arlock;   // Lock Type
  logic [ 3:0] arcache;  // Cache Type
  logic [ 2:0] arprot;   // Protection Type
  logic        arvalid;  // Read Address Valid
  logic        arready;  // Read Address Ready

  // Read Data Channel
  logic [ 3:0] rid;     // Read ID
  logic [31:0] rdata;   // Read Data
  logic [ 1:0] rresp;   // Read Response
  logic        rlast;   // Read Last
  logic        rvalid;  // Read Valid
  logic        rready;  // Read Ready

endinterface : peripheral_uvm_if
