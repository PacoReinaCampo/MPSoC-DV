import peripheral_bb_pkg::*;

class peripheral_uvm_transaction extends uvm_sequence_item;
  // Declaration of peripheral_adder transaction fields
  bit               ram_rst;  // Asynchronous reset active low

  rand bit [AW-1:0] ram_addr;  // RAM address
  bit      [DW-1:0] ram_dout;  // RAM data input
  rand bit [DW-1:0] ram_din;   // RAM data output
  bit               ram_cen;   // RAM chip enable (low active)
  bit      [   1:0] ram_wen;   // RAM write enable (low active)

  rand bit [31:0] address;  // Target Address

  // Declaration of Utility and Field macros
  `uvm_object_utils_begin(peripheral_uvm_transaction)

  `uvm_field_int(ram_rst, UVM_ALL_ON)  // Asynchronous reset active low

  `uvm_field_int(ram_addr, UVM_ALL_ON)
  `uvm_field_int(ram_dout, UVM_ALL_ON)
  `uvm_field_int(ram_din, UVM_ALL_ON)
  `uvm_field_int(ram_cen, UVM_ALL_ON)
  `uvm_field_int(ram_wen, UVM_ALL_ON)

  `uvm_field_int(address, UVM_ALL_ON)

  `uvm_object_utils_end

  // Constructor
  function new(string name = "peripheral_uvm_transaction");
    super.new(name);
  endfunction

  // Declaration of Constraints
  constraint ram_addr_c {ram_addr inside {[32'h00000000 : 32'hFFFFFFFF]};}
  constraint ram_din_c {ram_din inside {[32'h00000000 : 32'hFFFFFFFF]};}

  constraint address_c {address inside {[32'h00000000 : 32'hFFFFFFFF]};}

  // Method name : post_randomize();
  // Description : To display transaction info after randomization
  function void post_randomize();
  endfunction
endclass
