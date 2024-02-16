interface peripheral_uvm_interface (
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

  // Clocking block and modport declaration for driver
  clocking dr_cb @(posedge aclk);
    // Global Signals
    output aresetn;  // Active LOW

    // Write Address Channel
    output awid;     // Address Write ID
    output awadr;    // Write Address
    output awlen;    // Burst Length
    output awsize;   // Burst Size
    output awburst;  // Burst Type
    output awlock;   // Lock Type
    output awcache;  // Cache Type
    output awprot;   // Protection Type
    output awvalid;  // Write Address Valid   
    input  awready;  // Write Address Ready

    // Write Data Channel
    output wid;     // Write ID
    output wrdata;  // Write Data
    output wstrb;   // Write Strobes
    output wlast;   // Write Last
    output wvalid;  // Write Valid   
    input  wready;  // Write Ready

    // Write Response Channel
    output bid;     // Response ID
    output bresp;   // Write Response
    output bvalid;  // Write Response Valid   
    input  bready;  // Response Ready

    // Read Address Channel
    output arid;     // Read Address ID
    output araddr;   // Read Address
    output arlen;    // Burst Length
    output arsize;   // Burst Size
    output arlock;   // Lock Type
    output arcache;  // Cache Type
    output arprot;   // Protection Type
    output arvalid;  // Read Address Valid   
    input  arready;  // Read Address Ready

    // Read Data Channel
    input  rid;     // Read ID
    input  rdata;   // Read Data
    input  rresp;   // Read Response
    input  rlast;   // Read Last
    input  rvalid;  // Read Valid
    output rready;  // Read Ready
  endclocking

  modport DRV(clocking dr_cb, input aclk);

  // Clocking block and modport declaration for monitor
  clocking rc_cb @(negedge aclk);
    // Global Signals
    input aresetn;  // Active LOW

    // Write Address Channel
    input awid;     // Address Write ID
    input awadr;    // Write Address
    input awlen;    // Burst Length
    input awsize;   // Burst Size
    input awburst;  // Burst Type
    input awlock;   // Lock Type
    input awcache;  // Cache Type
    input awprot;   // Protection Type
    input awvalid;  // Write Address Valid   
    input awready;  // Write Address Ready

    // Write Data Channel
    input wid;     // Write ID
    input wrdata;  // Write Data
    input wstrb;   // Write Strobes
    input wlast;   // Write Last
    input wvalid;  // Write Valid   
    input wready;  // Write Ready

    // Write Response Channel
    input bid;     // Response ID
    input bresp;   // Write Response
    input bvalid;  // Write Response Valid   
    input bready;  // Response Ready

    // Read Address Channel
    input arid;     // Read Address ID
    input araddr;   // Read Address
    input arlen;    // Burst Length
    input arsize;   // Burst Size
    input arlock;   // Lock Type
    input arcache;  // Cache Type
    input arprot;   // Protection Type
    input arvalid;  // Read Address Valid   
    input arready;  // Read Address Ready

    // Read Data Channel
    input rid;     // Read ID
    input rdata;   // Read Data
    input rresp;   // Read Response
    input rlast;   // Read Last
    input rvalid;  // Read Valid
    input rready;  // Read Ready
  endclocking

  modport RCV(clocking rc_cb, input aclk);
endinterface
