`ifndef PERIPHERAL_UVM_TRANSACTION
`define PERIPHERAL_UVM_TRANSACTION

class peripheral_uvm_transaction extends uvm_sequence_item;

  // Declaration of peripheral_adder transaction fields
  rand bit [`ADDER_WIDTH-1:0] x,         y;
  rand bit                    cin;
  bit      [`ADDER_WIDTH-1:0] sum;
  bit                         cout;
  bit      [             2:0] carry_out;

  //Declaration of Utility and Field macros, 
  `uvm_object_utils_begin(peripheral_uvm_transaction)
    `uvm_field_int(x, UVM_ALL_ON)
    `uvm_field_int(y, UVM_ALL_ON)
    `uvm_field_int(cin, UVM_ALL_ON)
    `uvm_field_int(sum, UVM_ALL_ON)
    `uvm_field_int(cout, UVM_ALL_ON)
    `uvm_field_int(carry_out, UVM_ALL_ON)
  `uvm_object_utils_end

  //Constructor
  function new(string name = "peripheral_uvm_transaction");
    super.new(name);
  endfunction

  // Declaration of Constraints
  constraint x_c {x inside {[4'h0 : 4'hF]};}
  constraint y_c {y inside {[4'h0 : 4'hF]};}
  constraint cin_c {cin inside {0, 1};}

  // Method name : post_randomize();
  // Description : To display transaction info after randomization
  function void post_randomize();
  endfunction

endclass

`endif
