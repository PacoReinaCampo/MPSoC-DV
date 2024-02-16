class peripheral_uvm_transaction extends uvm_sequence_item;
  // Declaration of peripheral_adder transaction fields
  // Global Signals
  bit             aresetn;  // Active LOW

  // Write Address Channel
  bit      [ 3:0] awid;     // Address Write ID
  rand bit [31:0] awadr;    // Write Address
  bit      [ 3:0] awlen;    // Burst Length
  bit      [ 2:0] awsize;   // Burst Size
  bit      [ 1:0] awburst;  // Burst Type
  bit      [ 1:0] awlock;   // Lock Type
  bit      [ 3:0] awcache;  // Cache Type
  bit      [ 2:0] awprot;   // Protection Type
  bit             awvalid;  // Write Address Valid
  bit             awready;  // Write Address Ready

  // Write Data Channel
  bit      [ 3:0] wid;     // Write ID
  rand bit [31:0] wrdata;  // Write Data
  bit      [ 3:0] wstrb;   // Write Strobes
  bit             wlast;   // Write Last
  bit             wvalid;  // Write Valid
  bit             wready;  // Write Ready

  // Write Response CHannel
  bit       [3:0] bid;     // Response ID
  bit       [1:0] bresp;   // Write Response
  bit             bvalid;  // Write Response Valid
  bit             bready;  // Response Ready

  // Read Address Channel
  bit      [ 3:0] arid;     // Read Address ID
  rand bit [31:0] araddr;   // Read Address
  bit      [ 3:0] arlen;    // Burst Length
  bit      [ 2:0] arsize;   // Burst Size
  bit      [ 1:0] arlock;   // Lock Type
  bit      [ 3:0] arcache;  // Cache Type
  bit      [ 2:0] arprot;   // Protection Type
  bit             arvalid;  // Read Address Valid
  bit             arready;  // Read Address Ready

  // Read Data Channel
  bit      [ 3:0] rid;     // Read ID
  bit      [31:0] rdata;   // Read Data
  bit      [ 1:0] rresp;   // Read Response
  bit             rlast;   // Read Last
  bit             rvalid;  // Read Valid
  bit             rready;  // Read Ready

  rand bit [31:0] address;  // Target Address

  // Declaration of Utility and Field macros
  `uvm_object_utils_begin(peripheral_uvm_transaction)

  // Global Signals
  `uvm_field_int(aresetn, UVM_ALL_ON)  // Active LOW

  // Write Address Channel
  `uvm_field_int(awid, UVM_ALL_ON)     // Address Write ID
  `uvm_field_int(awadr, UVM_ALL_ON)    // Write Address
  `uvm_field_int(awlen, UVM_ALL_ON)    // Burst Length
  `uvm_field_int(awsize, UVM_ALL_ON)   // Burst Size
  `uvm_field_int(awburst, UVM_ALL_ON)  // Burst Type
  `uvm_field_int(awlock, UVM_ALL_ON)   // Lock Type
  `uvm_field_int(awcache, UVM_ALL_ON)  // Cache Type
  `uvm_field_int(awprot, UVM_ALL_ON)   // Protection Type
  `uvm_field_int(awvalid, UVM_ALL_ON)  // Write Address Valid

  // Write Data Channel
  `uvm_field_int(wid, UVM_ALL_ON)     // Write ID
  `uvm_field_int(wrdata, UVM_ALL_ON)  // Write Data
  `uvm_field_int(wstrb, UVM_ALL_ON)   // Write Strobes
  `uvm_field_int(wlast, UVM_ALL_ON)   // Write Last
  `uvm_field_int(wvalid, UVM_ALL_ON)  // Write Valid

  // Write Response CHannel
  `uvm_field_int(bready, UVM_ALL_ON)  // Response Ready

  // Read Address Channel
  `uvm_field_int(arid, UVM_ALL_ON)     // Read Address ID
  `uvm_field_int(araddr, UVM_ALL_ON)   // Read Address
  `uvm_field_int(arlen, UVM_ALL_ON)    // Burst Length
  `uvm_field_int(arsize, UVM_ALL_ON)   // Burst Size
  `uvm_field_int(arlock, UVM_ALL_ON)   // Lock Type
  `uvm_field_int(arcache, UVM_ALL_ON)  // Cache Type
  `uvm_field_int(arprot, UVM_ALL_ON)   // Protection Type
  `uvm_field_int(arvalid, UVM_ALL_ON)  // Read Address Valid

  // Read Data Channel
  `uvm_field_int(rready, UVM_ALL_ON)  // Read Ready

  `uvm_field_int(address, UVM_ALL_ON)  // Target Address

  `uvm_object_utils_end

  // Constructor
  function new(string name = "peripheral_uvm_transaction");
    super.new(name);
  endfunction

  // Declaration of Constraints
  constraint awadr_c {awadr inside {[32'h00000000 : 32'hFFFFFFFF]};}
  constraint wrdata_c {wrdata inside {[32'h00000000 : 32'hFFFFFFFF]};}
  constraint araddr_c {araddr inside {[32'h00000000 : 32'hFFFFFFFF]};}

  constraint address_c {address inside {[32'h00000000 : 32'hFFFFFFFF]};}

  // Method name : post_randomize();
  // Description : To display transaction info after randomization
  function void post_randomize();
  endfunction
endclass
