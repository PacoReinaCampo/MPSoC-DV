class peripheral_uvm_transaction extends uvm_sequence_item;
  // Declaration of peripheral_adder transaction fields
  bit                             rst_ni;  // Asynchronous reset active low

  bit      [AXI_ID_WIDTH    -1:0] axi_aw_id;
  rand bit [AXI_ADDR_WIDTH  -1:0] axi_aw_addr;
  bit      [                 7:0] axi_aw_len;
  bit      [                 2:0] axi_aw_size;
  bit      [                 1:0] axi_aw_burst;
  bit                             axi_aw_lock;
  bit      [                 3:0] axi_aw_cache;
  bit      [                 2:0] axi_aw_prot;
  bit      [                 3:0] axi_aw_qos;
  bit      [                 3:0] axi_aw_region;
  bit      [AXI_USER_WIDTH  -1:0] axi_aw_user;
  bit                             axi_aw_valid;
  bit                             axi_aw_ready;

  bit      [AXI_ID_WIDTH    -1:0] axi_ar_id;
  rand bit [AXI_ADDR_WIDTH  -1:0] axi_ar_addr;
  bit      [                 7:0] axi_ar_len;
  bit      [                 2:0] axi_ar_size;
  bit      [                 1:0] axi_ar_burst;
  bit                             axi_ar_lock;
  bit      [                 3:0] axi_ar_cache;
  bit      [                 2:0] axi_ar_prot;
  bit      [                 3:0] axi_ar_qos;
  bit      [                 3:0] axi_ar_region;
  bit      [AXI_USER_WIDTH  -1:0] axi_ar_user;
  bit                             axi_ar_valid;
  bit                             axi_ar_ready;

  rand bit [AXI_DATA_WIDTH  -1:0] axi_w_data;
  bit      [AXI_STRB_WIDTH  -1:0] axi_w_strb;
  bit                             axi_w_last;
  bit      [AXI_USER_WIDTH  -1:0] axi_w_user;
  bit                             axi_w_valid;
  bit                             axi_w_ready;

  bit      [AXI_ID_WIDTH    -1:0] axi_r_id;
  rand bit [AXI_DATA_WIDTH  -1:0] axi_r_data;
  bit      [                 1:0] axi_r_resp;
  bit                             axi_r_last;
  bit      [AXI_USER_WIDTH  -1:0] axi_r_user;
  bit                             axi_r_valid;
  bit                             axi_r_ready;

  bit      [AXI_ID_WIDTH    -1:0] axi_b_id;
  bit      [                 1:0] axi_b_resp;
  bit      [AXI_USER_WIDTH  -1:0] axi_b_user;
  bit                             axi_b_valid;
  bit                             axi_b_ready;

  bit                             req_o;
  bit                             we_o;
  rand bit [AXI_ADDR_WIDTH  -1:0] addr_o;
  bit      [AXI_DATA_WIDTH/8-1:0] be_o;
  rand bit [AXI_DATA_WIDTH  -1:0] data_o;
  rand bit [AXI_DATA_WIDTH  -1:0] data_i;

  rand bit [31:0] address;  // Target Address

  // Declaration of Utility and Field macros
  `uvm_object_utils_begin(peripheral_uvm_transaction)

  `uvm_field_int(rst_ni, UVM_ALL_ON)  // Asynchronous reset active low

  `uvm_field_int(axi_aw_id, UVM_ALL_ON)
  `uvm_field_int(axi_aw_addr, UVM_ALL_ON)
  `uvm_field_int(axi_aw_len, UVM_ALL_ON)
  `uvm_field_int(axi_aw_size, UVM_ALL_ON)
  `uvm_field_int(axi_aw_burst, UVM_ALL_ON)
  `uvm_field_int(axi_aw_lock, UVM_ALL_ON)
  `uvm_field_int(axi_aw_cache, UVM_ALL_ON)
  `uvm_field_int(axi_aw_prot, UVM_ALL_ON)
  `uvm_field_int(axi_aw_qos, UVM_ALL_ON)
  `uvm_field_int(axi_aw_region, UVM_ALL_ON)
  `uvm_field_int(axi_aw_user, UVM_ALL_ON)
  `uvm_field_int(axi_aw_valid, UVM_ALL_ON)

  `uvm_field_int(axi_ar_id, UVM_ALL_ON)
  `uvm_field_int(axi_ar_addr, UVM_ALL_ON)
  `uvm_field_int(axi_ar_len, UVM_ALL_ON)
  `uvm_field_int(axi_ar_size, UVM_ALL_ON)
  `uvm_field_int(axi_ar_burst, UVM_ALL_ON)
  `uvm_field_int(axi_ar_lock, UVM_ALL_ON)
  `uvm_field_int(axi_ar_cache, UVM_ALL_ON)
  `uvm_field_int(axi_ar_prot, UVM_ALL_ON)
  `uvm_field_int(axi_ar_qos, UVM_ALL_ON)
  `uvm_field_int(axi_ar_region, UVM_ALL_ON)
  `uvm_field_int(axi_ar_user, UVM_ALL_ON)
  `uvm_field_int(axi_ar_valid, UVM_ALL_ON)

  `uvm_field_int(axi_w_data, UVM_ALL_ON)
  `uvm_field_int(axi_w_strb, UVM_ALL_ON)
  `uvm_field_int(axi_w_last, UVM_ALL_ON)
  `uvm_field_int(axi_w_user, UVM_ALL_ON)
  `uvm_field_int(axi_w_valid, UVM_ALL_ON)

  `uvm_field_int(axi_r_ready, UVM_ALL_ON)

  `uvm_field_int(axi_b_ready, UVM_ALL_ON)

  `uvm_field_int(data_i, UVM_ALL_ON)

  `uvm_object_utils_end

  // Constructor
  function new(string name = "peripheral_uvm_transaction");
    super.new(name);
  endfunction

  // Declaration of Constraints
  constraint axi_aw_addr_c {axi_aw_addr inside {[32'h00000000 : 32'hFFFFFFFF]};}
  constraint axi_ar_addr_c {axi_ar_addr inside {[32'h00000000 : 32'hFFFFFFFF]};}
  constraint axi_w_data_c {axi_w_data inside {[32'h00000000 : 32'hFFFFFFFF]};}

  constraint address_c {address inside {[32'h00000000 : 32'hFFFFFFFF]};}

  // Method name : post_randomize();
  // Description : To display transaction info after randomization
  function void post_randomize();
  endfunction
endclass
