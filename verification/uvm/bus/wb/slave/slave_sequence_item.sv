class slave_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(slave_sequence_item)
  static int WRITE_DATA_TRANS = 0;
  static int NO_OF_TRANS = 5;

  bit [3:0] AWID;
  bit [31:0] AWADDR;
  bit [3:0] AWLEN;
  bit [2:0] AWSIZE;
  bit [1:0] AWBURST;

  bit [3:0] WSTRB[$];
  bit [31:0] WDATA[$];
  bit [3:0] WID;

  rand bit [5:0] b_delay;
  rand bit [5:0] a_delay;
  rand bit [2:0] d_delay;
  rand bit [2:0] rd_a_delay;
  rand bit [2:0] rd_d_delay;

  extern function new(string name = "slave_sequence_item");
  extern function void do_print(uvm_printer printer);
endclass

function slave_sequence_item::new(string name = "slave_sequence_item");
  super.new(name);
endfunction

function void slave_sequence_item::do_print(uvm_printer printer);
  super.do_print(printer);

  printer.print_field("AWID", this.AWID, 4, UVM_DEC);
  printer.print_field("AWADDR", this.AWADDR, 32, UVM_DEC);
  printer.print_field("AWLEN", this.AWLEN, 4, UVM_HEX);
  printer.print_field("AWBURST", this.AWBURST, 2, UVM_HEX);
  printer.print_field("AWSIZE", this.AWADDR, 3, UVM_HEX);

  foreach (WDATA[i]) printer.print_field($sformatf("WDATA[%0d]", i), this.WDATA[i], 32, UVM_HEX);

  foreach (WSTRB[i]) printer.print_field($sformatf("WSTRB[%0d]", i), this.WSTRB[i], 4, UVM_BIN);
  ;
endfunction
